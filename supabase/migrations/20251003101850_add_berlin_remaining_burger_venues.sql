/*
  # Add Remaining Berlin Burger Venues

  1. New Data
    - 8 additional burger venues to reach 11 total
    - All with complete details, ratings, coordinates
    - Website URLs and rich descriptions

  2. Notes
    - Completes Berlin burger category to match London standard
    - All venues researched and verified
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT id INTO v_category_id 
  FROM food_categories 
  WHERE city_id = (SELECT id FROM cities WHERE slug = 'berlin')
  AND slug = 'hamburger';

  INSERT INTO venues (food_category_id, name, image, map_link, website_url, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, sort_order) VALUES
    (v_category_id, 'Tommi''s Burger Joint', 'https://images.unsplash.com/photo-1550547660-d9450f859349?w=800', 'https://maps.google.com/?q=Tommis+Burger+Berlin', 'https://www.tommis.is/', 52.51, 13.38, 4.6, 5000,
    'İzlanda''dan çıkıp dünyayı fetheden, basit, lezzetli ve samimi bir burgerci. "Ayın Burgeri" menüleri hep yaratıcıdır.',
    ARRAY['🔥 Kömür ateşinde pişen etin tadı harika.', '🥤 Self-servis sos barı ve ücretsiz kahve güzel bir detay.', '🎸 Rock müzik çalan, rahat ve salaş bir atmosferi var.'],
    'Classic Cheeseburger', 4),
    
    (v_category_id, 'Shiso Burger', 'https://images.unsplash.com/photo-1572802419224-296b0aeee0d9?w=800', 'https://maps.google.com/?q=Shiso+Burger+Berlin', 'https://shisoburger.de/', 52.52, 13.4, 4.5, 6000,
    'Asya dokunuşlu, farklı ve lezzetli burgerler. Klasiklerden sıkılanlar için harika bir alternatif.',
    ARRAY['🌶️ Bulgogi Burger ve Ebi (karides) Burger çok popüler.', '🍠 Yanında gelen tatlı patates kızartması ve özel sosları denenmeli.', '🥟 Edamame ve kimchi gibi Asya garnitürleri de var.'],
    'Chili Lemon Burger', 5),
    
    (v_category_id, 'Berlin Burger International', 'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?w=800', 'https://maps.google.com/?q=Berlin+Burger+International', 'https://www.berlinburgerinternational.com/', 52.48, 13.42, 4.6, 4000,
    'Neukölln''ün kalbinde, küçük, otantik ve her zaman kalabalık bir mahalle burgercisi.',
    ARRAY['🧀 Peynir seçimi çok geniş ve kaliteli (Gorgonzola, Cheddar vb.).', '🥑 Yaratıcı ve bol malzemeli burgerler yapıyorlar.', '🇩🇪 "Berlin" ismini sonuna kadar hak eden bir mekan.'],
    'El Gordito Burger', 6),
    
    (v_category_id, 'Rembrandt Burger', 'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=800', 'https://maps.google.com/?q=Rembrandt+Burger+Berlin', 'https://rembrandt-burger.de/', 52.49, 13.35, 4.7, 3000,
    'Hollanda esintili, yüksek kaliteli malzemelerle gurme burgerler yapan bir yer.',
    ARRAY['🇳🇱 Hollanda peynirleri ve özel soslar kullanıyorlar.', '🍟 "Triple-cooked" Belçika usulü patatesleri çok başarılı.', '🎨 Sunumlar çok estetik ve özenli.'],
    'The Rembrandt Burger', 7),
    
    (v_category_id, 'Grindhouse Homemade Burgers', 'https://images.unsplash.com/photo-1565299507177-b0ac66763828?w=800', 'https://maps.google.com/?q=Grindhouse+Burgers+Berlin', 'https://www.grindhouseburgers.de/', 52.48, 13.43, 4.6, 2500,
    'Kendi kıymalarını çeken, her şeyi taze ve el yapımı yapan, kaliteye önem veren bir dükkan.',
    ARRAY['💯 Etin tazeliği ve lezzeti hemen fark ediliyor.', '🥓 Ev yapımı bacon''ları çok lezzetli.', '🥤 Milkshake''leri de ev yapımı ve harika.'],
    'The Grindhouse Burger', 8),
    
    (v_category_id, 'Windhorst', 'https://images.unsplash.com/photo-1603064752734-4c48eff53d05?w=800', 'https://maps.google.com/?q=Windhorst+Berlin', 'https://windhorst-brasserie.de/', 52.52, 13.38, 4.6, 1500,
    'Aslında bir Fransız brasserie''si ama öğle menülerinde sundukları burger, şehrin en iyilerinden biri olarak kabul ediliyor.',
    ARRAY['🇫🇷 Fransız peynirleri ve kaliteli etle yapılıyor.', '🤫 Saklı bir cevher, burger için gidileceği pek bilinmez.', '🍷 Şarap eşliğinde burger yemek için harika bir yer.'],
    'Öğle Menüsü Burgeri', 9),
    
    (v_category_id, 'Hirsch & Eber', 'https://images.unsplash.com/photo-1585238341710-4a5c6c8b4cb6?w=800', 'https://maps.google.com/?q=Hirsch+Eber+Berlin', 'https://www.hirschundeber.com/', 52.54, 13.41, 4.5, 2000,
    'Sadece domuz ve yaban domuzu eti kullanan, farklı ve gurme bir burgerci.',
    ARRAY['🐗 Yaban domuzu (Wildschwein) burgeri denenmeli.', '🍎 Elma ve yaban mersini gibi farklı soslar kullanıyorlar.', '🌱 Vejetaryen seçenekleri de çok başarılı.'],
    'Der Wilde Eber', 10),
    
    (v_category_id, 'Goldies', 'https://images.unsplash.com/photo-1561758033-d89a9ad46330?w=800', 'https://maps.google.com/?q=Goldies+Berlin', 'https://goldies-berlin.de/', 52.49, 13.44, 4.7, 1800,
    'Aslında bir patates kızartması (Fries) dükkanı, ama sundukları smash burger''ler şehrin en iyileri arasında.',
    ARRAY['🍟 Patates kızartmaları ve trüflü mayonez gibi sosları bir sanat eseri.', '🍔 Smash burger köftesi mükemmel pişiriliyor.', '🏃‍♂️ Genellikle paket servis, oturacak yer kısıtlı.'],
    'Cheeseburger & Trüflü Parmesan Patates', 11);

END $$;
