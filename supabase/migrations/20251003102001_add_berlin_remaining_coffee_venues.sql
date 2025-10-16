/*
  # Add Remaining Berlin Coffee Venues

  1. New Data
    - 8 additional coffee venues to reach 11 total
    - Specialty coffee and third wave focus
    - All with complete details and coordinates

  2. Notes
    - Completes Berlin coffee category
    - Matches London standard
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT id INTO v_category_id 
  FROM food_categories 
  WHERE city_id = (SELECT id FROM cities WHERE slug = 'berlin')
  AND slug = 'kahve';

  INSERT INTO venues (food_category_id, name, image, map_link, website_url, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, sort_order) VALUES
    (v_category_id, 'Five Elephant', 'https://images.unsplash.com/photo-1442512595331-e89e73853f31?w=800', 'https://maps.google.com/?q=Five+Elephant+Berlin', 'https://www.fiveelephant.com/', 52.488, 13.44, 4.6, 2500,
    'Harika kahvelerinin yanı sıra, Berlin''in en iyi cheesecake''ini yaptığı söylenen meşhur bir mekan.',
    ARRAY['🍰 Cheesecake gerçekten efsane, kahveyle birlikte mutlaka denenmeli.', '👍 Hem kahveleri hem de servisleri çok kaliteli.', '☀️ Kreuzberg''deki şubesinin önünde oturmak çok keyifli.'],
    'Flat White & Cheesecake', 4),
    
    (v_category_id, 'Father Carpenter', 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=800', 'https://maps.google.com/?q=Father+Carpenter+Berlin', 'https://www.father-carpenter.de/', 52.528, 13.405, 4.5, 1800,
    'Prenzlauer Berg''de kahve ve brunch için popüler bir durak. Hafta sonları çok kalabalık.',
    ARRAY['🥐 Avustralya tarzı brunch menüsü harika.', '☕ Flat white''ları Berlin''deki en iyilerden.', '🌳 Helmholtzplatz''a yakın, parkta oturmak için kahve almak güzel.'],
    'Flat White', 5),
    
    (v_category_id, 'Distrikt Coffee', 'https://images.unsplash.com/photo-1453614512568-c4024d13c247?w=800', 'https://maps.google.com/?q=Distrikt+Coffee+Berlin', 'https://www.distrikt-coffee.de/', 52.505, 13.388, 4.7, 2200,
    'Mitte''de küçük ama çok kaliteli bir specialty coffee dükkanı.',
    ARRAY['👨‍🍳 Barista''lar çok bilgili ve tutkulu.', '📚 Kahve hakkında sorular sorabilir ve öğrenebilirsiniz.', '🪑 Az oturma yeri var, genelde paket servis yapılıyor.'],
    'Pour Over', 6),
    
    (v_category_id, 'ISLA Coffee', 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800', 'https://maps.google.com/?q=ISLA+Coffee+Berlin', 'https://www.isla-coffee.com/', 52.515, 13.395, 4.6, 1500,
    'Küçük, şık ve samimi bir kahve dükkanı. Öğleden sonra çalışmak için ideal.',
    ARRAY['💻 Laptop dostu, wifi hızlı.', '🥪 Sandviçleri ve atıştırmalıkları taze ve lezzetli.', '🎵 Playlist seçimleri harika, rahat bir atmosfer.'],
    'Cappuccino', 7),
    
    (v_category_id, 'Westberlin', 'https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=800', 'https://maps.google.com/?q=Westberlin+Coffee+Berlin', 'https://www.westberlin-coffee.com/', 52.498, 13.392, 4.5, 1200,
    'Kreuzberg''de yerel bir favorit. Klasik Berlin cafe atmosferi.',
    ARRAY['🚬 Dışarıda oturma alanı geniş ve rahat.', '☕ Kahveleri tutarlı ve güzel.', '📰 Gazete okuyup kahve içmek için mükemmel.'],
    'Americano', 8),
    
    (v_category_id, 'Kaffeebar', 'https://images.unsplash.com/photo-1506619216599-9d16d0903dfd?w=800', 'https://maps.google.com/?q=Kaffeebar+Berlin', 'https://www.kaffeebar.de/', 52.52, 13.41, 4.6, 1400,
    'Birden fazla şubesi olan, kaliteli ve güvenilir bir kahve zinciri.',
    ARRAY['🏃 Hızlı servis, sabah acele edenler için ideal.', '🥐 Croissant ve pastry seçenekleri güzel.', '📍 Şehrin farklı noktalarında şubeleri var.'],
    'Espresso Macchiato', 9),
    
    (v_category_id, 'No Fire No Glory', 'https://images.unsplash.com/photo-1511537190424-bbbab87ac5eb?w=800', 'https://maps.google.com/?q=No+Fire+No+Glory+Berlin', 'https://www.nofirenoglory.de/', 52.533, 13.398, 4.7, 1100,
    'Prenzlauer Berg''de gizli bir cevher. Çok kaliteli kahve ve sıcak atmosfer.',
    ARRAY['🔥 İsmi kahve kavurma felsefelerinden geliyor.', '🎨 İç dekorasyon çok estetik ve samimi.', '🍪 Ev yapımı kurabiye ve kekleri denenmeli.'],
    'Filter Coffee', 10),
    
    (v_category_id, 'Kaffeehaus SowohlAlsAuch', 'https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?w=800', 'https://maps.google.com/?q=SowohlAlsAuch+Berlin', 'https://www.sowohlalsauch.de/', 52.485, 13.431, 4.5, 900,
    'Neukölln''de Berlin''in klasik mahalle kafesi havası. Yavaş tempolu ve rahat.',
    ARRAY['📚 Kitap okumak için harika bir ortam.', '☕ Klasik filtre kahve çok iyi.', '🥧 Ev yapımı kekler değişken menüde, denenmeli.'],
    'Filterkaffee', 11);

END $$;
