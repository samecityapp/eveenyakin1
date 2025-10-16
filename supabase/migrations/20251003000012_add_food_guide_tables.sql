/*
  # Add Food Guide Feature Tables
  
  ## Summary
  New tables to store city-specific food and venue recommendations
  
  ## New Tables
  1. `food_categories`
    - `id` (uuid, primary key)
    - `city_id` (uuid, foreign key to cities)
    - `name` (text) - Category name (e.g., "En İyi Hamburgerciler")
    - `slug` (text) - URL-friendly slug
    - `sort_order` (integer) - Display order
    - `created_at` (timestamptz)
    
  2. `venues`
    - `id` (uuid, primary key)
    - `food_category_id` (uuid, foreign key to food_categories)
    - `name` (text) - Venue name
    - `description` (text) - Why this place is special
    - `image` (text) - Image URL or path
    - `map_link` (text) - Google Maps link
    - `sort_order` (integer) - Display order within category
    - `created_at` (timestamptz)
  
  ## Security
  - Enable RLS on all tables
  - Public read access for all users
  - No write access (content managed via migrations)
  
  ## Indexes
  - city_id on food_categories for faster lookups
  - food_category_id on venues for faster joins
*/

-- Create food_categories table
CREATE TABLE IF NOT EXISTS food_categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  city_id uuid NOT NULL REFERENCES cities(id) ON DELETE CASCADE,
  name text NOT NULL,
  slug text NOT NULL,
  sort_order integer NOT NULL DEFAULT 0,
  created_at timestamptz DEFAULT now(),
  UNIQUE(city_id, slug)
);

-- Create venues table
CREATE TABLE IF NOT EXISTS venues (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  food_category_id uuid NOT NULL REFERENCES food_categories(id) ON DELETE CASCADE,
  name text NOT NULL,
  description text NOT NULL,
  image text NOT NULL,
  map_link text NOT NULL,
  sort_order integer NOT NULL DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_food_categories_city_id ON food_categories(city_id);
CREATE INDEX IF NOT EXISTS idx_venues_food_category_id ON venues(food_category_id);

-- Enable RLS
ALTER TABLE food_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE venues ENABLE ROW LEVEL SECURITY;

-- Create RLS policies for public read access
CREATE POLICY "Anyone can view food categories"
  ON food_categories FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Anyone can view venues"
  ON venues FOR SELECT
  TO public
  USING (true);
