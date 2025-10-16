/*
  # Expand Tokyo Sushi Category to 11 Venues

  Adding 7 more authentic sushi venues to reach 11 total
*/

DO $$
DECLARE
  v_cat_id UUID;
BEGIN
  SELECT id INTO v_cat_id FROM food_categories 
  WHERE city_id = (SELECT id FROM cities WHERE slug = 'tokyo')
  AND slug = 'sushi';

  -- Add 7 more sushi venues
  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Kyubey', 'https://maps.google.com/?q=35.671,139.761', 35.671, 139.761, 4.4, 1800, 'Ginza''nın saygın sushi restoranlarından, lüks ama ulaşılabilir.', ARRAY['Dans eden karides sunumu meşhur', 'Şefler çok cana yakın', 'Öğle menüsü uygun'], 'Öğle Omakase', '/venues/tokyo/kyubey.jpg', 5, 'https://www.kyubey.jp/'),
    (v_cat_id, 'Manten Sushi', 'https://maps.google.com/?q=35.676,139.766', 35.676, 139.766, 4.6, 2000, 'Harika fiyat/performans omakase sunan mekan.', ARRAY['Bu fiyata inanılmaz kalite', 'Şef her parçayı açıklıyor', 'Rezervasyon şart'], 'Omakase', '/venues/tokyo/manten.jpg', 6, 'https://www.manten-sushi.com/'),
    (v_cat_id, 'Midori Sushi', 'https://maps.google.com/?q=35.659,139.701', 35.659, 139.701, 4.3, 4000, 'Büyük porsiyonlu, uygun fiyatlı, uzun kuyruklu zincir.', ARRAY['Porsiyonlar çok büyük', 'Set menüler avantajlı', '1-2 saat sıra'], 'Maguro Set', '/venues/tokyo/midori.jpg', 7, 'https://www.sushinomidori.co.jp/'),
    (v_cat_id, 'Uogashi Nihon-Ichi', 'https://maps.google.com/?q=35.6895,139.7006', 35.6895, 139.7006, 4.2, 3500, 'Ayakta yenen sushi barı, hızlı ve ucuz.', ARRAY['Çok uygun fiyatlı', 'Taze ama basit', 'İstasyon içinde pratik'], 'Tuna Set', '/venues/tokyo/uogashi.jpg', 8, 'https://uogashi-nihonichi.com/'),
    (v_cat_id, 'Sushi Tokami', 'https://maps.google.com/?q=35.6718,139.7629', 35.6718, 139.7629, 4.5, 600, 'Gizli bir mücevher, harika omakase.', ARRAY['İntim atmosfer', 'Şef çok yetenekli', 'Fiyatlar yüksek'], 'Omakase', '/venues/tokyo/tokami.jpg', 9, '#'),
    (v_cat_id, 'Ginza Sushi Ichi', 'https://maps.google.com/?q=35.6714,139.7640', 35.6714, 139.7640, 4.4, 1200, 'Modern yaklaşımlı Ginza sushi barı.', ARRAY['Yenilikçi sunumlar', 'Genç şef enerjik', 'Rezervasyon kolay'], 'Seasonal Omakase', '/venues/tokyo/sushiichi.jpg', 10, '#'),
    (v_cat_id, 'Sushi Zanmai', 'https://maps.google.com/?q=35.6650,139.7705', 35.6650, 139.7705, 4.2, 8500, '24 saat açık, güvenilir zincir.', ARRAY['Her zaman açık', 'Fiyatlar turistik ama makul', 'Çeşit çok bol'], 'Tuna Tower', '/venues/tokyo/sushizanmai.jpg', 11, 'https://www.kiyomura.co.jp/');

  RAISE NOTICE 'Tokyo sushi expanded to 11 venues!';
END $$;
