/*
  # Kadıköy İlçesi ve Gurme Kategorileri

  1. Kadıköy İlçesi
    - İstanbul'un en canlı ilçelerinden
    - Yeme-içme kültürünün kalbi
    
  2. Gurme Kategorileri
    - En İyi Kahveciler (Coffee)
    - En İyi Hamburgerciler (Burger)
    - En İyi Pizzacılar (Pizza)
    - En İyi Esnaf Lokantaları (ChefHat)
    - En İyi Meyhaneler (Wine)
    - En Güzel Kafeler (Coffee)
*/

-- Kadıköy ilçesini ekle
DO $$
DECLARE
  v_istanbul_city_id uuid;
  v_kadikoy_district_id uuid;
BEGIN
  -- İstanbul'un ID'sini al
  SELECT id INTO v_istanbul_city_id FROM cities WHERE slug = 'istanbul';
  
  IF v_istanbul_city_id IS NOT NULL THEN
    -- Kadıköy'ü ekle
    INSERT INTO districts (
      name,
      slug,
      city_id,
      description,
      created_at
    )
    VALUES (
      'Kadıköy',
      'kadikoy',
      v_istanbul_city_id,
      'İstanbul''un Anadolu yakasının en canlı ve renkli ilçesi. Cafe, restoran ve meyhane kültürünün kalbi.',
      now()
    )
    RETURNING id INTO v_kadikoy_district_id;
    
    -- Gurme kategorilerini ekle
    INSERT INTO district_food_categories (district_id, category_name, category_slug, category_icon, display_order)
    VALUES
      (v_kadikoy_district_id, 'En İyi Kahveciler', 'kahve', 'Coffee', 1),
      (v_kadikoy_district_id, 'En İyi Hamburgerciler', 'hamburger', 'Beef', 2),
      (v_kadikoy_district_id, 'En İyi Pizzacılar', 'pizza', 'Pizza', 3),
      (v_kadikoy_district_id, 'En İyi Esnaf Lokantaları', 'esnaf-lokantasi', 'ChefHat', 4),
      (v_kadikoy_district_id, 'En İyi Meyhaneler', 'meyhane', 'Wine', 5),
      (v_kadikoy_district_id, 'En Güzel Kafeler', 'kafe', 'Coffee', 6);
  END IF;
END $$;