/*
  # Add website links to brands table

  1. Changes
    - Add `website_url` column to `brands` table to store official brand website URLs
    - Column is optional (nullable) to allow gradual migration
    - Allows users to click through to brand websites

  2. Notes
    - Links should be full URLs (e.g., https://www.tesco.com/)
    - Links will open in new tabs for better UX
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public'
    AND table_name = 'brands'
    AND column_name = 'website_url'
  ) THEN
    ALTER TABLE brands ADD COLUMN website_url text;
  END IF;
END $$;

UPDATE brands SET website_url = 'https://www.tesco.com/' WHERE name = 'Tesco';
UPDATE brands SET website_url = 'https://www.sainsburys.co.uk/' WHERE name = 'Sainsbury''s';
UPDATE brands SET website_url = 'https://www.asda.com/' WHERE name = 'Asda';
UPDATE brands SET website_url = 'https://www.waitrose.com/' WHERE name = 'Waitrose';
UPDATE brands SET website_url = 'https://www.morrisons.com/' WHERE name = 'Morrisons';
UPDATE brands SET website_url = 'https://www.marksandspencer.com/' WHERE name = 'M&S Food';
UPDATE brands SET website_url = 'https://www.aldi.co.uk/' WHERE name = 'Aldi';
UPDATE brands SET website_url = 'https://www.lidl.co.uk/' WHERE name = 'Lidl';
UPDATE brands SET website_url = 'https://www.iceland.co.uk/' WHERE name = 'Iceland';
UPDATE brands SET website_url = 'https://www.poundland.co.uk/' WHERE name = 'Poundland';
UPDATE brands SET website_url = 'https://www.boots.com/' WHERE name = 'Boots';
UPDATE brands SET website_url = 'https://www.superdrug.com/' WHERE name = 'Superdrug';
UPDATE brands SET website_url = 'https://www.spacenk.com/' WHERE name = 'Space NK';
UPDATE brands SET website_url = 'https://www.sephora.co.uk/' WHERE name = 'Sephora UK';
UPDATE brands SET website_url = 'https://www.currys.co.uk/' WHERE name = 'Currys';
UPDATE brands SET website_url = 'https://www.argos.co.uk/' WHERE name = 'Argos';
UPDATE brands SET website_url = 'https://www.johnlewis.com/' WHERE name = 'John Lewis';
UPDATE brands SET website_url = 'https://www.amazon.co.uk/' WHERE name = 'Amazon UK';
UPDATE brands SET website_url = 'https://www.uber.com/gb/en/' WHERE name = 'Uber';
UPDATE brands SET website_url = 'https://bolt.eu/en-gb/' WHERE name = 'Bolt';
UPDATE brands SET website_url = 'https://www.free-now.com/uk/' WHERE name = 'FREE NOW';
UPDATE brands SET website_url = 'https://gett.com/uk/' WHERE name = 'Gett';
UPDATE brands SET website_url = 'https://www.deliveroo.co.uk/' WHERE name = 'Deliveroo';
UPDATE brands SET website_url = 'https://www.ubereats.com/gb' WHERE name = 'Uber Eats';
UPDATE brands SET website_url = 'https://www.just-eat.co.uk/' WHERE name = 'Just Eat';
UPDATE brands SET website_url = 'https://zapp.co.uk/' WHERE name = 'Zapp';
UPDATE brands SET website_url = 'https://www.getir.com/en-gb/' WHERE name = 'Getir';
UPDATE brands SET website_url = 'https://gorillas.io/en' WHERE name = 'Gorillas';
UPDATE brands SET website_url = 'https://www.rightmove.co.uk/' WHERE name = 'Rightmove';
UPDATE brands SET website_url = 'https://www.zoopla.co.uk/' WHERE name = 'Zoopla';
UPDATE brands SET website_url = 'https://www.gumtree.com/' WHERE name = 'Gumtree';
UPDATE brands SET website_url = 'https://www.facebook.com/marketplace/' WHERE name = 'Facebook Marketplace';
UPDATE brands SET website_url = 'https://www.ebay.co.uk/' WHERE name = 'eBay UK';
UPDATE brands SET website_url = 'https://www.vinted.co.uk/' WHERE name = 'Vinted';
UPDATE brands SET website_url = 'https://www.depop.com/' WHERE name = 'Depop';
UPDATE brands SET website_url = 'https://www.shpock.com/' WHERE name = 'Shpock';
UPDATE brands SET website_url = 'https://www.revolut.com/' WHERE name = 'Revolut';
UPDATE brands SET website_url = 'https://monzo.com/' WHERE name = 'Monzo';
UPDATE brands SET website_url = 'https://www.starlingbank.com/' WHERE name = 'Starling Bank';
UPDATE brands SET website_url = 'https://www.ee.co.uk/' WHERE name = 'EE';
UPDATE brands SET website_url = 'https://www.vodafone.co.uk/' WHERE name = 'Vodafone UK';
UPDATE brands SET website_url = 'https://www.o2.co.uk/' WHERE name = 'O2';
UPDATE brands SET website_url = 'https://www.three.co.uk/' WHERE name = 'Three';
UPDATE brands SET website_url = 'https://www.giffgaff.com/' WHERE name = 'giffgaff';

UPDATE brands SET website_url = 'https://www.migros.com.tr/' WHERE name = 'Migros';
UPDATE brands SET website_url = 'https://www.carrefoursa.com/' WHERE name = 'CarrefourSA';
UPDATE brands SET website_url = 'https://www.sok.com.tr/' WHERE name = 'ŞOK';
UPDATE brands SET website_url = 'https://www.bim.com.tr/' WHERE name = 'BİM';
UPDATE brands SET website_url = 'https://www.a101.com.tr/' WHERE name = 'A101';
UPDATE brands SET website_url = 'https://www.gratis.com/' WHERE name = 'Gratis';
UPDATE brands SET website_url = 'https://www.watsons.com.tr/' WHERE name = 'Watsons';
UPDATE brands SET website_url = 'https://www.sephora.com.tr/' WHERE name = 'Sephora TR';
UPDATE brands SET website_url = 'https://www.mediamarkt.com.tr/' WHERE name = 'MediaMarkt';
UPDATE brands SET website_url = 'https://www.teknosa.com/' WHERE name = 'Teknosa';
UPDATE brands SET website_url = 'https://www.vatanbilgisayar.com/' WHERE name = 'Vatan Bilgisayar';
UPDATE brands SET website_url = 'https://www.trendyol.com/' WHERE name = 'Trendyol';
UPDATE brands SET website_url = 'https://www.hepsiburada.com/' WHERE name = 'Hepsiburada';
UPDATE brands SET website_url = 'https://www.bitaksi.com/' WHERE name = 'BiTaksi';
UPDATE brands SET website_url = 'https://www.uber.com/tr/tr/' WHERE name = 'Uber TR';
UPDATE brands SET website_url = 'https://www.marti.tech/' WHERE name = 'Martı';
UPDATE brands SET website_url = 'https://www.getir.com/' WHERE name = 'Getir TR';
UPDATE brands SET website_url = 'https://www.yemeksepeti.com/' WHERE name = 'Yemeksepeti';
UPDATE brands SET website_url = 'https://www.trendyolyemek.com/' WHERE name = 'Trendyol Yemek';
UPDATE brands SET website_url = 'https://www.sahibinden.com/' WHERE name = 'Sahibinden';
UPDATE brands SET website_url = 'https://www.hepsiemlak.com/' WHERE name = 'Hepsiemlak';
UPDATE brands SET website_url = 'https://www.emlakjet.com/' WHERE name = 'Emlakjet';
UPDATE brands SET website_url = 'https://www.dolap.com/' WHERE name = 'Dolap';
UPDATE brands SET website_url = 'https://www.gardrops.com/' WHERE name = 'Gardrops';
UPDATE brands SET website_url = 'https://www.papara.com/' WHERE name = 'Papara';
UPDATE brands SET website_url = 'https://www.enpara.com/' WHERE name = 'Enpara';
UPDATE brands SET website_url = 'https://www.turkcell.com.tr/' WHERE name = 'Turkcell';
UPDATE brands SET website_url = 'https://www.turktelekom.com.tr/' WHERE name = 'Türk Telekom';
UPDATE brands SET website_url = 'https://www.vodafone.com.tr/' WHERE name = 'Vodafone TR';
