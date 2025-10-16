/*
  # Expand Tokyo Ramen to 11 Venues
*/

DO $$
DECLARE
  v_cat_id UUID;
BEGIN
  SELECT id INTO v_cat_id FROM food_categories 
  WHERE city_id = (SELECT id FROM cities WHERE slug = 'tokyo')
  AND slug = 'ramen';

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Rokurinsha', 'https://maps.google.com/?q=35.681,139.768', 35.681, 139.768, 4.4, 5000, 'Tsukemen (batırma ramen) şampiyonu, Tokyo Station içinde.', ARRAY['Yoğun balık soslu daldırma', 'Kalın erişte', 'Tren öncesi ideal'], 'Tsukemen', '/venues/tokyo/rokurinsha.jpg', 5, 'https://www.rokurinsha.com/'),
    (v_cat_id, 'Ginza Kagari', 'https://maps.google.com/?q=35.672,139.763', 35.672, 139.763, 4.4, 3500, 'Kremalı tavuk çorbalı (tori-paitan) ramen.', ARRAY['Mısır çorbası gibi kremalı', 'Mevsimsel sebzeler', 'Farklı bir deneyim'], 'Tori Paitan Soba', '/venues/tokyo/kagari.jpg', 6, 'https://ginzakagari.huber.co.jp/'),
    (v_cat_id, 'Fuunji', 'https://maps.google.com/?q=35.6889,139.7017', 35.6889, 139.7017, 4.5, 4200, 'Tsukemen ve ramen karışımı özgün tarif.', ARRAY['Çok yoğun çorba', 'İki stil birden', 'Uzun kuyruklar'], 'Special Tsukemen', '/venues/tokyo/fuunji.jpg', 7, '#'),
    (v_cat_id, 'Ippudo', 'https://maps.google.com/?q=35.6954,139.7036', 35.6954, 139.7036, 4.3, 6800, 'Hakata-style tonkotsu zinciri, dünya çapında şubeler.', ARRAY['Standart kalite', 'Turistlere uygun', 'Modern atmosfer'], 'Shiromaru Classic', '/venues/tokyo/ippudo.jpg', 8, 'https://www.ippudo.com/'),
    (v_cat_id, 'Menya Musashi', 'https://maps.google.com/?q=35.6931,139.7006', 35.6931, 139.7006, 4.2, 5500, 'Kalın, yoğun erişte uzmanı.', ARRAY['Erişte çok kalın', 'Porsiyon bol', 'Samurai temalı'], 'Niku Soba', '/venues/tokyo/musashi.jpg', 9, '#'),
    (v_cat_id, 'Soranoiro', 'https://maps.google.com/?q=35.6816,139.7673', 35.6816, 139.7673, 4.4, 2800, 'Vejetaryen ramen seçenekleri sunan nadir mekanlardan.', ARRAY['Sebze çorbası lezzetli', 'Sağlıklı seçenekler', 'Rengarenk sunumlar'], 'Veggie Soba', '/venues/tokyo/soranoiro.jpg', 10, '#'),
    (v_cat_id, 'Kyushu Jangara', 'https://maps.google.com/?q=35.6689,139.7006', 35.6689, 139.7006, 4.3, 4100, 'Harajuku''nun meşhur tonkotsu ramen zinciri.', ARRAY['Gençlere hitap ediyor', 'Müzik yüksek sesle', 'Ekstralar bol'], 'Tonkotsu Ramen', '/venues/tokyo/jangara.jpg', 11, '#');

  RAISE NOTICE 'Tokyo ramen expanded to 11 venues!';
END $$;
