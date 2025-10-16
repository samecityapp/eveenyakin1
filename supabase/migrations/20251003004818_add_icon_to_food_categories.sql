/*
  # Add Icon Field to Food Categories
  
  ## Summary
  Adds an icon field to food_categories table for dynamic map markers
  
  ## Changes
  - Add `icon` field (text) - Lucide icon name for the category
  
  ## Purpose
  Enable category-specific colored icons on the map view
*/

-- Add icon column
ALTER TABLE food_categories 
  ADD COLUMN IF NOT EXISTS icon text;

-- Update categories with their icons
DO $$
DECLARE
  v_city_id uuid;
BEGIN
  SELECT id INTO v_city_id FROM cities WHERE slug = 'londra';

  UPDATE food_categories 
  SET icon = 'Beef' 
  WHERE city_id = v_city_id AND slug = 'hamburger';

  UPDATE food_categories 
  SET icon = 'Coffee' 
  WHERE city_id = v_city_id AND slug = 'kahve';

  UPDATE food_categories 
  SET icon = 'Pizza' 
  WHERE city_id = v_city_id AND slug = 'pizza';

  UPDATE food_categories 
  SET icon = 'UtensilsCrossed' 
  WHERE city_id = v_city_id AND slug = 'fine-dining';

  UPDATE food_categories 
  SET icon = 'Star' 
  WHERE city_id = v_city_id AND slug = 'michelin';

  UPDATE food_categories 
  SET icon = 'Utensils' 
  WHERE city_id = v_city_id AND slug = 'yerel-lezzetler';

END $$;
