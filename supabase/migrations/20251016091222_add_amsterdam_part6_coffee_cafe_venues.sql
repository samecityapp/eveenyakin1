/*
  # Amsterdam - Bölüm 6: Kahve ve Kafe Mekanları
  
  Kahve (11) + Kafe (11) = 22 mekan
*/

-- KAHVE MEKANLARI
INSERT INTO venues (food_category_id, name, website_url, map_link, image, lat, lng, google_rating, google_review_count, mentor_note, must_order, mentor_tricks, sort_order)
SELECT 
  (SELECT id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND slug = 'kahve'),
  v.name, v.website, v.map_link, v.image, v.lat, v.lng, v.rating, v.review_count, v.mentor_note, v.must_order, v.mentor_tricks, v.sort_order
FROM (VALUES
  ('Lot Sixty One', 'https://lotsixtyone.com/', 'https://maps.google.com/?q=52.36,4.86', '/venues/amsterdam/lot61.jpg', 52.36, 4.86, 4.6, 2000, 'Amsterdamın üçüncü dalga kahve sahnesinin en önemli oyuncularından. Kendi kahvelerini kavuruyorlar.', 'Flat White', ARRAY['☕ Çekirdeklerini paket olarak satın alabilirsiniz.', '☀️ Güneşli havalarda dükkanın önündeki banklarda oturmak çok keyifli.'], 1),
  ('Bocca Coffee', 'https://www.bocca.nl/', 'https://maps.google.com/?q=52.373,4.891', '/venues/amsterdam/bocca.jpg', 52.373, 4.891, 4.5, 2800, 'Kendi kavurma tesisine sahip, Amsterdamın en köklü specialty coffee mekanlarından.', 'Espresso', ARRAY['🔥 Kavurma atölyelerine katılabilirsiniz.', '📚 Kahve hakkında çok şey öğrenebileceğiniz bir yer.'], 2),
  ('Monks Coffee Roasters', 'https://www.monkscoffeeroasters.com/', 'https://maps.google.com/?q=52.357,4.888', '/venues/amsterdam/monks.jpg', 52.357, 4.888, 4.7, 1600, 'Albert Cuyp pazarı yakınında, minimalist ve şık bir kahve dükkanı.', 'Cappuccino', ARRAY['🎨 Latte artları muhteşem.', '🥐 Pastane ürünleri taze ve lezzetli.'], 3),
  ('Coffee & Coconuts', 'https://www.coffeeandcoconuts.com/', 'https://maps.google.com/?q=52.358,4.893', '/venues/amsterdam/coconuts.jpg', 52.358, 4.893, 4.4, 5200, 'Eski bir sinema binasında, çok geniş ve etkileyici bir mekan.', 'Almond Milk Latte', ARRAY['🏛️ Atmosfer inanılmaz, çok fotojenik.', '🍳 Brunch menüsü de çok zengin.'], 4),
  ('Scandinavian Embassy', 'https://www.scandinavianembassy.nl/', 'https://maps.google.com/?q=52.369,4.894', '/venues/amsterdam/scandi.jpg', 52.369, 4.894, 4.6, 1400, 'İskandinav estetiğiyle tasarlanmış, minimal ve şık kahve dükkanı.', 'Filter Coffee', ARRAY['🇸🇪 İskandinav tarzı pastalar çok lezzetli.', '☕ Demleme yöntemleri konusunda uzmanlar.'], 5),
  ('Back to Black', 'https://www.backtoblack.coffee/', 'https://maps.google.com/?q=52.378,4.889', '/venues/amsterdam/backtoblack.jpg', 52.378, 4.889, 4.5, 2100, 'Westerparkta kanal kenarında, manzaralı ve rahat bir kahve yeri.', 'Cold Brew', ARRAY['🌊 Kanal manzarası eşsiz.', '☀️ Yazın dışarıda oturmak harika.'], 6),
  ('Two for Joy', 'https://www.twoforjoy.nl/', 'https://maps.google.com/?q=52.372,4.895', '/venues/amsterdam/twoforjoy.jpg', 52.372, 4.895, 4.6, 3600, 'Rahat, ev gibi atmosferiyle bilinen kahveci. Brunch da mükemmel.', 'Oat Milk Cappuccino', ARRAY['🥞 Pancakeleri ünlü, mutlaka deneyin.', '📚 Uzun süre oturabileceğiniz rahat bir yer.'], 7),
  ('Toki', 'https://www.tokicoffee.nl/', 'https://maps.google.com/?q=52.361,4.878', '/venues/amsterdam/toki.jpg', 52.361, 4.878, 4.7, 900, 'Japon minimalizmi ile Amsterdam kahve kültürünün buluşması.', 'Matcha Latte', ARRAY['🍵 Matcha çeşitleri ve kalitesi çok iyi.', '🎎 Japon tatlıları da var.'], 8),
  ('Rum Baba', 'https://www.rumbaba.nl/', 'https://maps.google.com/?q=52.366,4.892', '/venues/amsterdam/rumbaba.jpg', 52.366, 4.892, 4.5, 1800, 'Kahve ve pâtisserie bir arada. Tatlıları inanılmaz.', 'Cortado', ARRAY['🍰 Rum baba tatlısı meşhur, adını buradan alıyor.', '🥐 Croissantlar Fransadan sonra en iyisi.'], 9),
  ('White Label Coffee', 'https://www.whitelabelcoffee.nl/', 'https://maps.google.com/?q=52.37,4.888', '/venues/amsterdam/whitelabel.jpg', 52.37, 4.888, 4.6, 2400, 'Modern ve şık, specialty coffee konusunda uzman.', 'V60 Pour Over', ARRAY['⚗️ Demleme ekipmanları ileri seviye.', '📖 Menüde kahve kökenini detaylı anlatan açıklamalar var.'], 10),
  ('CT Coffee & Coconuts Oost', 'https://www.ctcafe.nl/', 'https://maps.google.com/?q=52.361,4.925', '/venues/amsterdam/ct.jpg', 52.361, 4.925, 4.5, 1300, 'Amsterdam Oosttaki gizli kahve cenneti.', 'Iced Latte', ARRAY['🌳 Yeşilliklerle çevrili, doğayla iç içe.', '🏖️ Yaz aylarında bahçe çok popüler.'], 11)
) AS v(name, website, map_link, image, lat, lng, rating, review_count, mentor_note, must_order, mentor_tricks, sort_order)
ON CONFLICT DO NOTHING;

