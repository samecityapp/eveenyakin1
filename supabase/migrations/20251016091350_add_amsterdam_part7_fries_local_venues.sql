/*
  # Amsterdam - Bölüm 7: Patates Kızartması ve Yerel Lezzetler
  
  Patates (11) + Yerel Lezzetler (11) = 22 mekan
*/

-- PATATES KIZARTMASI MEKANLARI
INSERT INTO venues (food_category_id, name, website_url, map_link, image, lat, lng, google_rating, google_review_count, mentor_note, must_order, mentor_tricks, sort_order)
SELECT 
  (SELECT id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND slug = 'patates'),
  v.name, v.website, v.map_link, v.image, v.lat, v.lng, v.rating, v.review_count, v.mentor_note, v.must_order, v.mentor_tricks, v.sort_order
FROM (VALUES
  ('Vleminckx', 'https://www.vleminckxdesausmeester.nl/', 'https://maps.google.com/?q=52.368,4.889', '/venues/amsterdam/vleminckx.jpg', 52.368, 4.889, 4.6, 7000, '1957den beri hizmet veren, sadece patates kızartması ve onlarca çeşit sos satan ikonik bir dükkan.', 'Patat Oorlog', ARRAY['🍟 Patatje Oorlog mutlaka deneyin!', '🥫 20den fazla sos seçeneği var.', '🚶‍♂️ Ayakta yenen, hızlı bir atıştırmalık durağıdır.'], 1),
  ('Manneken Pis', 'https://www.mannekenpis.amsterdam/', 'https://maps.google.com/?q=52.373,4.896', '/venues/amsterdam/manneken.jpg', 52.373, 4.896, 4.3, 4200, 'Belçika patates geleneğini Amsterdama taşıyan zincir. Kalın kesim, çıtır patatesleri ünlü.', 'Vlaamse Frites', ARRAY['🇧🇪 Belçika usulü, iki kez kızartılıyor.', '🥫 Belçika mayonezi çok özel.'], 2),
  ('The Seafood Bar', 'https://www.theseafoodbar.com/', 'https://maps.google.com/?q=52.373,4.893', '/venues/amsterdam/seafoodbar.jpg', 52.373, 4.893, 4.5, 6800, 'Deniz ürünleri restoranı ama patatesleri de inanılmaz.', 'Hand-Cut Fries', ARRAY['🐟 Balık yemeklerle birlikte mükemmel.', '🍴 Restoran kalitesinde patates.'], 3),
  ('Chipsy King', 'https://www.chipsyking.nl/', 'https://maps.google.com/?q=52.362,4.881', '/venues/amsterdam/chipsy.jpg', 52.362, 4.881, 4.4, 2100, 'Klasik Hollanda usulü patates, uygun fiyatlı ve doyurucu.', 'Kapsalon', ARRAY['🥙 Kapsalon çok popüler.', '🌙 Gece geç saatlere kadar açık.'], 4),
  ('Frietsteeg', 'https://www.frietsteeg.nl/', 'https://maps.google.com/?q=52.357,4.886', '/venues/amsterdam/frietsteeg.jpg', 52.357, 4.886, 4.5, 1800, 'Organik patatesler ve sağlıklı yağlarla kızartıyorlar.', 'Organic Fries', ARRAY['🌱 Glutensiz ve vegan sos seçenekleri var.', '♻️ Çevre dostu.'], 5),
  ('Rob Wigboldus Vis', 'https://www.robwigboldusvis.nl/', 'https://maps.google.com/?q=52.358,4.893', '/venues/amsterdam/wigboldus.jpg', 52.358, 4.893, 4.6, 3400, 'Albert Cuyp pazarındaki balık dükkanı, patatesleri de efsane.', 'Kibbeling met Friet', ARRAY['🐟 Kibbeling ile patates harika ikili.', '🏪 Pazar atmosferinde yemek çok keyifli.'], 6),
  ('Febo', 'https://www.febo.nl/', 'https://maps.google.com/?q=52.367,4.895', '/venues/amsterdam/febo.jpg', 52.367, 4.895, 3.9, 5200, 'Hollandanın otomatik satış makinelerinden yiyecek alan ünlü zinciri.', 'Kroket en Frites', ARRAY['🤖 Duvardan yiyecek almak eğlenceli.', '🌙 24 saat açık olanları var.'], 7),
  ('The French Cafe', 'https://www.thefrenchcafe.nl/', 'https://maps.google.com/?q=52.36,4.887', '/venues/amsterdam/frenchcafe.jpg', 52.36, 4.887, 4.4, 2600, 'Fransız usulü ince kesim patates kızartması.', 'Pommes Frites', ARRAY['🇫🇷 Fransız tarzı, daha ince ve çıtır.', '🍷 Fransız şarap eşliğinde ideal.'], 8),
  ('De Vier Pilaren', 'https://www.devierpilaren.nl/', 'https://maps.google.com/?q=52.375,4.899', '/venues/amsterdam/pilaren.jpg', 52.375, 4.899, 4.3, 1500, 'Geleneksel Hollanda pubu, patatesleri ve kroketleri ünlü.', 'Bitterballen en Frites', ARRAY['🍺 Bira ile birlikte yemek çok popüler.', '🥔 Bitterballen deneyin.'], 9),
  ('Broodje Bert', 'https://www.broodjebert.nl/', 'https://maps.google.com/?q=52.368,4.891', '/venues/amsterdam/bert.jpg', 52.368, 4.891, 4.5, 3100, 'Sandwich dükkanı ama patatesleri de çok iyi.', 'Friet met Mayonaise', ARRAY['🥖 Sandviçlerle birlikte combo yapabilirsiniz.', '⚡ Çok hızlı servis.'], 10),
  ('Holtkamp', 'https://www.holtkamp.nl/', 'https://maps.google.com/?q=52.37,4.897', '/venues/amsterdam/holtkamp.jpg', 52.37, 4.897, 4.6, 2200, '1969dan beri, kroket ve patatesleriyle ünlü bir Amsterdam klasiği.', 'Kroket met Friet', ARRAY['👑 Kraliyet ailesinin de tercih ettiği söylenir.', '🏆 Kroketleri Hollandanın en iyilerinden.'], 11)
) AS v(name, website, map_link, image, lat, lng, rating, review_count, mentor_note, must_order, mentor_tricks, sort_order)
ON CONFLICT DO NOTHING;

