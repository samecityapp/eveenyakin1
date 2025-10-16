/*
  # Ensure All Cities Have Exactly 12 Standard Categories

  ## Overview
  This migration ensures every city has exactly these 12 categories with proper mappings:
  1. İkinci El & Seri İlan
  2. İndirim Marketleri  
  3. Taksi & Araç Paylaşımı
  4. Emlak Portalları
  5. Süpermarketler
  6. Moda Pazaryerleri
  7. Dijital Bankacılık
  8. Mobil Operatörler
  9. Hızlı Market Teslimatı
  10. Kozmetik & Kişisel Bakım
  11. Elektronik Mağazaları
  12. Yemek Siparişi

  ## Changes
  - Removes "Toplu Taşıma Uygulaması" category
  - Ensures all 5 cities (Berlin, Londra, Paris, Roma, Tokyo) have all 12 categories
  - Creates missing city_category_mappings
*/

-- First, get category IDs
DO $$
DECLARE
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
  cat_toplu uuid;
  
  city_berlin uuid := '1443851f-eff5-4992-92a7-dbdfa52b7d0a';
  city_londra uuid := 'ebe8639c-dac0-4d2c-b71a-5d2c63ac790b';
  city_paris uuid := 'a2f502da-4250-40e1-8bce-1dd2203be57d';
  city_roma uuid := '4c7a8dfa-9965-4fb6-9602-290708b3ebed';
  city_tokyo uuid := '0e50a122-4556-4eab-811d-3d7967a64d41';
BEGIN
  -- Get all category IDs
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
  SELECT id INTO cat_toplu FROM categories WHERE name = 'Toplu Taşıma Uygulaması';

  -- Delete "Toplu Taşıma" category and its mappings
  IF cat_toplu IS NOT NULL THEN
    DELETE FROM city_category_mappings WHERE category_id = cat_toplu;
    DELETE FROM categories WHERE id = cat_toplu;
  END IF;

  -- Create mappings for all cities for each category if not exists
  -- Berlin
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_berlin, cat_ikinciel WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_berlin AND category_id = cat_ikinciel);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_berlin, cat_indirim WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_berlin AND category_id = cat_indirim);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_berlin, cat_taksi WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_berlin AND category_id = cat_taksi);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_berlin, cat_emlak WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_berlin AND category_id = cat_emlak);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_berlin, cat_supermarket WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_berlin AND category_id = cat_supermarket);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_berlin, cat_moda WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_berlin AND category_id = cat_moda);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_berlin, cat_dijital WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_berlin AND category_id = cat_dijital);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_berlin, cat_mobil WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_berlin AND category_id = cat_mobil);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_berlin, cat_hizli WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_berlin AND category_id = cat_hizli);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_berlin, cat_kozmetik WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_berlin AND category_id = cat_kozmetik);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_berlin, cat_elektronik WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_berlin AND category_id = cat_elektronik);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_berlin, cat_yemek WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_berlin AND category_id = cat_yemek);

  -- Londra (repeat for all 12 categories)
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_londra, cat_ikinciel WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_londra AND category_id = cat_ikinciel);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_londra, cat_indirim WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_londra AND category_id = cat_indirim);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_londra, cat_taksi WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_londra AND category_id = cat_taksi);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_londra, cat_emlak WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_londra AND category_id = cat_emlak);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_londra, cat_supermarket WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_londra AND category_id = cat_supermarket);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_londra, cat_moda WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_londra AND category_id = cat_moda);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_londra, cat_dijital WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_londra AND category_id = cat_dijital);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_londra, cat_mobil WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_londra AND category_id = cat_mobil);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_londra, cat_hizli WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_londra AND category_id = cat_hizli);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_londra, cat_kozmetik WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_londra AND category_id = cat_kozmetik);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_londra, cat_elektronik WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_londra AND category_id = cat_elektronik);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_londra, cat_yemek WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_londra AND category_id = cat_yemek);

  -- Paris
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_paris, cat_ikinciel WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_paris AND category_id = cat_ikinciel);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_paris, cat_indirim WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_paris AND category_id = cat_indirim);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_paris, cat_taksi WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_paris AND category_id = cat_taksi);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_paris, cat_emlak WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_paris AND category_id = cat_emlak);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_paris, cat_supermarket WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_paris AND category_id = cat_supermarket);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_paris, cat_moda WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_paris AND category_id = cat_moda);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_paris, cat_dijital WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_paris AND category_id = cat_dijital);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_paris, cat_mobil WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_paris AND category_id = cat_mobil);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_paris, cat_hizli WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_paris AND category_id = cat_hizli);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_paris, cat_kozmetik WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_paris AND category_id = cat_kozmetik);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_paris, cat_elektronik WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_paris AND category_id = cat_elektronik);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_paris, cat_yemek WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_paris AND category_id = cat_yemek);

  -- Roma
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_roma, cat_ikinciel WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_roma AND category_id = cat_ikinciel);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_roma, cat_indirim WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_roma AND category_id = cat_indirim);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_roma, cat_taksi WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_roma AND category_id = cat_taksi);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_roma, cat_emlak WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_roma AND category_id = cat_emlak);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_roma, cat_supermarket WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_roma AND category_id = cat_supermarket);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_roma, cat_moda WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_roma AND category_id = cat_moda);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_roma, cat_dijital WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_roma AND category_id = cat_dijital);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_roma, cat_mobil WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_roma AND category_id = cat_mobil);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_roma, cat_hizli WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_roma AND category_id = cat_hizli);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_roma, cat_kozmetik WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_roma AND category_id = cat_kozmetik);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_roma, cat_elektronik WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_roma AND category_id = cat_elektronik);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_roma, cat_yemek WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_roma AND category_id = cat_yemek);

  -- Tokyo
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_tokyo, cat_ikinciel WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_tokyo AND category_id = cat_ikinciel);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_tokyo, cat_indirim WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_tokyo AND category_id = cat_indirim);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_tokyo, cat_taksi WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_tokyo AND category_id = cat_taksi);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_tokyo, cat_emlak WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_tokyo AND category_id = cat_emlak);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_tokyo, cat_supermarket WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_tokyo AND category_id = cat_supermarket);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_tokyo, cat_moda WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_tokyo AND category_id = cat_moda);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_tokyo, cat_dijital WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_tokyo AND category_id = cat_dijital);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_tokyo, cat_mobil WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_tokyo AND category_id = cat_mobil);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_tokyo, cat_hizli WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_tokyo AND category_id = cat_hizli);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_tokyo, cat_kozmetik WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_tokyo AND category_id = cat_kozmetik);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_tokyo, cat_elektronik WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_tokyo AND category_id = cat_elektronik);
  
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT city_tokyo, cat_yemek WHERE NOT EXISTS (SELECT 1 FROM city_category_mappings WHERE city_id = city_tokyo AND category_id = cat_yemek);
END $$;
