/*
  # Add Paris Complete Data with Missing Categories
  
  ## Summary
  Adds complete Paris data including creating the missing "Toplu Taşıma Uygulaması" category
  
  ## Categories for Paris (6 total)
  1. İndirim Marketleri (2 tips)
  2. Süpermarketler
  3. Yemek Siparişi (1 tip)
  4. Taksi & Araç Paylaşımı (2 tips)
  5. İkinci El & Seri İlan
  6. Toplu Taşıma Uygulaması (NEW)
*/

DO $$
DECLARE
  v_paris_id uuid;
  v_category_id uuid;
  v_mapping_id uuid;
  v_brand_id uuid;
BEGIN
  SELECT id INTO v_paris_id FROM cities WHERE slug = 'paris';

  -- ========== CATEGORY 1: İndirim Marketleri ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'İndirim Marketleri';
  
  INSERT INTO city_category_mappings (city_id, category_id, pro_tips)
  VALUES (v_paris_id, v_category_id, ARRAY[
    'Büyük zincir Carrefour''un "Carrefour City" gibi daha küçük ve pratik şehir içi formatları bulunur.',
    'Franprix, özellikle şehir merkezinde çok yaygındır ve genellikle Pazar günleri de açıktır.'
  ]) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'A101';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'BİM';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Aldi';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'de', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Lidl';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'de', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Lidl';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Aldi';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Leader Price';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Franprix';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 4);

  -- ========== CATEGORY 2: Süpermarketler ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Süpermarketler';
  INSERT INTO city_category_mappings (city_id, category_id) VALUES (v_paris_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Migros';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'CarrefourSA';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Carrefour';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Monoprix';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Auchan';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Intermarché';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 4);

  -- ========== CATEGORY 3: Yemek Siparişi ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Yemek Siparişi';
  INSERT INTO city_category_mappings (city_id, category_id, pro_tips)
  VALUES (v_paris_id, v_category_id, ARRAY[
    'Birçok yerel fırın (boulangerie) ve pastane bu uygulamalar üzerinden sandviç ve tatlı satışı yapar, mutlaka deneyin.'
  ]) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Yemeksepeti';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'GetirYemek';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Uber Eats';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Deliveroo';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- ========== CATEGORY 4: Taksi & Araç Paylaşımı ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'Taksi & Araç Paylaşımı';
  INSERT INTO city_category_mappings (city_id, category_id, pro_tips)
  VALUES (v_paris_id, v_category_id, ARRAY[
    'G7, Paris''in en köklü ve resmi taksi şirketidir, telefonla veya kendi uygulamasıyla çağırabilirsiniz.',
    'Toplu taşıma (Metro) Paris''te genellikle taksiden çok daha hızlı ve verimlidir.'
  ]) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'BiTaksi';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Uber';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 2);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Uber';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Bolt';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'G7 Taxi';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- ========== CATEGORY 5: İkinci El & Seri İlan ==========
  SELECT id INTO v_category_id FROM categories WHERE name = 'İkinci El & Seri İlan';
  INSERT INTO city_category_mappings (city_id, category_id) VALUES (v_paris_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Sahibinden';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Le Bon Coin';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Vinted';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- ========== CATEGORY 6: Toplu Taşıma Uygulaması (NEW) ==========
  INSERT INTO categories (name, description)
  VALUES ('Toplu Taşıma Uygulaması', 'Metro, RER ve otobüsler için en iyi rota planlayıcılar.')
  RETURNING id INTO v_category_id;
  
  INSERT INTO city_category_mappings (city_id, category_id) VALUES (v_paris_id, v_category_id) RETURNING id INTO v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Moovit';
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'tr', 1);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Citymapper';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Bonjour RATP';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

END $$;
