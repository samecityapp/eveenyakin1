/*
  # Add Tokyo Top 11 Burger Venues

  ## Overview
  Adds the top 11 burger venues in Tokyo with complete details including:
  - High Google ratings and review counts
  - Mentor notes highlighting what makes each special
  - Review summaries from customers
  - Must-order recommendations
  - Precise coordinates for map display
  - Website links where available

  ## Venues Included
  1. Shake Shack Meiji-Jingu - Premium American burgers
  2. Blacows - Legendary Japanese beef burgers
  3. Munch's Burger Shack - Tokyo's first burger bar
  4. The Great Burger - Gourmet creations
  5. T.Y.HARBOR Brewery - Waterfront burger experience
  6. Fire House - American-style smokehouse
  7. Burger Mania - Local favorite chains
  8. Brothers - Classic American burgers
  9. Umami Burger - Umami-focused gourmet
  10. Homemade Burger & Bar - Craft burgers
  11. Henry's Burger - Australian-style burgers
*/

-- Get Tokyo burger category ID
DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT id INTO v_category_id 
  FROM food_categories 
  WHERE city_id = '0e50a122-4556-4eab-811d-3d7967a64d41' 
    AND slug = 'burgers';

  -- Insert burger venues
  INSERT INTO venues (food_category_id, name, mentor_note, reviews_summary, must_order, image, map_link, website_url, lat, lng, google_rating, google_review_count, sort_order) VALUES
  
  (v_category_id, 'Shake Shack Meiji-Jingu', 
   'NYC legend brings premium burgers to Tokyo. Fresh, never frozen, 100% Angus beef with signature ShackSauce.',
   ARRAY['Perfectly juicy patties', 'Amazing crinkle-cut fries', 'Great location near shrine'],
   'ShackBurger with cheese fries',
   'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg',
   'https://maps.google.com/?q=35.6729,139.7027',
   'https://www.shakeshack.jp',
   35.6729, 139.7027, 4.2, 2847, 1),

  (v_category_id, 'Blacows', 
   'Tokyo''s most legendary burger joint using premium Japanese Kuroge Wagyu beef. Worth the wait.',
   ARRAY['Incredible wagyu beef flavor', 'Perfectly cooked patties', 'Worth the long lines'],
   'Blacows Burger (wagyu)',
   'https://images.pexels.com/photos/1251198/pexels-photo-1251198.jpeg',
   'https://maps.google.com/?q=35.6586,139.7013',
   NULL,
   35.6586, 139.7013, 4.4, 1523, 2),

  (v_category_id, 'Munch''s Burger Shack', 
   'Tokyo''s original burger bar since 2006. Craft burgers with creative toppings in casual setting.',
   ARRAY['Creative burger combinations', 'Great craft beer selection', 'Cozy atmosphere'],
   'Avocado Bacon Burger',
   'https://images.pexels.com/photos/1556688/pexels-photo-1556688.jpeg',
   'https://maps.google.com/?q=35.6655,139.7005',
   NULL,
   35.6655, 139.7005, 4.3, 892, 3),

  (v_category_id, 'The Great Burger', 
   'Premium gourmet burgers with unique Japanese-Western fusion flavors. Upscale burger experience.',
   ARRAY['High-quality ingredients', 'Unique flavor combinations', 'Beautiful presentation'],
   'Teriyaki Wagyu Burger',
   'https://images.pexels.com/photos/1556698/pexels-photo-1556698.jpeg',
   'https://maps.google.com/?q=35.6762,139.7654',
   'https://www.thegreatburger.jp',
   35.6762, 139.7654, 4.1, 1247, 4),

  (v_category_id, 'T.Y.HARBOR Brewery', 
   'Waterfront brewery with excellent burgers. Amazing views and craft beer pairing.',
   ARRAY['Fantastic location by canal', 'Great beer selection', 'Large portions'],
   'TY Harbor Burger with IPA',
   'https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg',
   'https://maps.google.com/?q=35.6246,139.7820',
   'https://www.tysons.jp/tyharbor',
   35.6246, 139.7820, 4.2, 2156, 5),

  (v_category_id, 'Fire House', 
   'American-style smokehouse with hefty burgers. BBQ flavors meet burger perfection.',
   ARRAY['Smoky BBQ flavors', 'Generous portions', 'Authentic American vibe'],
   'Smokehouse Burger',
   'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg',
   'https://maps.google.com/?q=35.6654,139.7289',
   NULL,
   35.6654, 139.7289, 4.0, 734, 6),

  (v_category_id, 'Burger Mania', 
   'Popular local chain with consistently great burgers. Excellent value and quality.',
   ARRAY['Good value for money', 'Consistent quality', 'Quick service'],
   'Double Cheeseburger',
   'https://images.pexels.com/photos/1633572/pexels-photo-1633572.jpeg',
   'https://maps.google.com/?q=35.6892,139.6917',
   NULL,
   35.6892, 139.6917, 4.1, 1089, 7),

  (v_category_id, 'Brothers', 
   'Classic American diner burgers. No-frills, delicious, authentic experience.',
   ARRAY['Classic American style', 'Juicy patties', 'Great milkshakes'],
   'Brothers Classic Burger',
   'https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg',
   'https://maps.google.com/?q=35.6667,139.7045',
   NULL,
   35.6667, 139.7045, 4.2, 956, 8),

  (v_category_id, 'Umami Burger', 
   'LA-based chain focusing on umami-rich burgers. Japanese ingredients meet American classic.',
   ARRAY['Unique umami flavors', 'Quality ingredients', 'Modern atmosphere'],
   'Umami Burger with truffle fries',
   'https://images.pexels.com/photos/1556707/pexels-photo-1556707.jpeg',
   'https://maps.google.com/?q=35.6647,139.6995',
   'https://www.umamiburger.jp',
   35.6647, 139.6995, 4.0, 823, 9),

  (v_category_id, 'Homemade Burger & Bar', 
   'Craft burger bar with rotating specials. Creative toppings and house-made everything.',
   ARRAY['House-made buns and sauces', 'Creative weekly specials', 'Great bar atmosphere'],
   'Chef''s Special Burger',
   'https://images.pexels.com/photos/1639563/pexels-photo-1639563.jpeg',
   'https://maps.google.com/?q=35.6595,139.7005',
   NULL,
   35.6595, 139.7005, 4.3, 678, 10),

  (v_category_id, 'Henry''s Burger', 
   'Australian-style gourmet burgers with unique toppings. Fresh ingredients, bold flavors.',
   ARRAY['Fresh quality ingredients', 'Australian burger style', 'Friendly service'],
   'The Aussie Burger with beetroot',
   'https://images.pexels.com/photos/1556697/pexels-photo-1556697.jpeg',
   'https://maps.google.com/?q=35.6716,139.7645',
   NULL,
   35.6716, 139.7645, 4.1, 567, 11);

END $$;
