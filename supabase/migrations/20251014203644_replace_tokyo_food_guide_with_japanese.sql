/*
  # Replace Tokyo Food Guide with Japanese Cuisine

  Remove generic categories (burgers, pizza, coffee)
  Add authentic Japanese categories:
  1. Sushi
  2. Ramen
  3. Tempura
  4. Izakaya
  5. Tonkatsu
  6. Tokyo Local Specialties
*/

DO $$
DECLARE
  v_tokyo_id UUID;
  v_cat_id UUID;
BEGIN
  SELECT id INTO v_tokyo_id FROM cities WHERE slug = 'tokyo';

  -- Delete old venues and categories
  DELETE FROM venues WHERE food_category_id IN (
    SELECT id FROM food_categories WHERE city_id = v_tokyo_id
  );
  DELETE FROM food_categories WHERE city_id = v_tokyo_id;

  -- 1. Sushi
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order)
  VALUES (v_tokyo_id, 'En İyi Sushi Barları', 'sushi', 'Fish', 1)
  RETURNING id INTO v_cat_id;

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Sukiyabashi Jiro', 'https://maps.google.com/?q=35.6709,139.7630', 35.6709, 139.7630, 4.3, 800, 'Dünyanın en ünlü sushi ustası Jiro''nun restoranı. Rezervasyon çok zor.', ARRAY['3 Michelin yıldızlı', 'Omakase sadece', 'Çok pahalı'], 'Omakase', '/venues/tokyo/jiro.jpg', 1, 'https://www.sushi-jiro.jp/'),
    (v_cat_id, 'Sushi Saito', 'https://maps.google.com/?q=35.6654,139.7298', 35.6654, 139.7298, 4.5, 600, '3 Michelin yıldızlı, dünyanın en iyi sushi restoranlarından.', ARRAY['Rezervasyon imkansız', 'Sadece Japonca', 'Omakase formatı'], 'Toro Sushi', '/venues/tokyo/saito.jpg', 2, '#'),
    (v_cat_id, 'Sushi Dai', 'https://maps.google.com/?q=35.6654,139.7707', 35.6654, 139.7707, 4.4, 3200, 'Tsukiji balık pazarındaki efsane sabah sushi yeri.', ARRAY['Sabah 5-6da kuyruk', 'Uygun fiyatlı', 'Taze balık'], 'Omakase Set', '/venues/tokyo/sushidai.jpg', 3, '#'),
    (v_cat_id, 'Sushizanmai', 'https://maps.google.com/?q=35.6650,139.7705', 35.6650, 139.7705, 4.2, 8500, '24 saat açık zincir, kaliteli ve uygun fiyatlı.', ARRAY['Her zaman açık', 'Fiyatlar makul', 'Turistlere uygun'], 'Tuna Tower', '/venues/tokyo/sushizanmai.jpg', 4, 'https://www.kiyomura.co.jp/');

  -- 2. Ramen
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order)
  VALUES (v_tokyo_id, 'En İyi Ramen Dükkanları', 'ramen', 'Utensils', 2)
  RETURNING id INTO v_cat_id;

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Ichiran', 'https://maps.google.com/?q=35.6938,139.7006', 35.6938, 139.7006, 4.3, 12000, 'Ünlü zincir, bireysel kabinlerde ramen deneyimi.', ARRAY['Özelleştirilebilir lezzet', 'Solo yemek için ideal', 'Turistlere uygun'], 'Tonkotsu Ramen', '/venues/tokyo/ichiran.jpg', 1, 'https://en.ichiran.com/'),
    (v_cat_id, 'Tsuta', 'https://maps.google.com/?q=35.7314,139.7979', 35.7314, 139.7979, 4.4, 2800, 'Dünyanın ilk Michelin yıldızlı ramen restoranı.', ARRAY['1 Michelin yıldızlı', 'Truffle shoyu ramen', 'Kuyruk var'], 'Truffle Shoyu Soba', '/venues/tokyo/tsuta.jpg', 2, '#'),
    (v_cat_id, 'Afuri', 'https://maps.google.com/?q=35.6470,139.7076', 35.6470, 139.7076, 4.3, 6500, 'Yuzu aromalı hafif ve ferahlatıcı ramen.', ARRAY['Yuzu shio ramen ünlü', 'Modern ve temiz', 'İngilizce menü'], 'Yuzu Shio Ramen', '/venues/tokyo/afuri.jpg', 3, 'https://afuri.com/'),
    (v_cat_id, 'Nakiryu', 'https://maps.google.com/?q=35.7310,139.7986', 35.7310, 139.7986, 4.5, 1200, 'Michelin yıldızlı tantanmen uzmanı.', ARRAY['1 Michelin yıldızlı', 'Acı tantanmen', 'Küçük mekan'], 'Tantanmen', '/venues/tokyo/nakiryu.jpg', 4, '#');

  -- 3. Tempura
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order)
  VALUES (v_tokyo_id, 'En İyi Tempura', 'tempura', 'UtensilsCrossed', 3)
  RETURNING id INTO v_cat_id;

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Tempura Kondo', 'https://maps.google.com/?q=35.6719,139.7639', 35.6719, 139.7639, 4.6, 800, '2 Michelin yıldızlı, sebze tempurası ile ünlü.', ARRAY['Sebze tempurası efsane', 'Çok pahalı', 'Rezervasyon şart'], 'Vegetable Tempura Course', '/venues/tokyo/kondo.jpg', 1, '#'),
    (v_cat_id, 'Tsunahachi', 'https://maps.google.com/?q=35.6931,139.7017', 35.6931, 139.7017, 4.2, 4500, 'Shinjuku''daki geleneksel tempura zinciri.', ARRAY['Uygun fiyatlı', 'Kaliteli', 'Turistlere uygun'], 'Tendon Set', '/venues/tokyo/tsunahachi.jpg', 2, 'https://www.tunahachi.co.jp/'),
    (v_cat_id, 'Mikawa Zezankyo', 'https://maps.google.com/?q=35.6815,139.7673', 35.6815, 139.7673, 4.5, 600, 'Edo tarzı tempura, master şef.', ARRAY['Otantik deneyim', 'Pahalı', 'Sakin atmosfer'], 'Omakase Tempura', '/venues/tokyo/mikawa.jpg', 3, '#');

  -- 4. Izakaya
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order)
  VALUES (v_tokyo_id, 'En İyi Izakaya''lar', 'izakaya', 'Beer', 4)
  RETURNING id INTO v_cat_id;

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Torikizoku', 'https://maps.google.com/?q=35.6895,139.6917', 35.6895, 139.6917, 4.1, 8500, 'Ucuz yakitori zinciri, öğrencilerin favorisi.', ARRAY['Her şey 298 yen', 'Çok kalabalık', 'Genç kitle'], 'Yakitori Assortment', '/venues/tokyo/torikizoku.jpg', 1, 'https://torikizoku.co.jp/'),
    (v_cat_id, 'Uoshin', 'https://maps.google.com/?q=35.6684,139.7004', 35.6684, 139.7004, 4.4, 2100, 'Shibuya''daki balık odaklı izakaya.', ARRAY['Taze deniz ürünleri', 'Fiyatlar makul', 'Yerel atmosfer'], 'Sashimi Platter', '/venues/tokyo/uoshin.jpg', 2, '#'),
    (v_cat_id, 'Gonpachi', 'https://maps.google.com/?q=35.6556,139.7293', 35.6556, 139.7293, 4.2, 6800, 'Kill Bill filminde çekim yapılan meşhur mekan.', ARRAY['Turistik ama kaliteli', 'İngilizce menü', 'Fiyatlar yüksek'], 'Yakitori & Sake', '/venues/tokyo/gonpachi.jpg', 3, 'https://www.gonpachi.jp/');

  -- 5. Tonkatsu
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order)
  VALUES (v_tokyo_id, 'En İyi Tonkatsu', 'tonkatsu', 'ChefHat', 5)
  RETURNING id INTO v_cat_id;

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Tonki', 'https://maps.google.com/?q=35.6343,139.7166', 35.6343, 139.7166, 4.3, 5200, '80 yıllık geleneksel tonkatsu restoranı.', ARRAY['Klasik Edo tarzı', 'Fiyatlar uygun', 'Çıtır çıtır'], 'Rosu Katsu', '/venues/tokyo/tonki.jpg', 1, '#'),
    (v_cat_id, 'Maisen', 'https://maps.google.com/?q=35.6655,139.7078', 35.6655, 139.7078, 4.2, 8900, 'Harajuku''daki popüler zincir.', ARRAY['Kurobuta domuz eti', 'Turistlere uygun', 'Fiyatlar makul'], 'Kurobuta Hire Katsu', '/venues/tokyo/maisen.jpg', 2, 'https://mai-sen.com/'),
    (v_cat_id, 'Butagumi', 'https://maps.google.com/?q=35.6654,139.7004', 35.6654, 139.7004, 4.4, 3100, 'Premium kalite tonkatsu.', ARRAY['Yüksek kalite et', 'Pahalı', 'İnce ve yumuşak'], 'Premium Hire Katsu', '/venues/tokyo/butagumi.jpg', 3, '#');

  -- 6. Local Specialties
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order)
  VALUES (v_tokyo_id, 'Tokyo''ya Özel Lezzetler', 'local-specialties', 'MapPin', 6)
  RETURNING id INTO v_cat_id;

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Sometaro', 'https://maps.google.com/?q=35.7145,139.7967', 35.7145, 139.7967, 4.3, 2800, 'Asakusa''daki geleneksel okonomiyaki restoranı.', ARRAY['Tatami oturma', 'Kendin pişir', 'Otantik atmosfer'], 'Okonomiyaki', '/venues/tokyo/sometaro.jpg', 1, '#'),
    (v_cat_id, 'Ginza Kagari', 'https://maps.google.com/?q=35.6715,139.7638', 35.6715, 139.7638, 4.5, 3500, 'Michelin rehberinde kremalı tavuk ramen.', ARRAY['Tori paitan ramen', 'Küçük mekan', 'Kuyruk var'], 'Tori Paitan Ramen', '/venues/tokyo/kagari.jpg', 2, '#'),
    (v_cat_id, 'Tsukiji Outer Market', 'https://maps.google.com/?q=35.6654,139.7707', 35.6654, 139.7707, 4.4, 15000, 'Sabah taze deniz ürünleri ve street food.', ARRAY['Sabah erken gidin', 'Çok çeşit var', 'Turistik ama lezzetli'], 'Uni (Sea Urchin)', '/venues/tokyo/tsukijimarket.jpg', 3, '#');

  RAISE NOTICE 'Tokyo food guide replaced with Japanese cuisine!';
END $$;
