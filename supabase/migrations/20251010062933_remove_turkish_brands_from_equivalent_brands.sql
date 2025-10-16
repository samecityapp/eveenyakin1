/*
  # Remove Turkish Brands from Equivalent Brands

  ## Overview
  Turkish brands should ONLY appear in source_country_brands table with country_code='tr'.
  They should NOT appear in equivalent_brands table for any city.

  ## Problem
  Currently Turkish brands are incorrectly added to equivalent_brands for all cities,
  making them appear as "equivalent brands" even when the user is from Turkey viewing Tokyo.

  ## Solution
  - Delete all Turkish brand entries from equivalent_brands table
  - Keep them only in source_country_brands with country_code='tr'
  - This way Turkish brands only show when sourceCountry='tr' in the left column

  ## Turkish Brands to Remove
  All brands specific to Turkey market including:
  - A101, BİM, File, Şok (discount stores)
  - BiTaksi, Uber TR (taxi)
  - Sahibinden.com, Letgo (classifieds)
  - Emlakjet, Hepsiemlak (real estate)
  - CarrefourSA, Macro Center, Migros (supermarkets)
  - Dolap, Gardrops (fashion marketplaces)
  - Enpara, Papara (digital banking)
  - Türk Telekom, Turkcell, Vodafone TR (mobile operators)
  - Getir, Trendyol Go (quick delivery)
  - Gratis, Watsons (cosmetics - keep Sephora as it's international)
  - MediaMarkt, Teknosa, Vatan Bilgisayar (electronics)
  - GetirYemek, Trendyol Yemek, Yemeksepeti (food delivery)
*/

-- Delete Turkish brands from equivalent_brands table
DELETE FROM equivalent_brands
WHERE brand_id IN (
  SELECT id FROM brands WHERE name IN (
    'A101',
    'BİM',
    'File',
    'Şok',
    'BiTaksi',
    'Sahibinden.com',
    'Letgo',
    'Emlakjet',
    'Hepsiemlak',
    'CarrefourSA',
    'Macro Center',
    'Migros',
    'Dolap',
    'Gardrops',
    'Enpara',
    'Papara',
    'Türk Telekom',
    'Turkcell',
    'Vodafone TR',
    'Getir',
    'Trendyol Go',
    'Gratis',
    'Teknosa',
    'Vatan Bilgisayar',
    'GetirYemek',
    'Trendyol Yemek',
    'Yemeksepeti'
  )
);

-- Note: We keep these brands in source_country_brands table where they belong
-- They will only show up when a user selects Turkey as their source country
