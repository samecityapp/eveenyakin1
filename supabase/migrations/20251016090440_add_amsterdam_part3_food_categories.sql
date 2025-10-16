/*
  # Amsterdam - Bölüm 3: Gurme Kategorileri

  6 gurme kategorisi ekleniyor:
    1. En iyi hamburgerciler
    2. En iyi pizzacılar  
    3. En iyi kahveciler
    4. En güzel kafeler
    5. En İyi Patates Kızartması
    6. O şehre özel lezzetler
*/

INSERT INTO food_categories (city_id, name, slug, icon, sort_order)
SELECT 
  (SELECT id FROM cities WHERE slug = 'amsterdam'),
  cat_name,
  cat_slug,
  cat_icon,
  cat_order
FROM (VALUES
  ('En iyi hamburgerciler', 'hamburger', 'Beef', 1),
  ('En iyi pizzacılar', 'pizza', 'Pizza', 2),
  ('En iyi kahveciler', 'kahve', 'Coffee', 3),
  ('En güzel kafeler', 'kafe', 'Building', 4),
  ('En İyi Patates Kızartması', 'patates', 'UtensilsCrossed', 5),
  ('O şehre özel lezzetler', 'yerel-lezzetler', 'Grape', 6)
) AS cats(cat_name, cat_slug, cat_icon, cat_order)
ON CONFLICT (city_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  icon = EXCLUDED.icon,
  sort_order = EXCLUDED.sort_order;
