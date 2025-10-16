/*
  # Add Pro Tips Feature to Categories
  
  ## Summary
  This migration adds mentor-like "pro tips" functionality to categories, transforming 
  the app from a simple brand list to a comprehensive city guide with insider advice.
  
  ## Changes Made
  
  ### 1. Schema Modifications
  - Added `pro_tips` column to `city_category_mappings` table
  - Type: `text[]` (PostgreSQL array of strings)
  - Nullable: Tips are optional for each category-city combination
  
  ### 2. Purpose
  Each tip provides valuable, location-specific advice that helps users navigate the city
  like a local. Examples:
  - "Black Cabs in London can use bus lanes, making them faster in traffic"
  - "Check Bolt and FREENOW when Uber has surge pricing"
  - "Evening supermarket discounts can reach 50% on items nearing expiration"
  
  ## Important Notes
  - Tips are stored at the mapping level (city + category combination)
  - Different cities can have different tips for the same category
  - Empty arrays are allowed for categories without tips yet
  - Tips are displayed via a modal when users click the info icon
*/

-- Add pro_tips column to city_category_mappings
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'city_category_mappings' 
    AND column_name = 'pro_tips'
  ) THEN
    ALTER TABLE city_category_mappings 
    ADD COLUMN pro_tips text[] DEFAULT '{}';
  END IF;
END $$;

-- Add sample pro tips for existing Londra data
UPDATE city_category_mappings
SET pro_tips = ARRAY[
  'Klasik siyah taksiler (Black Cab) otobüs şeritlerini kullanabildiği için trafikte daha hızlı olabilir.',
  'Yoğun saatlerde Uber''in "surge" fiyatları arttığında, mutlaka Bolt ve FREENOW uygulamalarını da kontrol et.',
  'Heathrow''dan merkeze metro (Piccadilly Line) genellikle taksiden daha hızlı ve ucuzdur.'
]
WHERE id IN (
  SELECT ccm.id
  FROM city_category_mappings ccm
  JOIN categories c ON c.id = ccm.category_id
  WHERE c.name = 'Taksi & Araç Paylaşımı'
);

UPDATE city_category_mappings
SET pro_tips = ARRAY[
  'Tesco ve Sainsbury''s''in "Meal Deal" (içecek + sandviç + atıştırmalık) teklifleri öğle yemeği için çok ekonomiktir.',
  'Akşam saatlerinde birçok süpermarket, son kullanma tarihi yaklaşan ürünlerde %50''ye varan indirimler yapar.',
  'Aldi ve Lidl, markalı ürünlere çok benzeyen kendi markalarını (own brand) çok daha ucuza satarlar.'
]
WHERE id IN (
  SELECT ccm.id
  FROM city_category_mappings ccm
  JOIN categories c ON c.id = ccm.category_id
  WHERE c.name = 'İndirim Marketleri'
);

UPDATE city_category_mappings
SET pro_tips = ARRAY[
  'Oyster Card veya contactless kartınızla günlük harcamanız belirli bir limiti geçmeyecek şekilde otomatik olarak "capping" uygulanır.',
  'Haftasonu sabahları (hafta sonu öncesi Cuma gecesinden Pazar gecesine) gece otobüsleri çok daha yoğundur.',
  'Zone 1-2 arası seyahat ediyorsanız, aylık kart yerine haftalık kart almak daha mantıklı olabilir.'
]
WHERE id IN (
  SELECT ccm.id
  FROM city_category_mappings ccm
  JOIN categories c ON c.id = ccm.category_id
  WHERE c.name = 'Toplu Taşıma Kartı'
);