-- YEREL LEZZETLER
INSERT INTO venues (food_category_id, name, website_url, map_link, image, lat, lng, google_rating, google_review_count, mentor_note, must_order, mentor_tricks, sort_order)
SELECT 
  (SELECT id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND slug = 'yerel-lezzetler'),
  v.name, v.website, v.map_link, v.image, v.lat, v.lng, v.rating, v.review_count, v.mentor_note, v.must_order, v.mentor_tricks, v.sort_order
FROM (VALUES
  ('Original Stroopwafels', 'https://www.originaldutchstroopwafels.com/', 'https://maps.google.com/?q=52.358,4.893', '/venues/amsterdam/stroopwafel.jpg', 52.358, 4.893, 4.8, 5000, 'Albert Cuyp Marketin içindeki bu küçük tezgah, taze ve sıcak stroopwafel için en iyi adres.', 'Taze Stroopwafel', ARRAY['😋 En güzeli sıcakken yemektir.', '🍫 Üzerine ekstra çikolata sosu isteyebilirsiniz.'], 1),
  ('Pancakes Amsterdam', 'https://www.pancakes.amsterdam/', 'https://maps.google.com/?q=52.374,4.898', '/venues/amsterdam/pancakes.jpg', 52.374, 4.898, 4.3, 6200, 'Hollanda usulü pankek için en popüler yerlerden.', 'Dutch Pancake with Bacon', ARRAY['🥞 Hollanda pankekleri çok farklı, daha ince ve geniş.', '🍎 Elmalı versiyonu çok popüler.'], 2),
  ('The Pancake Bakery', 'https://www.pancake.nl/', 'https://maps.google.com/?q=52.375,4.884', '/venues/amsterdam/pancakebakery.jpg', 52.375, 4.884, 4.4, 8600, 'Anne Frank Evinin yanında, tarihi bir binada. 75ten fazla çeşit!', 'Traditional Dutch Pancake', ARRAY['📜 Menü inanılmaz çeşitli.', '🏛️ Eski bir ticaret deposunda.'], 3),
  ('De Laatste Kruimel', 'https://www.delaatste kruimelnl/', 'https://maps.google.com/?q=52.375,4.902', '/venues/amsterdam/kruimel2.jpg', 52.375, 4.902, 4.7, 2400, 'Hollanda tatlıları ve pastane ürünleri için en iyi adreslerden.', 'Tompouce', ARRAY['🍰 Tompouce Hollanda klasiği.', '👑 Kral Gününde turuncu Tompouce yaparlar.'], 4),
  ('Haring Hendrikse', 'https://www.haringhendrikse.nl/', 'https://maps.google.com/?q=52.371,4.897', '/venues/amsterdam/haring.jpg', 52.371, 4.897, 4.6, 1800, 'Çiğ ringa balığı satan bir tezgah. Hollandanın en geleneksel yiyeceği.', 'Hollandse Nieuwe Haring', ARRAY['🐟 Baharın ilk ringası çok özel, Mayıs-Haziranda deneyin.', '🧅 Soğan ve turşu ile servis edilir.'], 5),
  ('Van Stapele', 'https://www.vanstapele.com/', 'https://maps.google.com/?q=52.37,4.894', '/venues/amsterdam/vanstapele.jpg', 52.37, 4.894, 4.7, 4200, 'Tek bir ürün satarlar: Sıcak çikolatalı kurabiye. Ve mükemmeldir!', 'White Chocolate Cookie', ARRAY['🍪 Sadece bir çeşit kurabiye var.', '🔥 Sıcak servis edilir.'], 6),
  ('Stubbes Haring', 'https://www.stubbes.nl/', 'https://maps.google.com/?q=52.358,4.893', '/venues/amsterdam/stubbes.jpg', 52.358, 4.893, 4.5, 3100, 'Albert Cuyp pazarındaki ringa balığı tezgahı.', 'Broodje Haring', ARRAY['🥖 Ekmek arası ringa daha kolay yenebilir.', '🐟 Balıklar her gün taze.'], 7),
  ('Puccini Bomboni', 'https://www.puccinibomboni.com/', 'https://maps.google.com/?q=52.373,4.891', '/venues/amsterdam/puccini.jpg', 52.373, 4.891, 4.6, 2800, 'El yapımı çikolatalar. Hollanda çikolata kültürünün en iyi örneklerinden.', 'Handmade Chocolates', ARRAY['🍫 Her biri sanat eseri gibi.', '🎁 Hediye paketleri çok şık.'], 8),
  ('Banketbakkerij van der Linde', 'https://www.banketbakkerij-vanderlinde.nl/', 'https://maps.google.com/?q=52.366,4.882', '/venues/amsterdam/vanderlinde.jpg', 52.366, 4.882, 4.5, 1600, '1910dan beri hizmet veren aile işletmesi pastane.', 'Gevulde Koek', ARRAY['🥧 Gevulde koek Hollanda klasiği.', '🏛️ Çok eski ve otantik bir yer.'], 9),
  ('De Drie Fleschjes', 'https://www.dedriefleschjes.nl/', 'https://maps.google.com/?q=52.373,4.893', '/venues/amsterdam/fleschjes.jpg', 52.373, 4.893, 4.5, 2400, '1650den beri açık, Amsterdamın en eski barlarından. Geleneksel Hollanda likörlerini tatmak için.', 'Jenever Tasting', ARRAY['🍸 Jenever tadım setleri var.', '🏛️ Atmosfer çok otantik.'], 10),
  ('Lanskroon', 'https://www.lanskroon.nl/', 'https://maps.google.com/?q=52.381,4.914', '/venues/amsterdam/lanskroon.jpg', 52.381, 4.914, 4.6, 1900, '1923ten beri, geleneksel Hollanda pastane ürünleri.', 'Appeltaart', ARRAY['🥧 Elmalı turtaları Winkel 43 kadar ünlü değil ama aynı derecede lezzetli.', '💰 Fiyatlar daha uygun.'], 11)
) AS v(name, website, map_link, image, lat, lng, rating, review_count, mentor_note, must_order, mentor_tricks, sort_order)
ON CONFLICT DO NOTHING;
