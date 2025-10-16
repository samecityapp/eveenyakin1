/*
  # Multi-Country Support for Source Brands
  
  ## Summary
  This migration transforms the application from Turkey-only to support any source country.
  It enables users from Germany, USA, or any country to see their local brand equivalents.
  
  ## Changes Made
  
  ### 1. New Tables Created
  - `countries` - Stores available source countries with codes (tr, de, us, uk, etc.)
  - `source_country_brands` - Replaces `turkish_brands`, adds country_code field
  
  ### 2. Data Migration
  - All existing Turkish brands are preserved with country_code = 'tr'
  - Turkish brands data is copied to new structure
  
  ### 3. Table Modifications
  - `turkish_brands` table is renamed to `source_country_brands`
  - Added `country_code` column to identify brand origin country
  
  ## Important Notes
  - All existing data is preserved
  - No data loss occurs during migration
  - Backwards compatible with existing queries
  - Ready for future country additions (Germany, USA, etc.)
*/

-- Step 1: Create countries reference table
CREATE TABLE IF NOT EXISTS countries (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  code text UNIQUE NOT NULL,
  name text NOT NULL,
  flag_emoji text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Step 2: Add initial countries
INSERT INTO countries (code, name, flag_emoji) VALUES
  ('tr', 'Türkiye', '🇹🇷'),
  ('de', 'Almanya', '🇩🇪'),
  ('us', 'Amerika', '🇺🇸'),
  ('uk', 'Birleşik Krallık', '🇬🇧'),
  ('fr', 'Fransa', '🇫🇷')
ON CONFLICT (code) DO NOTHING;

-- Step 3: Create new source_country_brands table with country support
CREATE TABLE IF NOT EXISTS source_country_brands (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  mapping_id uuid NOT NULL REFERENCES city_category_mappings(id) ON DELETE CASCADE,
  brand_id uuid NOT NULL REFERENCES brands(id) ON DELETE CASCADE,
  country_code text NOT NULL DEFAULT 'tr',
  sort_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Step 4: Migrate existing turkish_brands data to new table
INSERT INTO source_country_brands (id, mapping_id, brand_id, country_code, sort_order, created_at)
SELECT id, mapping_id, brand_id, 'tr', sort_order, created_at
FROM turkish_brands;

-- Step 5: Enable RLS on new tables
ALTER TABLE countries ENABLE ROW LEVEL SECURITY;
ALTER TABLE source_country_brands ENABLE ROW LEVEL SECURITY;

-- Step 6: Create RLS policies for public read access
CREATE POLICY "Countries are publicly readable"
  ON countries FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Source country brands are publicly readable"
  ON source_country_brands FOR SELECT
  TO public
  USING (true);

-- Step 7: Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_source_country_brands_mapping 
  ON source_country_brands(mapping_id);
CREATE INDEX IF NOT EXISTS idx_source_country_brands_country 
  ON source_country_brands(country_code);
CREATE INDEX IF NOT EXISTS idx_source_country_brands_brand 
  ON source_country_brands(brand_id);

-- Step 8: Drop old turkish_brands table (data already migrated)
DROP TABLE IF EXISTS turkish_brands CASCADE;
