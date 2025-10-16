/*
  # Add Roma Food Categories and Venues
  
  6 categories x 11 venues = 66 venues total
*/

DO $$
DECLARE
  v_city_id uuid;
  v_burger_id uuid;
  v_pizza_id uuid;
  v_kahve_id uuid;
  v_kafe_id uuid;
  v_michelin_id uuid;
  v_yerel_id uuid;
BEGIN
  SELECT id INTO v_city_id FROM cities WHERE slug = 'roma';
  
  -- Create categories
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order) VALUES
  (v_city_id, 'En İyi Hamburger', 'hamburger', 'UtensilsCrossed', 1),
  (v_city_id, 'En İyi Pizza', 'pizza', 'Pizza', 2),
  (v_city_id, 'En İyi Kahve', 'kahve', 'Coffee', 3),
  (v_city_id, 'En Güzel Kafeler', 'kafe', 'Store', 4),
  (v_city_id, 'Michelin Yıldızlılar', 'michelin', 'Star', 5),
  (v_city_id, 'Roma''ya Özel Lezzetler', 'yerel-lezzetler', 'Grape', 6);
  
  SELECT id INTO v_burger_id FROM food_categories WHERE city_id = v_city_id AND slug = 'hamburger';
  SELECT id INTO v_pizza_id FROM food_categories WHERE city_id = v_city_id AND slug = 'pizza';
  SELECT id INTO v_kahve_id FROM food_categories WHERE city_id = v_city_id AND slug = 'kahve';
  SELECT id INTO v_kafe_id FROM food_categories WHERE city_id = v_city_id AND slug = 'kafe';
  SELECT id INTO v_michelin_id FROM food_categories WHERE city_id = v_city_id AND slug = 'michelin';
  SELECT id INTO v_yerel_id FROM food_categories WHERE city_id = v_city_id AND slug = 'yerel-lezzetler';
  
  -- HAMBURGER
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_burger_id, '180g Burger', 'Roma''nın burger kralı', 'Classic 180g', 'https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg', 'https://maps.google.com/?q=180g+Burger+Rome', 41.9028, 12.4964, 1, 4.5, 3200, ARRAY['İtalyan kalite eti', 'Tüm soslar ev yapımı', 'Craft beer seçimi', 'Rezervasyon öneriliir']),
  
  (v_burger_id, 'My Burger', 'Testaccio''da gourmet', 'My Special', 'https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg', 'https://maps.google.com/?q=My+Burger+Rome', 41.8767, 12.4767, 2, 4.4, 2800, ARRAY['Organik malzeme', 'Vegan seçenekler', 'Sweet potato fries', 'Yerel mahalle']),
  
  (v_burger_id, 'Burgez', 'Roma burger zinciri', 'Burgez Classic', 'https://images.pexels.com/photos/3738730/pexels-photo-3738730.jpeg', 'https://maps.google.com/?q=Burgez+Rome', 41.8902, 12.4923, 3, 4.3, 4100, ARRAY['Birçok şube', 'Hızlı servis', 'Good value', 'Delivery yapıyor']),
  
  (v_burger_id, 'Goa', 'Fusion burger bar', 'Goa Burger', 'https://images.pexels.com/photos/1556688/pexels-photo-1556688.jpeg', 'https://maps.google.com/?q=Goa+Rome', 41.8956, 12.4823, 4, 4.5, 1800, ARRAY['Asian fusion', 'Cocktail bar', 'Late night', 'Hipster vibe']),
  
  (v_burger_id, 'Hard Rock Cafe', 'Classic Amerikan', 'Legendary Burger', 'https://images.pexels.com/photos/1624487/pexels-photo-1624487.jpeg', 'https://maps.google.com/?q=Hard+Rock+Cafe+Rome', 41.9009, 12.4833, 5, 4.2, 8900, ARRAY['Via Veneto', 'Tourist friendly', 'Rock memorabilia', 'Big portions']),
  
  (v_burger_id, 'PastaRito', 'Mexican-Italian fusion', 'Border Burger', 'https://images.pexels.com/photos/3738748/pexels-photo-3738748.jpeg', 'https://maps.google.com/?q=PastaRito+Rome', 41.9089, 12.4756, 6, 4.3, 1600, ARRAY['Unique concept', 'Guacamole yapıyorlar', 'Fun atmosphere', 'Good cocktails']),
  
  (v_burger_id, 'Buddy', 'American diner style', 'Buddy Special', 'https://images.pexels.com/photos/1633525/pexels-photo-1633525.jpeg', 'https://maps.google.com/?q=Buddy+Rome', 41.9145, 12.4823, 7, 4.4, 2200, ARRAY['Milkshakes harika', 'Retro decor', 'Family friendly', 'Brunch yapıyorlar']),
  
  (v_burger_id, 'Bun Burgers', 'Prati neighborhood', 'Double Bun', 'https://images.pexels.com/photos/580612/pexels-photo-580612.jpeg', 'https://maps.google.com/?q=Bun+Burgers+Rome', 41.9067, 12.4589, 8, 4.3, 1400, ARRAY['Local spot', 'Good prices', 'Nice staff', 'Outdoor seating']),
  
  (v_burger_id, 'Cotti in Fragranza', 'Bakery + burger', 'Fresh Bun Burger', 'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg', 'https://maps.google.com/?q=Cotti+in+Fragranza+Rome', 41.8923, 12.4889, 9, 4.5, 980, ARRAY['Fresh baked buns', 'Bakery quality', 'Breakfast too', 'Small space']),
  
  (v_burger_id, 'Birreria Peroni', 'Historic brewery', 'Peroni Burger', 'https://images.pexels.com/photos/1556698/pexels-photo-1556698.jpeg', 'https://maps.google.com/?q=Birreria+Peroni+Rome', 41.9028, 12.4856, 10, 4.2, 3400, ARRAY['Beer pairing', 'Historic place', 'Italian style', 'Central location']),
  
  (v_burger_id, 'Mama Eat', 'Modern Roman', 'Mama Burger', 'https://images.pexels.com/photos/2983101/pexels-photo-2983101.jpeg', 'https://maps.google.com/?q=Mama+Eat+Rome', 41.8834, 12.4923, 11, 4.4, 1200, ARRAY['Trastevere location', 'Trendy crowd', 'Good atmosphere', 'Weekend busy']);
  
  -- PIZZA
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_pizza_id, 'Pizzarium Bonci', 'Pizza''nın Michelangelo''su', 'Any Slice', 'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg', 'https://maps.google.com/?q=Pizzarium+Bonci+Rome', 41.9067, 12.4489, 1, 4.6, 18000, ARRAY['Pizza al taglio efsane', 'Patatesli pizza deneyin', 'Standing only', 'Worth the queue']),
  
  (v_pizza_id, 'Emma Pizzeria', 'Modern Roman pizza', 'Carbonara Pizza', 'https://images.pexels.com/photos/803963/pexels-photo-803963.jpeg', 'https://maps.google.com/?q=Emma+Pizzeria+Rome', 41.8956, 12.4756, 2, 4.5, 8200, ARRAY['Creative toppings', 'Thin crust', 'Trendy atmosphere', 'Good wine list']),
  
  (v_pizza_id, 'Seu Pizza Illuminati', 'Contemporary sourdough', 'Cheese Selection Pizza', 'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg', 'https://maps.google.com/?q=Seu+Pizza+Illuminati+Rome', 41.8889, 12.4889, 3, 4.7, 5400, ARRAY['Long fermentation', 'Creative pizzas', 'Hip crowd', 'Book ahead']),
  
  (v_pizza_id, 'Forno Campo de'' Fiori', 'Historic bakery pizza', 'Pizza Bianca', 'https://images.pexels.com/photos/1146760/pexels-photo-1146760.jpeg', 'https://maps.google.com/?q=Forno+Campo+Fiori+Rome', 41.8956, 12.4723, 4, 4.4, 12000, ARRAY['Since 1972', 'Pizza bianca legendary', 'Street food style', 'Always queue']),
  
  (v_pizza_id, 'Antico Forno Roscioli', 'Bakery institution', 'Rosso Pizza', 'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg', 'https://maps.google.com/?q=Antico+Forno+Roscioli+Rome', 41.8945, 12.4712, 5, 4.5, 9800, ARRAY['Historic bakery', 'Pizza al taglio', 'Maritozzo for dessert', 'Morning fresh']),
  
  (v_pizza_id, 'Sbanco', 'Neapolitan style', 'Margherita DOC', 'https://images.pexels.com/photos/803963/pexels-photo-803963.jpeg', 'https://maps.google.com/?q=Sbanco+Rome', 41.8989, 12.5134, 6, 4.6, 3200, ARRAY['Napoli certified', 'Buffalo mozzarella', 'Good fried starters', 'Pigneto area']),
  
  (v_pizza_id, 'La Gatta Mangiona', 'Trastevere gem', 'Supplì starter', 'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg', 'https://maps.google.com/?q=La+Gatta+Mangiona+Rome', 41.8756, 12.4634, 7, 4.5, 4800, ARRAY['Local favorite', 'Roman style', 'Good desserts', 'Weekend booking']),
  
  (v_pizza_id, 'Mercato Centrale', 'Food hall pizzas', 'Various Vendors', 'https://images.pexels.com/photos/1146760/pexels-photo-1146760.jpeg', 'https://maps.google.com/?q=Mercato+Centrale+Rome', 41.9010, 12.5025, 8, 4.3, 15000, ARRAY['Termini station', 'Multiple pizza spots', 'Food court style', 'Tourist friendly']),
  
  (v_pizza_id, '180g Pizzeria', 'Same as burger spot', 'Diavola', 'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg', 'https://maps.google.com/?q=180g+Pizzeria+Rome', 41.9028, 12.4964, 9, 4.4, 2800, ARRAY['Quality ingredients', 'Good for both', 'Modern setting', 'Craft beer']),
  
  (v_pizza_id, 'Sforno', 'San Lorenzo hipster', 'Creative Pizzas', 'https://images.pexels.com/photos/803963/pexels-photo-803963.jpeg', 'https://maps.google.com/?q=Sforno+Rome', 41.8967, 12.5156, 10, 4.5, 3600, ARRAY['University area', 'Young crowd', 'Good prices', 'Late night']),
  
  (v_pizza_id, 'Dar Poeta', 'Trastevere classic', 'Nutella Calzone dessert', 'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg', 'https://maps.google.com/?q=Dar+Poeta+Rome', 41.8889, 12.4656, 11, 4.3, 11000, ARRAY['Tourist favorite', 'Always busy', 'No reservation', 'Dessert pizza must']);
  
  -- KAHVE (continuing in next migration due to size)
  
END $$;
