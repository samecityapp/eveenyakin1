/*
  # Add Complete Roma City Data
  
  ## Summary
  Comprehensive Roma (Rome) data with 8 categories featuring Italian brands and local insights
  
  ## Categories Added (8 total)
  1. İndirim Marketleri
  2. Süpermarketler (2 tips)
  3. Yemek Siparişi
  4. Taksi & Araç Paylaşımı (2 tips)
  5. İkinci El & Seri İlan
  6. Emlak Portalları
  7. Mobil Operatörler
  8. Toplu Taşıma Uygulaması
  
  ## New Italian Brands (16 total)
  - Discount: Eurospin, MD SpA
  - Supermarkets: Coop, Conad, Carrefour Market, Esselunga
  - Food delivery: Glovo
  - Rideshare: itTaxi
  - Classifieds: Subito.it
  - Real estate: Immobiliare.it, Idealista
  - Mobile: TIM, Vodafone IT, Wind Tre, Iliad
  - Transport: ATAC
  
  ## Pro Tips (4 total)
  - Pausa Pranzo lunch break closures
  - Salumeria/Gastronomia sections
  - Taxi app requirement in Rome
  - Cash needed for taxis
*/

DO $$
DECLARE
  v_roma_id uuid;
  v_category_id uuid;
  v_mapping_id uuid;
  v_brand_id uuid;
BEGIN
  SELECT id INTO v_roma_id FROM cities WHERE slug = 'roma';

  -- ========== CATEGORY 1: İndirim Marketleri ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'İndirim Marketleri';
  INSERT INTO city_category_mappings (city_id, category_id)
  VALUES (v_roma_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'A101';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'BİM';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Lidl';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Eurospin';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'MD SpA';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- ========== CATEGORY 2: Süpermarketler ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Süpermarketler';
  INSERT INTO city_category_mappings (city_id, category_id, pro_tips)
  VALUES (v_roma_id, v_category_id, ARRAY[
    'Birçok süpermarkette öğle saatlerinde "Pausa Pranzo" (öğle arası) nedeniyle kısa süreli kapanmalar olabilir.',
    '"Salumeria" veya "Gastronomia" reyonlarından taze peynir ve şarküteri almayı unutmayın.'
  ]) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Migros';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'CarrefourSA';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Coop';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Conad';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Carrefour Market';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Esselunga';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 4);

  -- ========== CATEGORY 3: Yemek Siparişi ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Yemek Siparişi';
  INSERT INTO city_category_mappings (city_id, category_id)
  VALUES (v_roma_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Yemeksepeti';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Just Eat';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Glovo';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Deliveroo';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- ========== CATEGORY 4: Taksi & Araç Paylaşımı ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Taksi & Araç Paylaşımı';
  INSERT INTO city_category_mappings (city_id, category_id, pro_tips)
  VALUES (v_roma_id, v_category_id, ARRAY[
    'Roma''da yoldan taksi çevirmek zordur. Duraklardan binmek veya uygulama ile çağırmak en iyisidir.',
    'Taksilerde kredi kartı geçerli olmayabilir, yanınızda nakit bulundurmakta fayda var.'
  ]) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'BiTaksi';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Uber';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'FREENOW';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'itTaxi';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- ========== CATEGORY 5: İkinci El & Seri İlan ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'İkinci El & Seri İlan';
  INSERT INTO city_category_mappings (city_id, category_id)
  VALUES (v_roma_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Sahibinden';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Subito.it';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Facebook Marketplace';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- ========== CATEGORY 6: Emlak Portalları ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Emlak Portalları';
  INSERT INTO city_category_mappings (city_id, category_id)
  VALUES (v_roma_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Hepsiemlak';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Immobiliare.it';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Idealista';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- ========== CATEGORY 7: Mobil Operatörler ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Mobil Operatörler';
  INSERT INTO city_category_mappings (city_id, category_id)
  VALUES (v_roma_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Turkcell';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Vodafone TR';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'TIM';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Vodafone IT';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Wind Tre';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Iliad';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 4);

  -- ========== CATEGORY 8: Toplu Taşıma Uygulaması ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Toplu Taşıma Uygulaması';
  INSERT INTO city_category_mappings (city_id, category_id)
  VALUES (v_roma_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Moovit';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Moovit';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Citymapper';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'ATAC';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

END $$;
