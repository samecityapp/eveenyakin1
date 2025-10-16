/*
  # Add Tokyo City - Basic Version
  
  Adds Tokyo with key categories and brands.
  
  1. Tokyo City
    - Pink theme (Sakura)
    - Japanese icons
  
  2. Key Categories
    - İndirim Marketleri (Don Quijote, Gyomu Super)
    - Süpermarketler (AEON, Ito-Yokado, Seiyu)
    - Yemek Siparişi (Uber Eats JP, Demae-can, Wolt)
    - Taksi (Uber JP, GO, DiDi)
    - İkinci El (Mercari, Rakuma, Yahoo Auctions)
*/

DO $$
DECLARE
  v_tokyo_id uuid;
  v_category_id uuid;
  v_mapping_id uuid;
  v_brand_id uuid;
BEGIN
  -- Insert Tokyo city
  INSERT INTO cities (name, slug, country, bg_color, icon_color, icon_names)
  VALUES (
    'Tokyo',
    'tokyo',
    'Japonya',
    'bg-pink-50',
    'text-pink-200',
    ARRAY['Cherry', 'Sparkles', 'Fish', 'Globe']
  )
  ON CONFLICT (slug) DO UPDATE
  SET name = EXCLUDED.name, country = EXCLUDED.country
  RETURNING id INTO v_tokyo_id;

  RAISE NOTICE 'Tokyo added: %', v_tokyo_id;

  -- İndirim Marketleri
  SELECT id INTO v_category_id FROM categories WHERE name = 'İndirim Marketleri';
  IF v_category_id IS NOT NULL THEN
    INSERT INTO city_category_mappings (city_id, category_id)
    VALUES (v_tokyo_id, v_category_id)
    ON CONFLICT (city_id, category_id) DO NOTHING
    RETURNING id INTO v_mapping_id;
    
    -- Turkish brands
    INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
    SELECT v_mapping_id, id, 'TR', 1 FROM brands WHERE name = 'A101' ON CONFLICT DO NOTHING;
    INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
    SELECT v_mapping_id, id, 'TR', 2 FROM brands WHERE name = 'BİM' ON CONFLICT DO NOTHING;
    INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
    SELECT v_mapping_id, id, 'TR', 3 FROM brands WHERE name = 'Şok' ON CONFLICT DO NOTHING;

    -- Japanese brands
    INSERT INTO brands (name, logo_url, website_url) VALUES ('Don Quijote', '/logos/file.svg', 'https://www.donki.com/') ON CONFLICT (name) DO NOTHING RETURNING id INTO v_brand_id;
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1) ON CONFLICT DO NOTHING;
    
    INSERT INTO brands (name, logo_url, website_url) VALUES ('Gyomu Super', '/logos/file.svg', 'https://www.gyomusuper.jp/') ON CONFLICT (name) DO NOTHING RETURNING id INTO v_brand_id;
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2) ON CONFLICT DO NOTHING;
  END IF;

  -- Süpermarketler
  SELECT id INTO v_category_id FROM categories WHERE name = 'Süpermarketler';
  IF v_category_id IS NOT NULL THEN
    INSERT INTO city_category_mappings (city_id, category_id)
    VALUES (v_tokyo_id, v_category_id)
    ON CONFLICT (city_id, category_id) DO NOTHING
    RETURNING id INTO v_mapping_id;

    INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
    SELECT v_mapping_id, id, 'TR', 1 FROM brands WHERE name = 'Migros' ON CONFLICT DO NOTHING;
    INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
    SELECT v_mapping_id, id, 'TR', 2 FROM brands WHERE name = 'CarrefourSA' ON CONFLICT DO NOTHING;

    INSERT INTO brands (name, logo_url, website_url) VALUES ('AEON', '/logos/file.svg', 'https://www.aeon.info/') ON CONFLICT (name) DO NOTHING RETURNING id INTO v_brand_id;
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1) ON CONFLICT DO NOTHING;

    INSERT INTO brands (name, logo_url, website_url) VALUES ('Ito-Yokado', '/logos/file.svg', 'https://www.itoyokado.co.jp/') ON CONFLICT (name) DO NOTHING RETURNING id INTO v_brand_id;
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2) ON CONFLICT DO NOTHING;

    INSERT INTO brands (name, logo_url, website_url) VALUES ('Seiyu', '/logos/file.svg', 'https://www.seiyu.co.jp/') ON CONFLICT (name) DO NOTHING RETURNING id INTO v_brand_id;
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3) ON CONFLICT DO NOTHING;
  END IF;

  -- Yemek Siparişi
  SELECT id INTO v_category_id FROM categories WHERE name = 'Yemek Siparişi';
  IF v_category_id IS NOT NULL THEN
    INSERT INTO city_category_mappings (city_id, category_id)
    VALUES (v_tokyo_id, v_category_id)
    ON CONFLICT (city_id, category_id) DO NOTHING
    RETURNING id INTO v_mapping_id;

    INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
    SELECT v_mapping_id, id, 'TR', 1 FROM brands WHERE name = 'Yemeksepeti' ON CONFLICT DO NOTHING;

    INSERT INTO brands (name, logo_url, website_url) VALUES ('Uber Eats JP', '/logos/uber-eats.svg', 'https://www.ubereats.com/jp') ON CONFLICT (name) DO NOTHING RETURNING id INTO v_brand_id;
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1) ON CONFLICT DO NOTHING;

    INSERT INTO brands (name, logo_url, website_url) VALUES ('Demae-can', '/logos/file.svg', 'https://demae-can.com/') ON CONFLICT (name) DO NOTHING RETURNING id INTO v_brand_id;
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2) ON CONFLICT DO NOTHING;

    INSERT INTO brands (name, logo_url, website_url) VALUES ('Wolt JP', '/logos/file.svg', 'https://wolt.com/ja/jpn/tokyo') ON CONFLICT (name) DO NOTHING RETURNING id INTO v_brand_id;
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3) ON CONFLICT DO NOTHING;
  END IF;

  -- Taksi & Araç Paylaşımı
  SELECT id INTO v_category_id FROM categories WHERE name = 'Taksi & Araç Paylaşımı';
  IF v_category_id IS NOT NULL THEN
    INSERT INTO city_category_mappings (city_id, category_id)
    VALUES (v_tokyo_id, v_category_id)
    ON CONFLICT (city_id, category_id) DO NOTHING
    RETURNING id INTO v_mapping_id;

    INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
    SELECT v_mapping_id, id, 'TR', 1 FROM brands WHERE name = 'BiTaksi' ON CONFLICT DO NOTHING;

    INSERT INTO brands (name, logo_url, website_url) VALUES ('Uber JP', '/logos/uber.svg', 'https://www.uber.com/jp/ja/') ON CONFLICT (name) DO NOTHING RETURNING id INTO v_brand_id;
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1) ON CONFLICT DO NOTHING;

    INSERT INTO brands (name, logo_url, website_url) VALUES ('GO Taxi', '/logos/file.svg', 'https://go.goinc.jp/') ON CONFLICT (name) DO NOTHING RETURNING id INTO v_brand_id;
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2) ON CONFLICT DO NOTHING;

    INSERT INTO brands (name, logo_url, website_url) VALUES ('DiDi JP', '/logos/file.svg', 'https://didimobility.co.jp/') ON CONFLICT (name) DO NOTHING RETURNING id INTO v_brand_id;
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3) ON CONFLICT DO NOTHING;
  END IF;

  -- İkinci El & Seri İlan
  SELECT id INTO v_category_id FROM categories WHERE name = 'İkinci El & Seri İlan';
  IF v_category_id IS NOT NULL THEN
    INSERT INTO city_category_mappings (city_id, category_id)
    VALUES (v_tokyo_id, v_category_id)
    ON CONFLICT (city_id, category_id) DO NOTHING
    RETURNING id INTO v_mapping_id;

    INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order)
    SELECT v_mapping_id, id, 'TR', 1 FROM brands WHERE name = 'Sahibinden.com' ON CONFLICT DO NOTHING;

    INSERT INTO brands (name, logo_url, website_url) VALUES ('Mercari', '/logos/file.svg', 'https://jp.mercari.com/') ON CONFLICT (name) DO NOTHING RETURNING id INTO v_brand_id;
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1) ON CONFLICT DO NOTHING;

    INSERT INTO brands (name, logo_url, website_url) VALUES ('Rakuma', '/logos/file.svg', 'https://fril.jp/') ON CONFLICT (name) DO NOTHING RETURNING id INTO v_brand_id;
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2) ON CONFLICT DO NOTHING;

    INSERT INTO brands (name, logo_url, website_url) VALUES ('Yahoo! Auctions JP', '/logos/file.svg', 'https://auctions.yahoo.co.jp/') ON CONFLICT (name) DO NOTHING RETURNING id INTO v_brand_id;
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3) ON CONFLICT DO NOTHING;
  END IF;

  RAISE NOTICE 'Tokyo basic categories added successfully!';

END $$;
