/*
  # Add Remaining Berlin Michelin Starred Venues

  1. New Data
    - 9 additional Michelin starred venues to reach 11 total
    - Berlin's finest restaurants
    - All with complete details and star counts

  2. Notes
    - Completes Berlin Michelin category
    - Matches London gold standard
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT id INTO v_category_id 
  FROM food_categories 
  WHERE city_id = (SELECT id FROM cities WHERE slug = 'berlin')
  AND slug = 'michelin';

  INSERT INTO venues (food_category_id, name, image, map_link, website_url, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, sort_order) VALUES
    (v_category_id, 'Facil', 'https://images.unsplash.com/photo-1595439468874-ab2e8b083ce0?w=800', 'https://maps.google.com/?q=Facil+Restaurant+Berlin', 'https://www.facil.de/', 52.509, 13.378, 4.7, 700,
    '2 Michelin yıldızlı, cam tavanlı bahçe restoranı. Modern Fransız mutfağının Berlin yorumu.',
    ARRAY['⭐⭐ 2 Michelin yıldızı ile Berlin''in en prestijli restoranlarından.', '🌿 5. kattaki cam tavan ve yeşillikler arasında yemek deneyimi.', '🇫🇷 Şef Michael Kempf''in Fransız mutfağı yorumu.'],
    'Menu Surprise', 3),
    
    (v_category_id, 'Horváth', 'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=800', 'https://maps.google.com/?q=Horvath+Restaurant+Berlin', 'https://www.restaurant-horvath.de/', 52.493, 13.432, 4.7, 900,
    '2 Michelin yıldızlı, Avusturya esintili Alp mutfağı. Yerel ve mevsimlik malzemeler.',
    ARRAY['⭐⭐ Şef Sebastian Frank modern Alp mutfağını yeniden tanımlıyor.', '🏔️ Avusturya ve Bavyera tatları çağdaş tekniklerle.', '🌱 Sürdürülebilirlik ve yerel üreticilerle çalışma öncelik.'],
    'Seasonal Tasting Menu', 4),
    
    (v_category_id, 'Rutz', 'https://images.unsplash.com/photo-1424847651672-bf20a4b0982b?w=800', 'https://maps.google.com/?q=Rutz+Restaurant+Berlin', 'https://www.rutz-restaurant.de/', 52.526, 13.391, 4.7, 800,
    '2 Michelin yıldızlı, Berlin''in en iyi şarap listelerinden birine sahip.',
    ARRAY['⭐⭐ Modern Alman mutfağı ve dünya klasmanında şarap seçkisi.', '🍷 1000''den fazla şarap etiketi, sommelierleri çok bilgili.', '👨‍🍳 Şef Marco Müller''in yaratıcı ve teknik mutfağı.'],
    'Chef Tasting Menu with Wine Pairing', 5),
    
    (v_category_id, 'Nobelhart & Schmutzig', 'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=800', 'https://maps.google.com/?q=Nobelhart+Schmutzig', 'https://www.nobelhartundschmutzig.com/', 52.507, 13.418, 4.6, 1200,
    '1 Michelin yıldızlı, brutally local konsepti. Sadece Berlin ve Brandenburg bölgesi malzemeleri.',
    ARRAY['⭐ Radikal bir yaklaşım: 100km içinden tüm malzemeler.', '🍽️ Bar tarzı oturma, açık mutfak konsepti.', '🌱 Sezon ve bölge odaklı, her menü benzersiz.'],
    'Vocally Local Menu', 6),
    
    (v_category_id, 'Pauly Saal', 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=800', 'https://maps.google.com/?q=Pauly+Saal+Restaurant', 'https://www.paulysaal.com/', 52.525, 13.390, 4.5, 1100,
    '1 Michelin yıldızlı, eski Yahudi kız okulunun muhteşem spor salonunda.',
    ARRAY['⭐ Tarihi bina ve yüksek tavanlı salon inanılmaz atmosfer.', '🏛️ 1920lerde inşa edilmiş binanın orijinal detayları korunmuş.', '🍽️ Modern Avrupa mutfağı, zarif sunumlar.'],
    'Pauly Saal Set Menu', 7),
    
    (v_category_id, 'einsunternull', 'https://images.unsplash.com/photo-1586511925558-a4c6376fe65f?w=800', 'https://maps.google.com/?q=einsunternull+Berlin', 'https://www.einsunternull.com/', 52.525, 13.403, 4.6, 650,
    '1 Michelin yıldızlı, tamamen vegan fine dining. Sebze odaklı modern mutfak.',
    ARRAY['⭐ Vegan mutfak için Michelin yıldızı almış nadir restoranlardan.', '🌱 Sebzeler ve bitkisel protein kaynakları sanat eserine dönüşüyor.', '♻️ Sıfır atık ve sürdürülebilirlik felsefesi.'],
    'Plant-Based Tasting Menu', 8),
    
    (v_category_id, 'CODA Dessert Dining', 'https://images.unsplash.com/photo-1563778084-c0e3e1e8c191?w=800', 'https://maps.google.com/?q=CODA+Dessert+Dining', 'https://www.coda-berlin.com/', 52.499, 13.426, 4.8, 850,
    '1 Michelin yıldızlı, dünyanın ilk sadece tatlı menüsüyle yıldız almış restoranlarından.',
    ARRAY['⭐ Her tabak bir tatlı ama gurme seviyede tasarlanmış.', '🍰 Tatlı-tuzlu dengesi, tekstür oyunları ve beklenmedik tatlar.', '🍷 Tatlı şarapları ve içki eşleştirmeleri mükemmel.'],
    'Dessert Journey', 9),
    
    (v_category_id, 'Kin Dee', 'https://images.unsplash.com/photo-1579027989536-b7b1f875659b?w=800', 'https://maps.google.com/?q=Kin+Dee+Berlin', 'https://www.kindeeberlin.com/', 52.492, 13.356, 4.5, 1200,
    '1 Michelin yıldızlı, Berlin''de Michelin yıldızı almış ilk Tay restoranı.',
    ARRAY['⭐ Otantik Tay tatları fine dining seviyesinde.', '🇹🇭 Şef Dalad Kambhu''nun modern Tay mutfağı yorumu.', '🌶️ Baharat dengeleri ve lezzet katmanları kusursuz.'],
    'Kin Dee Tasting Menu', 10),
    
    (v_category_id, 'Bandol sur Mer', 'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=800', 'https://maps.google.com/?q=Bandol+sur+Mer', 'https://www.bandolsurmer.de/', 52.508, 13.322, 4.6, 950,
    '1 Michelin yıldızlı, Akdeniz mutfağı ve deniz ürünleri odaklı.',
    ARRAY['⭐ Taze balık ve deniz ürünleri, Akdeniz teknikleriyle.', '🐟 Günlük menü, o gün en taze ne varsa pişiriliyor.', '🍋 Provence ve İtalya etkileri güçlü.'],
    'Mediterranean Seafood Menu', 11);

END $$;
