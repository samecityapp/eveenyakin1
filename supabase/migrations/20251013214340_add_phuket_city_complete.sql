/*
  # Add Phuket City - Complete Data

  ## New City
  Phuket, Thailand - Popular beach destination with Thai brands and venues

  ## Structure
  1. City entry with Unsplash image
  2. 12 standard categories linked to Phuket
  3. Thai brands as equivalents
  4. 6 food guide categories
  5. 66 total venues (11 per food category)

  ## Thai Brands
  - 7-Eleven, FamilyMart (convenience)
  - Big C, Tesco Lotus, Tops (supermarkets)
  - Grab, Bolt, inDrive (transport)
  - AIS, DTAC, TrueMove H (mobile)
  - Watsons, Boots, Sephora (beauty)
  - Power Buy, Banana IT (electronics)
  - Lazada, Shopee (fashion/marketplace)
*/

DO $$
DECLARE
  v_phuket_id UUID;
  v_cat_id UUID;
  v_mapping_id UUID;
  v_brand_id UUID;
  v_food_cat_id UUID;
BEGIN
  -- Create Phuket city
  INSERT INTO cities (name, slug, country, image)
  VALUES ('Phuket', 'phuket', 'Tayland', 'https://source.unsplash.com/800x600/?phuket,thailand,beach')
  RETURNING id INTO v_phuket_id;

  -- Link all 12 Turkish categories to Phuket
  INSERT INTO city_category_mappings (city_id, category_id)
  SELECT v_phuket_id, id FROM categories;

  -- İndirim Marketleri → 7-Eleven, FamilyMart
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'İndirim Marketleri';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_phuket_id AND ccm.category_id = v_cat_id;
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('7-Eleven Thailand', '/logos/7eleven.svg', 'https://www.7eleven.co.th/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('FamilyMart Thailand', '/logos/familymart.svg', 'https://www.familymart.co.th/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- Süpermarketler → Big C, Tesco Lotus, Tops, Makro
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Süpermarketler';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_phuket_id AND ccm.category_id = v_cat_id;
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Big C', '/logos/bigc.svg', 'https://www.bigc.co.th/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Tesco Lotus', '/logos/tescolotus.svg', 'https://www.tescolotus.com/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Tops Market', '/logos/tops.svg', 'https://www.tops.co.th/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- Hızlı Market Teslimatı → GrabMart, Foodpanda Shops
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Hızlı Market Teslimatı';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_phuket_id AND ccm.category_id = v_cat_id;
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('GrabMart', '/logos/grab.svg', 'https://www.grab.com/th/en/mart/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Foodpanda Shops', '/logos/foodpanda.svg', 'https://www.foodpanda.co.th/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- Yemek Siparişi → GrabFood, Foodpanda
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Yemek Siparişi';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_phuket_id AND ccm.category_id = v_cat_id;
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('GrabFood', '/logos/grabfood.svg', 'https://www.grab.com/th/en/food/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Foodpanda Shops';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- Taksi & Araç Paylaşımı → Grab, Bolt, inDrive
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Taksi & Araç Paylaşımı';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_phuket_id AND ccm.category_id = v_cat_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Grab' OR name = 'GrabMart' LIMIT 1;
  IF v_brand_id IS NULL THEN
    INSERT INTO brands (name, logo_url, website_url)
    VALUES ('Grab', '/logos/grab.svg', 'https://www.grab.com/th/en/')
    RETURNING id INTO v_brand_id;
  END IF;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Bolt';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('inDrive', '/logos/indrive.svg', 'https://indrive.com/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- İkinci El & Seri İlan → Facebook Marketplace
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'İkinci El & Seri İlan';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_phuket_id AND ccm.category_id = v_cat_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Facebook Marketplace';
  IF v_brand_id IS NULL THEN
    INSERT INTO brands (name, logo_url, website_url)
    VALUES ('Facebook Marketplace', '/logos/facebook-marketplace.svg', 'https://www.facebook.com/marketplace/')
    RETURNING id INTO v_brand_id;
  END IF;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);

  -- Moda Pazaryerleri → Lazada, Shopee
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Moda Pazaryerleri';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_phuket_id AND ccm.category_id = v_cat_id;
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Lazada Thailand', '/logos/lazada.svg', 'https://www.lazada.co.th/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Shopee Thailand', '/logos/shopee.svg', 'https://shopee.co.th/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- Emlak Portalları → Hipflat, DDProperty, FazWaz
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Emlak Portalları';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_phuket_id AND ccm.category_id = v_cat_id;
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Hipflat', '/logos/hipflat.svg', 'https://www.hipflat.co.th/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('DDProperty', '/logos/ddproperty.svg', 'https://www.ddproperty.com/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('FazWaz', '/logos/fazwaz.svg', 'https://www.fazwaz.com/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- Dijital Bankacılık → Wise, Revolut
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Dijital Bankacılık';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_phuket_id AND ccm.category_id = v_cat_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Wise';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Revolut';
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- Mobil Operatörler → AIS, DTAC, TrueMove H
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Mobil Operatörler';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_phuket_id AND ccm.category_id = v_cat_id;
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('AIS', '/logos/ais.svg', 'https://www.ais.th/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('DTAC', '/logos/dtac.svg', 'https://www.dtac.co.th/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('TrueMove H', '/logos/truemove.svg', 'https://www.truemoveh.com/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  -- Elektronik Mağazaları → Power Buy, Banana IT
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Elektronik Mağazaları';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_phuket_id AND ccm.category_id = v_cat_id;
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Power Buy', '/logos/powerbuy.svg', 'https://www.powerbuy.co.th/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Banana IT', '/logos/bananait.svg', 'https://www.bnn.in.th/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);

  -- Kozmetik & Kişisel Bakım → Watsons, Boots, Sephora, EVEANDBOY
  SELECT cat.id INTO v_cat_id FROM categories cat WHERE cat.name = 'Kozmetik & Kişisel Bakım';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm 
  WHERE ccm.city_id = v_phuket_id AND ccm.category_id = v_cat_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Watsons';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  END IF;
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('Boots Thailand', '/logos/boots.svg', 'https://www.th.boots.com/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  
  INSERT INTO brands (name, logo_url, website_url)
  VALUES ('EVEANDBOY', '/logos/eveandboy.svg', 'https://www.eveandboy.com/')
  ON CONFLICT (name) DO UPDATE SET website_url = EXCLUDED.website_url
  RETURNING id INTO v_brand_id;
  INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);

  RAISE NOTICE 'Phuket city and brands created successfully!';
END $$;
