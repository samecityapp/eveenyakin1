/*
  # Add Tokyo Michelin Starred Venues

  ## Overview
  Adds notable Michelin-starred restaurants in Tokyo across various cuisines.
  Tokyo has the most Michelin stars in the world - featuring iconic establishments.

  ## Venues Included
  1. Sukiyabashi Jiro - Three-star sushi legend
  2. Kanda - Three-star kaiseki master
  3. Sushi Saito - Three-star sushi perfection
  4. Joël Robuchon - Three-star French
  5. Ishikawa - Three-star kaiseki
  6. Azabu Kadowaki - Three-star kaiseki
  7. Kohaku - Three-star kaiseki
  8. Sushi Yoshitake - Three-star sushi
  9. Makimura - Two-star kaiseki
  10. Ryugin - Three-star innovative Japanese
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT id INTO v_category_id 
  FROM food_categories 
  WHERE city_id = '0e50a122-4556-4eab-811d-3d7967a64d41' 
    AND slug = 'michelin';

  INSERT INTO venues (food_category_id, name, mentor_note, reviews_summary, must_order, image, map_link, website_url, lat, lng, google_rating, google_review_count, sort_order) VALUES
  
  (v_category_id, 'Sukiyabashi Jiro', 
   'Three Michelin stars. World''s most famous sushi restaurant. Jiro Ono''s legendary edomae sushi mastery.',
   ARRAY['Ultimate sushi experience', 'Living legend Jiro-san', 'Perfection in every piece'],
   'Omakase sushi course',
   'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg',
   'https://maps.google.com/?q=35.6712,139.7645',
   NULL,
   35.6712, 139.7645, 4.8, 892, 1),

  (v_category_id, 'Kanda', 
   'Three Michelin stars. Master kaiseki chef Kanda''s refined seasonal Japanese cuisine.',
   ARRAY['Refined kaiseki perfection', 'Seasonal ingredients', 'Impeccable technique'],
   'Kaiseki omakase',
   'https://images.pexels.com/photos/1148086/pexels-photo-1148086.jpeg',
   'https://maps.google.com/?q=35.6934,139.7656',
   NULL,
   35.6934, 139.7656, 4.7, 234, 2),

  (v_category_id, 'Sushi Saito', 
   'Three Michelin stars. Extraordinary edomae sushi. Perfection in simplicity and technique.',
   ARRAY['World-class sushi', 'Perfect rice', 'Exceptional fish quality'],
   'Omakase sushi course',
   'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg',
   'https://maps.google.com/?q=35.6645,139.7289',
   NULL,
   35.6645, 139.7289, 4.9, 167, 3),

  (v_category_id, 'Joël Robuchon', 
   'Three Michelin stars. Late master''s Tokyo flagship. French haute cuisine excellence.',
   ARRAY['French haute cuisine', 'Elegant atmosphere', 'Impeccable service'],
   'Le Menu Dégustation',
   'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg',
   'https://maps.google.com/?q=35.6654,139.7298',
   'https://www.robuchon.jp',
   35.6654, 139.7298, 4.7, 456, 4),

  (v_category_id, 'Ishikawa', 
   'Three Michelin stars. Master kaiseki in intimate 8-seat setting. Seasonal perfection.',
   ARRAY['Intimate kaiseki experience', 'Seasonal mastery', 'Personal attention'],
   'Seasonal kaiseki course',
   'https://images.pexels.com/photos/1148086/pexels-photo-1148086.jpeg',
   'https://maps.google.com/?q=35.6723,139.7456',
   NULL,
   35.6723, 139.7456, 4.8, 198, 5),

  (v_category_id, 'Azabu Kadowaki', 
   'Three Michelin stars. Refined kaiseki with creative touches. Intimate counter seating.',
   ARRAY['Creative kaiseki', 'Intimate setting', 'Exceptional hospitality'],
   'Chef''s kaiseki omakase',
   'https://images.pexels.com/photos/1148086/pexels-photo-1148086.jpeg',
   'https://maps.google.com/?q=35.6556,139.7298',
   NULL,
   35.6556, 139.7298, 4.8, 176, 6),

  (v_category_id, 'Kohaku', 
   'Three Michelin stars. Modern kaiseki with artistic presentations. Chef Kojima''s vision.',
   ARRAY['Artistic presentations', 'Modern kaiseki approach', 'Beautiful ceramics'],
   'Seasonal kaiseki menu',
   'https://images.pexels.com/photos/1148086/pexels-photo-1148086.jpeg',
   'https://maps.google.com/?q=35.6689,139.7456',
   NULL,
   35.6689, 139.7456, 4.7, 145, 7),

  (v_category_id, 'Sushi Yoshitake', 
   'Three Michelin stars. Intimate 7-seat sushi counter. Exceptional edomae sushi.',
   ARRAY['Intimate sushi experience', 'Perfect execution', 'Premium ingredients'],
   'Omakase sushi',
   'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg',
   'https://maps.google.com/?q=35.6723,139.7567',
   NULL,
   35.6723, 139.7567, 4.9, 134, 8),

  (v_category_id, 'Makimura', 
   'Two Michelin stars. Inventive kaiseki with French influences. Creative seasonal cuisine.',
   ARRAY['Creative kaiseki-French fusion', 'Innovative dishes', 'Warm hospitality'],
   'Seasonal tasting menu',
   'https://images.pexels.com/photos/1148086/pexels-photo-1148086.jpeg',
   'https://maps.google.com/?q=35.6612,139.7234',
   NULL,
   35.6612, 139.7234, 4.7, 187, 9),

  (v_category_id, 'Ryugin', 
   'Three Michelin stars. Innovative Japanese cuisine. Chef Seiji Yamamoto''s modern vision.',
   ARRAY['Innovative Japanese', 'Modern techniques', 'Theatrical presentations'],
   'Omakase tasting menu',
   'https://images.pexels.com/photos/1148086/pexels-photo-1148086.jpeg',
   'https://maps.google.com/?q=35.6654,139.7289',
   'https://www.nihonryori-ryugin.com',
   35.6654, 139.7289, 4.8, 298, 10);

END $$;
