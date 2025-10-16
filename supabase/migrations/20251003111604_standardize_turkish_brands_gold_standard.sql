/*
  # Standardize Turkish Brands - Gold Standard

  1. Changes
    - Removes ALL existing Turkish brands
    - Adds standard Turkish brands according to Gold Standard
    - Applied to ALL cities (London, Berlin, Paris)

  2. Gold Standard Turkish Brands
    - İndirim Marketleri: A101, BİM, Şok, File
    - Süpermarketler: Migros, CarrefourSA, Macro Center
    - Hızlı Market Teslimatı: Getir, Trendyol Go, İsteGelsin
    - Yemek Siparişi: Yemeksepeti, Trendyol Yemek, GetirYemek
    - Taksi & Araç Paylaşımı: BiTaksi, Uber Türkiye, Martı TAG
    - İkinci El: Sahibinden.com, Letgo
    - Moda: Dolap, Gardrops
    - Emlak: Hepsiemlak, Emlakjet
    - Dijital Banka: Enpara, Papara
    - Mobil: Turkcell, Vodafone TR, Türk Telekom
    - Elektronik: Teknosa, Vatan, MediaMarkt
    - Kozmetik: Gratis, Watsons, Sephora
    - Toplu Taşıma: Moovit
*/

DO $$
DECLARE
  v_city_id uuid;
  v_category_id uuid;
  v_mapping_id uuid;
  v_brand_id uuid;
