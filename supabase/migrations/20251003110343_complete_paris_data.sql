/*
  # Complete Paris Data - Gold Standard

  1. Missing Categories
    - Hızlı Market Teslimatı
    - Moda Pazaryerleri
    - Emlak Portalları
    - Dijital Bankacılık
    - Mobil Operatörler
    - Elektronik Mağazaları
    - Kozmetik & Kişisel Bakım

  2. Notes
    - Adds all missing categories with French brands
    - Matches London/Berlin gold standard
*/

DO $$
DECLARE
  v_paris_id uuid;
  v_category_id uuid;
  v_mapping_id uuid;
  v_brand_id uuid;
BEGIN
  -- Get Paris city ID
  SELECT id INTO v_paris_id FROM cities WHERE slug = 'paris';

  -- Hızlı Market Teslimatı
  SELECT id INTO v_category_id FROM categories WHERE name = 'Hızlı Market Teslimatı';
  IF v_category_id IS NULL THEN
    INSERT INTO categories (name, description) 
    VALUES ('Hızlı Market Teslimatı', '15-20 dakikada acil market ihtiyaçları.')
    RETURNING id INTO v_category_id;
  END IF;
  
  INSERT INTO city_category_mappings (city_id, category_id, pro_tips)
  VALUES (v_paris_id, v_category_id, ARRAY[]::text[])
  RETURNING id INTO v_mapping_id;

  -- Turkish brands
  INSERT INTO brands (name, logo_url, website_url) VALUES ('Getir', '/logos/getir.svg', 'https://getir.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
  
  INSERT INTO brands (name, logo_url, website_url) VALUES ('İsteGelsin', '/logos/istegelsin.svg', 'https://www.istegelsin.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);

  -- French brands
  INSERT INTO brands (name, logo_url, website_url) VALUES ('Gorillas', '/logos/gorillas.svg', 'https://gorillas.io/fr') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url) VALUES ('Flink', '/logos/file.svg', 'https://www.goflink.com/fr-FR/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- Moda Pazaryerleri
  SELECT id INTO v_category_id FROM categories WHERE name = 'Moda Pazaryerleri';
  IF v_category_id IS NULL THEN
    INSERT INTO categories (name, description) 
    VALUES ('Moda Pazaryerleri', 'İkinci el kıyafet alıp satmak için.')
    RETURNING id INTO v_category_id;
  END IF;
  
  INSERT INTO city_category_mappings (city_id, category_id, pro_tips)
  VALUES (v_paris_id, v_category_id, ARRAY[]::text[])
  RETURNING id INTO v_mapping_id;

  INSERT INTO brands (name, logo_url, website_url) VALUES ('Dolap', '/logos/dolap.svg', 'https://dolap.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
  
  INSERT INTO brands (name, logo_url, website_url) VALUES ('Gardrops', '/logos/gardrops.svg', 'https://www.gardrops.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);

  INSERT INTO brands (name, logo_url, website_url) VALUES ('Vinted', '/logos/vinted.svg', 'https://www.vinted.fr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);

  -- Emlak Portalları
  SELECT id INTO v_category_id FROM categories WHERE name = 'Emlak Portalları';
  IF v_category_id IS NULL THEN
    INSERT INTO categories (name, description) 
    VALUES ('Emlak Portalları', 'Kiralık ve satılık ev aramak için.')
    RETURNING id INTO v_category_id;
  END IF;
  
  INSERT INTO city_category_mappings (city_id, category_id, pro_tips)
  VALUES (v_paris_id, v_category_id, ARRAY['SeLoger en kapsamlısı, PAP ise komisyonsuz, doğrudan sahipten ilanlar için popülerdir.']::text[])
  RETURNING id INTO v_mapping_id;

  INSERT INTO brands (name, logo_url, website_url) VALUES ('Hepsiemlak', '/logos/hepsiemlak.svg', 'https://www.hepsiemlak.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
  
  INSERT INTO brands (name, logo_url, website_url) VALUES ('Emlakjet', '/logos/emlakjet.svg', 'https://www.emlakjet.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);

  INSERT INTO brands (name, logo_url, website_url) VALUES ('SeLoger', '/logos/file.svg', 'https://www.seloger.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url) VALUES ('PAP', '/logos/file.svg', 'https://www.pap.fr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- Dijital Bankacılık
  SELECT id INTO v_category_id FROM categories WHERE name = 'Dijital Bankacılık';
  IF v_category_id IS NULL THEN
    INSERT INTO categories (name, description) 
    VALUES ('Dijital Bankacılık', 'Şubesiz, dijital bankalar.')
    RETURNING id INTO v_category_id;
  END IF;
  
  INSERT INTO city_category_mappings (city_id, category_id, pro_tips)
  VALUES (v_paris_id, v_category_id, ARRAY[]::text[])
  RETURNING id INTO v_mapping_id;

  INSERT INTO brands (name, logo_url, website_url) VALUES ('Enpara', '/logos/enpara.svg', 'https://www.qnbfinansbank.enpara.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
  
  INSERT INTO brands (name, logo_url, website_url) VALUES ('Papara', '/logos/papara.svg', 'https://www.papara.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);

  INSERT INTO brands (name, logo_url, website_url) VALUES ('Revolut', '/logos/revolut.svg', 'https://www.revolut.com/fr-FR') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url) VALUES ('N26', '/logos/file.svg', 'https://n26.com/fr') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- Mobil Operatörler
  SELECT id INTO v_category_id FROM categories WHERE name = 'Mobil Operatörler';
  IF v_category_id IS NULL THEN
    INSERT INTO categories (name, description) 
    VALUES ('Mobil Operatörler', 'Telefon ve internet hattı.')
    RETURNING id INTO v_category_id;
  END IF;
  
  INSERT INTO city_category_mappings (city_id, category_id, pro_tips)
  VALUES (v_paris_id, v_category_id, ARRAY['Free Mobile, agresif fiyat politikalarıyla bilinen popüler bir alternatiftir.']::text[])
  RETURNING id INTO v_mapping_id;

  INSERT INTO brands (name, logo_url, website_url) VALUES ('Turkcell', '/logos/turkcell.svg', 'https://www.turkcell.com.tr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
  
  INSERT INTO brands (name, logo_url, website_url) VALUES ('Vodafone TR', '/logos/vodafone-tr.svg', 'https://www.vodafone.com.tr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);

  INSERT INTO brands (name, logo_url, website_url) VALUES ('Orange', '/logos/file.svg', 'https://www.orange.fr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url) VALUES ('SFR', '/logos/file.svg', 'https://www.sfr.fr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  
  INSERT INTO brands (name, logo_url, website_url) VALUES ('Free Mobile', '/logos/file.svg', 'https://mobile.free.fr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- Elektronik Mağazaları
  SELECT id INTO v_category_id FROM categories WHERE name = 'Elektronik Mağazaları';
  IF v_category_id IS NULL THEN
    INSERT INTO categories (name, description) 
    VALUES ('Elektronik Mağazaları', 'Bilgisayar, telefon ve elektronik.')
    RETURNING id INTO v_category_id;
  END IF;
  
  INSERT INTO city_category_mappings (city_id, category_id, pro_tips)
  VALUES (v_paris_id, v_category_id, ARRAY['Fnac, elektroniğin yanı sıra kitap ve müzik için de en popüler adrestir.']::text[])
  RETURNING id INTO v_mapping_id;

  INSERT INTO brands (name, logo_url, website_url) VALUES ('Teknosa', '/logos/teknosa.svg', 'https://www.teknosa.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
  
  INSERT INTO brands (name, logo_url, website_url) VALUES ('Vatan', '/logos/vatan.svg', 'https://www.vatanbilgisayar.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);

  INSERT INTO brands (name, logo_url, website_url) VALUES ('Fnac', '/logos/file.svg', 'https://www.fnac.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url) VALUES ('Darty', '/logos/file.svg', 'https://www.darty.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- Kozmetik & Kişisel Bakım
  SELECT id INTO v_category_id FROM categories WHERE name = 'Kozmetik & Kişisel Bakım';
  IF v_category_id IS NULL THEN
    INSERT INTO categories (name, description) 
    VALUES ('Kozmetik & Kişisel Bakım', 'Makyaj, cilt bakımı ve parfüm.')
    RETURNING id INTO v_category_id;
  END IF;
  
  INSERT INTO city_category_mappings (city_id, category_id, pro_tips)
  VALUES (v_paris_id, v_category_id, ARRAY['City Pharma, özellikle dermokozmetik ürünleri inanılmaz uygun fiyata bulabileceğiniz, turistlerin akın ettiği bir eczanedir.']::text[])
  RETURNING id INTO v_mapping_id;

  INSERT INTO brands (name, logo_url, website_url) VALUES ('Gratis', '/logos/gratis.svg', 'https://www.gratis.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
  
  INSERT INTO brands (name, logo_url, website_url) VALUES ('Watsons', '/logos/watsons.svg', 'https://www.watsons.com.tr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);

  INSERT INTO brands (name, logo_url, website_url) VALUES ('Sephora FR', '/logos/sephora.svg', 'https://www.sephora.fr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url) VALUES ('Marionnaud', '/logos/file.svg', 'https://www.marionnaud.fr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  
  INSERT INTO brands (name, logo_url, website_url) VALUES ('City Pharma', '/logos/file.svg', 'https://pharmacie-citypharma.fr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

END $$;
