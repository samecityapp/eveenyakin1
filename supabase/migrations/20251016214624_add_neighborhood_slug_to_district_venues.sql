/*
  # Mahalle Bazlı Filtreleme Sistemi

  1. Yeni Alan
    - `district_venues` tablosuna `neighborhood_slug` alanı ekleniyor
    - Mahalle bazlı filtreleme için kullanılacak

  2. Değişiklikler
    - Her venue artık bir mahalleye ait olacak
    - Kullanıcılar "Moda", "Yeldeğirmeni", "Kadıköy Merkez" gibi filtreleyebilecek

  3. Örnek Mahalleler (Kadıköy için)
    - moda (Moda)
    - yeldegirmeni (Yeldeğirmeni)
    - kadikoy-merkez (Kadıköy Merkez - Çarşı)
*/

-- Neighborhood slug alanını ekle
ALTER TABLE district_venues
ADD COLUMN IF NOT EXISTS neighborhood_slug text;

-- Index ekle (filtreleme performansı için)
CREATE INDEX IF NOT EXISTS idx_district_venues_neighborhood 
ON district_venues(neighborhood_slug);

-- Kadıköy kahvecilerine mahalle bilgilerini ekle
UPDATE district_venues
SET neighborhood_slug = CASE
  WHEN name = 'Montag Coffee Roasters' THEN 'moda'
  WHEN name = 'Walter''s Coffee Roastery' THEN 'moda'
  WHEN name = 'Story Coffee Roasting' THEN 'yeldegirmeni'
  WHEN name = 'RAF' THEN 'kadikoy-merkez'
  WHEN name = 'Coffee Manifesto' THEN 'moda'
  WHEN name = 'Drip Coffeeist' THEN 'yeldegirmeni'
  WHEN name = 'Çekirdek' THEN 'moda'
  WHEN name = 'Fahriye Cafe' THEN 'moda'
  WHEN name = 'Brekkie Croissant & Cookie' THEN 'moda'
  WHEN name = 'Benazio Coffee' THEN 'kadikoy-merkez'
  WHEN name = 'Heim' THEN 'yeldegirmeni'
  ELSE neighborhood_slug
END
WHERE district_category_id IN (
  SELECT id FROM district_food_categories 
  WHERE category_slug = 'kahve'
);