-- KAFE MEKANLARI
INSERT INTO venues (food_category_id, name, website_url, map_link, image, lat, lng, google_rating, google_review_count, mentor_note, must_order, mentor_tricks, sort_order)
SELECT 
  (SELECT id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND slug = 'kafe'),
  v.name, v.website, v.map_link, v.image, v.lat, v.lng, v.rating, v.review_count, v.mentor_note, v.must_order, v.mentor_tricks, v.sort_order
FROM (VALUES
  ('Winkel 43', 'https://winkel43.nl/', 'https://maps.google.com/?q=52.379,4.88', '/venues/amsterdam/winkel43.jpg', 52.379, 4.88, 4.6, 9000, 'Burası tek bir şeyle meşhur: Hollanda usulü elmalı turta (Appeltaart). Amsterdama gelip burada turta yememek olmaz.', 'Appeltaart met slagroom', ARRAY['🥧 Turta porsiyonları devasadır, paylaşmayı düşünebilirsiniz.', '📅 Cumartesi günleri çok kalabalık olur.'], 1),
  ('Café de Jaren', 'https://www.cafedejaren.nl/', 'https://maps.google.com/?q=52.367,4.898', '/venues/amsterdam/dejaren.jpg', 52.367, 4.898, 4.3, 8500, 'Amstel nehri kenarında, dev terasıyla ünlü ikonik bir kafe.', 'Dutch Breakfast', ARRAY['☀️ Güneşli günlerde terasta oturmak harika.', '📰 Uluslararası gazete ve dergi çeşidi çok geniş.'], 2),
  ('Pluk', 'https://www.plukamsterdam.nl/', 'https://maps.google.com/?q=52.363,4.884', '/venues/amsterdam/pluk.jpg', 52.363, 4.884, 4.5, 4200, 'Instagramın çok sevdiği, şık ve renkli bir brunch kafesi.', 'Açai Bowl', ARRAY['📸 Her köşe fotoğraf çekmeye değer.', '🥗 Sağlıklı beslenenlerin cenneti.'], 3),
  ('Bagels & Beans', 'https://www.bagelsbeans.nl/', 'https://maps.google.com/?q=52.373,4.89', '/venues/amsterdam/bagels.jpg', 52.373, 4.89, 4.3, 6800, 'Amsterdamın her yerinde şubesi olan, bagel ve kahve uzmanı zincir.', 'Cream Cheese & Salmon Bagel', ARRAY['🥯 Bagel çeşitleri çok fazla.', '☕ Kahveleri de kaliteli ve uygun fiyatlı.'], 4),
  ('De Wasserette', 'https://www.dewasserette.nl/', 'https://maps.google.com/?q=52.377,4.903', '/venues/amsterdam/wasserette.jpg', 52.377, 4.903, 4.4, 3400, 'Eski bir çamaşırhane binasında, benzersiz atmosferiyle dikkat çeken kafe-bar.', 'Dutch Pancakes', ARRAY['🏛️ İç mekan çok ilginç ve nostaljik.', '🌙 Akşam saatleri daha canlı.'], 5),
  ('Gartine', 'https://www.gartine.nl/', 'https://maps.google.com/?q=52.37,4.893', '/venues/amsterdam/gartine.jpg', 52.37, 4.893, 4.6, 2100, 'Ev yapımı yiyecekler ve taze malzemelerle ünlü küçük bir kafe.', 'High Tea', ARRAY['🍰 Kekler ve tatlılar ev yapımı, harika.', '☕ High tea servisi çok özel.'], 6),
  ('Buffet van Odette', 'https://www.buffetvanodettenl/', 'https://maps.google.com/?q=52.356,4.913', '/venues/amsterdam/odette.jpg', 52.356, 4.913, 4.5, 2800, 'Doğu Amsterdamdaki gizli bir inci. Ev gibi sıcak atmosfer.', 'Homemade Pie', ARRAY['🏡 Atmosfer çok samimi ve rahat.', '👵 Tatlıları neredeyse büyükannenin yaptığı gibi.'], 7),
  ('Dignita Hoftuin', 'https://www.dignita.nl/hoftuin/', 'https://maps.google.com/?q=52.361,4.892', '/venues/amsterdam/dignita-hoft.jpg', 52.361, 4.892, 4.5, 4200, 'Gizli bir bahçede saklı, büyülü bir kafe.', 'Shakshuka', ARRAY['🌳 Bahçesi inanılmaz güzel.', '🔍 Bulmak biraz zor ama çok değer.'], 8),
  ('The Avocado Show', 'https://www.theavocadoshow.com/', 'https://maps.google.com/?q=52.368,4.899', '/venues/amsterdam/avocado.jpg', 52.368, 4.899, 4.3, 5600, 'Tüm menüsü avokado bazlı! Sağlıklı beslenmeyi sevenler için cennet.', 'Avocado Burger', ARRAY['🥑 Her şeyde avokado var.', '📸 Sunumlar çok güzel.'], 9),
  ('Bakers & Roasters', 'https://www.bakersandroasters.com/', 'https://maps.google.com/?q=52.358,4.891', '/venues/amsterdam/bakers.jpg', 52.358, 4.891, 4.5, 7200, 'Yeni Zelanda tarzı brunch yapan popüler bir kafe.', 'Banana Bread French Toast', ARRAY['🥞 Brunch menüsü inanılmaz zengin.', '⏰ Hafta sonları çok kalabalık.'], 10),
  ('De Laatste Kruimel', 'https://www.delaatste kruimelnl/', 'https://maps.google.com/?q=52.375,4.902', '/venues/amsterdam/kruimel.jpg', 52.375, 4.902, 4.7, 2400, 'Son Kırıntı anlamına geliyor. Ev yapımı pastane ürünleriyle ünlü.', 'Scones with Cream', ARRAY['🥐 Tüm ürünler günlük taze yapılıyor.', '📏 Yer çok küçük.'], 11)
) AS v(name, website, map_link, image, lat, lng, rating, review_count, mentor_note, must_order, mentor_tricks, sort_order)
ON CONFLICT DO NOTHING;
