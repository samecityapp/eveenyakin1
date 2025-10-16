/*
  # Amsterdam - Bölüm 2: Kategori Bağlantıları (Düzeltilmiş)

  1. Kategori Bağlantıları
    - 12 standart pratik kategori Amsterdam'a bağlanıyor
    - Her kategori için mentor notları ve pro tips
*/

-- İndirim Marketleri
INSERT INTO city_category_mappings (city_id, category_id, mentor_note, pro_tips)
SELECT 
  (SELECT id FROM cities WHERE slug = 'amsterdam'),
  (SELECT id FROM categories WHERE name = 'İndirim Marketleri'),
  'Lidl ve Aldi, Avrupa genelinde olduğu gibi burada da en bütçe dostu seçeneklerdir. Kaliteli ürünleri uygun fiyata sunarlar.',
  ARRAY['Pazar günleri birçok süpermarket ya kapalıdır ya da daha kısa saatlerde çalışır, planınızı ona göre yapın.', 'Nakit yerine "PIN" adı verilen yerel banka kartları (Maestro/V PAY) daha yaygındır, bazı küçük marketler kredi kartı kabul etmeyebilir.']
ON CONFLICT (city_id, category_id) DO UPDATE SET
  mentor_note = EXCLUDED.mentor_note,
  pro_tips = EXCLUDED.pro_tips;

INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
SELECT 
  (SELECT id FROM city_category_mappings WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND category_id = (SELECT id FROM categories WHERE name = 'İndirim Marketleri')),
  id,
  ROW_NUMBER() OVER () - 1
FROM brands WHERE name IN ('Lidl NL', 'Aldi NL')
ON CONFLICT DO NOTHING;

-- Süpermarketler
INSERT INTO city_category_mappings (city_id, category_id, mentor_note)
SELECT 
  (SELECT id FROM cities WHERE slug = 'amsterdam'),
  (SELECT id FROM categories WHERE name = 'Süpermarketler'),
  'Albert Heijn (genellikle AH olarak kısaltılır), ülkenin en yaygın ve popüler süpermarketidir. Macro Center''ın karşılığı ise organik ve gurme ürünlere odaklanan Marqt''tır.'
ON CONFLICT (city_id, category_id) DO UPDATE SET mentor_note = EXCLUDED.mentor_note;

INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
SELECT 
  (SELECT id FROM city_category_mappings WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND category_id = (SELECT id FROM categories WHERE name = 'Süpermarketler')),
  id,
  ROW_NUMBER() OVER () - 1
FROM brands WHERE name IN ('Albert Heijn', 'Jumbo', 'Marqt')
ON CONFLICT DO NOTHING;

-- Hızlı Market Teslimatı
INSERT INTO city_category_mappings (city_id, category_id, mentor_note)
SELECT 
  (SELECT id FROM cities WHERE slug = 'amsterdam'),
  (SELECT id FROM categories WHERE name = 'Hızlı Market Teslimatı'),
  'Acil market ihtiyaçları için bu iki uygulama en hızlı çözümleri sunar.'
ON CONFLICT (city_id, category_id) DO UPDATE SET mentor_note = EXCLUDED.mentor_note;

INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
SELECT 
  (SELECT id FROM city_category_mappings WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND category_id = (SELECT id FROM categories WHERE name = 'Hızlı Market Teslimatı')),
  id,
  ROW_NUMBER() OVER () - 1
FROM brands WHERE name IN ('Flink', 'Gorillas NL')
ON CONFLICT DO NOTHING;

-- Yemek Siparişi
INSERT INTO city_category_mappings (city_id, category_id, mentor_note)
SELECT 
  (SELECT id FROM cities WHERE slug = 'amsterdam'),
  (SELECT id FROM categories WHERE name = 'Yemek Siparişi'),
  'Thuisbezorgd.nl (Just Eat''in Hollanda markası), ülkedeki en dominant ve en geniş restoran ağına sahip platformdur.'
ON CONFLICT (city_id, category_id) DO UPDATE SET mentor_note = EXCLUDED.mentor_note;

INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
SELECT 
  (SELECT id FROM city_category_mappings WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND category_id = (SELECT id FROM categories WHERE name = 'Yemek Siparişi')),
  id,
  ROW_NUMBER() OVER () - 1
FROM brands WHERE name IN ('Thuisbezorgd.nl', 'Uber Eats NL', 'Deliveroo NL')
ON CONFLICT DO NOTHING;

