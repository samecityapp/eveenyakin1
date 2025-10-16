/*
  # Add Remaining Berlin Fine Dining Venues

  1. New Data
    - 9 additional fine dining venues to reach 11 total
    - High-end restaurants with unique concepts
    - All with complete details

  2. Notes
    - Showcases Berlin's upscale dining scene
    - Matches London standard
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT id INTO v_category_id 
  FROM food_categories 
  WHERE city_id = (SELECT id FROM cities WHERE slug = 'berlin')
  AND slug = 'fine-dining';

  INSERT INTO venues (food_category_id, name, image, map_link, website_url, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, sort_order) VALUES
    (v_category_id, 'Horváth', 'https://images.unsplash.com/photo-1559339352-11d035aa65de?w=800', 'https://maps.google.com/?q=Horváth+Berlin', 'https://www.restaurant-horvath.de/', 52.493, 13.432, 4.7, 900,
    '2 Michelin yıldızlı, Avusturya kökenli şef Sebastian Frank''ın modern Alp mutfağı yorumu.',
    ARRAY['⭐ 2 Michelin yıldızlı ama hala ulaşılabilir bir atmosfere sahip.', '🏔️ Alp bölgesi malzemeleri ve teknikleri modern yorumlanıyor.', '🍷 Şarap eşleştirmeleri mükemmel.'],
    'Tasting Menu', 3),
    
    (v_category_id, 'einsunternull', 'https://images.unsplash.com/photo-1550966871-3ed3cdb5ed0c?w=800', 'https://maps.google.com/?q=einsunternull+Berlin', 'https://www.einsunternull.com/', 52.525, 13.403, 4.6, 650,
    '1 Michelin yıldızlı, vegan fine dining. Sebze odaklı yaratıcı mutfak.',
    ARRAY['🌱 Tamamen vegan ama et yemeyen herkes için harika bir deneyim.', '🎨 Tabaklar görsel sanat eseri gibi.', '♻️ Sürdürülebilirlik ve yerel malzeme kullanımına çok önem veriyorlar.'],
    'Vegan Tasting Menu', 4),
    
    (v_category_id, 'Pauly Saal', 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=800', 'https://maps.google.com/?q=Pauly+Saal+Berlin', 'https://www.paulysaal.com/', 52.525, 13.390, 4.5, 1100,
    '1 Michelin yıldızlı, eski bir Yahudi kız okulunun spor salonunda açılmış muhteşem mekan.',
    ARRAY['🏛️ Tarihi bina ve yüksek tavanlar inanılmaz bir atmosfer yaratıyor.', '🍽️ Modern Avrupa mutfağı, teknik çok iyi.', '🎭 Özel günler için mükemmel bir seçim.'],
    'Set Menu', 5),
    
    (v_category_id, 'CODA Dessert Dining', 'https://images.unsplash.com/photo-1563778084-c0e3e1e8c191?w=800', 'https://maps.google.com/?q=CODA+Berlin', 'https://www.coda-berlin.com/', 52.499, 13.426, 4.8, 850,
    '1 Michelin yıldızlı, sadece tatlılardan oluşan benzersiz bir fine dining deneyimi.',
    ARRAY['🍰 Her tabak bir tatlı, ama gurme seviyede.', '🍷 Tatlı şarapları ve içki eşleştirmeleri çok yaratıcı.', '✨ Dünyanın ilk dessert-only Michelin yıldızlı restoranlarından.'],
    'Dessert Tasting Menu', 6),
    
    (v_category_id, 'Facil', 'https://images.unsplash.com/photo-1551218808-94e220e084d2?w=800', 'https://maps.google.com/?q=Facil+Berlin', 'https://www.facil.de/', 52.509, 13.378, 4.7, 700,
    '2 Michelin yıldızlı, Potsdamer Platz''daki lüks bir otelin 5. katında, cam tavanlı bahçe restoranı.',
    ARRAY['🌿 Bahçe atmosferi ve doğal ışık çok özel.', '🇫🇷 Fransız mutfağı etkileri güçlü, teknik kusursuz.', '💎 Lüks ve zarif bir deneyim.'],
    'Menu Surprise', 7),
    
    (v_category_id, 'Bandol sur Mer', 'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=800', 'https://maps.google.com/?q=Bandol+sur+Mer+Berlin', 'https://www.bandolsurmer.de/', 52.508, 13.322, 4.6, 950,
    'Akdeniz mutfağına odaklanan, balık ve deniz ürünleri harikası bir restoran.',
    ARRAY['🐟 Balık çok taze ve pişirme teknikleri mükemmel.', '🍋 Akdeniz tatları ve malzemeleri hakim.', '🍷 Fransız Provence şarapları öne çıkıyor.'],
    'Seafood Tasting', 8),
    
    (v_category_id, 'Kin Dee', 'https://images.unsplash.com/photo-1579027989536-b7b1f875659b?w=800', 'https://maps.google.com/?q=Kin+Dee+Berlin', 'https://www.kindeeberlin.com/', 52.492, 13.356, 4.5, 1200,
    '1 Michelin yıldızlı Tay mutfağı. Berlin''deki en iyi Asya restoranlarından.',
    ARRAY['🇹🇭 Otantik Tay tatları ama fine dining seviyesinde sunum.', '🌶️ Baharatlar ve dengeler mükemmel.', '✨ Michelin yıldızlı Tay mutfağı nadir, çok özel bir deneyim.'],
    'Thai Tasting Menu', 9),
    
    (v_category_id, 'Volt', 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?w=800', 'https://maps.google.com/?q=Volt+Berlin', 'https://www.volt-berlin.de/', 52.495, 13.447, 4.6, 800,
    'Eski bir güç santralinde açılmış, endüstriyel tasarımı ve yaratıcı mutfağıyla dikkat çeken restoran.',
    ARRAY['⚡ Mekan tasarımı inanılmaz, eski transformatörler hala duvarlarda.', '🍽️ Modern Avrupa mutfağı, cesur lezzetler.', '🎨 Sanat galerileri ve kültür merkezi içinde.'],
    'Chef Menu', 10),
    
    (v_category_id, 'Grill Royal', 'https://images.unsplash.com/photo-1544025162-d76694265947?w=800', 'https://maps.google.com/?q=Grill+Royal+Berlin', 'https://www.grillroyal.com/', 52.523, 13.393, 4.5, 2200,
    'Berlin''in en ünlü steakhouse''u. Ünlülerin ve iş insanlarının uğrak yeri.',
    ARRAY['🥩 Dry-aged etler dünya klasında.', '🌃 Spree nehri kenarında, görüntü harika.', '💼 Gösterişli ve lüks bir atmosfer, özel günler için ideal.'],
    'Dry-Aged Rib Eye', 11);

END $$;
