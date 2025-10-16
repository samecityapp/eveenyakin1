/*
  # Add Tokyo Top 11 Coffee Venues

  ## Overview
  Adds the top 11 coffee venues in Tokyo featuring specialty roasters,
  traditional kissaten, and modern third-wave cafes.

  ## Venues Included
  1. Onibus Coffee - Tokyo's specialty coffee pioneer
  2. Fuglen Tokyo - Norwegian roaster meets Tokyo
  3. Streamer Coffee Company - Latte art champions
  4. Blue Bottle Coffee - Omotesando flagship
  5. Café de l'Ambre - Historic kissaten since 1948
  6. Bear Pond Espresso - Espresso perfectionists
  7. Glitch Coffee - Science meets craft
  8. About Life Coffee Brewers - Award-winning roastery
  9. Turret Coffee - Specialty coffee excellence
  10. Little Nap Coffee Stand - Cozy neighborhood spot
  11. Koffee Mameya - Coffee temple experience
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT id INTO v_category_id 
  FROM food_categories 
  WHERE city_id = '0e50a122-4556-4eab-811d-3d7967a64d41' 
    AND slug = 'coffee';

  INSERT INTO venues (food_category_id, name, mentor_note, reviews_summary, must_order, image, map_link, website_url, lat, lng, google_rating, google_review_count, sort_order) VALUES
  
  (v_category_id, 'Onibus Coffee', 
   'Tokyo''s specialty coffee pioneer. Exceptional single-origin beans, expert brewing, welcoming atmosphere.',
   ARRAY['Outstanding coffee quality', 'Knowledgeable baristas', 'Multiple locations'],
   'Single origin pour-over',
   'https://images.pexels.com/photos/1595385/pexels-photo-1595385.jpeg',
   'https://maps.google.com/?q=35.6439,139.6682',
   'https://www.onibuscoffee.com',
   35.6439, 139.6682, 4.5, 2134, 1),

  (v_category_id, 'Fuglen Tokyo', 
   'Norwegian vintage meets Tokyo coffee culture. Specialty roaster with stunning retro interior.',
   ARRAY['Beautiful vintage interior', 'Excellent espresso', 'Cocktails at night'],
   'Flat white',
   'https://images.pexels.com/photos/1251175/pexels-photo-1251175.jpeg',
   'https://maps.google.com/?q=35.6651,139.6998',
   'https://www.fuglen.com/tokyo',
   35.6651, 139.6998, 4.4, 1876, 2),

  (v_category_id, 'Streamer Coffee Company', 
   'World latte art champions. Perfectly crafted espresso drinks with impressive latte art.',
   ARRAY['Amazing latte art', 'Great espresso', 'Stylish space'],
   'Latte with latte art',
   'https://images.pexels.com/photos/1251175/pexels-photo-1251175.jpeg',
   'https://maps.google.com/?q=35.6643,139.7008',
   'https://www.streamercoffee.com',
   35.6643, 139.7008, 4.3, 1654, 3),

  (v_category_id, 'Blue Bottle Coffee Omotesando', 
   'Blue Bottle''s stunning Omotesando flagship. California coffee culture in Tokyo.',
   ARRAY['Beautiful architecture', 'Consistent quality', 'Great iced coffee'],
   'New Orleans iced coffee',
   'https://images.pexels.com/photos/1595385/pexels-photo-1595385.jpeg',
   'https://maps.google.com/?q=35.6655,139.7103',
   'https://www.bluebottlecoffee.jp',
   35.6655, 139.7103, 4.2, 2543, 4),

  (v_category_id, 'Café de l''Ambre', 
   'Historic kissaten since 1948. Old-school coffee mastery, aged beans, timeless atmosphere.',
   ARRAY['Historic atmosphere', 'Unique aged coffee', 'Old Tokyo charm'],
   'Aged coffee blend',
   'https://images.pexels.com/photos/1251175/pexels-photo-1251175.jpeg',
   'https://maps.google.com/?q=35.6713,139.7642',
   NULL,
   35.6713, 139.7642, 4.4, 987, 5),

  (v_category_id, 'Bear Pond Espresso', 
   'Espresso perfectionist. Katsu-san''s meticulous approach to espresso extraction.',
   ARRAY['Exceptional espresso', 'Master roaster', 'Intimate setting'],
   'Dirty espresso',
   'https://images.pexels.com/photos/1595385/pexels-photo-1595385.jpeg',
   'https://maps.google.com/?q=35.6599,139.6685',
   NULL,
   35.6599, 139.6685, 4.6, 823, 6),

  (v_category_id, 'Glitch Coffee', 
   'Scientific precision meets craft coffee. Data-driven brewing, exceptional results.',
   ARRAY['Precise brewing methods', 'Unique approach', 'Educational experience'],
   'Pour-over tasting flight',
   'https://images.pexels.com/photos/1251175/pexels-photo-1251175.jpeg',
   'https://maps.google.com/?q=35.6723,139.7568',
   'https://www.glitchcoffee.com',
   35.6723, 139.7568, 4.5, 1234, 7),

  (v_category_id, 'About Life Coffee Brewers', 
   'Award-winning specialty roastery. Clean, bright, expertly roasted beans.',
   ARRAY['Award-winning roaster', 'Bright, clean flavors', 'Welcoming atmosphere'],
   'Ethiopia natural process',
   'https://images.pexels.com/photos/1595385/pexels-photo-1595385.jpeg',
   'https://maps.google.com/?q=35.6592,139.6987',
   'https://www.aboutlifecoffee.com',
   35.6592, 139.6987, 4.4, 967, 8),

  (v_category_id, 'Turret Coffee', 
   'Specialty coffee with excellent food. Great all-day cafe for coffee and meals.',
   ARRAY['Great food menu', 'Excellent coffee', 'All-day dining'],
   'Cappuccino with breakfast',
   'https://images.pexels.com/photos/1251175/pexels-photo-1251175.jpeg',
   'https://maps.google.com/?q=35.6734,139.7089',
   NULL,
   35.6734, 139.7089, 4.3, 876, 9),

  (v_category_id, 'Little Nap Coffee Stand', 
   'Cozy neighborhood coffee stand. Quality beans, friendly vibes, local favorite.',
   ARRAY['Neighborhood gem', 'Friendly staff', 'Great value'],
   'Cafe latte',
   'https://images.pexels.com/photos/1595385/pexels-photo-1595385.jpeg',
   'https://maps.google.com/?q=35.6612,139.6945',
   NULL,
   35.6612, 139.6945, 4.5, 734, 10),

  (v_category_id, 'Koffee Mameya', 
   'Coffee temple experience. Premium beans, expert guidance, coffee education.',
   ARRAY['Unique coffee experience', 'Expert knowledge', 'Premium beans'],
   'Barista''s choice pour-over',
   'https://images.pexels.com/photos/1251175/pexels-photo-1251175.jpeg',
   'https://maps.google.com/?q=35.6658,139.7089',
   'https://www.koffee-mameya.com',
   35.6658, 139.7089, 4.6, 1456, 11);

END $$;
