/*
  # Add website links to venues table

  1. Changes
    - Add `website_url` column to `venues` table to store venue website URLs
    - Column is optional (nullable) to allow gradual migration
    - Allows users to click through to venue websites or booking pages

  2. Notes
    - Links should be full URLs (e.g., https://www.bleecker.co.uk/)
    - Can include Google Maps links, booking sites, or official websites
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public'
    AND table_name = 'venues'
    AND column_name = 'website_url'
  ) THEN
    ALTER TABLE venues ADD COLUMN website_url text;
  END IF;
END $$;

UPDATE venues SET website_url = 'https://www.bleecker.co.uk/' WHERE name = 'Bleecker St. Burger';
UPDATE venues SET website_url = 'https://www.pattyandbun.co.uk/' WHERE name = 'Patty & Bun';
UPDATE venues SET website_url = 'https://www.honest-burgers.co.uk/' WHERE name = 'Honest Burgers';
UPDATE venues SET website_url = 'https://www.fiveguys.co.uk/' WHERE name = 'Five Guys';
UPDATE venues SET website_url = 'https://shakeshack.com/location/covent-garden-uk/' WHERE name = 'Shake Shack';
UPDATE venues SET website_url = 'https://burgerandbeyond.co.uk/' WHERE name = 'Burger & Beyond';
UPDATE venues SET website_url = 'https://www.flatironsteaks.co.uk/' WHERE name = 'Flat Iron';
UPDATE venues SET website_url = 'https://www.hawksmoor.com/' WHERE name = 'Hawksmoor';
UPDATE venues SET website_url = 'https://blacklockchophouse.com/' WHERE name = 'Blacklock';
UPDATE venues SET website_url = 'https://www.goodmanbars.com/' WHERE name = 'Goodman';
UPDATE venues SET website_url = 'https://www.gordonramsayrestaurants.com/restaurant-gordon-ramsay/' WHERE name = 'Restaurant Gordon Ramsay';
UPDATE venues SET website_url = 'https://www.the-ledbury.com/' WHERE name = 'The Ledbury';
UPDATE venues SET website_url = 'https://www.core-restaurant.co.uk/' WHERE name = 'Core by Clare Smyth';
UPDATE venues SET website_url = 'https://www.alainducasse.com/en/restaurant/alain-ducasse-dorchester' WHERE name = 'Alain Ducasse at The Dorchester';
UPDATE venues SET website_url = 'https://www.dishoom.com/' WHERE name = 'Dishoom';
UPDATE venues SET website_url = 'https://www.darjeelingexpress.com/' WHERE name = 'Darjeeling Express';
UPDATE venues SET website_url = 'https://www.gymkhana.restaurant/' WHERE name = 'Gymkhana';
UPDATE venues SET website_url = 'https://www.stjohnrestaurant.com/' WHERE name = 'St. John';
UPDATE venues SET website_url = 'https://www.pizzapilgrims.co.uk/' WHERE name = 'Pizza Pilgrims';
UPDATE venues SET website_url = 'https://www.francomanca.co.uk/' WHERE name = 'Franco Manca';
UPDATE venues SET website_url = 'https://www.santamariarestaurants.com/' WHERE name = 'Santa Maria';
UPDATE venues SET website_url = 'https://www.homeslicepizza.co.uk/' WHERE name = 'Homeslice';
UPDATE venues SET website_url = 'https://www.monmouthcoffee.co.uk/' WHERE name = 'Monmouth Coffee';
UPDATE venues SET website_url = 'https://www.workshopcoffee.com/' WHERE name = 'Workshop Coffee';
UPDATE venues SET website_url = 'https://www.prufrockcoffee.com/' WHERE name = 'Prufrock Coffee';
UPDATE venues SET website_url = 'https://www.origincoffee.co.uk/' WHERE name = 'Origin Coffee';
