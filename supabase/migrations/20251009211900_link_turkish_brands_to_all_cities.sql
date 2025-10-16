/*
  # Link Turkish Brands to All Cities (12 Categories)

  ## Overview
  Links all Turkish brands to their respective categories for all 5 cities.
  Each city will show Turkish brands as equivalent brands.

  ## 12 Categories and Their Brands:
  1. İkinci El & Seri İlan: Sahibinden.com, Letgo
  2. İndirim Marketleri: A101, BİM, File, Şok
  3. Taksi & Araç Paylaşımı: BiTaksi, Uber
  4. Emlak Portalları: Emlakjet, Hepsiemlak
  5. Süpermarketler: CarrefourSA, Macro Center, Migros
  6. Moda Pazaryerleri: Dolap, Gardrops
  7. Dijital Bankacılık: Enpara, Papara
  8. Mobil Operatörler: Türk Telekom, Turkcell, Vodafone TR
  9. Hızlı Market Teslimatı: Getir, Trendyol Go
  10. Kozmetik & Kişisel Bakım: Gratis, Sephora, Watsons
  11. Elektronik Mağazaları: MediaMarkt, Teknosa, Vatan Bilgisayar
  12. Yemek Siparişi: GetirYemek, Trendyol Yemek, Yemeksepeti
*/

DO $$
DECLARE
  -- Category IDs
  cat_ikinciel uuid;
  cat_indirim uuid;
  cat_taksi uuid;
  cat_emlak uuid;
  cat_supermarket uuid;
  cat_moda uuid;
  cat_dijital uuid;
  cat_mobil uuid;
  cat_hizli uuid;
  cat_kozmetik uuid;
  cat_elektronik uuid;
  cat_yemek uuid;
  
  -- Brand IDs
  brand_sahibinden uuid;
  brand_letgo uuid;
  brand_a101 uuid;
  brand_bim uuid;
  brand_file uuid;
  brand_sok uuid;
  brand_bitaksi uuid;
  brand_uber uuid;
  brand_emlakjet uuid;
  brand_hepsiemlak uuid;
  brand_carrefour uuid;
  brand_macro uuid;
  brand_migros uuid;
  brand_dolap uuid;
  brand_gardrops uuid;
  brand_enpara uuid;
  brand_papara uuid;
  brand_turktelekom uuid;
  brand_turkcell uuid;
  brand_vodafone uuid;
  brand_getir uuid;
  brand_trendyolgo uuid;
  brand_gratis uuid;
  brand_sephora uuid;
  brand_watsons uuid;
  brand_mediamarkt uuid;
  brand_teknosa uuid;
  brand_vatan uuid;
  brand_getiryemek uuid;
  brand_trendyolyemek uuid;
  brand_yemeksepeti uuid;
  
  mapping_record RECORD;
