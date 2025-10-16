/*
  # Add Complete Berlin City Data
  
  ## Summary
  Comprehensive Berlin data with 13 categories matching London's "gold standard"
  
  ## New Categories Added (13 total)
  1. İndirim Marketleri (2 tips)
  2. Süpermarketler
  3. Hızlı Market Teslimatı
  4. Yemek Siparişi
  5. Taksi & Araç Paylaşımı
  6. İkinci El & Seri İlan
  7. Moda Pazaryerleri
  8. Emlak Portalları
  9. Dijital Bankacılık
  10. Mobil Operatörler
  11. Elektronik Mağazaları
  12. Kozmetik & Kişisel Bakım
  13. Toplu Taşıma Uygulaması
  
  ## New German Brands (25+)
  - Discount: Netto, Penny
  - Supermarkets: REWE, Edeka, Kaufland
  - Quick delivery: Flink
  - Food delivery: Lieferando, Wolt
  - Rideshare: FREENOW
  - Classifieds: Kleinanzeigen
  - Fashion: Kleiderkreisel
  - Real estate: ImmoScout24, Immonet, WG-Gesucht
  - Banking: N26, Vivid Money
  - Mobile: Telekom, Vodafone DE, O2, Aldi Talk
  - Electronics: Saturn, Conrad
  - Beauty: dm-drogerie markt, Rossmann, Douglas
  - Transport: BVG Fahrinfo, DB Navigator
  
  ## Pro Tips (2 total)
  - Sunday closing law
  - Pfand deposit system
*/

DO $$
DECLARE
  v_berlin_id uuid;
  v_category_id uuid;
  v_mapping_id uuid;
  v_brand_id uuid;
BEGIN
  SELECT id INTO v_berlin_id FROM cities WHERE slug = 'berlin';

  -- ========== CATEGORY 1: İndirim Marketleri ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'İndirim Marketleri';
  INSERT INTO city_category_mappings (city_id, category_id, pro_tips)
  VALUES (v_berlin_id, v_category_id, ARRAY[
    'Almanya''da Pazar günleri süpermarketler dahil neredeyse tüm dükkanlar kapalıdır.',
    'İçecek şişeleri için "Pfand" (depozito) sistemi vardır. Boşları makineye iade ederek para iadesi alabilirsiniz.'
  ]) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'A101';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'BİM';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Aldi';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Lidl';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Netto';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Penny';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 4);

  -- ========== CATEGORY 2: Süpermarketler ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Süpermarketler';
  INSERT INTO city_category_mappings (city_id, category_id) VALUES (v_berlin_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Migros';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'CarrefourSA';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'REWE';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Edeka';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Kaufland';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- ========== CATEGORY 3: Hızlı Market Teslimatı ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Hızlı Market Teslimatı';
  INSERT INTO city_category_mappings (city_id, category_id) VALUES (v_berlin_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Getir';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'İsteGelsin';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Gorillas';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Flink';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- ========== CATEGORY 4: Yemek Siparişi ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Yemek Siparişi';
  INSERT INTO city_category_mappings (city_id, category_id) VALUES (v_berlin_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Yemeksepeti';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'GetirYemek';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Lieferando';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Uber Eats';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Wolt';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- ========== CATEGORY 5: Taksi & Araç Paylaşımı ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Taksi & Araç Paylaşımı';
  INSERT INTO city_category_mappings (city_id, category_id) VALUES (v_berlin_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'BiTaksi';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Uber';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Uber';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Bolt';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'FREENOW';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- ========== CATEGORY 6: İkinci El & Seri İlan ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'İkinci El & Seri İlan';
  INSERT INTO city_category_mappings (city_id, category_id) VALUES (v_berlin_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Sahibinden';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Kleinanzeigen';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);

  -- ========== CATEGORY 7: Moda Pazaryerleri ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Moda Pazaryerleri';
  INSERT INTO city_category_mappings (city_id, category_id) VALUES (v_berlin_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Dolap';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Gardrops';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Vinted';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Kleiderkreisel';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- ========== CATEGORY 8: Emlak Portalları ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Emlak Portalları';
  INSERT INTO city_category_mappings (city_id, category_id) VALUES (v_berlin_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Hepsiemlak';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Emlakjet';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'ImmoScout24';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Immonet';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'WG-Gesucht';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- ========== CATEGORY 9: Dijital Bankacılık ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Dijital Bankacılık';
  INSERT INTO city_category_mappings (city_id, category_id) VALUES (v_berlin_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Enpara';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Papara';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'N26';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Vivid Money';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Revolut';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- ========== CATEGORY 10: Mobil Operatörler ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Mobil Operatörler';
  INSERT INTO city_category_mappings (city_id, category_id) VALUES (v_berlin_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Turkcell';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Vodafone TR';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Telekom';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Vodafone DE';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'O2';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Aldi Talk';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 4);

  -- ========== CATEGORY 11: Elektronik Mağazaları ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Elektronik Mağazaları';
  INSERT INTO city_category_mappings (city_id, category_id) VALUES (v_berlin_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Teknosa';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'MediaMarkt';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'MediaMarkt';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Saturn';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Conrad';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- ========== CATEGORY 12: Kozmetik & Kişisel Bakım ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Kozmetik & Kişisel Bakım';
  INSERT INTO city_category_mappings (city_id, category_id) VALUES (v_berlin_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Gratis';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Watsons';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'dm-drogerie markt';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Rossmann';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Douglas';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- ========== CATEGORY 13: Toplu Taşıma Uygulaması ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Toplu Taşıma Uygulaması';
  INSERT INTO city_category_mappings (city_id, category_id) VALUES (v_berlin_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Moovit';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'BVG Fahrinfo';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Citymapper';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'DB Navigator';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

END $$;
