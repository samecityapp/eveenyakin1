/*
  # Add Rich Details to Pizza Venues
  
  ## Summary
  Adds mentor notes, review summaries, must-order items, and coordinates to Pizza venues
  
  ## Content
  11 pizzerias with Neapolitan traditions and London innovations
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT fc.id INTO v_category_id
  FROM food_categories fc
  JOIN cities c ON c.id = fc.city_id
  WHERE c.slug = 'londra' AND fc.slug = 'pizza';

  -- Pizza Pilgrims
  UPDATE venues SET
    mentor_note = 'Napoli''den ilham alan, otantik fırınlarıyla ünlü. Nutella dough balls''ları tatlı olarak efsane.',
    reviews_summary = ARRAY[
      '🍕 Hamur çok hafif ve çıtır, 400 derece fırında pişiyor.',
      '🍫 Nutella dough balls paylaşımlık ama paylaşmak istemeyeceksiniz.',
      '📍 Çok şubesi var, Covent Garden ve Soho en merkezi olanları.'
    ],
    must_order = 'Nduja pizza with Nutella dough balls',
    lat = 51.5132,
    lng = -0.1267
  WHERE food_category_id = v_category_id AND name = 'Pizza Pilgrims';

  -- Franco Manca
  UPDATE venues SET
    mentor_note = 'Londra''nın en sevilen pizza zinciri. Sourdough hamuru 48 saat mayalanıyor, fiyat/performans şampiyonu.',
    reviews_summary = ARRAY[
      '💷 Çok uygun fiyatlı, £8-10 arası mükemmel pizzalar.',
      '🍷 House wine da çok iyi ve ucuz, mutlu saat fırsatları var.',
      '⏱️ Hızlı servis, öğle yemeği molası için ideal.'
    ],
    must_order = 'Number 4 (Spicy Salami)',
    lat = 51.4612,
    lng = -0.1145
  WHERE food_category_id = v_category_id AND name = 'Franco Manca';

  -- Homeslice
  UPDATE venues SET
    mentor_note = 'Dev dilim pizzalar (20 inch). Amerikan tarzı, paylaşımlık veya tek başına meydan okumak için.',
    reviews_summary = ARRAY[
      '🍕 Dilimler çok büyük, 1-2 dilim doyurucu.',
      '🎨 Neal''s Yard şubesi çok renkli ve Instagram''lık.',
      '🍺 Craft beer seçkisi geniş, pizza ve bira kombinasyonu mükemmel.'
    ],
    must_order = 'Margarita slice (to start)',
    lat = 51.5145,
    lng = -0.1267
  WHERE food_category_id = v_category_id AND name = 'Homeslice';

  -- L'Antica Pizzeria da Michele
  UPDATE venues SET
    mentor_note = 'Napoli''deki orijinal 1870 tarihli pizzerianın Londra şubesi. Sadece iki pizza var: Marinara ve Margherita.',
    reviews_summary = ARRAY[
      '🇮🇹 En otantik Napoli pizzası, Eat Pray Love filminden tanıdık.',
      '📋 Çok basit menü, klasik lezzetler, hiç değişmemiş tarif.',
      '⏰ Kuyruk olabiliyor, rezervasyon yapın veya erken gidin.'
    ],
    must_order = 'Margherita DOC',
    lat = 51.5056,
    lng = -0.1287
  WHERE food_category_id = v_category_id AND name = 'L''Antica Pizzeria da Michele';

  -- Yard Sale Pizza
  UPDATE venues SET
    mentor_note = 'Brooklyn tarzı pizzalar. Gece geç saatlere kadar açık, bar atmosferi enerjik.',
    reviews_summary = ARRAY[
      '🌙 Gece 12''ye kadar açık, gece hayatı sonrası pizza durağı.',
      '🍕 Dilim satışı var, tam pizza da alabilirsiniz.',
      '🎵 DJ setleri ve etkinlikler oluyor, sadece yemek değil eğlence de var.'
    ],
    must_order = 'Pepperoni slice',
    lat = 51.5234,
    lng = -0.0756
  WHERE food_category_id = v_category_id AND name = 'Yard Sale Pizza';

  -- Rudy's Pizza Napoletana
  UPDATE venues SET
    mentor_note = 'Manchester''dan gelen, Napoli geleneğine sadık kalan bir zincir. Hamuru ve malzemeleri İtalya''dan getiriyorlar.',
    reviews_summary = ARRAY[
      '🇮🇹 İtalyan un ve domates, orijinal Napoli lezzeti.',
      '🔥 Fırınlar 500 derece, pizza 60 saniyede pişiyor.',
      '💚 Vegan seçenekleri de çok iyi, bitkisel peynir lezzetli.'
    ],
    must_order = 'Margherita with Burrata',
    lat = 51.5156,
    lng = -0.0987
  WHERE food_category_id = v_category_id AND name = 'Rudy''s Pizza Napoletana';

  -- Santa Maria
  UPDATE venues SET
    mentor_note = 'Ealing''in gizli cevheri. Ailece işletilen, otantik İtalyan atmosferi, yerel favorisi.',
    reviews_summary = ARRAY[
      '👨‍👩‍👧‍👦 Aile işletmesi, çok samimi atmosfer, kendini evinde hissediyorsun.',
      '🍝 Pizzalar harika ama pasta ve risottoları da deneyin.',
      '📍 Merkez dışında ama gidenleri hiç pişman etmiyor.'
    ],
    must_order = 'Diavola pizza',
    lat = 51.5123,
    lng = -0.3045
  WHERE food_category_id = v_category_id AND name = 'Santa Maria';

  -- Voodoo Ray's
  UPDATE venues SET
    mentor_note = 'Dalston''ın kült pizza yeri. New York dilim kültürü, gece kulübü sonrası vazgeçilmez.',
    reviews_summary = ARRAY[
      '🌶️ Spicy seçenekleri çok iyi, özellikle hot honey pizza.',
      '🎭 Dalston''ın en enerjik bölgesinde, gece hayatının merkezi.',
      '🍺 İçki lisansı var, pizza ve bira kombinasyonu süper.'
    ],
    must_order = 'Hot Honey Pepperoni',
    lat = 51.5487,
    lng = -0.0756
  WHERE food_category_id = v_category_id AND name = 'Voodoo Ray''s';

  -- Pizza Union
  UPDATE venues SET
    mentor_note = 'Hızlı, ucuz ve lezzetli. Öğrenci dostu fiyatlar, kaliteden ödün vermeyen bir konsept.',
    reviews_summary = ARRAY[
      '💷 £5-7 arası pizzalar, Londra''da inanılmaz değer.',
      '⚡ Sipariş verdikten 5 dakika sonra masanızda, çok hızlı.',
      '🎯 Basit menü, klasik seçenekler, hepsi güvenilir.'
    ],
    must_order = 'Margherita (classic)',
    lat = 51.5267,
    lng = -0.0812
  WHERE food_category_id = v_category_id AND name = 'Pizza Union';

  -- Bad Boy Pizza Society
  UPDATE venues SET
    mentor_note = 'Sourdough uzmanları. Aynı hamuru pizza, focaccia ve ekmek için kullanıyorlar, hepsi mükemmel.',
    reviews_summary = ARRAY[
      '🍞 Focaccia sandviçleri de çok iyi, pizza alternatiği olarak deneyin.',
      '🌱 Mevsimsel ve yerel malzeme kullanıyorlar, her ay değişen özel pizzalar.',
      '📸 Sunum çok şık, Instagram için hazır.'
    ],
    must_order = 'Truffle & Mushroom pizza',
    lat = 51.5389,
    lng = -0.0543
  WHERE food_category_id = v_category_id AND name = 'Bad Boy Pizza Society';

  -- Circolo Popolare
  UPDATE venues SET
    mentor_note = 'Big Mamma grup''unun gösterişli mekanı. İtalyan kilisesi temalı, Instagram''ın favorisi.',
    reviews_summary = ARRAY[
      '🎨 İç tasarım inanılmaz, tavan freskleri ve büyük çiçek düzenlemeleri.',
      '🍕 Pizzalar lezzetli ama asıl gitmek için sebep atmosfer.',
      '📸 Her köşe fotoğraflanmaya değer, rezervasyon şart.'
    ],
    must_order = 'Truffle pizza with Parmesan wheel',
    lat = 51.5123,
    lng = -0.1089
  WHERE food_category_id = v_category_id AND name = 'Circolo Popolare';

END $$;