BEGIN
  -- First, delete ALL existing Turkish brands
  DELETE FROM source_country_brands WHERE country_code = 'TR';

  -- Now add standard Turkish brands for EACH city
  FOR v_city_id IN SELECT id FROM cities WHERE slug IN ('london', 'berlin', 'paris') LOOP
    
    -- İndirim Marketleri
    SELECT ccm.id INTO v_mapping_id 
    FROM city_category_mappings ccm
    JOIN categories c ON c.id = ccm.category_id
    WHERE ccm.city_id = v_city_id AND c.name = 'İndirim Marketleri';
    
    IF v_mapping_id IS NOT NULL THEN
      INSERT INTO brands (name, logo_url, website_url) VALUES ('A101', '/logos/a101.svg', 'https://a101.com.tr') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('BİM', '/logos/bim.svg', 'https://bim.com.tr') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Şok', '/logos/sok.svg', 'https://sokmarket.com.tr') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 3);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('File', '/logos/file.svg', 'https://www.file.com.tr') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 4);
    END IF;

    -- Süpermarketler
    SELECT ccm.id INTO v_mapping_id 
    FROM city_category_mappings ccm
    JOIN categories c ON c.id = ccm.category_id
    WHERE ccm.city_id = v_city_id AND c.name = 'Süpermarketler';
    
    IF v_mapping_id IS NOT NULL THEN
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Migros', '/logos/migros.svg', 'https://www.migros.com.tr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('CarrefourSA', '/logos/carrefour.svg', 'https://www.carrefoursa.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Macro Center', '/logos/macro.svg', 'https://www.macrocenter.com.tr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 3);
    END IF;

    -- Hızlı Market Teslimatı
    SELECT ccm.id INTO v_mapping_id 
    FROM city_category_mappings ccm
    JOIN categories c ON c.id = ccm.category_id
    WHERE ccm.city_id = v_city_id AND c.name = 'Hızlı Market Teslimatı';
    
    IF v_mapping_id IS NOT NULL THEN
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Getir', '/logos/getir.svg', 'https://getir.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Trendyol Go', '/logos/trendyol.svg', 'https://www.trendyol.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('İsteGelsin', '/logos/istegelsin.svg', 'https://www.istegelsin.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 3);
    END IF;

    -- Yemek Siparişi
    SELECT ccm.id INTO v_mapping_id 
    FROM city_category_mappings ccm
    JOIN categories c ON c.id = ccm.category_id
    WHERE ccm.city_id = v_city_id AND c.name = 'Yemek Siparişi';
    
    IF v_mapping_id IS NOT NULL THEN
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Yemeksepeti', '/logos/yemeksepeti.svg', 'https://www.yemeksepeti.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Trendyol Yemek', '/logos/trendyol-yemek.svg', 'https://www.trendyol.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('GetirYemek', '/logos/getiryemek.svg', 'https://getir.com/yemek/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 3);
    END IF;

    -- Taksi & Araç Paylaşımı
    SELECT ccm.id INTO v_mapping_id 
    FROM city_category_mappings ccm
    JOIN categories c ON c.id = ccm.category_id
    WHERE ccm.city_id = v_city_id AND c.name = 'Taksi & Araç Paylaşımı';
    
    IF v_mapping_id IS NOT NULL THEN
      INSERT INTO brands (name, logo_url, website_url) VALUES ('BiTaksi', '/logos/bitaksi.svg', 'https://www.bitaksi.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Uber Türkiye', '/logos/uber.svg', 'https://www.uber.com/tr/tr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Martı TAG', '/logos/marti.svg', 'https://www.marti.tech/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 3);
    END IF;

    -- İkinci El & Seri İlan
    SELECT ccm.id INTO v_mapping_id 
    FROM city_category_mappings ccm
    JOIN categories c ON c.id = ccm.category_id
    WHERE ccm.city_id = v_city_id AND c.name = 'İkinci El & Seri İlan';
    
    IF v_mapping_id IS NOT NULL THEN
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Sahibinden.com', '/logos/sahibinden.svg', 'https://www.sahibinden.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Letgo', '/logos/letgo.svg', 'https://www.letgo.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);
    END IF;

    -- Moda Pazaryerleri
    SELECT ccm.id INTO v_mapping_id 
    FROM city_category_mappings ccm
    JOIN categories c ON c.id = ccm.category_id
    WHERE ccm.city_id = v_city_id AND c.name = 'Moda Pazaryerleri';
    
    IF v_mapping_id IS NOT NULL THEN
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Dolap', '/logos/dolap.svg', 'https://dolap.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Gardrops', '/logos/gardrops.svg', 'https://www.gardrops.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);
    END IF;

    -- Emlak Portalları
    SELECT ccm.id INTO v_mapping_id 
    FROM city_category_mappings ccm
    JOIN categories c ON c.id = ccm.category_id
    WHERE ccm.city_id = v_city_id AND c.name = 'Emlak Portalları';
    
    IF v_mapping_id IS NOT NULL THEN
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Hepsiemlak', '/logos/hepsiemlak.svg', 'https://www.hepsiemlak.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Emlakjet', '/logos/emlakjet.svg', 'https://www.emlakjet.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);
    END IF;

    -- Dijital Bankacılık
    SELECT ccm.id INTO v_mapping_id 
    FROM city_category_mappings ccm
    JOIN categories c ON c.id = ccm.category_id
    WHERE ccm.city_id = v_city_id AND c.name = 'Dijital Bankacılık';
    
    IF v_mapping_id IS NOT NULL THEN
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Enpara', '/logos/enpara.svg', 'https://www.qnbfinansbank.enpara.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Papara', '/logos/papara.svg', 'https://www.papara.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);
    END IF;

    -- Mobil Operatörler
    SELECT ccm.id INTO v_mapping_id 
    FROM city_category_mappings ccm
    JOIN categories c ON c.id = ccm.category_id
    WHERE ccm.city_id = v_city_id AND c.name = 'Mobil Operatörler';
    
    IF v_mapping_id IS NOT NULL THEN
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Turkcell', '/logos/turkcell.svg', 'https://www.turkcell.com.tr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Vodafone TR', '/logos/vodafone-tr.svg', 'https://www.vodafone.com.tr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Türk Telekom', '/logos/turktelekom.svg', 'https://www.turktelekom.com.tr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 3);
    END IF;

    -- Elektronik Mağazaları
    SELECT ccm.id INTO v_mapping_id 
    FROM city_category_mappings ccm
    JOIN categories c ON c.id = ccm.category_id
    WHERE ccm.city_id = v_city_id AND c.name = 'Elektronik Mağazaları';
    
    IF v_mapping_id IS NOT NULL THEN
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Teknosa', '/logos/teknosa.svg', 'https://www.teknosa.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Vatan Bilgisayar', '/logos/vatan.svg', 'https://www.vatanbilgisayar.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('MediaMarkt TR', '/logos/mediamarkt.svg', 'https://www.mediamarkt.com.tr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 3);
    END IF;

    -- Kozmetik & Kişisel Bakım
    SELECT ccm.id INTO v_mapping_id 
    FROM city_category_mappings ccm
    JOIN categories c ON c.id = ccm.category_id
    WHERE ccm.city_id = v_city_id AND c.name = 'Kozmetik & Kişisel Bakım';
    
    IF v_mapping_id IS NOT NULL THEN
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Gratis', '/logos/gratis.svg', 'https://www.gratis.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Watsons', '/logos/watsons.svg', 'https://www.watsons.com.tr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 2);
      
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Sephora TR', '/logos/sephora.svg', 'https://www.sephora.com.tr/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 3);
    END IF;

    -- Toplu Taşıma Uygulaması
    SELECT ccm.id INTO v_mapping_id 
    FROM city_category_mappings ccm
    JOIN categories c ON c.id = ccm.category_id
    WHERE ccm.city_id = v_city_id AND c.name = 'Toplu Taşıma Uygulaması';
    
    IF v_mapping_id IS NOT NULL THEN
      INSERT INTO brands (name, logo_url, website_url) VALUES ('Moovit', '/logos/file.svg', 'https://moovitapp.com/') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name RETURNING id INTO v_brand_id;
      INSERT INTO source_country_brands (mapping_id, brand_id, country_code, sort_order) VALUES (v_mapping_id, v_brand_id, 'TR', 1);
    END IF;

  END LOOP;

END $$;
