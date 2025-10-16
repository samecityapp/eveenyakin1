/*
  # Add Mentor Note to City Category Mappings

  ## Overview
  Adds a `mentor_note` field to city_category_mappings table to display
  personalized, valuable mentor notes for each category in each city.

  ## Changes
  - Adds `mentor_note` text field to city_category_mappings table
  - This field will store category-specific guidance and tips for users
  - Unlike generic descriptions, mentor notes are personalized and contextual

  ## Why
  - Provides more valuable, personalized information to users
  - Replaces generic category descriptions with meaningful guidance
  - Improves user experience by showing expert advice immediately
*/

-- Add mentor_note field to city_category_mappings
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'city_category_mappings' AND column_name = 'mentor_note'
  ) THEN
    ALTER TABLE city_category_mappings ADD COLUMN mentor_note text;
  END IF;
END $$;