BEGIN
  -- Get category IDs
  SELECT id INTO cat_ikinciel FROM categories WHERE name = 'İkinci El & Seri İlan';
  SELECT id INTO cat_indirim FROM categories WHERE name = 'İndirim Marketleri';
  SELECT id INTO cat_taksi FROM categories WHERE name = 'Taksi & Araç Paylaşımı';
  SELECT id INTO cat_emlak FROM categories WHERE name = 'Emlak Portalları';
  SELECT id INTO cat_supermarket FROM categories WHERE name = 'Süpermarketler';
  SELECT id INTO cat_moda FROM categories WHERE name = 'Moda Pazaryerleri';
  SELECT id INTO cat_dijital FROM categories WHERE name = 'Dijital Bankacılık';
  SELECT id INTO cat_mobil FROM categories WHERE name = 'Mobil Operatörler';
  SELECT id INTO cat_hizli FROM categories WHERE name = 'Hızlı Market Teslimatı';
  SELECT id INTO cat_kozmetik FROM categories WHERE name = 'Kozmetik & Kişisel Bakım';
  SELECT id INTO cat_elektronik FROM categories WHERE name = 'Elektronik Mağazaları';
  SELECT id INTO cat_yemek FROM categories WHERE name = 'Yemek Siparişi';
  
  -- Get brand IDs
  SELECT id INTO brand_sahibinden FROM brands WHERE name = 'Sahibinden.com';
  SELECT id INTO brand_letgo FROM brands WHERE name = 'Letgo';
  SELECT id INTO brand_a101 FROM brands WHERE name = 'A101';
  SELECT id INTO brand_bim FROM brands WHERE name = 'BİM';
  SELECT id INTO brand_file FROM brands WHERE name = 'File';
  SELECT id INTO brand_sok FROM brands WHERE name = 'Şok';
  SELECT id INTO brand_bitaksi FROM brands WHERE name = 'BiTaksi';
  SELECT id INTO brand_uber FROM brands WHERE name = 'Uber';
  SELECT id INTO brand_emlakjet FROM brands WHERE name = 'Emlakjet';
  SELECT id INTO brand_hepsiemlak FROM brands WHERE name = 'Hepsiemlak';
  SELECT id INTO brand_carrefour FROM brands WHERE name = 'CarrefourSA';
  SELECT id INTO brand_macro FROM brands WHERE name = 'Macro Center';
  SELECT id INTO brand_migros FROM brands WHERE name = 'Migros';
  SELECT id INTO brand_dolap FROM brands WHERE name = 'Dolap';
  SELECT id INTO brand_gardrops FROM brands WHERE name = 'Gardrops';
  SELECT id INTO brand_enpara FROM brands WHERE name = 'Enpara';
  SELECT id INTO brand_papara FROM brands WHERE name = 'Papara';
  SELECT id INTO brand_turktelekom FROM brands WHERE name = 'Türk Telekom';
  SELECT id INTO brand_turkcell FROM brands WHERE name = 'Turkcell';
  SELECT id INTO brand_vodafone FROM brands WHERE name = 'Vodafone TR';
  SELECT id INTO brand_getir FROM brands WHERE name = 'Getir';
  SELECT id INTO brand_trendyolgo FROM brands WHERE name = 'Trendyol Go';
  SELECT id INTO brand_gratis FROM brands WHERE name = 'Gratis';
  SELECT id INTO brand_sephora FROM brands WHERE name = 'Sephora';
  SELECT id INTO brand_watsons FROM brands WHERE name = 'Watsons';
  SELECT id INTO brand_mediamarkt FROM brands WHERE name = 'MediaMarkt';
  SELECT id INTO brand_teknosa FROM brands WHERE name = 'Teknosa';
  SELECT id INTO brand_vatan FROM brands WHERE name = 'Vatan Bilgisayar';
  SELECT id INTO brand_getiryemek FROM brands WHERE name = 'GetirYemek';
  SELECT id INTO brand_trendyolyemek FROM brands WHERE name = 'Trendyol Yemek';
  SELECT id INTO brand_yemeksepeti FROM brands WHERE name = 'Yemeksepeti';
  
  -- For each city, link brands to categories via equivalent_brands
  -- İkinci El & Seri İlan
  FOR mapping_record IN 
    SELECT id as mapping_id FROM city_category_mappings WHERE category_id = cat_ikinciel
  LOOP
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_sahibinden, 1)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_letgo, 2)
    ON CONFLICT DO NOTHING;
  END LOOP;
  
  -- İndirim Marketleri
  FOR mapping_record IN 
    SELECT id as mapping_id FROM city_category_mappings WHERE category_id = cat_indirim
  LOOP
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_a101, 1)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_bim, 2)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_file, 3)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_sok, 4)
    ON CONFLICT DO NOTHING;
  END LOOP;
  
  -- Taksi & Araç Paylaşımı
  FOR mapping_record IN 
    SELECT id as mapping_id FROM city_category_mappings WHERE category_id = cat_taksi
  LOOP
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_bitaksi, 1)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_uber, 2)
    ON CONFLICT DO NOTHING;
  END LOOP;
  
  -- Emlak Portalları
  FOR mapping_record IN 
    SELECT id as mapping_id FROM city_category_mappings WHERE category_id = cat_emlak
  LOOP
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_emlakjet, 1)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_hepsiemlak, 2)
    ON CONFLICT DO NOTHING;
  END LOOP;
  
  -- Süpermarketler
  FOR mapping_record IN 
    SELECT id as mapping_id FROM city_category_mappings WHERE category_id = cat_supermarket
  LOOP
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_carrefour, 1)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_macro, 2)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_migros, 3)
    ON CONFLICT DO NOTHING;
  END LOOP;
  
  -- Moda Pazaryerleri
  FOR mapping_record IN 
    SELECT id as mapping_id FROM city_category_mappings WHERE category_id = cat_moda
  LOOP
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_dolap, 1)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_gardrops, 2)
    ON CONFLICT DO NOTHING;
  END LOOP;
  
  -- Dijital Bankacılık
  FOR mapping_record IN 
    SELECT id as mapping_id FROM city_category_mappings WHERE category_id = cat_dijital
  LOOP
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_enpara, 1)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_papara, 2)
    ON CONFLICT DO NOTHING;
  END LOOP;
  
  -- Mobil Operatörler
  FOR mapping_record IN 
    SELECT id as mapping_id FROM city_category_mappings WHERE category_id = cat_mobil
  LOOP
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_turktelekom, 1)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_turkcell, 2)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_vodafone, 3)
    ON CONFLICT DO NOTHING;
  END LOOP;
  
  -- Hızlı Market Teslimatı
  FOR mapping_record IN 
    SELECT id as mapping_id FROM city_category_mappings WHERE category_id = cat_hizli
  LOOP
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_getir, 1)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_trendyolgo, 2)
    ON CONFLICT DO NOTHING;
  END LOOP;
  
  -- Kozmetik & Kişisel Bakım
  FOR mapping_record IN 
    SELECT id as mapping_id FROM city_category_mappings WHERE category_id = cat_kozmetik
  LOOP
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_gratis, 1)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_sephora, 2)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_watsons, 3)
    ON CONFLICT DO NOTHING;
  END LOOP;
  
  -- Elektronik Mağazaları
  FOR mapping_record IN 
    SELECT id as mapping_id FROM city_category_mappings WHERE category_id = cat_elektronik
  LOOP
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_mediamarkt, 1)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_teknosa, 2)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_vatan, 3)
    ON CONFLICT DO NOTHING;
  END LOOP;
  
  -- Yemek Siparişi
  FOR mapping_record IN 
    SELECT id as mapping_id FROM city_category_mappings WHERE category_id = cat_yemek
  LOOP
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_getiryemek, 1)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_trendyolyemek, 2)
    ON CONFLICT DO NOTHING;
    
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
    VALUES (mapping_record.mapping_id, brand_yemeksepeti, 3)
    ON CONFLICT DO NOTHING;
  END LOOP;
  
END $$;
