/*
  # Add Paris Food Categories

  1. New Categories
    - En İyi Fırınlar (Boulangerie)
    - En İyi Kahveciler
    - Klasik Fransız Bistroları
    - En İyi Crêpe'ciler
    - Michelin Yıldızlılar
    - Paris'in Meşhur Lezzetleri

  2. Notes
    - Creates 6 food categories for Paris
    - Matches London/Berlin structure
*/

DO $$
DECLARE
  v_paris_id uuid;
BEGIN
  SELECT id INTO v_paris_id FROM cities WHERE slug = 'paris';

  INSERT INTO food_categories (city_id, name, slug, icon, sort_order) VALUES
    (v_paris_id, 'En İyi Fırınlar (Boulangerie)', 'firin', 'Croissant', 1),
    (v_paris_id, 'En İyi Kahveciler', 'kahve', 'Coffee', 2),
    (v_paris_id, 'Klasik Fransız Bistroları', 'bistro', 'UtensilsCrossed', 3),
    (v_paris_id, 'En İyi Crêpe''ciler', 'crepe', 'Pizza', 4),
    (v_paris_id, 'Michelin Yıldızlılar', 'michelin', 'Star', 5),
    (v_paris_id, 'Paris''in Meşhur Lezzetleri', 'yerel-lezzetler', 'Grape', 6);

END $$;
