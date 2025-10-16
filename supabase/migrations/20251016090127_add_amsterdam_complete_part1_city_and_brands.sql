/*
  # Amsterdam Şehri - Bölüm 1: Şehir ve Markalar

  1. Şehir Ekleme
    - Amsterdam şehri (Hollanda)
  
  2. Amsterdam Markalar (40+ marka)
    - Tüm 13 kategori için yerel markalar
*/

INSERT INTO cities (name, slug, country, image)
VALUES ('Amsterdam', 'amsterdam', 'Hollanda', '/cities/amsterdam.jpg')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO brands (name, logo_url, website_url) VALUES
  ('Lidl NL', '/logos/lidl.svg', 'https://www.lidl.nl/'),
  ('Aldi NL', '/logos/aldi.svg', 'https://www.aldi.nl/'),
  ('Albert Heijn', NULL, 'https://www.ah.nl/'),
  ('Jumbo', NULL, 'https://www.jumbo.com/'),
  ('Marqt', NULL, 'https://www.marqt.nl/'),
  ('Flink', NULL, 'https://www.goflink.com/nl-NL/'),
  ('Gorillas NL', '/logos/gorillas.svg', 'https://gorillas.io/nl'),
  ('Thuisbezorgd.nl', NULL, 'https://www.thuisbezorgd.nl/'),
  ('Uber Eats NL', '/logos/uber-eats.svg', 'https://www.ubereats.com/nl'),
  ('Deliveroo NL', '/logos/deliveroo.svg', 'https://deliveroo.nl/'),
  ('Uber NL', '/logos/uber.svg', 'https://www.uber.com/nl/en/'),
  ('Bolt NL', '/logos/bolt.svg', 'https://bolt.eu/nl-nl/'),
  ('TCA Taxi', NULL, 'https://www.tcataxi.nl/'),
  ('Bol.com', NULL, 'https://www.bol.com/'),
  ('Coolblue', NULL, 'https://www.coolblue.nl/'),
  ('Amazon NL', '/logos/amazon-uk.svg', 'https://www.amazon.nl/'),
  ('Marktplaats', NULL, 'https://www.marktplaats.nl/'),
  ('Vinted NL', '/logos/vinted.svg', 'https://www.vinted.nl/'),
  ('Funda', NULL, 'https://www.funda.nl/'),
  ('Pararius', NULL, 'https://www.pararius.nl/'),
  ('Kamernet', NULL, 'https://kamernet.nl/'),
  ('KPN', NULL, 'https://www.kpn.com/'),
  ('Vodafone NL', NULL, 'https://www.vodafone.nl/'),
  ('T-Mobile NL', NULL, 'https://www.t-mobile.nl/'),
  ('Lebara NL', NULL, 'https://www.lebara.nl/'),
  ('MediaMarkt NL', '/logos/mediamarkt.svg', 'https://www.mediamarkt.nl/'),
  ('BCC', NULL, 'https://www.bcc.nl/'),
  ('Etos', NULL, 'https://www.etos.nl/'),
  ('Kruidvat', NULL, 'https://www.kruidvat.nl/'),
  ('Douglas NL', NULL, 'https://www.douglas.nl/'),
  ('Sephora NL', '/logos/sephora.svg', 'https://www.sephora.nl/'),
  ('GVB', NULL, 'https://www.gvb.nl/'),
  ('NS (Nederlandse Spoorwegen)', NULL, 'https://www.ns.nl/'),
  ('OV-chipkaart', NULL, 'https://www.ov-chipkaart.nl/'),
  ('ING', NULL, 'https://www.ing.nl/'),
  ('ABN AMRO', NULL, 'https://www.abnamro.nl/'),
  ('Rabobank', NULL, 'https://www.rabobank.nl/'),
  ('Bunq', NULL, 'https://www.bunq.com/'),
  ('Revolut NL', '/logos/revolut.svg', 'https://www.revolut.com/nl-NL/')
ON CONFLICT (name) DO UPDATE SET
  website_url = EXCLUDED.website_url,
  logo_url = COALESCE(EXCLUDED.logo_url, brands.logo_url);
