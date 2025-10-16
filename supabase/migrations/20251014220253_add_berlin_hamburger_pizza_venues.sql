/*
  # Add Berlin Hamburger and Pizza Venues
  
  22 venues (11 burger + 11 pizza)
*/

DO $$
DECLARE
  v_burger_id uuid;
  v_pizza_id uuid;
BEGIN
  SELECT id INTO v_burger_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'berlin') AND slug = 'hamburger';
  SELECT id INTO v_pizza_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'berlin') AND slug = 'pizza';
  
  -- HAMBURGER
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_burger_id, 'Burgermeister', 'Eski tuvalette burger, Berlin efsanesi', 'Meisterburger', 'https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg', 'https://maps.google.com/?q=Burgermeister+Berlin', 52.5008, 13.4189, 1, 4.4, 8500, ARRAY['Schlesisches Tor metro altında', 'Gece 3''e kadar açık', 'Club çıkışı ideal', 'Nakit only']),
  
  (v_burger_id, 'The Bird', 'New York tarzı, dev porsiyonlar', 'The Phat Bird', 'https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg', 'https://maps.google.com/?q=The+Bird+Berlin', 52.5289, 13.4015, 2, 4.5, 3200, ARRAY['Amerikan barbekü soslu', 'Onion rings efsane', 'Prenzlauer Berg''de', 'Craft beer seçimi']),
  
  (v_burger_id, 'Tommi''s Burger Joint', 'İzlanda zinciri, basit ama mükemmel', 'Cheeseburger', 'https://images.pexels.com/photos/3738730/pexels-photo-3738730.jpeg', 'https://maps.google.com/?q=Tommi+Burger+Berlin', 52.5245, 13.4023, 3, 4.3, 2100, ARRAY['No frills concept', 'Çok ucuz', 'Hızlı servis', 'Minimalist']),
  
  (v_burger_id, 'Schillerburger', 'Neukölln''ün favorisi', 'Schillerburger Classic', 'https://images.pexels.com/photos/1556688/pexels-photo-1556688.jpeg', 'https://maps.google.com/?q=Schillerburger+Berlin', 52.4823, 13.4289, 4, 4.6, 1800, ARRAY['Yerel vibe', 'Organik malzeme', 'Sweet potato fries', 'Vegan burger harika']),
  
  (v_burger_id, 'Kreuzburger', 'Kreuzberg klasiği', 'Kreuzburger Special', 'https://images.pexels.com/photos/1624487/pexels-photo-1624487.jpeg', 'https://maps.google.com/?q=Kreuzburger+Berlin', 52.4956, 13.4267, 5, 4.4, 2600, ARRAY['Late night açık', 'Alkol lisansı var', 'Hipster crowd', 'Outdoor seating']),
  
  (v_burger_id, 'Shiso Burger', 'Asyalı fusion burger', 'Tokyo Burger', 'https://images.pexels.com/photos/3738748/pexels-photo-3738748.jpeg', 'https://maps.google.com/?q=Shiso+Burger+Berlin', 52.5212, 13.4089, 6, 4.5, 1900, ARRAY['Japonca tatlar', 'Bao bun seçeneği', 'Edamame side', 'Matcha shake']),
  
  (v_burger_id, 'Brooklyn Burger Bar', 'Mitte''de Amerikan diner', 'BBB Special', 'https://images.pexels.com/photos/1633525/pexels-photo-1633525.jpeg', 'https://maps.google.com/?q=Brooklyn+Burger+Bar+Berlin', 52.5267, 13.3923, 7, 4.2, 2800, ARRAY['Tourist friendly', 'English menü', 'Brunch yapıyorlar', 'Central location']),
  
  (v_burger_id, 'Max und Moritz', 'Traditional Berlin + burger', 'Berliner Burger', 'https://images.pexels.com/photos/580612/pexels-photo-580612.jpeg', 'https://maps.google.com/?q=Max+und+Moritz+Berlin', 52.5023, 13.4267, 8, 4.3, 3400, ARRAY['1902''den beri', 'Tarihi pub', 'Alman yemekleri de', 'Beer garden']),
  
  (v_burger_id, 'Balanced', 'Sağlıklı burger konsepti', 'Protein Burger', 'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg', 'https://maps.google.com/?q=Balanced+Berlin', 52.5289, 13.4134, 9, 4.4, 1200, ARRAY['Fitness focus', 'Protein power bowl', 'Keto friendly', 'Clean eating']),
  
  (v_burger_id, 'Fräulein Burger', 'Local Berlin chain', 'Fräulein Special', 'https://images.pexels.com/photos/1556698/pexels-photo-1556698.jpeg', 'https://maps.google.com/?q=Fraulein+Burger+Berlin', 52.5178, 13.3889, 10, 4.3, 1600, ARRAY['Birkaç şube', 'Consistent quality', 'Good value', 'Delivery yapıyor']),
  
  (v_burger_id, 'Jim Block', 'Hamburg zinciri, fast casual', 'Block House Burger', 'https://images.pexels.com/photos/2983101/pexels-photo-2983101.jpeg', 'https://maps.google.com/?q=Jim+Block+Berlin', 52.5067, 13.3289, 11, 4.1, 2200, ARRAY['Hızlı yemek', 'Train station''larda', 'Standart kalite', '24 saat bazı şubeler']);
  
  -- PIZZA
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_pizza_id, 'Zola', 'Neapolitan pizza, odun fırını', 'Margherita Verace', 'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg', 'https://maps.google.com/?q=Zola+Pizza+Berlin', 52.5312, 13.4123, 1, 4.7, 2800, ARRAY['Napoli sertifikalı', 'Rezervasyon şart', 'Natural wine', 'Hamur perfect']),
  
  (v_pizza_id, 'Standard Pizza', 'Prenzlauer Berg favorisi', 'Diavola', 'https://images.pexels.com/photos/803963/pexels-photo-803963.jpeg', 'https://maps.google.com/?q=Standard+Pizza+Berlin', 52.5389, 13.4156, 2, 4.6, 3200, ARRAY['Long fermentation', 'Craft beer pairing', 'Industrial chic', 'Weekend brunch']),
  
  (v_pizza_id, 'Malafemmena', 'Otantik Napoli', 'Marinara', 'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg', 'https://maps.google.com/?q=Malafemmena+Berlin', 52.5278, 13.4012, 3, 4.8, 1600, ARRAY['İtalyan sahip', 'Çok otantik', 'Küçük yer', 'Erken gidin']),
  
  (v_pizza_id, 'W Pizza', 'Berlin sourdough pizza', 'Truffle Funghi', 'https://images.pexels.com/photos/1146760/pexels-photo-1146760.jpeg', 'https://maps.google.com/?q=W+Pizza+Berlin', 52.5089, 13.4512, 4, 4.5, 2100, ARRAY['Sourdough hamur', 'Creative toppings', 'Trendy Friedrichshain', 'Good wine list']),
  
  (v_pizza_id, 'Il Ritrovo', 'Italian trattoria', 'Quattro Formaggi', 'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg', 'https://maps.google.com/?q=Il+Ritrovo+Berlin', 52.4923, 13.4378, 5, 4.4, 1800, ARRAY['Family run', 'Pasta da güzel', 'Neighborhood gem', 'Affordable']),
  
  (v_pizza_id, 'Stranero', 'Modern Italian', 'Burrata Pizza', 'https://images.pexels.com/photos/803963/pexels-photo-803963.jpeg', 'https://maps.google.com/?q=Stranero+Berlin', 52.5245, 13.4089, 6, 4.6, 2400, ARRAY['Aperitivo hour', 'Chic atmosphere', 'Date night perfect', 'Cocktail bar']),
  
  (v_pizza_id, 'Masaniello', 'Neukölln Italian', 'Capricciosa', 'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg', 'https://maps.google.com/?q=Masaniello+Berlin', 52.4767, 13.4389, 7, 4.5, 1400, ARRAY['Yerel favorisi', 'Good prices', 'Friendly staff', 'Cash only']),
  
  (v_pizza_id, 'Mani in Pasta', 'Traditional Italian', 'Pizza Romana', 'https://images.pexels.com/photos/1146760/pexels-photo-1146760.jpeg', 'https://maps.google.com/?q=Mani+in+Pasta+Berlin', 52.5189, 13.4623, 8, 4.4, 1600, ARRAY['Thin crust', 'Roman style', 'Homemade pasta', 'Desserts great']),
  
  (v_pizza_id, 'Santa Maria', 'Wood fired specialist', 'Prosciutto e Funghi', 'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg', 'https://maps.google.com/?q=Santa+Maria+Berlin', 52.5312, 13.3978, 9, 4.5, 1900, ARRAY['Big portions', 'Outdoor seating', 'Family friendly', 'Takeaway available']),
  
  (v_pizza_id, 'A Magica', 'Kreuzberg Italian', 'Vegetariana', 'https://images.pexels.com/photos/803963/pexels-photo-803963.jpeg', 'https://maps.google.com/?q=A+Magica+Berlin', 52.4989, 13.4156, 10, 4.3, 1200, ARRAY['Vegan options', 'Organic focus', 'Canal view', 'Relaxed vibe']),
  
  (v_pizza_id, 'Due Amici', 'Charlottenburg classic', 'Calzone', 'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg', 'https://maps.google.com/?q=Due+Amici+Berlin', 52.5067, 13.3156, 11, 4.4, 2600, ARRAY['West Berlin', 'Traditional spot', 'Good for groups', 'Lunch specials']);
  
END $$;