-- Taksi & Araç Paylaşımı
INSERT INTO city_category_mappings (city_id, category_id, mentor_note, pro_tips)
SELECT 
  (SELECT id FROM cities WHERE slug = 'amsterdam'),
  (SELECT id FROM categories WHERE name = 'Taksi & Araç Paylaşımı'),
  'Uber en popüleridir. TCA, şehrin en büyük yerel taksi şirketlerinden biridir. Ancak Amsterdam''da en hızlı ulaşım aracı genellikle bisiklet veya tramvaydır.',
  ARRAY['Bisiklet yollarında yürümeyin, bu çok tehlikelidir ve yerel halkı çok sinirlendirir.', 'Kısa mesafeler için Uber yerine yürümek veya bisiklet kiralamak genellikle daha keyifli ve hızlıdır.']
ON CONFLICT (city_id, category_id) DO UPDATE SET
  mentor_note = EXCLUDED.mentor_note,
  pro_tips = EXCLUDED.pro_tips;

INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
SELECT 
  (SELECT id FROM city_category_mappings WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND category_id = (SELECT id FROM categories WHERE name = 'Taksi & Araç Paylaşımı')),
  id,
  ROW_NUMBER() OVER () - 1
FROM brands WHERE name IN ('Uber NL', 'Bolt NL', 'TCA Taxi')
ON CONFLICT DO NOTHING;

-- Moda Pazaryerleri (E-Ticaret yerine)
INSERT INTO city_category_mappings (city_id, category_id, mentor_note, pro_tips)
SELECT 
  (SELECT id FROM cities WHERE slug = 'amsterdam'),
  (SELECT id FROM categories WHERE name = 'Moda Pazaryerleri'),
  'Bol.com, Hollanda''nın Amazon''u gibidir ve çok popülerdir. Coolblue elektronik ve ev aletlerinde öne çıkar, müşteri hizmetleri mükemmeldir.',
  ARRAY['Amazon.nl nispeten yeni açıldı ve ürün çeşitliliği Bol.com''a göre daha sınırlı olabilir.']
ON CONFLICT (city_id, category_id) DO UPDATE SET
  mentor_note = EXCLUDED.mentor_note,
  pro_tips = EXCLUDED.pro_tips;

INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
SELECT 
  (SELECT id FROM city_category_mappings WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND category_id = (SELECT id FROM categories WHERE name = 'Moda Pazaryerleri')),
  id,
  ROW_NUMBER() OVER () - 1
FROM brands WHERE name IN ('Bol.com', 'Coolblue', 'Amazon NL')
ON CONFLICT DO NOTHING;

-- İkinci El & Seri İlan
INSERT INTO city_category_mappings (city_id, category_id, mentor_note, pro_tips)
SELECT 
  (SELECT id FROM cities WHERE slug = 'amsterdam'),
  (SELECT id FROM categories WHERE name = 'İkinci El & Seri İlan'),
  'Marktplaats, Hollanda''nın en büyük ve en popüler ikinci el platformudur. Her şeyi burada bulabilirsiniz.',
  ARRAY['Marktplaats''ta dolandırıcılık olayları olabilir, yüz yüze teslimat ve ödeme tercih edin.', 'Bisiklet almak istiyorsanız, Swapfiets gibi abonelik modellerine de bakabilirsiniz.']
ON CONFLICT (city_id, category_id) DO UPDATE SET
  mentor_note = EXCLUDED.mentor_note,
  pro_tips = EXCLUDED.pro_tips;

INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
SELECT 
  (SELECT id FROM city_category_mappings WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND category_id = (SELECT id FROM categories WHERE name = 'İkinci El & Seri İlan')),
  id,
  ROW_NUMBER() OVER () - 1
FROM brands WHERE name IN ('Marktplaats', 'Vinted NL')
ON CONFLICT DO NOTHING;

-- Emlak Portalları
INSERT INTO city_category_mappings (city_id, category_id, mentor_note, pro_tips)
SELECT 
  (SELECT id FROM cities WHERE slug = 'amsterdam'),
  (SELECT id FROM categories WHERE name = 'Emlak Portalları'),
  'Funda, ev alım-satımı ve kiralama için en popüler platformdur. Pararius ve Kamernet kiralık evler için idealdir. Amsterdam''da konut bulmak çok zordur.',
  ARRAY['Amsterdam''da ev kiralamak son derece rekabetçidir, ilanlar çıktığı anda başvuru yapmalısınız.', 'Birçok ev ilanı "registratie" (nüfusa kayıt) izni vermez, dikkatli kontrol edin.', 'Kefil (guarantor) isteyebilirler ve genellikle 1-2 aylık depozito alınır.']
ON CONFLICT (city_id, category_id) DO UPDATE SET
  mentor_note = EXCLUDED.mentor_note,
  pro_tips = EXCLUDED.pro_tips;

INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
SELECT 
  (SELECT id FROM city_category_mappings WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND category_id = (SELECT id FROM categories WHERE name = 'Emlak Portalları')),
  id,
  ROW_NUMBER() OVER () - 1
