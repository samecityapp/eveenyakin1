/*
  # Add Rich Details to Coffee Venues
  
  ## Summary
  Adds mentor notes, review summaries, must-order items, and coordinates to Coffee venues
  
  ## Content
  11 specialty coffee shops with London's best coffee culture
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT fc.id INTO v_category_id
  FROM food_categories fc
  JOIN cities c ON c.id = fc.city_id
  WHERE c.slug = 'londra' AND fc.slug = 'kahve';

  -- Monmouth Coffee
  UPDATE venues SET
    mentor_note = 'Londra''nın specialty coffee öncülerinden. Borough Market''teki şubesi sabahları kuyruklu ama beklemeye değer.',
    reviews_summary = ARRAY[
      '☕ Flat white burada mükemmel, süt köpüğü tam kıvamında.',
      '🥐 Taze croissant ve kahve kombinasyonu sabah rutini için ideal.',
      '📍 Covent Garden şubesi daha sakin, Borough daha hareketli.'
    ],
    must_order = 'Flat White',
    lat = 51.5055,
    lng = -0.0910
  WHERE food_category_id = v_category_id AND name = 'Monmouth Coffee';

  -- Prufrock Coffee
  UPDATE venues SET
    mentor_note = 'Dünya Barista Şampiyonu Gwilym Davies''in mekanı. Kahve eğitimleri de veriyorlar, ciddi kahve tutkunları için.',
    reviews_summary = ARRAY[
      '🏆 Barista seviyesi çok yüksek, her fincan dikkatle hazırlanıyor.',
      '📚 Kahve kitapları ve ekipman satışı da var, kahve kültürü merkezi.',
      '🎯 Filtreleme teknikleri denemeye açık, yeni şeyler öğrenebilirsiniz.'
    ],
    must_order = 'V60 Pour Over',
    lat = 51.5234,
    lng = -0.0876
  WHERE food_category_id = v_category_id AND name = 'Prufrock Coffee';

  -- Ozone Coffee Roasters
  UPDATE venues SET
    mentor_note = 'Yeni Zelanda tarzı kahve kültürü. Brunch menüsü de kahvesi kadar iyi, hafta sonu favorisi.',
    reviews_summary = ARRAY[
      '🥑 Avokado tostu İnstagram''da viral, kahveyle mükemmel uyum.',
      '☀️ Geniş ve aydınlık mekan, laptop çalışması için ideal değil (çok kalabalık).',
      '🌏 Kendi kahvelerini kavuruyorlar, Yeni Zelanda çekirdeği kullanıyorlar.'
    ],
    must_order = 'Long Black with Smashed Avocado',
    lat = 51.5267,
    lng = -0.0759
  WHERE food_category_id = v_category_id AND name = 'Ozone Coffee Roasters';

  -- Kaffeine
  UPDATE venues SET
    mentor_note = 'Fitzrovia''nın gözde kahve durağı. İş toplantısı öncesi veya öğle arası için mükemmel konum.',
    reviews_summary = ARRAY[
      '🥪 Sandviçleri ve salataları da çok iyi, sadece kahve değil.',
      '⚡ Hızlı servis, sabah yoğunluğunda bile beklemek uzun sürmüyor.',
      '💼 WiFi var ve laptop dostu, freelancer''ların favorisi.'
    ],
    must_order = 'Magic (Aussie Style Coffee)',
    lat = 51.5201,
    lng = -0.1398
  WHERE food_category_id = v_category_id AND name = 'Kaffeine';

  -- Rosslyn Coffee
  UPDATE venues SET
    mentor_note = 'Minimalist tasarım ve maksimum lezzet. Queen Elizabeth Hall''un altında saklı bir cevher.',
    reviews_summary = ARRAY[
      '🎨 Mekan tasarımı çok şık, Thames manzaralı oturma alanı var.',
      '🍰 Tatlıları ve kekleri günlük taze, öğleden sonra atıştırmalık için ideal.',
      '🎭 South Bank''te, tiyatro veya konser öncesi mükemmel bir durak.'
    ],
    must_order = 'Cortado',
    lat = 51.5065,
    lng = -0.1172
  WHERE food_category_id = v_category_id AND name = 'Rosslyn Coffee';

  -- WatchHouse
  UPDATE venues SET
    mentor_note = 'Eski bir saat kulesinde, Instagram''ın en sevdiği kahve mekanı. Estetik ve lezzet bir arada.',
    reviews_summary = ARRAY[
      '📸 Tower Bridge şubesi inanılmaz fotojenik, Instagram için hazırlanın.',
      '🥤 Cold brew''ları yaz aylarında çok popüler, buzlu kahve severler bayılacak.',
      '🪑 Genellikle dolu, sabah erken gitmek daha iyi.'
    ],
    must_order = 'Iced Latte',
    lat = 51.5055,
    lng = -0.0745
  WHERE food_category_id = v_category_id AND name = 'WatchHouse';

  -- Grind
  UPDATE venues SET
    mentor_note = 'Gündüz kahve, gece kokteyl barı. Soho''nun en versatile mekanlarından biri.',
    reviews_summary = ARRAY[
      '🍹 Akşam 6''dan sonra espresso martini yapıyorlar, çok iyi.',
      '🎶 Müzik her zaman iyi, atmosfer enerjik ve genç.',
      '📍 Çok şubesi var, hepsinde aynı kalite, güvenilir zincir.'
    ],
    must_order = 'Espresso Martini',
    lat = 51.5132,
    lng = -0.1312
  WHERE food_category_id = v_category_id AND name = 'Grind';

  -- Caravan
  UPDATE venues SET
    mentor_note = 'Dünya kahvelerinin buluşma noktası. Brunch kültürünün Londra öncülerinden, her zaman kalabalık.',
    reviews_summary = ARRAY[
      '🌍 Farklı ülkelerden çekirdekler, menüde hangi ülke olduğu yazıyor.',
      '🍳 Shakshuka ve diğer brunch menüleri çok meşhur, rezervasyon şart.',
      '👥 Grup kahvaltısı için ideal, geniş masalar ve paylaşımlı tabaklar.'
    ],
    must_order = 'Ethiopian Single Origin',
    lat = 51.5354,
    lng = -0.1089
  WHERE food_category_id = v_category_id AND name = 'Caravan';

  -- The Gentlemen Baristas
  UPDATE venues SET
    mentor_note = 'İsmi kadar centilmen bir mekan. Kahve kalitesine odaklanan, samimi bir ortam.',
    reviews_summary = ARRAY[
      '☕ Barista''lar çok bilgili, hangi çekirdeği seçeceğinize yardımcı oluyorlar.',
      '📖 Kitap okumak için rahat köşeler var, sakin atmosfer.',
      '🏆 Düzenli olarak kahve tadım etkinlikleri yapıyorlar.'
    ],
    must_order = 'Single Origin Filter',
    lat = 51.5045,
    lng = -0.0865
  WHERE food_category_id = v_category_id AND name = 'The Gentlemen Baristas';

  -- Workshop Coffee
  UPDATE venues SET
    mentor_note = 'Specialty coffee''nin Londra''daki duayenlerinden. Kahve kavrulması sanat seviyesinde.',
    reviews_summary = ARRAY[
      '🔬 Bilimsel yaklaşımla kahve hazırlıyorlar, detaylara çok önem veriliyor.',
      '🥐 Pastane ürünleri de çok kaliteli, özellikle cardamom bun.',
      '📚 Holborn şubesi çok merkezi, iş toplantısı için popüler.'
    ],
    must_order = 'Batch Brew',
    lat = 51.5201,
    lng = -0.1187
  WHERE food_category_id = v_category_id AND name = 'Workshop Coffee';

  -- Flat White Soho
  UPDATE venues SET
    mentor_note = 'Flat white''ı Londra''ya tanıtan efsanevi mekan. 2005''ten beri Soho''nun kahve kalbi.',
    reviews_summary = ARRAY[
      '🇦🇺 Avustralya kahve kültürünün Londra''daki ilk temsilcisi.',
      '⚡ Çok küçük mekan, genellikle ayakta içiyorsunuz ama değer.',
      '🏆 Flat white burada icat edilmedi ama İngiltere''ye burada geldi.'
    ],
    must_order = 'Flat White (obviously)',
    lat = 51.5132,
    lng = -0.1312
  WHERE food_category_id = v_category_id AND name = 'Flat White Soho';

END $$;
