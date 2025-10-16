/*
  # Add Berlin Brands

  1. New Brands
    - German shopping brands
    - All include website URLs
    - Logos where available

  2. Notes
    - Just adding brands, linking comes next
*/

INSERT INTO brands (name, logo_url, website_url) VALUES
  ('Aldi Nord', '/logos/aldi.svg', 'https://www.aldi-nord.de/'),
  ('Netto', NULL, 'https://www.netto-online.de/'),
  ('Penny', NULL, 'https://www.penny.de/'),
  ('REWE', NULL, 'https://www.rewe.de/'),
  ('Edeka', NULL, 'https://www.edeka.de/'),
  ('Kaufland', NULL, 'https://www.kaufland.de/'),
  ('Lieferando', NULL, 'https://www.lieferando.de/'),
  ('Wolt', NULL, 'https://wolt.com/de'),
  ('N26', NULL, 'https://n26.com/'),
  ('Deutsche Bank', NULL, 'https://www.deutsche-bank.de/'),
  ('Commerzbank', NULL, 'https://www.commerzbank.de/'),
  ('Telekom', NULL, 'https://www.telekom.de/'),
  ('Vodafone DE', '/logos/vodafone-uk.svg', 'https://www.vodafone.de/'),
  ('O2 DE', '/logos/o2.svg', 'https://www.o2online.de/'),
  ('ImmobilienScout24', NULL, 'https://www.immobilienscout24.de/'),
  ('WG-Gesucht', NULL, 'https://www.wg-gesucht.de/'),
  ('eBay Kleinanzeigen', NULL, 'https://www.kleinanzeigen.de/'),
  ('Zalando', NULL, 'https://www.zalando.de/'),
  ('Amazon DE', '/logos/amazon-uk.svg', 'https://www.amazon.de/'),
  ('MediaMarkt DE', '/logos/mediamarkt.svg', 'https://www.mediamarkt.de/'),
  ('Saturn', NULL, 'https://www.saturn.de/'),
  ('dm', NULL, 'https://www.dm.de/'),
  ('Rossmann', NULL, 'https://www.rossmann.de/'),
  ('Müller', NULL, 'https://www.mueller.de/')
ON CONFLICT (name) DO UPDATE SET
  website_url = EXCLUDED.website_url,
  logo_url = COALESCE(EXCLUDED.logo_url, brands.logo_url);