FROM brands WHERE name IN ('Funda', 'Pararius', 'Kamernet')
ON CONFLICT DO NOTHING;

-- Mobil Operatörler
INSERT INTO city_category_mappings (city_id, category_id, mentor_note, pro_tips)
SELECT 
  (SELECT id FROM cities WHERE slug = 'amsterdam'),
  (SELECT id FROM categories WHERE name = 'Mobil Operatörler'),
  'KPN en büyük operatördür ancak pahalıdır. Yabancı öğrenciler ve expat''lar için Lebara gibi prepaid seçenekler daha uygun olabilir.',
  ARRAY['Hollanda''da kontrat yapmak için BSN (Burgerservicenummer - vatandaşlık numarası) gerekir.', 'Lebara, yurt dışı aramaları için çok uygun fiyatlıdır.']
ON CONFLICT (city_id, category_id) DO UPDATE SET
  mentor_note = EXCLUDED.mentor_note,
  pro_tips = EXCLUDED.pro_tips;

INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
SELECT 
  (SELECT id FROM city_category_mappings WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND category_id = (SELECT id FROM categories WHERE name = 'Mobil Operatörler')),
  id,
  ROW_NUMBER() OVER () - 1
FROM brands WHERE name IN ('KPN', 'Vodafone NL', 'T-Mobile NL', 'Lebara NL')
ON CONFLICT DO NOTHING;

-- Elektronik Mağazaları
INSERT INTO city_category_mappings (city_id, category_id, mentor_note)
SELECT 
  (SELECT id FROM cities WHERE slug = 'amsterdam'),
  (SELECT id FROM categories WHERE name = 'Elektronik Mağazaları'),
  'Coolblue, müşteri hizmetleri ve hızlı teslimatıyla çok beğenilir. MediaMarkt daha geniş fiziksel mağaza ağına sahiptir.'
ON CONFLICT (city_id, category_id) DO UPDATE SET mentor_note = EXCLUDED.mentor_note;

INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
SELECT 
  (SELECT id FROM city_category_mappings WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND category_id = (SELECT id FROM categories WHERE name = 'Elektronik Mağazaları')),
  id,
  ROW_NUMBER() OVER () - 1
FROM brands WHERE name IN ('MediaMarkt NL', 'Coolblue', 'BCC')
ON CONFLICT DO NOTHING;

-- Kozmetik & Kişisel Bakım
INSERT INTO city_category_mappings (city_id, category_id, mentor_note)
SELECT 
  (SELECT id FROM cities WHERE slug = 'amsterdam'),
  (SELECT id FROM categories WHERE name = 'Kozmetik & Kişisel Bakım'),
  'Etos ve Kruidvat uygun fiyatlı günlük ihtiyaçlar için idealdir. Douglas ve Sephora lüks markalar için tercih edilir.'
ON CONFLICT (city_id, category_id) DO UPDATE SET mentor_note = EXCLUDED.mentor_note;

INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
SELECT 
  (SELECT id FROM city_category_mappings WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND category_id = (SELECT id FROM categories WHERE name = 'Kozmetik & Kişisel Bakım')),
  id,
  ROW_NUMBER() OVER () - 1
FROM brands WHERE name IN ('Etos', 'Kruidvat', 'Douglas NL', 'Sephora NL')
ON CONFLICT DO NOTHING;

-- Dijital Bankacılık
INSERT INTO city_category_mappings (city_id, category_id, mentor_note, pro_tips)
SELECT 
  (SELECT id FROM cities WHERE slug = 'amsterdam'),
  (SELECT id FROM categories WHERE name = 'Dijital Bankacılık'),
  'ING, ABN AMRO ve Rabobank en büyük geleneksel bankalardır. Bunq dijital bankacılık için çok popülerdir ve hızlı hesap açılışı sunar. Revolut yabancı para transferleri için idealdir.',
  ARRAY['Hollanda''da banka hesabı açmak için BSN (vatandaşlık numarası) ve bir adres gereklidir.', 'Bunq, expat''lar için en kolay seçeneklerden biridir.', 'Hollanda''da nakit yerine PIN (banka kartı) her yerde kabul edilir.']
ON CONFLICT (city_id, category_id) DO UPDATE SET
  mentor_note = EXCLUDED.mentor_note,
  pro_tips = EXCLUDED.pro_tips;

INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order)
SELECT 
  (SELECT id FROM city_category_mappings WHERE city_id = (SELECT id FROM cities WHERE slug = 'amsterdam') AND category_id = (SELECT id FROM categories WHERE name = 'Dijital Bankacılık')),
  id,
  ROW_NUMBER() OVER () - 1
FROM brands WHERE name IN ('ING', 'ABN AMRO', 'Rabobank', 'Bunq', 'Revolut NL')
ON CONFLICT DO NOTHING;
