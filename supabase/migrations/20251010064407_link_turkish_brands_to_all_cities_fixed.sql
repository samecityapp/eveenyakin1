/*
  # Link Turkish Brands to All Cities - Complete Fix

  ## Problem
  Turkish brands are only linked to some cities (London has 31, Tokyo has 0).
  When a Turkish user views Tokyo, they should see their familiar brands on the left.

  ## Solution
  Copy London's Turkish brand mappings to all other cities for matching categories.
  This ensures every city shows the same Turkish brands when source country is Turkey.

  ## Process
  1. For each city (Berlin, Paris, Roma, Tokyo)
  2. For each category in that city
  3. Find the matching category in London
  4. Copy all Turkish brand links from London's mapping to this city's mapping
*/

-- First, let's create a temporary function to copy Turkish brands
DO $$
DECLARE
  source_city_id UUID;
  target_city_id UUID;
  target_city_name TEXT;
  source_mapping_id UUID;
  target_mapping_id UUID;
  category_record RECORD;
  brand_record RECORD;
  new_sort_order INT;
BEGIN
  -- Get London's city ID (our reference city)
  SELECT id INTO source_city_id FROM cities WHERE slug = 'londra';
  
  -- Loop through each city that needs Turkish brands
  FOR target_city_name IN 
    SELECT slug FROM cities WHERE slug IN ('berlin', 'paris', 'roma', 'tokyo')
  LOOP
    SELECT id INTO target_city_id FROM cities WHERE slug = target_city_name;
    
    RAISE NOTICE 'Processing city: %', target_city_name;
    
    -- Loop through all categories
    FOR category_record IN 
      SELECT DISTINCT cat.id as category_id, cat.name as category_name
      FROM categories cat
      ORDER BY cat.name
    LOOP
      -- Get London's mapping for this category
      SELECT ccm.id INTO source_mapping_id
      FROM city_category_mappings ccm
      WHERE ccm.city_id = source_city_id 
        AND ccm.category_id = category_record.category_id;
      
      -- Get target city's mapping for this category
      SELECT ccm.id INTO target_mapping_id
      FROM city_category_mappings ccm
      WHERE ccm.city_id = target_city_id 
        AND ccm.category_id = category_record.category_id;
      
      -- If both mappings exist, copy Turkish brands
      IF source_mapping_id IS NOT NULL AND target_mapping_id IS NOT NULL THEN
        -- Delete existing Turkish brands for this target mapping to avoid duplicates
        DELETE FROM source_country_brands 
        WHERE mapping_id = target_mapping_id AND country_code = 'tr';
        
        -- Copy all Turkish brands from London to this city
        FOR brand_record IN
          SELECT brand_id, sort_order
          FROM source_country_brands
          WHERE mapping_id = source_mapping_id 
            AND country_code = 'tr'
          ORDER BY sort_order
        LOOP
          INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
          VALUES (target_mapping_id, brand_record.brand_id, 'tr', brand_record.sort_order);
        END LOOP;
        
        RAISE NOTICE '  Copied Turkish brands for category: %', category_record.category_name;
      END IF;
    END LOOP;
  END LOOP;
  
  RAISE NOTICE 'Turkish brand linking completed for all cities!';
END $$;
