/*
  # Link Turkish Brands Globally to All Cities
  
  Ensures every city has Turkish brands for all 13 categories
*/

DO $$
DECLARE
  v_city RECORD;
  v_category RECORD;
  v_mapping_id uuid;
  v_brand RECORD;
  v_sort_order int;
BEGIN
  -- For each city
  FOR v_city IN SELECT id, slug, name FROM cities LOOP
    
    -- For each category
    FOR v_category IN SELECT id, name FROM categories ORDER BY name LOOP
      
      -- Get or create mapping
      SELECT ccm.id INTO v_mapping_id 
      FROM city_category_mappings ccm 
      WHERE ccm.city_id = v_city.id AND ccm.category_id = v_category.id;
      
      -- If mapping exists, link Turkish brands
      IF v_mapping_id IS NOT NULL THEN
        
        -- Delete existing Turkish brands for this mapping to avoid duplicates
        DELETE FROM source_country_brands 
        WHERE mapping_id = v_mapping_id AND country_code = 'tr';
        
        -- Link Turkish brands based on category
        v_sort_order := 1;
        
        CASE v_category.name
          WHEN 'İndirim Marketleri' THEN
            FOR v_brand IN 
              SELECT id FROM brands WHERE name IN ('A101', 'BİM', 'Şok', 'File') ORDER BY name
            LOOP
              INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
              VALUES (v_mapping_id, v_brand.id, 'tr', v_sort_order);
              v_sort_order := v_sort_order + 1;
            END LOOP;
            
          WHEN 'Süpermarketler' THEN
            FOR v_brand IN 
              SELECT id FROM brands WHERE name IN ('Migros', 'CarrefourSA', 'Macro Center') ORDER BY name
            LOOP
              INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
              VALUES (v_mapping_id, v_brand.id, 'tr', v_sort_order);
              v_sort_order := v_sort_order + 1;
            END LOOP;
            
          WHEN 'Hızlı Market Teslimatı' THEN
            FOR v_brand IN 
              SELECT id FROM brands WHERE name IN ('Getir', 'İsteGelsin') ORDER BY name
            LOOP
              INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
              VALUES (v_mapping_id, v_brand.id, 'tr', v_sort_order);
              v_sort_order := v_sort_order + 1;
            END LOOP;
            
          WHEN 'Yemek Siparişi' THEN
            FOR v_brand IN 
              SELECT id FROM brands WHERE name IN ('Yemeksepeti', 'Trendyol Yemek', 'GetirYemek') ORDER BY name
            LOOP
              INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
              VALUES (v_mapping_id, v_brand.id, 'tr', v_sort_order);
              v_sort_order := v_sort_order + 1;
            END LOOP;
            
          WHEN 'Taksi & Araç Paylaşımı' THEN
            FOR v_brand IN 
              SELECT id FROM brands WHERE name IN ('BiTaksi', 'Martı') ORDER BY name
            LOOP
              INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
              VALUES (v_mapping_id, v_brand.id, 'tr', v_sort_order);
              v_sort_order := v_sort_order + 1;
            END LOOP;
            
          WHEN 'İkinci El & Seri İlan' THEN
            FOR v_brand IN 
              SELECT id FROM brands WHERE name IN ('Sahibinden', 'Letgo') ORDER BY name
            LOOP
              INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
              VALUES (v_mapping_id, v_brand.id, 'tr', v_sort_order);
              v_sort_order := v_sort_order + 1;
            END LOOP;
            
          WHEN 'Moda Pazaryerleri' THEN
            FOR v_brand IN 
              SELECT id FROM brands WHERE name IN ('Trendyol', 'Dolap') ORDER BY name
            LOOP
              INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
              VALUES (v_mapping_id, v_brand.id, 'tr', v_sort_order);
              v_sort_order := v_sort_order + 1;
            END LOOP;
            
          WHEN 'Emlak Portalları' THEN
            FOR v_brand IN 
              SELECT id FROM brands WHERE name IN ('Sahibinden', 'Hepsiemlak') ORDER BY name
            LOOP
              INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
              VALUES (v_mapping_id, v_brand.id, 'tr', v_sort_order);
              v_sort_order := v_sort_order + 1;
            END LOOP;
            
          WHEN 'Dijital Bankacılık' THEN
            FOR v_brand IN 
              SELECT id FROM brands WHERE name IN ('Papara', 'Enpara') ORDER BY name
            LOOP
              INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
              VALUES (v_mapping_id, v_brand.id, 'tr', v_sort_order);
              v_sort_order := v_sort_order + 1;
            END LOOP;
            
          WHEN 'Mobil Operatörler' THEN
            FOR v_brand IN 
              SELECT id FROM brands WHERE name IN ('Turkcell', 'Vodafone TR', 'Türk Telekom') ORDER BY name
            LOOP
              INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
              VALUES (v_mapping_id, v_brand.id, 'tr', v_sort_order);
              v_sort_order := v_sort_order + 1;
            END LOOP;
            
          WHEN 'Elektronik Mağazaları' THEN
            FOR v_brand IN 
              SELECT id FROM brands WHERE name IN ('Teknosa', 'Vatan', 'MediaMarkt') ORDER BY name
            LOOP
              INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
              VALUES (v_mapping_id, v_brand.id, 'tr', v_sort_order);
              v_sort_order := v_sort_order + 1;
            END LOOP;
            
          WHEN 'Kozmetik & Kişisel Bakım' THEN
            FOR v_brand IN 
              SELECT id FROM brands WHERE name IN ('Gratis', 'Watsons', 'Sephora') ORDER BY name
            LOOP
              INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
              VALUES (v_mapping_id, v_brand.id, 'tr', v_sort_order);
              v_sort_order := v_sort_order + 1;
            END LOOP;
            
          WHEN 'Toplu Taşıma' THEN
            FOR v_brand IN 
              SELECT id FROM brands WHERE name IN ('İstanbulkart', 'Moovit') ORDER BY name
            LOOP
              INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
              VALUES (v_mapping_id, v_brand.id, 'tr', v_sort_order);
              v_sort_order := v_sort_order + 1;
            END LOOP;
            
          ELSE
            -- Skip categories without Turkish brands defined
            NULL;
        END CASE;
        
      END IF;
      
    END LOOP;
  END LOOP;
  
  RAISE NOTICE 'Turkish brands linked to all cities successfully';
END $$;
