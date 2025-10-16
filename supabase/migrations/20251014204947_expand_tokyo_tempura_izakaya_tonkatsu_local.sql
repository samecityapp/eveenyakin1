/*
  # Expand Tokyo Remaining Categories to 11 Venues Each

  Expanding Tempura, Izakaya, Tonkatsu, and Local Specialties
*/

DO $$
DECLARE
  v_cat_id UUID;
BEGIN
  -- Tempura (currently 3, adding 8 more)
  SELECT id INTO v_cat_id FROM food_categories 
  WHERE city_id = (SELECT id FROM cities WHERE slug = 'tokyo')
  AND slug = 'tempura';

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Tempura Motoyoshi', 'https://maps.google.com/?q=35.6845,139.7673', 35.6845, 139.7673, 4.7, 400, '1 Michelin yıldızlı yenilikçi tempura.', ARRAY['Modern teknikler', 'Çok yaratıcı', 'Pahalı'], 'Omakase Course', '/venues/tokyo/motoyoshi.jpg', 4, '#'),
    (v_cat_id, 'Tenichi', 'https://maps.google.com/?q=35.6719,139.7638', 35.6719, 139.7638, 4.3, 2100, 'Ginza''nın klasik tempura zinciri.', ARRAY['Güvenilir kalite', 'Turistlere uygun', 'Set menüler iyi'], 'Tendon Set', '/venues/tokyo/tenichi.jpg', 5, 'https://www.tenichi.co.jp/'),
    (v_cat_id, 'Tempura Fukamachi', 'https://maps.google.com/?q=35.6654,139.7298', 35.6654, 139.7298, 4.6, 500, 'Roppongi''daki gizli mücevher.', ARRAY['İntim atmosfer', 'Şef çok yetenekli', 'Fiyat/performans iyi'], 'Omakase', '/venues/tokyo/fukamachi.jpg', 6, '#'),
    (v_cat_id, 'Dote-no-Iseya', 'https://maps.google.com/?q=35.7145,139.7967', 35.7145, 139.7967, 4.4, 1800, 'Asakusa''daki 150 yıllık tarihi mekan.', ARRAY['Tarihi bina', 'Geleneksel atmosfer', 'Uygun fiyatlı'], 'Tempura Set', '/venues/tokyo/iseya.jpg', 7, '#'),
    (v_cat_id, 'Tatsumi', 'https://maps.google.com/?q=35.6715,139.7640', 35.6715, 139.7640, 4.5, 600, 'Ginza counter-style tempura.', ARRAY['Bar tarzı oturma', 'Samimi', 'Kaliteli'], 'Chef''s Selection', '/venues/tokyo/tatsumi.jpg', 8, '#'),
    (v_cat_id, 'Tempura Yamanoue', 'https://maps.google.com/?q=35.6914,139.7673', 35.6914, 139.7673, 4.4, 900, 'Hotel Yamanoue içinde lüks tempura.', ARRAY['Otel restoranı', 'Zarif atmosfer', 'Pahalı'], 'Omakase', '/venues/tokyo/yamanoue.jpg', 9, '#'),
    (v_cat_id, 'Tenkuni', 'https://maps.google.com/?q=35.6654,139.7004', 35.6654, 139.7004, 4.2, 1500, 'Shibuya''daki uygun fiyatlı tempura.', ARRAY['Öğrenci dostu', 'Hızlı servis', 'Basit ama iyi'], 'Tempura Teishoku', '/venues/tokyo/tenkuni.jpg', 10, '#'),
    (v_cat_id, 'Rakutei', 'https://maps.google.com/?q=35.6715,139.7630', 35.6715, 139.7630, 4.3, 800, 'Ginza''da sakin tempura deneyimi.', ARRAY['Huzurlu atmosfer', 'Yaşlı ustalar', 'Fiyatlar yüksek'], 'Seasonal Tempura', '/venues/tokyo/rakutei.jpg', 11, '#');

  -- Izakaya (currently 3, adding 8 more)
  SELECT id INTO v_cat_id FROM food_categories 
  WHERE city_id = (SELECT id FROM cities WHERE slug = 'tokyo')
  AND slug = 'izakaya';

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Yonekyu', 'https://maps.google.com/?q=35.7095,139.7986', 35.7095, 139.7986, 4.5, 1800, 'Edo döneminden kalma otantik izakaya.', ARRAY['Tarihi atmosfer', 'Yerel müdavimler', 'Japon dilini bilmek önemli'], 'Yakitori & Sake', '/venues/tokyo/yonekyu.jpg', 4, '#'),
    (v_cat_id, 'Maru', 'https://maps.google.com/?q=35.6689,139.7006', 35.6689, 139.7006, 4.3, 2400, 'Shibuya''nın popüler zinciri.', ARRAY['Genç kitle', 'Modern', 'İngilizce menü'], 'Mixed Grill Plate', '/venues/tokyo/maru.jpg', 5, '#'),
    (v_cat_id, 'Robata Jiromaru', 'https://maps.google.com/?q=35.6654,139.7298', 35.6654, 139.7298, 4.4, 1600, 'Robatayaki (ızgara) uzmanı.', ARRAY['Açık ızgara', 'Taze malzemeler', 'Fiyatlar makul'], 'Grilled Seafood', '/venues/tokyo/jiromaru.jpg', 6, '#'),
    (v_cat_id, 'Shinsuke', 'https://maps.google.com/?q=35.6715,139.7640', 35.6715, 139.7640, 4.6, 800, 'Ginza''daki lüks izakaya.', ARRAY['Çok şık', 'Premium malzemeler', 'Pahalı'], 'Seasonal Omakase', '/venues/tokyo/shinsuke.jpg', 7, '#'),
    (v_cat_id, 'Kushikatsu Tanaka', 'https://maps.google.com/?q=35.6931,139.7006', 35.6931, 139.7006, 4.2, 5200, 'Kızarmış şişler (kushikatsu) zinciri.', ARRAY['Ucuz ve doyurucu', 'Çok çeşit', 'Her yerde şube var'], 'Assorted Kushikatsu', '/venues/tokyo/tanaka.jpg', 8, '#'),
    (v_cat_id, 'Kikunoi', 'https://maps.google.com/?q=35.6654,139.7004', 35.6654, 139.7004, 4.5, 1200, 'Kyoto tarzı kaiseki izakaya.', ARRAY['Sofistike', 'Güzel sunumlar', 'Pahalı'], 'Kaiseki Course', '/venues/tokyo/kikunoi.jpg', 9, '#'),
    (v_cat_id, 'Watami', 'https://maps.google.com/?q=35.6895,139.6917', 35.6895, 139.6917, 4.0, 8800, 'Ülke çapında zincir, ucuz ve güvenilir.', ARRAY['Öğrenci dostu', 'Standart menü', 'İçecekler ucuz'], 'Nomihoudai (All-you-can-drink)', '/venues/tokyo/watami.jpg', 10, '#'),
    (v_cat_id, 'Yamachan', 'https://maps.google.com/?q=35.6931,139.7017', 35.6931, 139.7017, 4.3, 4100, 'Nagoya''dan gelen kanat uzmanı.', ARRAY['Tebasaki (kanatlar) ünlü', 'Baharatlı ve çıtır', 'Fiyatlar uygun'], 'Tebasaki Wings', '/venues/tokyo/yamachan.jpg', 11, '#');

  -- Tonkatsu (currently 3, adding 8 more)
  SELECT id INTO v_cat_id FROM food_categories 
  WHERE city_id = (SELECT id FROM cities WHERE slug = 'tokyo')
  AND slug = 'tonkatsu';

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Tonkatsu Wako', 'https://maps.google.com/?q=35.6715,139.7640', 35.6715, 139.7640, 4.5, 2800, 'Ginza''nın premium tonkatsu restoranı.', ARRAY['Çok yumuşak', 'Kaliteli et', 'Pahalı'], 'Premium Hire Katsu', '/venues/tokyo/wako.jpg', 4, '#'),
    (v_cat_id, 'Katsukura', 'https://maps.google.com/?q=35.6689,139.7006', 35.6689, 139.7006, 4.3, 3200, 'Kyoto''dan gelen zincir.', ARRAY['Çok sulu', 'Set menüler', 'Fiyat/performans iyi'], 'Rosu Katsu Set', '/venues/tokyo/katsukura.jpg', 5, '#'),
    (v_cat_id, 'Tonkatsu Suzuki', 'https://maps.google.com/?q=35.6654,139.7004', 35.6654, 139.7004, 4.4, 1800, 'Shibuya''daki gizli gem.', ARRAY['Yerel favorisi', 'Turistik değil', 'Uygun fiyat'], 'Hire Katsu', '/venues/tokyo/suzuki.jpg', 6, '#'),
    (v_cat_id, 'Saboten', 'https://maps.google.com/?q=35.6931,139.7006', 35.6931, 139.7006, 4.2, 6500, 'Ülke çapında güvenilir zincir.', ARRAY['Her yerde var', 'Standart kalite', 'Hızlı servis'], 'Hire Katsu Teishoku', '/venues/tokyo/saboten.jpg', 7, 'https://www.tonkatsu-saboten.com/'),
    (v_cat_id, 'Narikura', 'https://maps.google.com/?q=35.6815,139.7673', 35.6815, 139.7673, 4.6, 900, 'İnce ve yumuşak katsu uzmanı.', ARRAY['Çok ince kesim', 'Çıtır kaplama', 'Rezervasyon şart'], 'Special Hire Katsu', '/venues/tokyo/narikura.jpg', 8, '#'),
    (v_cat_id, 'Ponchi-ken', 'https://maps.google.com/?q=35.6716,139.7460', 35.6716, 139.7460, 4.3, 2100, 'Ueno''daki klasik.', ARRAY['70 yıllık tarih', 'Basit ama iyi', 'Uygun fiyatlı'], 'Katsu Curry', '/venues/tokyo/ponchiken.jpg', 9, '#'),
    (v_cat_id, 'Katsuhana', 'https://maps.google.com/?q=35.6689,139.7006', 35.6689, 139.7006, 4.4, 1500, 'Shibuya''da modern tonkatsu.', ARRAY['Genç atmosfer', 'İyi kalite', 'Makul fiyat'], 'Kurobuta Rosu', '/venues/tokyo/katsuhana.jpg', 10, '#'),
    (v_cat_id, 'Tonkatsu Hinata', 'https://maps.google.com/?q=35.6931,139.7017', 35.6931, 139.7017, 4.2, 1200, 'Shinjuku''daki küçük mekan.', ARRAY['Samimi', 'Ev yapımı', 'Az yer var'], 'Daily Special', '/venues/tokyo/hinata.jpg', 11, '#');

  -- Local Specialties (currently 3, adding 8 more)
  SELECT id INTO v_cat_id FROM food_categories 
  WHERE city_id = (SELECT id FROM cities WHERE slug = 'tokyo')
  AND slug = 'local-specialties';

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Chanko Tomoegata', 'https://maps.google.com/?q=35.7019,139.7946', 35.7019, 139.7946, 4.4, 2400, 'Sumo güreşçilerinin yediği chanko nabe (güveç).', ARRAY['Dev porsiyonlar', 'Besleyici', 'Sumo temalı'], 'Chanko Nabe', '/venues/tokyo/chanko.jpg', 4, '#'),
    (v_cat_id, 'Kanda Yabu Soba', 'https://maps.google.com/?q=35.6954,139.7673', 35.6954, 139.7673, 4.3, 3800, '130 yıllık soba (karabuğday eriştesi) restoranı.', ARRAY['Tarihi mekan', 'El yapımı erişte', 'Geleneksel'], 'Zaru Soba', '/venues/tokyo/yabu.jpg', 5, '#'),
    (v_cat_id, 'Daiwa Sushi', 'https://maps.google.com/?q=35.6654,139.7707', 35.6654, 139.7707, 4.5, 4200, 'Tsukiji''deki sabah sushi efsanesi.', ARRAY['Sabah 5''te kuyruk', 'Çok taze', 'Uygun fiyatlı'], 'Morning Omakase', '/venues/tokyo/daiwa.jpg', 6, '#'),
    (v_cat_id, 'Asakusa Imahan', 'https://maps.google.com/?q=35.7115,139.7967', 35.7115, 139.7967, 4.4, 2100, 'Sukiyaki ve shabu-shabu uzmanı.', ARRAY['Premium Wagyu', 'Zarif atmosfer', 'Çok pahalı'], 'Sukiyaki Course', '/venues/tokyo/imahan.jpg', 7, 'https://www.asakusaimahan.co.jp/'),
    (v_cat_id, 'Kozue', 'https://maps.google.com/?q=35.6954,139.6917', 35.6954, 139.6917, 4.6, 800, 'Park Hyatt''ta manzaralı kaiseki.', ARRAY['Harika manzara', 'Michelin yıldızlı', 'Çok pahalı'], 'Kaiseki', '/venues/tokyo/kozue.jpg', 8, '#'),
    (v_cat_id, 'Monjayaki Hiyoko', 'https://maps.google.com/?q=35.664,139.782', 35.664, 139.782, 4.3, 1600, 'Tsukishima''da otantik monjayaki.', ARRAY['Kendin pişir', 'Eğlenceli', 'Ucuz'], 'Mentaiko Monja', '/venues/tokyo/hiyoko.jpg', 9, '#'),
    (v_cat_id, 'Kanda Matsuya', 'https://maps.google.com/?q=35.6931,139.7673', 35.6931, 139.7673, 4.2, 5200, '120 yıllık curry-udon restoranı.', ARRAY['Nostalji', 'Basit ama iyi', 'Çok ucuz'], 'Curry Nanban', '/venues/tokyo/matsuya.jpg', 10, '#'),
    (v_cat_id, 'Nabezo', 'https://maps.google.com/?q=35.6895,139.6917', 35.6895, 139.6917, 4.1, 3900, 'Shabu-shabu büfesi, all-you-can-eat.', ARRAY['Sınırsız et', 'Uygun fiyat', 'Öğrencilere ideal'], 'All-You-Can-Eat Shabu', '/venues/tokyo/nabezo.jpg', 11, '#');

  RAISE NOTICE 'All Tokyo food categories expanded to 11 venues!';
END $$;
