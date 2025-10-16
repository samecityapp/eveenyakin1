/*
  # Add Tokyo Equivalent Brands - Correct Schema

  Add all missing Japanese brand equivalents for Tokyo categories.
  Using correct column names: logo_url instead of logo_filename.
*/

DO $$
DECLARE
  v_tokyo_city_id UUID;
  v_mapping_id UUID;
  v_cat_id UUID;
  v_brand_id UUID;
BEGIN
  SELECT id INTO v_tokyo_city_id FROM cities WHERE slug = 'tokyo';

  -- Dijital Bankacılık
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Dijital Bankacılık';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_tokyo_city_id AND ccm.category_id = v_cat_id;
  
  DELETE FROM equivalent_brands eb WHERE eb.mapping_id = v_mapping_id;
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Revolut', '/logos/revolut.svg', 'https://www.revolut.com/ja-JP')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Wise', '/logos/wise.svg', 'https://wise.com/jp/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- Emlak Portalları
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Emlak Portalları';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_tokyo_city_id AND ccm.category_id = v_cat_id;
  
  DELETE FROM equivalent_brands eb WHERE eb.mapping_id = v_mapping_id;
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('SUUMO', '/logos/suumo.svg', 'https://suumo.jp/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('HOMES', '/logos/homes.svg', 'https://www.homes.co.jp/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('athome', '/logos/athome.svg', 'https://www.athome.co.jp/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- Hızlı Market Teslimatı
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Hızlı Market Teslimatı';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_tokyo_city_id AND ccm.category_id = v_cat_id;
  
  DELETE FROM equivalent_brands eb WHERE eb.mapping_id = v_mapping_id;
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Uber Eats Market', '/logos/uber-eats.svg', 'https://www.ubereats.com/jp-en/category/grocery')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Wolt Market', '/logos/wolt.svg', 'https://wolt.com/ja/jpn/tokyo/category/grocery-stores')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('onigo', '/logos/onigo.svg', 'https://onigo.co.jp/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- Mobil Operatörler
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Mobil Operatörler';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_tokyo_city_id AND ccm.category_id = v_cat_id;
  
  DELETE FROM equivalent_brands eb WHERE eb.mapping_id = v_mapping_id;
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('docomo', '/logos/docomo.svg', 'https://www.docomo.ne.jp/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('au by KDDI', '/logos/au.svg', 'https://www.au.com/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('SoftBank', '/logos/softbank.svg', 'https://www.softbank.jp/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- Moda Pazaryerleri
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Moda Pazaryerleri';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_tokyo_city_id AND ccm.category_id = v_cat_id;
  
  DELETE FROM equivalent_brands eb WHERE eb.mapping_id = v_mapping_id;
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('ZOZOTOWN', '/logos/zozotown.svg', 'https://zozo.jp/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Mercari';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- Elektronik Mağazaları
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Elektronik Mağazaları';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_tokyo_city_id AND ccm.category_id = v_cat_id;
  
  DELETE FROM equivalent_brands eb WHERE eb.mapping_id = v_mapping_id;
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Yodobashi Camera', '/logos/yodobashi.svg', 'https://www.yodobashi.com/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Bic Camera', '/logos/biccamera.svg', 'https://www.biccamera.com/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Yamada Denki', '/logos/yamada.svg', 'https://www.yamada-denkiweb.com/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- Kozmetik & Kişisel Bakım
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Kozmetik & Kişisel Bakım';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_tokyo_city_id AND ccm.category_id = v_cat_id;
  
  DELETE FROM equivalent_brands eb WHERE eb.mapping_id = v_mapping_id;
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Matsumoto Kiyoshi', '/logos/matsukiyo.svg', 'https://www.matsukiyo.co.jp/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Don Quijote';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('@cosme Store', '/logos/cosme.svg', 'https://www.cosme.net/store/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url, logo_url = EXCLUDED.logo_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  RAISE NOTICE 'Tokyo equivalent brands completed!';
END $$;
