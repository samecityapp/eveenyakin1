/*
  # Replace Paris Food Categories with Standard Structure
  
  Replace Paris-specific categories with standard 6 categories
*/

DO $$
DECLARE
  v_city_id uuid;
BEGIN
  SELECT id INTO v_city_id FROM cities WHERE slug = 'paris';
  
  -- Delete old venues and categories
  DELETE FROM venues WHERE food_category_id IN (
    SELECT id FROM food_categories WHERE city_id = v_city_id
  );
  DELETE FROM food_categories WHERE city_id = v_city_id;
  
  -- Insert new standard categories
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order) VALUES
  (v_city_id, 'En İyi Hamburger', 'hamburger', 'UtensilsCrossed', 1),
  (v_city_id, 'En İyi Pizza', 'pizza', 'Pizza', 2),
  (v_city_id, 'En İyi Kahve', 'kahve', 'Coffee', 3),
  (v_city_id, 'En Güzel Kafeler', 'kafe', 'Store', 4),
  (v_city_id, 'Michelin Yıldızlılar', 'michelin', 'Star', 5),
  (v_city_id, 'Paris''e Özel Lezzetler', 'yerel-lezzetler', 'Grape', 6);
  
END $$;
