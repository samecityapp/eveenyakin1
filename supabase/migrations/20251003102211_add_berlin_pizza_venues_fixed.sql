/*
  # Add Remaining Berlin Pizza Venues (Fixed)

  1. New Data
    - 9 additional pizza venues to reach 11 total
    - Neapolitan, Roman, and modern styles
    - All with complete details

  2. Notes
    - Fixed apostrophe escaping
    - Showcases Berlin's diverse pizza scene
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT id INTO v_category_id 
  FROM food_categories 
  WHERE city_id = (SELECT id FROM cities WHERE slug = 'berlin')
  AND slug = 'pizza';

  INSERT INTO venues (food_category_id, name, image, map_link, website_url, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, sort_order) VALUES
    (v_category_id, 'Masaniello', 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=800', 'https://maps.google.com/?q=Masaniello+Berlin', 'https://www.masaniello-berlin.de/', 52.525, 13.382, 4.7, 4800,
    'Napoli''den gelen pizzacıların açtığı, Berlin''deki en otantik Napoli pizzası.',
    ARRAY['🇮🇹 Pizzacılar Napoli''den gelmiş, gerçek İtalyan deneyimi.', '🔥 Taş fırın sıcaklığı ve hamur fermantasyonu mükemmel.', '🍷 İtalyan şarap seçenekleri zengin.'],
    'Marinara', 3),
    
    (v_category_id, 'Il Casolare', 'https://images.unsplash.com/photo-1571997478779-2adcbbe9ab2f?w=800', 'https://maps.google.com/?q=Il+Casolare+Berlin', 'https://www.ilcasolare.de/', 52.489, 13.356, 4.6, 3200,
    'Schöneberg''de aile işletmesi, geleneksel İtalyan pizzası.',
    ARRAY['👨‍👩‍👧 Aile atmosferi çok sıcak ve samimi.', '🍕 Pizzalar ince hamurlu ve dengeli.', '🍝 Pizza dışında pastaları da harika.'],
    'Quattro Stagioni', 4),
    
    (v_category_id, 'I Due Forni', 'https://images.unsplash.com/photo-1593560708920-61dd98c46a4e?w=800', 'https://maps.google.com/?q=I+Due+Forni+Berlin', 'https://www.idueforni.de/', 52.491, 13.349, 4.8, 5200,
    '2 fırınlı (Roma ve Napoli tarzı) benzersiz konsept. Her iki stili de deneyebilirsiniz.',
    ARRAY['🏛️ Roma pizzası (al taglio) ve Napoli pizzası aynı yerde.', '📏 Dilim pizza seçenekleri çok çeşitli.', '⚡ Çok popüler, rezervasyon önerilir.'],
    'Pizza Bianca (Roma tarzı)', 5),
    
    (v_category_id, 'Malatesta', 'https://images.unsplash.com/photo-1534308983496-4fabb1a015ee?w=800', 'https://maps.google.com/?q=Malatesta+Berlin', 'https://www.malatesta-berlin.de/', 52.49, 13.435, 4.5, 2800,
    'Neukölln''de yerel favorisi, fiyat/performans oranı çok iyi.',
    ARRAY['💰 Uygun fiyatlı ama kaliteli pizza.', '🌿 Taze malzemeler ve iyi hamur.', '🏃 Genellikle kalabalık, erken gitmek veya paket yapmak mantıklı.'],
    'Diavola', 6),
    
    (v_category_id, 'W Pizza', 'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=800', 'https://maps.google.com/?q=W+Pizza+Berlin', 'https://www.w-pizza.de/', 52.508, 13.389, 4.6, 3500,
    'Mitte''de modern İtalyan pizzası, şık atmosfer.',
    ARRAY['✨ Mekan tasarımı çok modern ve estetik.', '🍕 Pizzalar hem klasik hem yaratıcı çeşitlerde.', '🍸 Kokteyl ve aperitif menüsü güzel.'],
    'Burrata Pizza', 7),
    
    (v_category_id, 'Made in Berlin', 'https://images.unsplash.com/photo-1571407970349-bc81e7e96a47?w=800', 'https://maps.google.com/?q=Made+in+Berlin+Pizza', 'https://www.madeinberlin-pizza.de/', 52.515, 13.41, 4.5, 2200,
    'Yerel malzemelerle yapılan, Berlin ruhu taşıyan pizzalar.',
    ARRAY['🇩🇪 Yerel ve mevsimlik malzemeler kullanıyorlar.', '🌱 Organik un ve soslar.', '🎨 Her ay değişen özel pizza menüleri var.'],
    'Berlin Special', 8),
    
    (v_category_id, 'Pazzi Pizza', 'https://images.unsplash.com/photo-1589119908995-c6c8f5b92950?w=800', 'https://maps.google.com/?q=Pazzi+Pizza+Berlin', 'https://www.pazzipizza.de/', 52.532, 13.395, 4.6, 1900,
    'Prenzlauer Berg''de, çılgın kombinasyonlarıyla tanınan yaratıcı pizzacı.',
    ARRAY['🤪 İsim "çılgın" demek, pizzalar da gerçekten cesur.', '🥑 Avokado pizza ve diğer modern kombinasyonlar.', '👍 Klasik sevenler için de güzel seçenekler var.'],
    'Pazzi Special', 9),
    
    (v_category_id, 'Uno Momento', 'https://images.unsplash.com/photo-1595854341625-f33ee10dbf94?w=800', 'https://maps.google.com/?q=Uno+Momento+Berlin', 'https://www.unomomento.de/', 52.478, 13.428, 4.7, 2600,
    'Kreuzberg''de gizli bir İtalyan cevheri, pizza ve pasta harika.',
    ARRAY['🤫 Turistik değil, yerel bir yer.', '🍕 Pizzalar otantik ve lezzetli.', '🎵 Canlı müzik geceleri oluyor, atmosfer harika.'],
    'Capricciosa', 10),
    
    (v_category_id, 'Razzo', 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=800', 'https://maps.google.com/?q=Razzo+Pizza+Berlin', 'https://www.razzo-berlin.de/', 52.502, 13.415, 4.5, 1700,
    'Romalı pizzacıların açtığı, al taglio (dilim) pizza ustası.',
    ARRAY['🇮🇹 Roma tarzı kare pizza, kalın ve yumuşak hamur.', '⚖️ Dilimleri gramla satıyorlar, istediğiniz kadar alabilirsiniz.', '🏃 Hızlı ve pratik, öğle arası için mükemmel.'],
    'Pizza Rossa', 11);

END $$;
