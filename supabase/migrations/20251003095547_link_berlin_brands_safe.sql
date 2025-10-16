/*
  # Link Berlin Shopping Brands Safely

  1. Updates
    - Add pro tips to all Berlin categories
    - Link German brands to Berlin categories
    - Skip brands that don't exist

  2. Notes
    - Uses IF EXISTS checks
    - Safe for missing brands
*/

DO $$
DECLARE
  v_berlin_id uuid;
  v_category_id uuid;
  v_mapping_id uuid;
  v_brand_id uuid;
BEGIN
  SELECT id INTO v_berlin_id FROM cities WHERE slug = 'berlin';

  -- İndirim Marketleri
  SELECT id INTO v_category_id FROM categories WHERE name = 'İndirim Marketleri';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm
  WHERE ccm.city_id = v_berlin_id AND ccm.category_id = v_category_id;
  
  UPDATE city_category_mappings SET pro_tips = ARRAY[
    'Almanya''da Pazar günleri süpermarketler dahil neredeyse tüm dükkanlar kapalıdır. Alışverişinizi önceden planlayın.',
    'İçecek şişeleri için "Pfand" (depozito) sistemi vardır. Boşları makineye iade ederek para iadesi alabilirsiniz.',
    'Aldi ve Lidl, Almanya''nın discount market konseptini dünyaya yaydı. Kalite/fiyat oranı mükemmel.'
  ] WHERE id = v_mapping_id;

  DELETE FROM equivalent_brands WHERE mapping_id = v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Aldi Nord';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Lidl';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Netto';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Penny';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 4);
  END IF;

  -- Süpermarketler
  SELECT id INTO v_category_id FROM categories WHERE name = 'Süpermarketler';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm
  WHERE ccm.city_id = v_berlin_id AND ccm.category_id = v_category_id;
  
  UPDATE city_category_mappings SET pro_tips = ARRAY[
    'REWE ve Edeka genelde daha kaliteli ürünler sunar, fiyatları da buna göre biraz daha yüksektir.',
    'Bio (organik) ürünler Almanya''da çok popüler ve neredeyse her markette geniş bir bölüm var.',
    'Cumartesi akşamları marketler çok kalabalık olur, Pazar için alışveriş yapılır.'
  ] WHERE id = v_mapping_id;

  DELETE FROM equivalent_brands WHERE mapping_id = v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'REWE';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Edeka';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Kaufland';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);
  END IF;

  -- Taksi & Araç Paylaşımı
  SELECT id INTO v_category_id FROM categories WHERE name = 'Taksi & Araç Paylaşımı';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm
  WHERE ccm.city_id = v_berlin_id AND ccm.category_id = v_category_id;
  
  UPDATE city_category_mappings SET pro_tips = ARRAY[
    'Berlin''de toplu taşıma çok gelişmiş ve ucuz. Taksi genelde lüks bir tercihtir.',
    'Bolt, Uber''e göre genelde daha uygun fiyatlı.',
    'Gece U-Bahn ve S-Bahn hatlarının çoğu hafta sonları 24 saat çalışır.'
  ] WHERE id = v_mapping_id;

  DELETE FROM equivalent_brands WHERE mapping_id = v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Uber';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Bolt';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'FREE NOW';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);
  END IF;

  -- Yemek Siparişi
  SELECT id INTO v_category_id FROM categories WHERE name = 'Yemek Siparişi';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm
  WHERE ccm.city_id = v_berlin_id AND ccm.category_id = v_category_id;
  
  UPDATE city_category_mappings SET pro_tips = ARRAY[
    'Lieferando, Almanya''nın en büyük yemek sipariş platformu.',
    'Wolt, genellikle daha hızlı teslimat yapıyor ve arayüzü kullanıcı dostu.',
    'Uber Eats Berlin''de de aktif ama Lieferando kadar yaygın değil.'
  ] WHERE id = v_mapping_id;

  DELETE FROM equivalent_brands WHERE mapping_id = v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Lieferando';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Wolt';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Uber Eats';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);
  END IF;

  -- Dijital Bankacılık
  SELECT id INTO v_category_id FROM categories WHERE name = 'Dijital Bankacılık';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm
  WHERE ccm.city_id = v_berlin_id AND ccm.category_id = v_category_id;
  
  UPDATE city_category_mappings SET pro_tips = ARRAY[
    'N26, Berlin merkezli dijital banka, çok hızlı hesap açma süreci.',
    'Almanya''da banka hesabı açmak için Anmeldung (ikametgah kaydı) gerekir.',
    'Geleneksel bankalar şube hizmetleri sunuyor ama dijitallere göre daha yavaş.'
  ] WHERE id = v_mapping_id;

  DELETE FROM equivalent_brands WHERE mapping_id = v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'N26';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Revolut';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Deutsche Bank';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Commerzbank';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 4);
  END IF;

  -- Mobil Operatörler
  SELECT id INTO v_category_id FROM categories WHERE name = 'Mobil Operatörler';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm
  WHERE ccm.city_id = v_berlin_id AND ccm.category_id = v_category_id;
  
  UPDATE city_category_mappings SET pro_tips = ARRAY[
    'Almanya''da kontrat olmadan SIM kart almak kolay, ama büyük paketler için kontrat daha ucuz.',
    'Telekom en iyi kapsama alanına sahip ama en pahalı.',
    'O2, genç kullanıcılar için uygun fiyatlı paketler sunuyor.'
  ] WHERE id = v_mapping_id;

  DELETE FROM equivalent_brands WHERE mapping_id = v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Telekom';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Vodafone DE';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'O2 DE';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);
  END IF;

  -- Emlak Portalları
  SELECT id INTO v_category_id FROM categories WHERE name = 'Emlak Portalları';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm
  WHERE ccm.city_id = v_berlin_id AND ccm.category_id = v_category_id;
  
  UPDATE city_category_mappings SET pro_tips = ARRAY[
    'Berlin''de ev bulmak çok zor ve rekabetçi, başvuruları hızlı yapın.',
    'WG-Gesucht, oda arkadaşlı daireler için en popüler platform.',
    'Schufa (kredi skoru) genelde istenir, yoksa kefil gerekebilir.'
  ] WHERE id = v_mapping_id;

  DELETE FROM equivalent_brands WHERE mapping_id = v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'ImmobilienScout24';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'WG-Gesucht';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  END IF;

  -- İkinci El & Seri İlan
  SELECT id INTO v_category_id FROM categories WHERE name = 'İkinci El & Seri İlan';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm
  WHERE ccm.city_id = v_berlin_id AND ccm.category_id = v_category_id;
  
  UPDATE city_category_mappings SET pro_tips = ARRAY[
    'eBay Kleinanzeigen (şimdi sadece Kleinanzeigen), Almanya''nın Sahibinden''i.',
    'Facebook Marketplace Berlin''de çok aktif.',
    'Vinted, ikinci el kıyafet alışverişi için popüler.'
  ] WHERE id = v_mapping_id;

  DELETE FROM equivalent_brands WHERE mapping_id = v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'eBay Kleinanzeigen';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Facebook Marketplace';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Vinted';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);
  END IF;

  -- Moda Pazaryerleri
  SELECT id INTO v_category_id FROM categories WHERE name = 'Moda Pazaryerleri';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm
  WHERE ccm.city_id = v_berlin_id AND ccm.category_id = v_category_id;
  
  UPDATE city_category_mappings SET pro_tips = ARRAY[
    'Zalando, Almanya''da kuruldu ve çok hızlı teslimat yapıyor.',
    'Ücretsiz iade çok yaygın, rahatça deneyip iade edebilirsiniz.'
  ] WHERE id = v_mapping_id;

  DELETE FROM equivalent_brands WHERE mapping_id = v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Zalando';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Amazon DE';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  END IF;

  -- Elektronik Mağazaları
  SELECT id INTO v_category_id FROM categories WHERE name = 'Elektronik Mağazaları';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm
  WHERE ccm.city_id = v_berlin_id AND ccm.category_id = v_category_id;
  
  UPDATE city_category_mappings SET pro_tips = ARRAY[
    'MediaMarkt ve Saturn aynı şirketin markaları, fiyatlar çok benzer.',
    'Online fiyatlar bazen mağazadan daha ucuz, karşılaştırın.',
    'Garanti (Garantie) genelde 2 yıl yasal olarak zorunlu.'
  ] WHERE id = v_mapping_id;

  DELETE FROM equivalent_brands WHERE mapping_id = v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'MediaMarkt DE';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Saturn';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  END IF;

  -- Kozmetik & Kişisel Bakım
  SELECT id INTO v_category_id FROM categories WHERE name = 'Kozmetik & Kişisel Bakım';
  SELECT ccm.id INTO v_mapping_id FROM city_category_mappings ccm
  WHERE ccm.city_id = v_berlin_id AND ccm.category_id = v_category_id;
  
  UPDATE city_category_mappings SET pro_tips = ARRAY[
    'dm ve Rossmann, Almanya''nın en büyük kozmetik zincirleri, çok uygun fiyatlı.',
    'Müller daha geniş ürün yelpazesi sunar ama biraz daha pahalı.',
    'Alman kozmetik markaları (Nivea, Sebamed vb.) çok kaliteli ve ucuz.'
  ] WHERE id = v_mapping_id;

  DELETE FROM equivalent_brands WHERE mapping_id = v_mapping_id;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'dm';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 1);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Rossmann';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 2);
  END IF;
  
  SELECT id INTO v_brand_id FROM brands WHERE name = 'Müller';
  IF v_brand_id IS NOT NULL THEN
    INSERT INTO equivalent_brands (mapping_id, brand_id, sort_order) VALUES (v_mapping_id, v_brand_id, 3);
  END IF;

END $$;
