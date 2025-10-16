/*
  # Add Tokyo Top 11 Fine Dining Venues

  ## Overview
  Adds the top 11 fine dining venues in Tokyo featuring world-class
  restaurants across various cuisines and styles.

  ## Venues Included
  1. Narisawa - Innovative Satoyama cuisine
  2. Florilège - Modern French-Japanese fusion
  3. L'Effervescence - Contemporary French
  4. Quintessence - Classic French excellence
  5. Den - Playful modern kaiseki
  6. Esquisse - Refined French cuisine
  7. Sugalabo - Intimate French-Japanese
  8. Crony - Creative contemporary
  9. TACUBO - Modern European-Asian
  10. Tirpse - Innovative French
  11. Restaurant Toyo - Contemporary French
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT id INTO v_category_id 
  FROM food_categories 
  WHERE city_id = '0e50a122-4556-4eab-811d-3d7967a64d41' 
    AND slug = 'fine-dining';

  INSERT INTO venues (food_category_id, name, mentor_note, reviews_summary, must_order, image, map_link, website_url, lat, lng, google_rating, google_review_count, sort_order) VALUES
  
  (v_category_id, 'Narisawa', 
   'Two Michelin stars. Innovative Satoyama cuisine celebrating Japan''s forests, seas, and villages. Chef Narisawa''s sustainable gastronomy.',
   ARRAY['Innovative and sustainable', 'Theatrical presentations', 'Deep connection to nature'],
   'Essence of the Forest tasting menu',
   'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg',
   'https://maps.google.com/?q=35.6693,139.7198',
   'https://www.narisawa-yoshihiro.com',
   35.6693, 139.7198, 4.6, 534, 1),

  (v_category_id, 'Florilège', 
   'Two Michelin stars. Modern French with Japanese ingredients. Chef Kawate''s creative, interactive open kitchen.',
   ARRAY['Open kitchen experience', 'Creative presentations', 'Excellent wine pairing'],
   'Chef''s tasting menu',
   'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg',
   'https://maps.google.com/?q=35.6645,139.7089',
   'https://www.aoyama-florilege.jp',
   35.6645, 139.7089, 4.7, 423, 2),

  (v_category_id, 'L''Effervescence', 
   'One Michelin star. Contemporary French celebrating seasonal Japanese ingredients. Natural wine focus.',
   ARRAY['Outstanding wine program', 'Seasonal ingredients', 'Elegant atmosphere'],
   'Seasonal tasting menu with wine pairing',
   'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg',
   'https://maps.google.com/?q=35.6645,139.7234',
   'https://www.leffervescence.jp',
   35.6645, 139.7234, 4.5, 387, 3),

  (v_category_id, 'Quintessence', 
   'Three Michelin stars. Classic French technique with Japanese precision. Chef Kishida''s mastery.',
   ARRAY['Three Michelin stars', 'Perfect technique', 'Intimate setting'],
   'Omakase tasting menu',
   'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg',
   'https://maps.google.com/?q=35.6534,139.7089',
   NULL,
   35.6534, 139.7089, 4.8, 298, 4),

  (v_category_id, 'Den', 
   'Two Michelin stars. Playful modern kaiseki. Chef Hasegawa''s fun, innovative approach to tradition.',
   ARRAY['Fun, interactive experience', 'Creative presentations', 'Warm hospitality'],
   'Dentucky Fried Chicken course',
   'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg',
   'https://maps.google.com/?q=35.6512,139.7123',
   'https://www.jimbocho-den.com',
   35.6512, 139.7123, 4.7, 456, 5),

  (v_category_id, 'Esquisse', 
   'One Michelin star. Refined French cuisine with Japanese soul. Elegant and intimate.',
   ARRAY['Refined French technique', 'Intimate atmosphere', 'Excellent service'],
   'Chef''s signature menu',
   'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg',
   'https://maps.google.com/?q=35.6689,139.7245',
   NULL,
   35.6689, 139.7245, 4.6, 234, 6),

  (v_category_id, 'Sugalabo', 
   'One Michelin star. Ultra-exclusive French-Japanese fusion. Only 6 seats, impeccable execution.',
   ARRAY['Ultra-intimate setting', 'Perfect execution', 'Hard to book'],
   'Omakase course',
   'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg',
   'https://maps.google.com/?q=35.6734,139.7456',
   NULL,
   35.6734, 139.7456, 4.9, 167, 7),

  (v_category_id, 'Crony', 
   'One Michelin star. Creative contemporary cuisine. Young chef''s bold, artistic vision.',
   ARRAY['Creative and artistic', 'Young talented chef', 'Intimate space'],
   'Tasting menu',
   'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg',
   'https://maps.google.com/?q=35.6556,139.7089',
   NULL,
   35.6556, 139.7089, 4.6, 189, 8),

  (v_category_id, 'TACUBO', 
   'Modern European-Asian fusion. Innovative techniques, bold flavors, stunning presentations.',
   ARRAY['Innovative fusion', 'Beautiful plating', 'Great value for quality'],
   'Seasonal tasting course',
   'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg',
   'https://maps.google.com/?q=35.6623,139.7298',
   NULL,
   35.6623, 139.7298, 4.5, 276, 9),

  (v_category_id, 'Tirpse', 
   'One Michelin star. Innovative French with Japanese ingredients. Surprising flavor combinations.',
   ARRAY['Innovative flavors', 'Surprising combinations', 'Friendly atmosphere'],
   'Chef''s creative menu',
   'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg',
   'https://maps.google.com/?q=35.6645,139.7156',
   NULL,
   35.6645, 139.7156, 4.7, 312, 10),

  (v_category_id, 'Restaurant Toyo', 
   'Contemporary French with Japanese precision. Refined flavors, elegant presentations.',
   ARRAY['Refined French cuisine', 'Elegant atmosphere', 'Excellent technique'],
   'Seasonal set menu',
   'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg',
   'https://maps.google.com/?q=35.6598,139.7234',
   NULL,
   35.6598, 139.7234, 4.6, 245, 11);

END $$;
