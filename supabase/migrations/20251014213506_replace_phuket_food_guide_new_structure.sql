/*
  # Replace Phuket Food Guide with New Structure
  
  1. Remove old categories and venues
  2. Add 6 new categories: Hamburger, Pizza, Kahve, Yerel Lezzetler, Manzaralı Barlar, Deniz Ürünleri
  3. Each category will have 11 venues
*/

DO $$
DECLARE
  v_city_id uuid;
BEGIN
  -- Get Phuket city ID
  SELECT id INTO v_city_id FROM cities WHERE slug = 'phuket';
  
  -- Delete old venues and categories
  DELETE FROM venues WHERE food_category_id IN (
    SELECT id FROM food_categories WHERE city_id = v_city_id
  );
  DELETE FROM food_categories WHERE city_id = v_city_id;
  
  -- Insert new categories
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order) VALUES
  (v_city_id, 'En İyi Hamburger', 'hamburger', 'UtensilsCrossed', 1),
  (v_city_id, 'En İyi Pizza', 'pizza', 'Pizza', 2),
  (v_city_id, 'En İyi Kahve ve Kafe', 'kahve-kafe', 'Coffee', 3),
  (v_city_id, 'Phuket''e Özel Lezzetler', 'yerel-lezzetler', 'Fish', 4),
  (v_city_id, 'En İyi Manzaralı Barlar', 'manzarali-barlar', 'Wine', 5),
  (v_city_id, 'En İyi Deniz Ürünleri', 'deniz-urunleri', 'Fish', 6);
  
END $$;
