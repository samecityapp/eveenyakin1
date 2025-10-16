/*
  # Fix Tokyo Food Categories - Final Version

  Replace current categories with:
  1. Sushi (keep existing 11)
  2. Ramen (keep existing 11)
  3. Hamburger (new, 11 venues)
  4. Kahve (new, 11 venues)
  5. Fine Dining (new, 11 venues)
  6. Yerel Lezzetler (keep existing 11)

  Remove: Tempura, Izakaya, Tonkatsu
*/

DO $$
DECLARE
  v_tokyo_id UUID;
  v_cat_id UUID;
  v_old_cat_id UUID;
BEGIN
  SELECT id INTO v_tokyo_id FROM cities WHERE slug = 'tokyo';

  -- Delete Tempura, Izakaya, Tonkatsu categories and their venues
  FOR v_old_cat_id IN 
    SELECT id FROM food_categories 
    WHERE city_id = v_tokyo_id 
    AND slug IN ('tempura', 'izakaya', 'tonkatsu')
  LOOP
    DELETE FROM venues WHERE food_category_id = v_old_cat_id;
    DELETE FROM food_categories WHERE id = v_old_cat_id;
  END LOOP;

  -- Update Local Specialties name
  UPDATE food_categories 
  SET name = 'Tokyo''ya Özel Lezzetler', slug = 'yerel-lezzetler', icon = 'Grape'
  WHERE city_id = v_tokyo_id AND slug = 'local-specialties';

  -- Add Hamburger category
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order)
  VALUES (v_tokyo_id, 'En İyi Hamburger', 'hamburger', 'ChefHat', 3)
  RETURNING id INTO v_cat_id;

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Shake Shack', 'https://maps.google.com/?q=35.67,139.71', 35.67, 139.71, 4.3, 3000, 'New York klasiği Tokyo''da çok popüler.', ARRAY['ShackBurger güvenilir', 'Patatesler çıtır', 'Park atmosferi'], 'ShackBurger', '/venues/tokyo/shakeshack.jpg', 1, 'https://www.shakeshack.jp/'),
    (v_cat_id, 'Burger Mania', 'https://maps.google.com/?q=35.6654,139.7004', 35.6654, 139.7004, 4.5, 2100, 'Tokyo''nun en iyi el yapımı burgercisi.', ARRAY['Etler günlük taze', 'Soslar ev yapımı', 'Fiyatlar makul'], 'Mania Burger', '/venues/tokyo/burgermania.jpg', 2, '#'),
    (v_cat_id, 'Brozers''', 'https://maps.google.com/?q=35.6689,139.7006', 35.6689, 139.7006, 4.4, 1800, 'Shibuya''daki kalın burger uzmanı.', ARRAY['Çok büyük burgerler', 'Amerikan tarzı', 'Genç kitle'], 'Double Cheese', '/venues/tokyo/brozers.jpg', 3, '#'),
    (v_cat_id, 'Umami Burger', 'https://maps.google.com/?q=35.6717,139.7029', 35.6717, 139.7029, 4.2, 2500, 'Umami bombalı gurme burgerler.', ARRAY['Japon tatları', 'Yenilikçi', 'Fiyatlar yüksek'], 'Truffle Burger', '/venues/tokyo/umami.jpg', 4, '#'),
    (v_cat_id, 'Fire House', 'https://maps.google.com/?q=35.6815,139.7673', 35.6815, 139.7673, 4.3, 1600, 'Craft beer ile mükemmel uyum.', ARRAY['Beer selection harika', 'Burgerler sulu', 'Pub atmosferi'], 'BBQ Burger', '/venues/tokyo/firehouse.jpg', 5, '#'),
    (v_cat_id, 'The Great Burger', 'https://maps.google.com/?q=35.6654,139.7298', 35.6654, 139.7298, 4.4, 1400, 'Roppongi''daki lüks burger barı.', ARRAY['Premium malzemeler', 'Pahalı', 'Şık atmosfer'], 'Wagyu Burger', '/venues/tokyo/greatburger.jpg', 6, '#'),
    (v_cat_id, 'Blacows', 'https://maps.google.com/?q=35.6466,139.7476', 35.6466, 139.7476, 4.5, 1900, 'Japon Wagyu burgeri yapan nadir yer.', ARRAY['100% Wagyu', 'Yumuşacık', 'Çok pahalı'], 'Wagyu Burger', '/venues/tokyo/blacows.jpg', 7, '#'),
    (v_cat_id, 'Burgers Tokyo', 'https://maps.google.com/?q=35.6931,139.7006', 35.6931, 139.7006, 4.2, 2200, 'Shinjuku''daki hızlı ve lezzetli.', ARRAY['Fast casual', 'Fiyatlar uygun', 'Her zaman açık'], 'Classic Burger', '/venues/tokyo/burgerstokyo.jpg', 8, '#'),
    (v_cat_id, 'Henry''s Burger', 'https://maps.google.com/?q=35.7145,139.7967', 35.7145, 139.7967, 4.3, 1100, 'Asakusa''daki nostaljik mekan.', ARRAY['Retro dekor', 'Aile dostu', 'Porsiyon bol'], 'Henry Special', '/venues/tokyo/henrys.jpg', 9, '#'),
    (v_cat_id, 'The Counter', 'https://maps.google.com/?q=35.6689,139.7006', 35.6689, 139.7006, 4.1, 1800, 'Özelleştirilebilir burger konsepti.', ARRAY['Kendin tasarla', 'Çok seçenek', 'Eğlenceli'], 'Custom Burger', '/venues/tokyo/counter.jpg', 10, '#'),
    (v_cat_id, 'Burger Cafe Honolu', 'https://maps.google.com/?q=35.6719,139.7029', 35.6719, 139.7029, 4.2, 1500, 'Hawaii tarzı burger ve kokteyl.', ARRAY['Tropikal atmosfer', 'Kokteyl menüsü', 'Fiyatlar makul'], 'Aloha Burger', '/venues/tokyo/honolu.jpg', 11, '#');

  -- Add Kahve category
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order)
  VALUES (v_tokyo_id, 'En İyi Kahve', 'kahve', 'Coffee', 4)
  RETURNING id INTO v_cat_id;

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Blue Bottle Coffee', 'https://maps.google.com/?q=35.649,139.708', 35.649, 139.708, 4.4, 2000, 'Üçüncü dalga kahvenin ikonu.', ARRAY['Filtre kahveler mükemmel', 'Estetik tasarım', 'Tutarlı kalite'], 'New Orleans Iced', '/venues/tokyo/bluebottle.jpg', 1, 'https://store.bluebottlecoffee.jp/'),
    (v_cat_id, 'Onibus Coffee', 'https://maps.google.com/?q=35.6466,139.6683', 35.6466, 139.6683, 4.6, 1200, 'Tokyo''nun en iyi specialty kahvecisi.', ARRAY['Kendi kavurması', 'Barista çok bilgili', 'Küçük mekan'], 'Pour Over', '/venues/tokyo/onibus.jpg', 2, '#'),
    (v_cat_id, 'Cafe Kitsune', 'https://maps.google.com/?q=35.6717,139.7029', 35.6717, 139.7029, 4.3, 2800, 'Moda markasının şık kafesi.', ARRAY['Instagram worthy', 'Atmosfer harika', 'Fiyatlar yüksek'], 'Flat White', '/venues/tokyo/kitsune.jpg', 3, '#'),
    (v_cat_id, 'Omotesando Koffee', 'https://maps.google.com/?q=35.6654,139.7110', 35.6654, 139.7110, 4.5, 1800, 'Geleneksel Japon evinde kahve.', ARRAY['Unique atmosfer', 'Minimalist', 'Sakin'], 'Espresso', '/venues/tokyo/omotesandokoffee.jpg', 4, '#'),
    (v_cat_id, 'Fuglen Tokyo', 'https://maps.google.com/?q=35.6689,139.7006', 35.6689, 139.7006, 4.4, 1600, 'Norveç''ten gelen specialty kahve.', ARRAY['Skandinav tasarım', 'Gece bar olarak açık', 'Lezzetli'], 'Cortado', '/venues/tokyo/fuglen.jpg', 5, '#'),
    (v_cat_id, 'Starbucks Reserve Roastery', 'https://maps.google.com/?q=35.6556,139.7293', 35.6556, 139.7293, 4.3, 5200, 'Dünyanın en büyük Starbucks''ı.', ARRAY['4 katlı dev mekan', 'Özel kahveler', 'Turistik'], 'Reserve Brew', '/venues/tokyo/starbucksreserve.jpg', 6, 'https://www.starbucks.co.jp/'),
    (v_cat_id, 'Streamer Coffee', 'https://maps.google.com/?q=35.6689,139.7006', 35.6689, 139.7006, 4.4, 1400, 'Latte art şampiyonunun kafesi.', ARRAY['Latte art muhteşem', 'Barista çok yetenekli', 'Samimi'], 'Latte', '/venues/tokyo/streamer.jpg', 7, '#'),
    (v_cat_id, 'Arise Coffee', 'https://maps.google.com/?q=35.6654,139.7004', 35.6654, 139.7004, 4.5, 1100, 'Shibuya''nın gizli kahve mücevheri.', ARRAY['Yerel favorisi', 'Taze kavurma', 'Fiyat/performans'], 'Drip Coffee', '/venues/tokyo/arise.jpg', 8, '#'),
    (v_cat_id, 'Little Nap Coffee', 'https://maps.google.com/?q=35.6466,139.6683', 35.6466, 139.6683, 4.6, 900, 'Yoyogi''deki tiny kahve standı.', ARRAY['Çok küçük', 'Takeaway only', 'Harika kahve'], 'Americano', '/venues/tokyo/littlenap.jpg', 9, '#'),
    (v_cat_id, 'Nozy Coffee', 'https://maps.google.com/?q=35.7145,139.7967', 35.7145, 139.7967, 4.4, 1200, 'Ueno''daki sanat galerisi kafe.', ARRAY['Sanat sergileri', 'Huzurlu', 'Espresso iyi'], 'Espresso', '/venues/tokyo/nozy.jpg', 10, '#'),
    (v_cat_id, 'Turret Coffee', 'https://maps.google.com/?q=35.6815,139.7673', 35.6815, 139.7673, 4.3, 800, 'Yanesen bölgesinin vintage kafesi.', ARRAY['Retro dekor', 'Sakin mahalle', 'Uygun fiyat'], 'Cold Brew', '/venues/tokyo/turret.jpg', 11, '#');

  -- Add Fine Dining category
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order)
  VALUES (v_tokyo_id, 'Fine Dining', 'fine-dining', 'UtensilsCrossed', 5)
  RETURNING id INTO v_cat_id;

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Narisawa', 'https://maps.google.com/?q=35.659,139.722', 35.659, 139.722, 4.6, 800, 'Dünyanın En İyi 50 Restoranı listesinde.', ARRAY['Orman Ekmeği performansı', 'Sürdürülebilirlik odaklı', 'Çok pahalı'], 'Tasting Menu', '/venues/tokyo/narisawa.jpg', 1, 'https://www.narisawa-yoshihiro-en.com/'),
    (v_cat_id, 'Florilege', 'https://maps.google.com/?q=35.6654,139.7004', 35.6654, 139.7004, 4.7, 600, '2 Michelin yıldızlı French-Japanese fusion.', ARRAY['Open kitchen', 'Yenilikçi', 'Rezervasyon zor'], 'Chef''s Menu', '/venues/tokyo/florilege.jpg', 2, '#'),
    (v_cat_id, 'L''Effervescence', 'https://maps.google.com/?q=35.6556,139.7293', 35.6556, 139.7293, 4.6, 700, 'Modern French fine dining.', ARRAY['Şarap eşleştirmesi', 'Zarif sunumlar', 'Pahalı'], 'Degustation', '/venues/tokyo/leffervescence.jpg', 3, '#'),
    (v_cat_id, 'Quintessence', 'https://maps.google.com/?q=35.6466,139.7110', 35.6466, 139.7110, 4.7, 500, '3 Michelin yıldızlı French.', ARRAY['Klasik teknikler', 'Mükemmel yemekler', 'Çok pahalı'], 'Grand Menu', '/venues/tokyo/quintessence.jpg', 4, '#'),
    (v_cat_id, 'Azabu Kadowaki', 'https://maps.google.com/?q=35.6556,139.7293', 35.6556, 139.7293, 4.8, 400, '3 Michelin yıldızlı kaiseki.', ARRAY['Japon fine dining zirvesi', 'Mevsimsel', 'Rezervasyon imkansız'], 'Omakase', '/venues/tokyo/kadowaki.jpg', 5, '#'),
    (v_cat_id, 'Kohaku', 'https://maps.google.com/?q=35.6815,139.7673', 35.6815, 139.7673, 4.7, 500, '3 Michelin yıldızlı kaiseki.', ARRAY['Modern kaiseki', 'Çok rafine', 'Pahalı'], 'Seasonal Course', '/venues/tokyo/kohaku.jpg', 6, '#'),
    (v_cat_id, 'Den', 'https://maps.google.com/?q=35.6654,139.7004', 35.6654, 139.7004, 4.6, 900, 'Asia''s 50 Best''te, eğlenceli fine dining.', ARRAY['Signature Dentucky Fried Chicken', 'Enerjik şef', 'Eğlenceli'], 'Tasting Menu', '/venues/tokyo/den.jpg', 7, '#'),
    (v_cat_id, 'Nihonryori RyuGin', 'https://maps.google.com/?q=35.6556,139.7293', 35.6556, 139.7293, 4.7, 600, '3 Michelin yıldızlı kaiseki efsanesi.', ARRAY['En prestijli', 'Mükemmel servis', 'Çok pahalı'], 'Omakase', '/venues/tokyo/ryugin.jpg', 8, '#'),
    (v_cat_id, 'Esquisse', 'https://maps.google.com/?q=35.6719,139.7638', 35.6719, 139.7638, 4.6, 700, '2 Michelin yıldızlı French.', ARRAY['Zarif', 'Ginza konumu', 'Pahalı'], 'Chef''s Selection', '/venues/tokyo/esquisse.jpg', 9, '#'),
    (v_cat_id, 'Sezanne', 'https://maps.google.com/?q=35.6654,139.7298', 35.6654, 139.7298, 4.8, 300, 'Four Seasons içinde yeni Michelin yıldızlı.', ARRAY['Contemporary French', 'Çok lüks', 'Rezervasyon zor'], 'Tasting Course', '/venues/tokyo/sezanne.jpg', 10, '#'),
    (v_cat_id, 'Tirpse', 'https://maps.google.com/?q=35.6689,139.7006', 35.6689, 139.7006, 4.5, 400, 'Shibuya''daki modern French.', ARRAY['Yenilikçi', 'Genç şef', 'Fiyatlar makul'], 'Course Menu', '/venues/tokyo/tirpse.jpg', 11, '#');

  RAISE NOTICE 'Tokyo food categories fixed!';
END $$;
