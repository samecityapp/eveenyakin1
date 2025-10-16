/*
  # Add Toplu Taşıma to Londra

  1. Changes
    - Adds Toplu Taşıma Uygulaması category to Londra
    - Adds UK equivalent brands
    - Completes 13 category standard
*/

DO $$
DECLARE
  v_londra_id uuid;
  v_category_id uuid;
  v_mapping_id uuid;
  v_brand_id uuid;
BEGIN
  SELECT id INTO v_londra_id FROM cities WHERE slug = 'londra';
  
  SELECT id INTO v_category_id FROM categories WHERE name = 'Toplu Taşıma Uygulaması';
  IF v_category_id IS NULL THEN
    INSERT INTO categories (name, description) 
    VALUES ('Toplu Taşıma Uygulaması', 'Şehirdeki otobüs, metro, tren rotaları için.')
    RETURNING id INTO v_category_id;
  END IF;
  
  INSERT INTO city_category_mappings (city_id, category_id, pro_tips)
  VALUES (v_londra_id, v_category_id, ARRAY['Citymapper, Londra için en popüler ve kapsamlı toplu taşıma uygulamasıdır.']::text[])
  RETURNING id INTO v_mapping_id;

  -- Turkish brand
  INSERT INTO brands (name, logo_url, website_url) VALUES ('Moovit', '/logos/file.svg', 'https://moovitapp.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);

  -- UK brands
  INSERT INTO brands (name, logo_url, website_url) VALUES ('Citymapper', '/logos/file.svg', 'https://citymapper.com/london') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url) VALUES ('TfL Go', '/logos/file.svg', 'https://tfl.gov.uk/maps_/tfl-go') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

END $$;
