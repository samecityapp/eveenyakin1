/*
  # Add Tokyo Local Specialty Venues

  ## Overview
  Adds venues showcasing Tokyo and Japanese specialty dishes that visitors must try.
  Features iconic Japanese cuisine unique to Tokyo culture.

  ## Specialties Included
  1. Tsukiji Sushiko - Tsukiji market sushi
  2. Tempura Kondo - Premium tempura
  3. Tonki - Classic tonkatsu
  4. Afuri - Yuzu ramen specialty
  5. Nakiryu - Michelin-starred tantanmen
  6. Kyubey - Traditional Edo-mae sushi
  7. Sometaro - Authentic okonomiyaki
  8. Nodaiwa - Unagi (eel) specialist
  9. Uobei - Conveyor belt sushi experience
  10. Kagari - Tori paitan ramen
  11. Ippudo - Hakata-style tonkotsu ramen
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT id INTO v_category_id 
  FROM food_categories 
  WHERE city_id = '0e50a122-4556-4eab-811d-3d7967a64d41' 
    AND slug = 'local-specialties';

  INSERT INTO venues (food_category_id, name, mentor_note, reviews_summary, must_order, image, map_link, website_url, lat, lng, google_rating, google_review_count, sort_order) VALUES
  
  (v_category_id, 'Tsukiji Sushiko', 
   'Experience authentic Tsukiji market sushi. Fresh fish daily from the market, traditional edomae style.',
   ARRAY['Incredibly fresh fish', 'Traditional preparation', 'Great value'],
   'Omakase nigiri set',
   'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg',
   'https://maps.google.com/?q=35.6654,139.7709',
   NULL,
   35.6654, 139.7709, 4.5, 1834, 1),

  (v_category_id, 'Tempura Kondo', 
   'Two Michelin stars. Master tempura artistry. Seasonal vegetables and seafood perfectly fried.',
   ARRAY['Tempura perfection', 'Seasonal ingredients', 'Counter seating experience'],
   'Tempura omakase course',
   'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg',
   'https://maps.google.com/?q=35.6723,139.7645',
   NULL,
   35.6723, 139.7645, 4.7, 567, 2),

  (v_category_id, 'Tonki', 
   'Tokyo''s most famous tonkatsu. Crispy perfection since 1939. Classic Showa-era atmosphere.',
   ARRAY['Legendary tonkatsu', 'Perfect crispy coating', 'Historic atmosphere'],
   'Hire-katsu set meal',
   'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg',
   'https://maps.google.com/?q=35.6334,139.7156',
   NULL,
   35.6334, 139.7156, 4.4, 2345, 3),

  (v_category_id, 'Afuri', 
   'Signature yuzu shio ramen. Light, citrus-infused broth. Modern ramen innovation.',
   ARRAY['Unique yuzu flavor', 'Light and refreshing', 'Great char siu'],
   'Yuzu Shio Ramen',
   'https://images.pexels.com/photos/1907228/pexels-photo-1907228.jpeg',
   'https://maps.google.com/?q=35.6445,139.6987',
   'https://www.afuri.com',
   35.6445, 139.6987, 4.2, 3456, 4),

  (v_category_id, 'Nakiryu', 
   'Michelin-starred tantanmen ramen. Spicy sesame masterpiece at affordable price.',
   ARRAY['Michelin-starred ramen', 'Perfect spice level', 'Amazing value'],
   'Tantanmen',
   'https://images.pexels.com/photos/1907228/pexels-photo-1907228.jpeg',
   'https://maps.google.com/?q=35.7312,139.7234',
   NULL,
   35.7312, 139.7234, 4.3, 1567, 5),

  (v_category_id, 'Kyubey', 
   'Traditional Ginza sushi institution since 1935. Classic edomae sushi experience.',
   ARRAY['Historic sushi institution', 'Traditional style', 'Excellent quality'],
   'Omakase sushi course',
   'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg',
   'https://maps.google.com/?q=35.6712,139.7623',
   'https://www.kyubey.jp',
   35.6712, 139.7623, 4.5, 987, 6),

  (v_category_id, 'Sometaro', 
   'Authentic okonomiyaki in traditional setting. Cook your own on tableside griddle.',
   ARRAY['Fun DIY experience', 'Traditional atmosphere', 'Great value'],
   'Mix okonomiyaki',
   'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg',
   'https://maps.google.com/?q=35.7123,139.7989',
   NULL,
   35.7123, 139.7989, 4.3, 876, 7),

  (v_category_id, 'Nodaiwa', 
   'Unagi (eel) specialist since 1868. Premium grilled eel over rice in historic setting.',
   ARRAY['Historic unagi restaurant', 'Premium eel quality', 'Traditional preparation'],
   'Una-jyu (eel rice box)',
   'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg',
   'https://maps.google.com/?q=35.6467,139.7456',
   NULL,
   35.6467, 139.7456, 4.4, 734, 8),

  (v_category_id, 'Uobei Shibuya', 
   'High-tech conveyor belt sushi. Order via tablet, fresh sushi arrives via express lane.',
   ARRAY['Fun high-tech experience', 'Great value', 'Fast service'],
   'Salmon and tuna set',
   'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg',
   'https://maps.google.com/?q=35.6595,139.7005',
   'https://www.genkisushi.co.jp',
   35.6595, 139.7005, 4.1, 2876, 9),

  (v_category_id, 'Kagari', 
   'Legendary tori paitan (chicken) ramen. Rich, creamy chicken broth. Long lines worth it.',
   ARRAY['Amazing chicken broth', 'Perfect noodles', 'Worth the wait'],
   'Tori Paitan Ramen',
   'https://images.pexels.com/photos/1907228/pexels-photo-1907228.jpeg',
   'https://maps.google.com/?q=35.6734,139.7645',
   NULL,
   35.6734, 139.7645, 4.4, 1923, 10),

  (v_category_id, 'Ippudo', 
   'Hakata-style tonkotsu ramen legend. Rich pork bone broth, thin noodles. Tokyo institution.',
   ARRAY['Classic tonkotsu', 'Rich flavorful broth', 'Consistent quality'],
   'Shiromaru Classic',
   'https://images.pexels.com/photos/1907228/pexels-photo-1907228.jpeg',
   'https://maps.google.com/?q=35.6645,139.7001',
   'https://www.ippudo.com',
   35.6645, 139.7001, 4.2, 3234, 11);

END $$;
