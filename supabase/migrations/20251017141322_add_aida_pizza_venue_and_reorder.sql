/*
  # Aida - vino e cucina Ekleme ve Sıralama Güncelleme

  1. Yeni Mekan
    - Aida - vino e cucina (4.7 puan)
    - Şarap barı + gurme pizza
    - Moda, 5. sırada eklenecek

  2. Sıralama Güncellemesi
    - Aida 5. sıraya eklenince
    - La Petite Maison ve sonraki mekanlar 1 sıra aşağı kayacak
*/

-- Önce 5. sıradan sonraki tüm mekanların sırasını 1 artır
UPDATE district_venues 
SET display_order = display_order + 1
WHERE district_category_id = '62407f8a-acfd-41e9-8880-241ad87c39c4'
  AND display_order >= 5;

-- Şimdi Aida'yı 5. sıraya ekle
INSERT INTO district_venues (
  district_category_id,
  name,
  mentor_note,
  must_order,
  mentor_tricks,
  image,
  link,
  latitude,
  longitude,
  google_rating,
  google_review_count,
  display_order,
  neighborhood_slug,
  deep_dive_note
) VALUES (
  '62407f8a-acfd-41e9-8880-241ad87c39c4',
  'Aida - vino e cucina',
  'Aslında bir şarap barı, ama odun fırınından çıkan gurme pizzaları şehrin en iyileri arasında. Romantik bir akşam için ideal.',
  'Prosciutto Crudo Pizza',
  ARRAY[
    'Geniş ve özenle seçilmiş bir şarap kavları var, pizzanıza uygun bir şarap tavsiyesi istemekten çekinmeyin.',
    'Atmosferi çok şık ve rafine, özel bir buluşma için harika bir seçenek.',
    'Pizzaların yanı sıra peynir ve şarküteri tabakları da çok başarılıdır.'
  ],
  'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg',
  'https://maps.google.com/?q=Aida+vino+e+cucina+Moda',
  40.983,
  29.032,
  4.7,
  500,
  5,
  'moda',
  'Aida, pizza ve şarabın evliliğini kutlayan bir yer. Her pizza, yanındaki şarapla mükemmel armoni yaratacak şekilde tasarlanmış. Bu sadece yemek değil, bir İtalyan dolce vita deneyimi.'
);
