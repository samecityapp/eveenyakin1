/*
  # Add image column to cities table

  1. Changes
    - Add `image` column to `cities` table to store city card image paths
    - Column is optional (nullable) to allow gradual migration
    - Default value provided for existing cities

  2. Notes
    - Images should be stored in `/cities/` directory
    - Format: `/cities/london.jpg`, `/cities/paris.jpg`, etc.
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public'
    AND table_name = 'cities'
    AND column_name = 'image'
  ) THEN
    ALTER TABLE cities ADD COLUMN image text;
  END IF;
END $$;

UPDATE cities SET image = '/cities/london.jpg' WHERE slug = 'london';
UPDATE cities SET image = '/cities/paris.jpg' WHERE slug = 'paris';
UPDATE cities SET image = '/cities/berlin.jpg' WHERE slug = 'berlin';
UPDATE cities SET image = '/cities/roma.jpg' WHERE slug = 'roma';
