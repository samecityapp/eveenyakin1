/*
  # Add Tokyo Top 11 Pizza Venues

  ## Overview
  Adds the top 11 pizza venues in Tokyo featuring authentic Neapolitan, Roman,
  and creative Japanese-Italian fusion pizzas.

  ## Venues Included
  1. Savoy - Tokyo's legendary Neapolitan pizza pioneer
  2. Pizza Studio Tamaki - Award-winning pizzaiolo
  3. PST Roppongi - Modern Neapolitan excellence
  4. Seirinkan - Traditional wood-fired perfection
  5. Napule - Authentic Naples-style pizza
  6. Pizza Slice - NY-style slices in Tokyo
  7. Trattoria Pizzeria Logic - Italian tradition meets Tokyo
  8. Pizzeria e Trattoria da ISA - Neighborhood favorite
  9. 800°DEGREES - Custom Neapolitan pizza
  10. Pizzeria GG - Casual Roman-style
  11. Il Tamburello - Hidden gem in Azabu
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT id INTO v_category_id 
  FROM food_categories 
  WHERE city_id = '0e50a122-4556-4eab-811d-3d7967a64d41' 
    AND slug = 'pizza';

  INSERT INTO venues (food_category_id, name, mentor_note, reviews_summary, must_order, image, map_link, website_url, lat, lng, google_rating, google_review_count, sort_order) VALUES
  
  (v_category_id, 'Savoy', 
   'Tokyo''s most legendary pizza. Since 1995, perfecting Neapolitan pizza with Japanese precision and ingredients.',
   ARRAY['Tokyo pizza institution', 'Perfect crust texture', 'Amazing tomato sauce'],
   'Marinara pizza',
   'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg',
   'https://maps.google.com/?q=35.6632,139.7025',
   NULL,
   35.6632, 139.7025, 4.5, 1834, 1),

  (v_category_id, 'Pizza Studio Tamaki', 
   'Award-winning pizzaiolo crafting exceptional Neapolitan pizza. Authentic wood-fired excellence.',
   ARRAY['Championship-level pizza', 'Premium ingredients', 'Perfect leoparding'],
   'Margherita DOC',
   'https://images.pexels.com/photos/1566837/pexels-photo-1566837.jpeg',
   'https://maps.google.com/?q=35.6983,139.7663',
   NULL,
   35.6983, 139.7663, 4.6, 892, 2),

  (v_category_id, 'PST Roppongi', 
   'Modern Neapolitan pizza with creative toppings. Stylish atmosphere, serious pizza.',
   ARRAY['Modern take on classics', 'Great ambiance', 'Excellent wine pairing'],
   'Bismarck pizza',
   'https://images.pexels.com/photos/2714722/pexels-photo-2714722.jpeg',
   'https://maps.google.com/?q=35.6627,139.7297',
   'https://www.pstroppongi.com',
   35.6627, 139.7297, 4.3, 1456, 3),

  (v_category_id, 'Seirinkan', 
   'Traditional wood-fired pizza in cozy setting. Japanese attention to detail meets Italian tradition.',
   ARRAY['Authentic wood-fired flavor', 'Cozy atmosphere', 'Consistent quality'],
   'Quattro Formaggi',
   'https://images.pexels.com/photos/1260968/pexels-photo-1260968.jpeg',
   'https://maps.google.com/?q=35.6445,139.6953',
   NULL,
   35.6445, 139.6953, 4.4, 1123, 4),

  (v_category_id, 'Napule', 
   'Certified authentic Neapolitan pizza. Ingredients imported from Naples, traditional techniques.',
   ARRAY['True Neapolitan style', 'Imported ingredients', 'Certified authentic'],
   'Diavola pizza',
   'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg',
   'https://maps.google.com/?q=35.6588,139.7003',
   'https://www.napule.jp',
   35.6588, 139.7003, 4.3, 967, 5),

  (v_category_id, 'Pizza Slice', 
   'New York-style pizza by the slice. Large, foldable slices with classic toppings.',
   ARRAY['Authentic NY-style', 'Great late-night option', 'Huge slices'],
   'Pepperoni slice',
   'https://images.pexels.com/photos/708587/pexels-photo-708587.jpeg',
   'https://maps.google.com/?q=35.6645,139.7001',
   NULL,
   35.6645, 139.7001, 4.1, 834, 6),

  (v_category_id, 'Trattoria Pizzeria Logic', 
   'Italian trattoria with exceptional pizza. Traditional recipes, quality ingredients.',
   ARRAY['Authentic Italian atmosphere', 'Great pasta too', 'Wood-fired perfection'],
   'Prosciutto e Rucola',
   'https://images.pexels.com/photos/1435903/pexels-photo-1435903.jpeg',
   'https://maps.google.com/?q=35.6754,139.7456',
   NULL,
   35.6754, 139.7456, 4.2, 756, 7),

  (v_category_id, 'Pizzeria e Trattoria da ISA', 
   'Neighborhood gem serving Roman-style pizza. Thin, crispy, loaded with flavor.',
   ARRAY['Roman-style thin crust', 'Local favorite', 'Great value'],
   'Quattro Stagioni',
   'https://images.pexels.com/photos/2714722/pexels-photo-2714722.jpeg',
   'https://maps.google.com/?q=35.6512,139.7038',
   NULL,
   35.6512, 139.7038, 4.3, 623, 8),

  (v_category_id, '800°DEGREES', 
   'Fast-casual Neapolitan pizza. Customize your pizza, 800-degree oven, 3-minute bake.',
   ARRAY['Quick service', 'Customizable options', 'Fresh ingredients'],
   'Build your own pizza',
   'https://images.pexels.com/photos/1566837/pexels-photo-1566837.jpeg',
   'https://maps.google.com/?q=35.6702,139.7636',
   'https://www.800degreespizza.jp',
   35.6702, 139.7636, 4.0, 891, 9),

  (v_category_id, 'Pizzeria GG', 
   'Casual pizzeria with Roman-style pies. No-frills, delicious, authentic.',
   ARRAY['Simple and delicious', 'Good prices', 'Friendly service'],
   'Margherita',
   'https://images.pexels.com/photos/1260968/pexels-photo-1260968.jpeg',
   'https://maps.google.com/?q=35.6423,139.6987',
   NULL,
   35.6423, 139.6987, 4.2, 534, 10),

  (v_category_id, 'Il Tamburello', 
   'Hidden Italian gem in Azabu. Excellent pizza and pasta in intimate setting.',
   ARRAY['Hidden gem', 'Intimate atmosphere', 'Authentic recipes'],
   'Capricciosa',
   'https://images.pexels.com/photos/1435903/pexels-photo-1435903.jpeg',
   'https://maps.google.com/?q=35.6556,139.7321',
   NULL,
   35.6556, 139.7321, 4.4, 467, 11);

END $$;
