/*
  # Amsterdam - Bölüm 4: Hamburger Mekanları
  
  11 hamburger mekanı ekleniyor, tüm detaylarıyla
*/

-- En iyi hamburgerciler (11 mekan)
INSERT INTO venues (food_category_id, name, website_url, map_link, image, lat, lng, google_rating, google_review_count, mentor_note, must_order, mentor_tricks, sort_order)
SELECT 
  (SELECT id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND slug = 'hamburger'),
  v.name, v.website, v.map_link, v.image, v.lat, v.lng, v.rating, v.review_count, v.mentor_note, v.must_order, v.mentor_tricks, v.sort_order
FROM (VALUES
  ('The Butcher', 'https://the-butcher.com/', 'https://maps.google.com/?q=52.357,4.88', '/venues/amsterdam/butcher.jpg', 52.357, 4.88, 4.4, 5000, 
   'Kaliteli Aberdeen Angus etinden yaptıkları sulu ve lezzetli burgerlerle bir Amsterdam klasiği. Albert Cuyp Market''teki ilk dükkanları çok otantik.', 
   'The Butcher with Cheese', 
   ARRAY['🍔 "The Daddy" burgeri en doyurucu ve en popüler seçeneklerden biri.', '🤫 Bazı şubelerinin arkasında "gizli" bir kokteyl barı bulunur, gitmeden araştırın.', '🍟 Patatesleri Belçika usulü ve çok lezzetli.'], 
   1),
   
  ('Lombardo''s', 'https://www.lombardos.nl/', 'https://maps.google.com/?q=52.364,4.896', '/venues/amsterdam/lombardos.jpg', 52.364, 4.896, 4.5, 3200, 
   'De Pijp''teki rahat, samimi atmosferiyle bilinen burger ve BBQ restoranı. Burger tutkunları için gerçek bir hazine.', 
   'Lombardo Burger', 
   ARRAY['🥓 Bacon jam''li burgerleri denemeyi unutmayın, imza lezzetlerinden biri.', '🍺 Craft beer seçenekleri çok zengin ve burgerlerle mükemmel uyum sağlıyor.', '⏰ Akşam saatleri çok kalabalık olabiliyor, rezervasyon önerilir.'], 
   2),
   
  ('Cannibale Royale', 'https://www.cannibaleroyale.nl/', 'https://maps.google.com/?q=52.363,4.884', '/venues/amsterdam/cannibale.jpg', 52.363, 4.884, 4.4, 4800, 
   'Endüstriyel tasarımıyla dikkat çeken, kaliteli etler ve burgerleriyle ünlü mekan. Belçika etkileri taşıyan menüsü çok lezzetli.', 
   'Cannibale Burger', 
   ARRAY['🥩 Et kalitesi gerçekten üst seviye, izgara nefis.', '🍟 Truffle mayonezli patates kızartması favorilerden.', '🍷 Şarap listesi de oldukça etkileyici.'], 
   3),
   
  ('Burgermeester', 'https://www.burgermeester.eu/', 'https://maps.google.com/?q=52.362,4.889', '/venues/amsterdam/burgermeester.jpg', 52.362, 4.889, 4.3, 6500, 
   'Amsterdam''ın birçok semtinde şubesi olan, organik et ve taze malzemeler kullanan yerel bir zincir. Rahat ve samimi atmosfer.', 
   'Burgermeester Burger', 
   ARRAY['🌱 Vejetaryen ve vegan burger seçenekleri çok başarılı.', '🧀 Peynir seçenekleri geniş, farklı tatları deneyebilirsiniz.', '💰 Fiyat-performans dengesi iyi.'], 
   4),
   
  ('The Beef Chief', 'https://www.thebeefchief.nl/', 'https://maps.google.com/?q=52.372,4.892', '/venues/amsterdam/beefchief.jpg', 52.372, 4.892, 4.6, 2800, 
   'Jordaan bölgesinde küçük ama çok kaliteli bir burger dükkanı. Her şey günlük taze hazırlanıyor.', 
   'Chief Burger', 
   ARRAY['🔥 Burgerler sipariş üzerine hazırlanıyor, biraz beklemeye değer.', '🥤 Limonataları ev yapımı ve çok ferahlatıcı.', '📍 Yer çok küçük, genellikle dışarıda kuyruk oluşuyor.'], 
   5),
   
  ('Ter Marsch & Co', 'https://termarsch.nl/', 'https://maps.google.com/?q=52.376,4.902', '/venues/amsterdam/termarsch.jpg', 52.376, 4.902, 4.5, 3600, 
   'Yerel halk arasında çok popüler, kaliteli burgerleri uygun fiyata sunan bir yer. Rahat bir ortam.', 
   'Ter Marsch Burger', 
   ARRAY['🍔 Burger boyutları cömert, açlara hitap ediyor.', '🌭 Hot dog''ları da çok lezzetli, alternatif isteyenler için.', '☕ Kahveleri de kaliteli, yemek sonrası keyifli.'], 
   6),
   
  ('MOS Burgers', 'https://mosburgers.nl/', 'https://maps.google.com/?q=52.368,4.879', '/venues/amsterdam/mos.jpg', 52.368, 4.879, 4.4, 2100, 
   'Japon tarzı burgerler sunan özgün bir konsept. Farklı tatlar arıyorsanız harika bir seçenek.', 
   'Teriyaki Burger', 
   ARRAY['🍚 Rice burger (pirinç ekmeği) seçeneği çok ilginç ve lezzetli.', '🥢 Japon sosları ve tatlandırmaları burgere farklı bir boyut katıyor.', '🍱 Yan ürünler de Japon mutfağından esinlenmiş.'], 
   7),
   
  ('Firm Burgers & Fries', 'https://www.firmburgers.nl/', 'https://maps.google.com/?q=52.358,4.895', '/venues/amsterdam/firm.jpg', 52.358, 4.895, 4.3, 1800, 
   'Albert Cuyp pazarı yakınında, taze ve kaliteli malzemeler kullanan burger restoranı.', 
   'Firm Classic Burger', 
   ARRAY['🥔 Tatlı patates kızartması harika.', '🍔 Ekmekleri özel sipariş, çok yumuşak.', '🎵 Atmosfer rahat ve genç, müzik seviyesi ideal.'], 
   8),
   
  ('Stach', 'https://www.stachfood.nl/', 'https://maps.google.com/?q=52.363,4.881', '/venues/amsterdam/stach.jpg', 52.363, 4.881, 4.2, 4200, 
   'Organik ve sürdürülebilir gıda odaklı bir market/kafe. Burgerleri de bu felsefe doğrultusunda hazırlanıyor.', 
   'Organic Beef Burger', 
   ARRAY['🌿 Tüm ürünler organik ve yerel kaynaklardan.', '🥗 Salata ve sağlıklı yan ürünler çok çeşitli.', '♻️ Çevre dostu ambalajlar kullanılıyor.'], 
   9),
   
  ('The Butcher Social Club', 'https://the-butcher.com/social-club/', 'https://maps.google.com/?q=52.377,4.896', '/venues/amsterdam/butcher-social.jpg', 52.377, 4.896, 4.5, 2900, 
   'The Butcher''ın özel konsepti. Gündüz burger restoranı, gece gizli kokteyl barı.', 
   'Secret Menu Burger', 
   ARRAY['🍸 Gece kokteylleri için rezervasyon gerekiyor.', '🔐 Gizli menüden burger sipariş edebilirsiniz, personele sorun.', '🎭 Atmosfer çok özel ve eğlenceli.'], 
   10),
   
  ('Beef & Bun', 'https://www.beefandbun.nl/', 'https://maps.google.com/?q=52.361,4.883', '/venues/amsterdam/beefbun.jpg', 52.361, 4.883, 4.4, 2600, 
   'Minimalist dekorasyonu ve enfes burgerleriyle dikkat çeken küçük bir mekan.', 
   'Beef & Bun Signature', 
   ARRAY['🍞 Brioche ekmeği ev yapımı, hafif tatlı ve mükemmel.', '🧅 Karamelize soğanları efsane.', '💡 Menü sade ama her şey mükemmel yapılmış.'], 
   11)
) AS v(name, website, map_link, image, lat, lng, rating, review_count, mentor_note, must_order, mentor_tricks, sort_order)
ON CONFLICT DO NOTHING;
