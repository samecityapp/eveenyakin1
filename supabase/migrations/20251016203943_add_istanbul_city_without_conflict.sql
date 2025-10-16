/*
  # İstanbul Şehri Ekleme

  1. İstanbul Şehri
    - Türkiye'nin en büyük şehri
    - İlçe bazlı gurme rehberi sistemi ile çalışacak

  2. Türk Markaları Bağlantısı
    - İstanbul için turkish_category_brands tablosundan bağlantı kurulacak
    - 12 standart kategori

  3. Tasarım
    - Kırmızı arka plan (İstanbul'un enerjisi)
*/

-- İstanbul şehrini ekle
INSERT INTO cities (
  name, 
  slug, 
  country, 
  image, 
  bg_color, 
  icon_names, 
  icon_color,
  created_at
)
SELECT 
  'İstanbul',
  'istanbul',
  'Türkiye',
  '/cities/istanbul.jpg',
  '#dc2626',
  ARRAY['Landmark', 'Ship', 'Utensils', 'Coffee', 'MapPin'],
  '#fef2f2',
  now()
WHERE NOT EXISTS (SELECT 1 FROM cities WHERE slug = 'istanbul');

-- Kategorileri bağla
DO $$
DECLARE
  v_istanbul_city_id uuid;
  category_rec RECORD;
BEGIN
  SELECT id INTO v_istanbul_city_id FROM cities WHERE slug = 'istanbul';
  
  IF v_istanbul_city_id IS NOT NULL THEN
    FOR category_rec IN 
      SELECT id FROM categories ORDER BY name
    LOOP
      IF NOT EXISTS (
        SELECT 1 FROM city_category_mappings 
        WHERE city_id = v_istanbul_city_id AND category_id = category_rec.id
      ) THEN
        INSERT INTO city_category_mappings (city_id, category_id)
        VALUES (v_istanbul_city_id, category_rec.id);
      END IF;
    END LOOP;
  END IF;
END $$;

-- Türk markalarını bağla
DO $$
DECLARE
  v_istanbul_city_id uuid;
  turkish_brand_rec RECORD;
  v_mapping_id uuid;
BEGIN
  SELECT id INTO v_istanbul_city_id FROM cities WHERE slug = 'istanbul';
  
  IF v_istanbul_city_id IS NOT NULL THEN
    FOR turkish_brand_rec IN 
      SELECT tcb.brand_id, tcb.category_id, tcb.sort_order
      FROM turkish_category_brands tcb
      ORDER BY tcb.sort_order
    LOOP
      SELECT ccm.id INTO v_mapping_id
      FROM city_category_mappings ccm
      WHERE ccm.city_id = v_istanbul_city_id 
        AND ccm.category_id = turkish_brand_rec.category_id;
      
      IF v_mapping_id IS NOT NULL THEN
        IF NOT EXISTS (
          SELECT 1 FROM equivalent_brands 
          WHERE mapping_id = v_mapping_id AND brand_id = turkish_brand_rec.brand_id
        ) THEN
          INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
          VALUES (v_mapping_id, turkish_brand_rec.brand_id, turkish_brand_rec.sort_order);
        END IF;
      END IF;
    END LOOP;
  END IF;
END $$;