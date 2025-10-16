/*
  # Add Coordinates to London Burger Venues
  
  ## Summary
  Adds geographic coordinates (lat/lng) to all 11 burger venues in London
  
  ## Coordinates
  Approximate central London locations for each venue
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT fc.id INTO v_category_id
  FROM food_categories fc
  JOIN cities c ON c.id = fc.city_id
  WHERE c.slug = 'londra' AND fc.slug = 'hamburger';

  -- Update coordinates for all burger venues
  UPDATE venues SET lat = 51.5132, lng = -0.1223 WHERE food_category_id = v_category_id AND name = 'Bleecker St. Burger';
  UPDATE venues SET lat = 51.5163, lng = -0.1370 WHERE food_category_id = v_category_id AND name = 'Patty & Bun';
  UPDATE venues SET lat = 51.5248, lng = -0.0768 WHERE food_category_id = v_category_id AND name = 'Black Bear Burger';
  UPDATE venues SET lat = 51.5145, lng = -0.1447 WHERE food_category_id = v_category_id AND name = 'Honest Burgers';
  UPDATE venues SET lat = 51.5134, lng = -0.1276 WHERE food_category_id = v_category_id AND name = 'MEATliquor';
  UPDATE venues SET lat = 51.5055, lng = -0.0754 WHERE food_category_id = v_category_id AND name = 'Mother Flipper';
  UPDATE venues SET lat = 51.5201, lng = -0.1087 WHERE food_category_id = v_category_id AND name = 'Burger & Beyond';
  UPDATE venues SET lat = 51.5412, lng = -0.1433 WHERE food_category_id = v_category_id AND name = 'Four Legs';
  UPDATE venues SET lat = 51.5267, lng = -0.1099 WHERE food_category_id = v_category_id AND name = 'Quality Chop House';
  UPDATE venues SET lat = 51.5321, lng = -0.1250 WHERE food_category_id = v_category_id AND name = 'Dip & Flip';
  UPDATE venues SET lat = 51.4989, lng = -0.0785 WHERE food_category_id = v_category_id AND name = 'The Beefsteaks';

END $$;
