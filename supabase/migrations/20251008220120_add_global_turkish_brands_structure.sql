/*
  # Add Global Turkish Brands Structure

  ## Overview
  This migration restructures how Turkish brands are stored to make them global across all cities,
  rather than being city-specific. Previously, Turkish brands were linked to specific cities via
  city_category_mappings. Now they will be stored at the category level only.

  ## Changes

  1. New Table: `turkish_category_brands`
    - Links Turkish brands directly to categories (not cities)
    - `category_id` (uuid, references categories)
    - `brand_id` (uuid, references brands)
    - `sort_order` (integer)
    - Makes Turkish brands consistent across all cities

  2. Data Migration
    - Extracts Turkish brands from Londra (template city)
    - Inserts them into new global structure
    - Preserves sort order

  3. Security
    - Enable RLS on new table
    - Add read-only policy for authenticated users

  ## Important Notes
  - Old `source_country_brands` table remains for backward compatibility
  - Turkish brands now shared globally across all cities
  - Each category has one set of Turkish brands regardless of city
*/

-- Create new global Turkish brands table
CREATE TABLE IF NOT EXISTS turkish_category_brands (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  category_id uuid NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
  brand_id uuid NOT NULL REFERENCES brands(id) ON DELETE CASCADE,
  sort_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now(),
  UNIQUE(category_id, brand_id)
);

-- Enable RLS
ALTER TABLE turkish_category_brands ENABLE ROW LEVEL SECURITY;

-- Add read-only policy
CREATE POLICY "Anyone can view Turkish brands"
  ON turkish_category_brands
  FOR SELECT
  TO public
  USING (true);

-- Migrate Turkish brands from Londra as the global template
INSERT INTO turkish_category_brands (category_id, brand_id, sort_order)
SELECT DISTINCT
  cat.id as category_id,
  b.id as brand_id,
  MIN(scb.sort_order) as sort_order
FROM city_category_mappings ccm
JOIN categories cat ON ccm.category_id = cat.id
JOIN cities c ON ccm.city_id = c.id
JOIN source_country_brands scb ON scb.mapping_id = ccm.id
JOIN brands b ON scb.brand_id = b.id
WHERE c.slug = 'londra' 
  AND scb.country_code = 'tr'
GROUP BY cat.id, b.id
ON CONFLICT (category_id, brand_id) DO NOTHING;

-- Create index for faster queries
CREATE INDEX IF NOT EXISTS idx_turkish_category_brands_category 
  ON turkish_category_brands(category_id);
CREATE INDEX IF NOT EXISTS idx_turkish_category_brands_sort 
  ON turkish_category_brands(category_id, sort_order);
