/*
  # Add Remaining Berlin Venues
  
  Kahve, Kafe, Michelin, Yerel Lezzetler = 44 venues
*/

DO $$
DECLARE
  v_kahve_id uuid;
  v_kafe_id uuid;
  v_michelin_id uuid;
  v_yerel_id uuid;
BEGIN
  SELECT id INTO v_kahve_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'berlin') AND slug = 'kahve';
  SELECT id INTO v_kafe_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'berlin') AND slug = 'kafe';
  SELECT id INTO v_michelin_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'berlin') AND slug = 'michelin';
  SELECT id INTO v_yerel_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'berlin') AND slug = 'yerel-lezzetler';
  
  -- KAHVE
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_kahve_id, 'Bonanza Coffee', 'Berlin specialty kahve öncüsü', 'Filter Coffee', 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg', 'https://maps.google.com/?q=Bonanza+Coffee+Berlin', 52.5234, 13.4089, 1, 4.6, 2400, ARRAY['Roastery var', 'Barista eğitimi', 'Çekirdek satışı', 'Minimalist design']),
  
  (v_kahve_id, 'Five Elephant', 'Cheesecake + kahve', 'Flat White', 'https://images.pexels.com/photos/1251175/pexels-photo-1251175.jpeg', 'https://maps.google.com/?q=Five+Elephant+Berlin', 52.4823, 13.4289, 2, 4.7, 3800, ARRAY['Cheesecake legendary', 'Brunch harika', 'Roastery Reichenberger', 'Outdoor seating']),
  
  (v_kahve_id, 'The Barn', 'Hipster coffee temple', 'Espresso', 'https://images.pexels.com/photos/1002740/pexels-photo-1002740.jpeg', 'https://maps.google.com/?q=The+Barn+Berlin', 52.5289, 13.4023, 3, 4.5, 1900, ARRAY['Multiple locations', 'Quality obsessed', 'No milk alternatives', 'Pure coffee focus']),
  
  (v_kahve_id, 'Silo Coffee', 'Specialty kahve + brunch', 'Cappuccino', 'https://images.pexels.com/photos/1415555/pexels-photo-1415555.jpeg', 'https://maps.google.com/?q=Silo+Coffee+Berlin', 52.5178, 13.4734, 4, 4.6, 1600, ARRAY['All day breakfast', 'Avocado toast', 'Weekend brunch', 'Laptop friendly']),
  
  (v_kahve_id, 'Distrikt Coffee', 'Third wave pioneer', 'Pour Over', 'https://images.pexels.com/photos/851555/pexels-photo-851555.jpeg', 'https://maps.google.com/?q=Distrikt+Coffee+Berlin', 52.5312, 13.4012, 5, 4.5, 1200, ARRAY['Prenzlauer Berg', 'Cozy interior', 'Good playlist', 'Work friendly']),
  
  (v_kahve_id, 'Father Carpenter', 'Australian cafe vibes', 'Long Black', 'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg', 'https://maps.google.com/?q=Father+Carpenter+Berlin', 52.5089, 13.4512, 6, 4.4, 1800, ARRAY['Aussie breakfast', 'Smashed avo', 'Good coffee', 'Trendy crowd']),
  
  (v_kahve_id, 'Happy Baristas', 'Smile guaranteed', 'Americano', 'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg', 'https://maps.google.com/?q=Happy+Baristas+Berlin', 52.4978, 13.4289, 7, 4.6, 980, ARRAY['Super friendly', 'Small space', 'Great vibes', 'Community feel']),
  
  (v_kahve_id, 'Westberlin', 'Friedrichshain gem', 'Cortado', 'https://images.pexels.com/photos/373639/pexels-photo-373639.jpeg', 'https://maps.google.com/?q=Westberlin+Coffee+Berlin', 52.5156, 13.4623, 8, 4.5, 1400, ARRAY['Chill atmosphere', 'Good brunch', 'Natural light', 'Dog friendly']),
  
  (v_kahve_id, 'Chapter One', 'Mitte specialty', 'Cold Brew', 'https://images.pexels.com/photos/2467281/pexels-photo-2467281.jpeg', 'https://maps.google.com/?q=Chapter+One+Berlin', 52.5267, 13.3889, 9, 4.4, 1100, ARRAY['Central location', 'Tourist friendly', 'Clean design', 'Fast WiFi']),
  
  (v_kahve_id, 'Isla Coffee', 'Neukölln hideout', 'Oat Latte', 'https://images.pexels.com/photos/1307692/pexels-photo-1307692.jpeg', 'https://maps.google.com/?q=Isla+Coffee+Berlin', 52.4712, 13.4456, 10, 4.7, 820, ARRAY['Tiny space', 'Quality focus', 'Vegan milk', 'Local favorite']),
  
  (v_kahve_id, 'Roamers', 'Specialty + brunch', 'Chemex', 'https://images.pexels.com/photos/1251176/pexels-photo-1251176.jpeg', 'https://maps.google.com/?q=Roamers+Berlin', 52.5334, 13.4189, 11, 4.6, 1500, ARRAY['Weekend queue', 'Instagrammable', 'Brunch reservation', 'Trendy Mitte']);
  
  -- KAFE
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_kafe_id, 'Café Einstein Stammhaus', 'Classic Viennese cafe', 'Apfelstrudel', 'https://images.pexels.com/photos/1907227/pexels-photo-1907227.jpeg', 'https://maps.google.com/?q=Cafe+Einstein+Berlin', 52.5045, 13.3623, 1, 4.5, 4200, ARRAY['Historic villa', 'Old Berlin charm', 'Schnitzel lunch', 'Garden terrace']),
  
  (v_kafe_id, 'Café am Neuen See', 'Park içinde beer garden', 'Biergarten Menu', 'https://images.pexels.com/photos/4518844/pexels-photo-4518844.jpeg', 'https://maps.google.com/?q=Cafe+am+Neuen+See+Berlin', 52.5112, 13.3478, 2, 4.4, 6800, ARRAY['Tiergarten''da', 'Göl kenarı', 'Summer heaven', 'Rowboat rental']),
  
  (v_kafe_id, 'Princess Cheesecake', 'Cheesecake paradise', 'NY Cheesecake', 'https://images.pexels.com/photos/1907226/pexels-photo-1907226.jpeg', 'https://maps.google.com/?q=Princess+Cheesecake+Berlin', 52.5289, 13.4012, 3, 4.6, 2400, ARRAY['Multiple locations', 'Amazing cakes', 'Coffee good too', 'Takeaway popular']),
  
  (v_kafe_id, 'Anna Blume', 'Flower shop + cafe', 'Breakfast Platter', 'https://images.pexels.com/photos/8951425/pexels-photo-8951425.jpeg', 'https://maps.google.com/?q=Anna+Blume+Berlin', 52.5389, 13.4123, 4, 4.3, 3200, ARRAY['Weekend brunch', 'Flowers everywhere', 'Romantic', 'Queue Sunday']),
  
  (v_kafe_id, 'Schwarzes Café', '24 saat açık legend', 'Spätzle', 'https://images.pexels.com/photos/8951547/pexels-photo-8951547.jpeg', 'https://maps.google.com/?q=Schwarzes+Cafe+Berlin', 52.5056, 13.3234, 5, 4.2, 2800, ARRAY['24/7 open', 'Night owl spot', 'After club food', 'Historic place']),
  
  (v_kafe_id, 'Commonground', 'Neukölln trendy spot', 'Shakshuka', 'https://images.pexels.com/photos/5409010/pexels-photo-5409010.jpeg', 'https://maps.google.com/?q=Commonground+Berlin', 52.4823, 13.4389, 6, 4.5, 1600, ARRAY['Brunch heaven', 'Good coffee', 'Laptop allowed', 'Community vibe']),
  
  (v_kafe_id, 'Mogg', 'Jewish deli style', 'Pastrami Sandwich', 'https://images.pexels.com/photos/5409011/pexels-photo-5409011.jpeg', 'https://maps.google.com/?q=Mogg+Berlin', 52.5023, 13.3889, 7, 4.4, 1800, ARRAY['NY deli vibes', 'Jewish Museum nearby', 'Bagels great', 'Pickle bar']),
  
  (v_kafe_id, 'Tomasa', 'Villa setting', 'Mediterranean Platter', 'https://images.pexels.com/photos/5409012/pexels-photo-5409012.jpeg', 'https://maps.google.com/?q=Tomasa+Berlin', 52.4978, 13.3567, 8, 4.6, 1200, ARRAY['Beautiful garden', 'Wedding location', 'Schöneberg gem', 'Weekend booking']),
  
  (v_kafe_id, 'Bekarei', 'Israeli bakery cafe', 'Sabich', 'https://images.pexels.com/photos/8951546/pexels-photo-8951546.jpeg', 'https://maps.google.com/?q=Bekarei+Berlin', 52.4745, 13.4412, 9, 4.7, 980, ARRAY['Fresh baked', 'Middle Eastern', 'Vegan friendly', 'Morning best']),
  
  (v_kafe_id, 'Brammibal''s Donuts', 'Vegan donuts + coffee', 'Vegan Donut Selection', 'https://images.pexels.com/photos/4518848/pexels-photo-4518848.jpeg', 'https://maps.google.com/?q=Brammibals+Donuts+Berlin', 52.5312, 13.4089, 10, 4.5, 2200, ARRAY['All vegan', 'Creative flavors', 'Multiple shops', 'Instagram worthy']),
  
  (v_kafe_id, 'Café Kranzler', 'Kurfürstendamm icon', 'Schwarzwälder Kirschtorte', 'https://images.pexels.com/photos/8951548/pexels-photo-8951548.jpeg', 'https://maps.google.com/?q=Cafe+Kranzler+Berlin', 52.5045, 13.3356, 11, 4.1, 3600, ARRAY['Tourist spot', 'Historic name', 'City views', 'Good cakes']);
  
  -- MICHELIN
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_michelin_id, 'Tim Raue', '2 yıldız, Asian fusion master', 'Tasting Menu', 'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg', 'https://maps.google.com/?q=Tim+Raue+Berlin', 52.5089, 13.3912, 1, 4.7, 1200, ARRAY['Berlin''in en ünlüsü', 'Asian techniques', 'Reservation months ahead', 'Wine pairing must']),
  
  (v_michelin_id, 'Rutz', '2 yıldız, wine focus', 'Chef''s Menu', 'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg', 'https://maps.google.com/?q=Rutz+Berlin', 52.5234, 13.3889, 2, 4.6, 890, ARRAY['1800 wine labels', 'Sommelier guided', 'Ground floor Weinbar', 'Michelin upstairs']),
  
  (v_michelin_id, 'Nobelhart & Schmutzig', '1 yıldız, brutally local', 'Surprise Menu', 'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg', 'https://maps.google.com/?q=Nobelhart+Schmutzig+Berlin', 52.5023, 13.4089, 3, 4.8, 680, ARRAY['Only local ingredients', 'Berlin regionality', 'Counter seating', 'Unique concept']),
  
  (v_michelin_id, 'Lorenz Adlon Esszimmer', '2 yıldız, Brandenburg Gate', 'Lobster Course', 'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg', 'https://maps.google.com/?q=Lorenz+Adlon+Berlin', 52.5156, 13.3789, 4, 4.5, 520, ARRAY['Hotel Adlon içinde', 'Brandenburger Tor view', 'Classic fine dining', 'Dress code']),
  
  (v_michelin_id, 'Facil', '2 yıldız, hotel gem', 'Garden Menu', 'https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg', 'https://maps.google.com/?q=Facil+Berlin', 52.5089, 13.3756, 5, 4.6, 420, ARRAY['Hidden courtyard', 'Glass roof', 'Business lunch', 'Elegant']),
  
  (v_michelin_id, 'Horváth', '2 yıldız, Austrian touch', 'Austrian Tasting', 'https://images.pexels.com/photos/2456435/pexels-photo-2456435.jpeg', 'https://maps.google.com/?q=Horvath+Berlin', 52.4923, 13.4289, 6, 4.7, 580, ARRAY['Kreuzberg location', 'Alpine flavors', 'Intimate', 'Natural wine']),
  
  (v_michelin_id, 'Skykitchen', '1 yıldız, panorama', 'Skyline Menu', 'https://images.pexels.com/photos/2456436/pexels-photo-2456436.jpeg', 'https://maps.google.com/?q=Skykitchen+Berlin', 52.5334, 13.3623, 7, 4.4, 780, ARRAY['12th floor', '360 views', 'Modern cuisine', 'Sunset timing']),
  
  (v_michelin_id, 'einsunternull', '1 yıldız, vegetable focus', 'Seasonal Vegetables', 'https://images.pexels.com/photos/262047/pexels-photo-262047.jpeg', 'https://maps.google.com/?q=einsunternull+Berlin', 52.5312, 13.4012, 8, 4.6, 520, ARRAY['Veggie-forward', 'Creative cooking', 'Small space', 'Seasonal menu']),
  
  (v_michelin_id, 'Pauly Saal', '1 yıldız, former gym', 'Lamb Course', 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg', 'https://maps.google.com/?q=Pauly+Saal+Berlin', 52.5289, 13.3956, 9, 4.5, 920, ARRAY['Jewish school building', 'High ceilings', 'Historic', 'Modern cuisine']),
  
  (v_michelin_id, 'Golvet', '1 yıldız, rooftop', 'Berlin Menu', 'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg', 'https://maps.google.com/?q=Golvet+Berlin', 52.5178, 13.4523, 10, 4.5, 420, ARRAY['Potsdamer Platz', 'City views', 'Contemporary', 'Bar on top']),
  
  (v_michelin_id, 'Bandol sur Mer', '1 yıldız, seafood', 'Fish Tasting', 'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg', 'https://maps.google.com/?q=Bandol+sur+Mer+Berlin', 52.5067, 13.3234, 11, 4.4, 380, ARRAY['Mediterranean focus', 'Fresh fish daily', 'French techniques', 'Wine selection']);
  
  -- YEREL LEZZETLER
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_yerel_id, 'Curry 36', 'Currywurst efsanesi', 'Currywurst mit Pommes', 'https://images.pexels.com/photos/2456437/pexels-photo-2456437.jpeg', 'https://maps.google.com/?q=Curry+36+Berlin', 52.4945, 13.3889, 1, 4.3, 12000, ARRAY['Berlin icon', 'Late night', 'Standing only', 'Kuyruk normal']),
  
  (v_yerel_id, 'Mustafa''s Gemüse Kebap', 'Legendary döner line', 'Gemüse Kebap', 'https://images.pexels.com/photos/5409011/pexels-photo-5409011.jpeg', 'https://maps.google.com/?q=Mustafa+Gemuse+Kebap+Berlin', 52.4956, 13.3956, 2, 4.5, 18000, ARRAY['2 saat kuyruk', 'Sebzeli döner', 'Worth the wait', 'Cash only']),
  
  (v_yerel_id, 'Zur Letzten Instanz', '1621''den beri, en eski', 'Eisbein', 'https://images.pexels.com/photos/1907227/pexels-photo-1907227.jpeg', 'https://maps.google.com/?q=Zur+Letzten+Instanz+Berlin', 52.5167, 13.4189, 3, 4.3, 5200, ARRAY['Napoleon yemiş', 'Historic tavern', 'Traditional German', 'Tourist trap ama otantik']),
  
  (v_yerel_id, 'Konnopke''s Imbiss', 'U-bahn altında currywurst', 'Currywurst', 'https://images.pexels.com/photos/8951425/pexels-photo-8951425.jpeg', 'https://maps.google.com/?q=Konnopke+Imbiss+Berlin', 52.5312, 13.4134, 4, 4.4, 4800, ARRAY['1930''dan beri', 'Eberswalder straße', 'Yerel favorisi', 'Ucuz']),
  
  (v_yerel_id, 'Markthalle Neun', 'Street food Thursday', 'Mixed Street Food', 'https://images.pexels.com/photos/5409010/pexels-photo-5409010.jpeg', 'https://maps.google.com/?q=Markthalle+Neun+Berlin', 52.4978, 13.4312, 5, 4.6, 8900, ARRAY['Perşembe akşamları', 'Street food market', 'Çok çeşit', 'Hipster heaven']),
  
  (v_yerel_id, 'Rogacki', 'Historic delicatessen', 'Fischbrötchen', 'https://images.pexels.com/photos/8951547/pexels-photo-8951547.jpeg', 'https://maps.google.com/?q=Rogacki+Berlin', 52.5056, 13.3156, 6, 4.5, 2400, ARRAY['1928''den beri', 'Fresh fish', 'Deli counter', 'Pazar kapalı']),
  
  (v_yerel_id, 'Henne', 'Sadece tavuk, 1907', 'Brathähnchen', 'https://images.pexels.com/photos/4518844/pexels-photo-4518844.jpeg', 'https://maps.google.com/?q=Henne+Berlin', 52.5012, 13.4156, 7, 4.4, 3200, ARRAY['Tek menü item', 'Fried chicken only', 'Beer hall', 'Rezervasyon yapın']),
  
  (v_yerel_id, 'Konditerei Buchwald', '1852 baumkuchen', 'Baumkuchen', 'https://images.pexels.com/photos/8951546/pexels-photo-8951546.jpeg', 'https://maps.google.com/?q=Buchwald+Berlin', 52.5078, 13.3389, 8, 4.6, 1200, ARRAY['Oldest konditorei', 'Tree cake specialist', 'Gift worthy', 'Cash only']),
  
  (v_yerel_id, 'Döner Kebab Hasir', 'Kreuzberg döner king', 'Döner Teller', 'https://images.pexels.com/photos/5409011/pexels-photo-5409011.jpeg', 'https://maps.google.com/?q=Hasir+Kreuzberg+Berlin', 52.4989, 13.4089, 9, 4.3, 4600, ARRAY['Turkish family run', 'Multiple locations', 'Good quality', 'Open late']),
  
  (v_yerel_id, 'Schleusenkrug', 'Biergarten classic', 'Schnitzel', 'https://images.pexels.com/photos/4518848/pexels-photo-4518848.jpeg', 'https://maps.google.com/?q=Schleusenkrug+Berlin', 52.5134, 13.3378, 10, 4.4, 3800, ARRAY['Canal side', 'Summer perfect', 'Tiergarten edge', 'Self service']),
  
  (v_yerel_id, 'Bäckerei Siebert', 'Traditional bakery', 'Berliner Pfannkuchen', 'https://images.pexels.com/photos/8951548/pexels-photo-8951548.jpeg', 'https://maps.google.com/?q=Backerei+Siebert+Berlin', 52.4723, 13.4412, 11, 4.7, 980, ARRAY['Morning fresh', 'Traditional breads', 'Local favorite', 'Closed Sunday']);
  
END $$;
