/*
  # Add London Michelin-Starred Venues
  
  ## Summary
  Adds Michelin star category and 11 prestigious Michelin-starred restaurants
  
  ## Category
  - Michelin Yıldızlılar (Michelin-Starred Restaurants)
  
  ## Venues (11 total)
  Selection of 1, 2, and 3 Michelin star restaurants in London
*/

DO $$
DECLARE
  v_london_id uuid;
  v_category_id uuid;
BEGIN
  SELECT id INTO v_london_id FROM cities WHERE slug = 'londra';

  INSERT INTO food_categories (city_id, name, slug, sort_order)
  VALUES (v_london_id, 'Michelin Yıldızlılar', 'michelin', 5)
  RETURNING id INTO v_category_id;

  INSERT INTO venues (food_category_id, name, description, image, map_link, google_rating, google_review_count, sort_order) VALUES
    (
      v_category_id,
      'Restaurant Gordon Ramsay',
      '3 Michelin yıldızlı, Londra''nın en prestijli restoranlarından biri. Gordon Ramsay''in amiral gemisi.',
      'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/GordonRamsay',
      4.6,
      1200,
      1
    ),
    (
      v_category_id,
      'Alain Ducasse at The Dorchester',
      '3 Michelin yıldızlı, Fransız haute cuisine''inin doruk noktası. Lüks ve mükemmeliyet.',
      'https://images.pexels.com/photos/1126728/pexels-photo-1126728.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/AlainDucasse',
      4.5,
      850,
      2
    ),
    (
      v_category_id,
      'The Ledbury',
      '2 Michelin yıldızlı, modern Avrupa mutfağı. Yaratıcı tabaklarıyla dünya çapında ün yapmış.',
      'https://images.pexels.com/photos/696218/pexels-photo-696218.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/TheLedbury',
      4.7,
      950,
      3
    ),
    (
      v_category_id,
      'Core by Clare Smyth',
      '3 Michelin yıldızlı, İngiltere''nin en iyi şefi Clare Smyth''in restoranı. Modern İngiliz mutfağının zirvesi.',
      'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Core',
      4.8,
      780,
      4
    ),
    (
      v_category_id,
      'The Clove Club',
      '1 Michelin yıldızlı, rahat ve samimi atmosferde üst düzey mutfak deneyimi.',
      'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/CloveClub',
      4.6,
      1100,
      5
    ),
    (
      v_category_id,
      'Pollen Street Social',
      '1 Michelin yıldızlı, Jason Atherton''ın şık ve modern restoranı.',
      'https://images.pexels.com/photos/941861/pexels-photo-941861.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/PollenStreet',
      4.5,
      1600,
      6
    ),
    (
      v_category_id,
      'Sabor',
      '1 Michelin yıldızlı, otantik İspanyol mutfağı. Tapas ve deniz ürünleriyle ünlü.',
      'https://images.pexels.com/photos/1211887/pexels-photo-1211887.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Sabor',
      4.6,
      1800,
      7
    ),
    (
      v_category_id,
      'Gymkhana',
      '1 Michelin yıldızlı, modern Hint mutfağı. Sofistike tatlar ve zarif atmosfer.',
      'https://images.pexels.com/photos/1395967/pexels-photo-1395967.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Gymkhana',
      4.5,
      2100,
      8
    ),
    (
      v_category_id,
      'Sketch (The Lecture Room)',
      '2 Michelin yıldızlı, sanatsal dekorasyonu ve Fransız mutfağıyla dikkat çeken üst kat restoranı.',
      'https://images.pexels.com/photos/1126728/pexels-photo-1126728.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/SketchLecture',
      4.5,
      950,
      9
    ),
    (
      v_category_id,
      'A Wong',
      '2 Michelin yıldızlı, modern Çin mutfağı. Dim sum menüsü dünya çapında övülüyor.',
      'https://images.pexels.com/photos/769289/pexels-photo-769289.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/AWong',
      4.6,
      1400,
      10
    ),
    (
      v_category_id,
      'Ikoyi',
      '2 Michelin yıldızlı, Batı Afrika''dan ilham alan benzersiz lezzetler. Cesur ve yenilikçi.',
      'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Ikoyi',
      4.7,
      680,
      11
    );

END $$;
