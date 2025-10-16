/*
  # SameCityApp Database Schema

  ## Overview
  This migration creates the foundational database structure for SameCityApp,
  a platform that helps users find equivalent services/brands in foreign cities.

  ## New Tables
  
  ### 1. `cities`
  Stores information about cities covered by the platform
  - `id` (uuid, primary key)
  - `name` (text) - City name (e.g., "Londra")
  - `slug` (text, unique) - URL-friendly identifier (e.g., "londra")
  - `country` (text) - Country name
  - `created_at` (timestamptz)
  - `updated_at` (timestamptz)

  ### 2. `categories`
  Stores service/product categories (e.g., "Hızlı Market Teslimatı")
  - `id` (uuid, primary key)
  - `name` (text) - Category name
  - `description` (text, nullable) - Optional description
  - `created_at` (timestamptz)
  - `updated_at` (timestamptz)

  ### 3. `brands`
  Stores brand/service information
  - `id` (uuid, primary key)
  - `name` (text) - Brand name
  - `logo_url` (text, nullable) - Logo image URL
  - `created_at` (timestamptz)
  - `updated_at` (timestamptz)

  ### 4. `city_category_mappings`
  Links cities to categories with brand equivalents
  - `id` (uuid, primary key)
  - `city_id` (uuid, foreign key to cities)
  - `category_id` (uuid, foreign key to categories)
  - `created_at` (timestamptz)

  ### 5. `turkish_brands`
  Maps Turkish brands to categories in city mappings
  - `id` (uuid, primary key)
  - `mapping_id` (uuid, foreign key to city_category_mappings)
  - `brand_id` (uuid, foreign key to brands)
  - `sort_order` (integer) - Display order
  - `created_at` (timestamptz)

  ### 6. `equivalent_brands`
  Maps equivalent local brands to categories in city mappings
  - `id` (uuid, primary key)
  - `mapping_id` (uuid, foreign key to city_category_mappings)
  - `brand_id` (uuid, foreign key to brands)
  - `sort_order` (integer) - Display order
  - `created_at` (timestamptz)

  ## Security
  - Enable RLS on all tables
  - Public read access for all data (this is a public information platform)
  - No write access for anonymous users (content will be managed separately)
*/

-- Create cities table
CREATE TABLE IF NOT EXISTS cities (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text UNIQUE NOT NULL,
  country text NOT NULL,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create categories table
CREATE TABLE IF NOT EXISTS categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  description text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create brands table
CREATE TABLE IF NOT EXISTS brands (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL UNIQUE,
  logo_url text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create city_category_mappings table
CREATE TABLE IF NOT EXISTS city_category_mappings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  city_id uuid NOT NULL REFERENCES cities(id) ON DELETE CASCADE,
  category_id uuid NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
  created_at timestamptz DEFAULT now(),
  UNIQUE(city_id, category_id)
);

-- Create turkish_brands junction table
CREATE TABLE IF NOT EXISTS turkish_brands (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  mapping_id uuid NOT NULL REFERENCES city_category_mappings(id) ON DELETE CASCADE,
  brand_id uuid NOT NULL REFERENCES brands(id) ON DELETE CASCADE,
  sort_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Create equivalent_brands junction table
CREATE TABLE IF NOT EXISTS equivalent_brands (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  mapping_id uuid NOT NULL REFERENCES city_category_mappings(id) ON DELETE CASCADE,
  brand_id uuid NOT NULL REFERENCES brands(id) ON DELETE CASCADE,
  sort_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Create indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_cities_slug ON cities(slug);
CREATE INDEX IF NOT EXISTS idx_city_category_mappings_city_id ON city_category_mappings(city_id);
CREATE INDEX IF NOT EXISTS idx_city_category_mappings_category_id ON city_category_mappings(category_id);
CREATE INDEX IF NOT EXISTS idx_turkish_brands_mapping_id ON turkish_brands(mapping_id);
CREATE INDEX IF NOT EXISTS idx_equivalent_brands_mapping_id ON equivalent_brands(mapping_id);

-- Enable Row Level Security
ALTER TABLE cities ENABLE ROW LEVEL SECURITY;
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE brands ENABLE ROW LEVEL SECURITY;
ALTER TABLE city_category_mappings ENABLE ROW LEVEL SECURITY;
ALTER TABLE turkish_brands ENABLE ROW LEVEL SECURITY;
ALTER TABLE equivalent_brands ENABLE ROW LEVEL SECURITY;

-- Create policies for public read access
CREATE POLICY "Public read access for cities"
  ON cities FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "Public read access for categories"
  ON categories FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "Public read access for brands"
  ON brands FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "Public read access for city_category_mappings"
  ON city_category_mappings FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "Public read access for turkish_brands"
  ON turkish_brands FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "Public read access for equivalent_brands"
  ON equivalent_brands FOR SELECT
  TO anon, authenticated
  USING (true);