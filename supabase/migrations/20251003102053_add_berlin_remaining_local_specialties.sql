/*
  # Add Remaining Berlin Local Specialty Venues

  1. New Data
    - 8 additional local specialty venues to reach 11 total
    - Currywurst, döner, traditional German food
    - All with complete details

  2. Notes
    - Showcases Berlin's unique food culture
    - Matches London standard
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT id INTO v_category_id 
  FROM food_categories 
  WHERE city_id = (SELECT id FROM cities WHERE slug = 'berlin')
  AND slug = 'yerel-lezzetler';

  INSERT INTO venues (food_category_id, name, image, map_link, website_url, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, sort_order) VALUES
    (v_category_id, 'Konnopke''s Imbiss', 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=800', 'https://maps.google.com/?q=Konnopke+Imbiss+Berlin', 'https://www.konnopke-imbiss.de/', 52.531, 13.410, 4.3, 8500,
    'U-Bahn istasyonunun altında 1930''dan beri hizmet veren efsane currywurst mekanı.',
    ARRAY['🏛️ Berlin''in en eski currywurst noktalarından, tarihi atmosferi var.', '🌭 Geleneksel tarif, nostaljik lezzet.', '🚇 U-Bahn''ın altında yemek Berlin deneyiminin bir parçası.'],
    'Currywurst', 4),
    
    (v_category_id, 'Spätzle & Knödel @ Alpenstück', 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800', 'https://maps.google.com/?q=Alpenstück+Berlin', 'https://www.alpenstueck.de/', 52.508, 13.397, 4.4, 3200,
    'Güney Almanya ve Alp mutfağı. Geleneksel Alman yemeklerini modern yorumlarla sunuyor.',
    ARRAY['🏔️ Spätzle (Alman eriştesi) ve Knödel (köfte) muhteşem.', '🥨 Pretzel ve bira eşleştirmeleri harika.', '🎿 Dekorasyon ve atmosfer tam bir Alp evi.'],
    'Käsespätzle', 5),
    
    (v_category_id, 'Eisbein @ Zur Letzten Instanz', 'https://images.unsplash.com/photo-1432139509613-5c4255815697?w=800', 'https://maps.google.com/?q=Zur+Letzten+Instanz+Berlin', 'https://www.zurletzteninstanz.de/', 52.516, 13.418, 4.3, 2800,
    '1621''den beri açık, Berlin''in en eski restoranı. Klasik Berlin mutfağı.',
    ARRAY['🍖 Eisbein (domuz incik) Berlin''in geleneksel yemeği.', '🏛️ Tarihi bina ve atmosfer eşsiz.', '🍺 Alman biraları ve geleneksel yemekler için ideal.'],
    'Berliner Eisbein', 6),
    
    (v_category_id, 'Döner @ Imren Grill', 'https://images.unsplash.com/photo-1529006557810-274b9b2fc783?w=800', 'https://maps.google.com/?q=Imren+Grill+Berlin', 'https://www.imren.de/', 52.527, 13.368, 4.5, 6500,
    'Mustafa''nın rakibi, daha az sıra bekleyerek harika döner yiyebileceğiniz yer.',
    ARRAY['🥙 Döner kalitesi Mustafa ile yarışıyor ama sıra çok daha kısa.', '🌶️ Acı sos seçenekleri çok iyi.', '💰 Fiyat/performans oranı mükemmel.'],
    'Döner Kebap', 7),
    
    (v_category_id, 'Schnitzel @ Leibhaftig', 'https://images.unsplash.com/photo-1504718855392-c0f33b0b8527?w=800', 'https://maps.google.com/?q=Leibhaftig+Berlin', 'https://www.leibhaftig-berlin.de/', 52.535, 13.401, 4.5, 1900,
    'Berlin tarzı schnitzel ve klasik Alman yemekleri. Porsiyonlar devasa.',
    ARRAY['🍗 Schnitzel''ler çok büyük ve lezzetli.', '🥔 Patates salatası klasik Alman tarifi.', '🍻 Beer garden atmosferi var, yazın dışarıda oturmak harika.'],
    'Wiener Schnitzel', 8),
    
    (v_category_id, 'Königsberger Klopse @ Maximilians', 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=800', 'https://maps.google.com/?q=Maximilians+Berlin', 'https://www.maximilians-berlin.de/', 52.518, 13.405, 4.4, 2100,
    'Geleneksel Alman et köftesi yemeği Königsberger Klopse''nin en iyi yapıldığı yerlerden.',
    ARRAY['🥩 Köfteler kapers sosunda servis ediliyor, klasik tarif.', '🍽️ Porsiyonlar doyurucu ve otantik.', '🏛️ Mekan klasik Berlin lokantası havası veriyor.'],
    'Königsberger Klopse', 9),
    
    (v_category_id, 'Berliner Pfannkuchen @ Bäckerei Siebert', 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?w=800', 'https://maps.google.com/?q=Siebert+Bäckerei+Berlin', 'https://www.baeckerei-siebert.de/', 52.503, 13.441, 4.6, 1500,
    'Berlin''in meşhur jambonlu donut''u (aslında marmelatlı çörek) için en iyi fırınlardan.',
    ARRAY['🍩 Berliner (jelly donut) taze ve lezzetli.', '🥐 Diğer hamur işleri de çok başarılı.', '☕ Sabah kahvaltısı için harika bir durak.'],
    'Berliner Pfannkuchen', 10),
    
    (v_category_id, 'Maultaschen @ Kantine Kohlmann', 'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=800', 'https://maps.google.com/?q=Kantine+Kohlmann+Berlin', 'https://www.kantine-kohlmann.de/', 52.512, 13.42, 4.3, 1100,
    'Schwaben bölgesinin meşhur dolması Maultaschen için Berlin''deki en iyi adres.',
    ARRAY['🥟 Maultaschen (Alman mantısı/dolması) otantik ve lezzetli.', '🧈 Tereyağında kızartılmış versiyonu harika.', '🌿 Vejetaryen seçenekleri de var.'],
    'Maultaschen mit Butter', 11);

END $$;
