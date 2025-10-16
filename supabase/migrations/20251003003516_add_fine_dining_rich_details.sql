/*
  # Add Rich Details to Fine Dining Venues
  
  ## Summary
  Adds mentor notes, review summaries, must-order items, and coordinates to Fine Dining venues
  
  ## Content
  11 high-end dining venues with personality-driven descriptions
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT fc.id INTO v_category_id
  FROM food_categories fc
  JOIN cities c ON c.id = fc.city_id
  WHERE c.slug = 'londra' AND fc.slug = 'fine-dining';

  -- Sketch
  UPDATE venues SET
    mentor_note = 'Sadece bir restoran değil, tam bir sanat deneyimi. David Shrigley''nin sürreal tasarımıyla Instagram''ın en çok fotoğraflanan mekanlarından.',
    reviews_summary = ARRAY[
      '🎨 Tuvalet tasarımı (yumurta şeklinde kabinler) başlı başına bir deneyim, görmeden gitmeyin.',
      '🍰 Afternoon tea çok popüler, önceden rezervasyon şart, tatlıları görsel bir şölen.',
      '💰 Pahalı ama özel günler için değer, her köşesi Instagram worthy.'
    ],
    must_order = 'Afternoon Tea with Champagne',
    lat = 51.5153,
    lng = -0.1418
  WHERE food_category_id = v_category_id AND name = 'Sketch';

  -- The Ivy
  UPDATE venues SET
    mentor_note = 'Londra''nın en ikonik restoranlarından biri. Ünlüleri görmek ve görülmek isteyenler için klasik bir adres.',
    reviews_summary = ARRAY[
      '⭐ Haftasonları özellikle popüler, çok önceden rezervasyon yapın.',
      '🍸 Bar alanı çok enerjik, aperitif için ideal.',
      '🎭 West End''e çok yakın, tiyatro öncesi mükemmel konum.'
    ],
    must_order = 'Shepherd''s Pie',
    lat = 51.5127,
    lng = -0.1270
  WHERE food_category_id = v_category_id AND name = 'The Ivy';

  -- Clos Maggiore
  UPDATE venues SET
    mentor_note = 'Londra''nın en romantik restoranı. Çiçeklerle kaplı avlusu ve şöminesiyle evlilik teklifi için favori mekan.',
    reviews_summary = ARRAY[
      '🌸 Konservatuvar bölümü muhteşem, mutlaka o bölümden masa isteyin.',
      '🕯️ Işıklandırma ve atmosfer akşam yemeği için mükemmel, öğle yemeği o kadar büyüleyici değil.',
      '🍷 Fransız ağırlıklı menü ve şarap listesi çok kaliteli.'
    ],
    must_order = 'Beef Wellington',
    lat = 51.5118,
    lng = -0.1245
  WHERE food_category_id = v_category_id AND name = 'Clos Maggiore';

  -- Dishoom
  UPDATE venues SET
    mentor_note = 'Bombay''ın eski kafelerinden ilham alan, her gün kuyruğu olan bir Hint restoranı. Ortam ve lezzet mükemmel dengede.',
    reviews_summary = ARRAY[
      '🍳 Kahvaltıları efsane, Bacon Naan Roll için sabah erkenden gidin.',
      '🌶️ Akşamları içki menüsü çok iyi, kokteylleri deneyin.',
      '📖 Menü bir hikaye kitabı gibi, her yemeğin arkasında bir öykü var.'
    ],
    must_order = 'House Black Daal',
    lat = 51.5145,
    lng = -0.1220
  WHERE food_category_id = v_category_id AND name = 'Dishoom';

  -- Hawksmoor
  UPDATE venues SET
    mentor_note = 'Et severler için cennet. Mükemmel pişirilmiş steakler, nostaljik art deco atmosfer ve şaşırtıcı derecede iyi deniz ürünleri.',
    reviews_summary = ARRAY[
      '🥩 Etler dry-aged ve mükemmel pişiriliyor, orta pişmiş (medium-rare) öneririm.',
      '🍨 Sticky Toffee Pudding Londra''nın en iyisi, mutlaka yer bırakın.',
      '🍹 Sunday roast ve brunch menüleri de çok iyi, hafta sonları kalabalık.'
    ],
    must_order = 'Porterhouse Steak (to share)',
    lat = 51.5134,
    lng = -0.1280
  WHERE food_category_id = v_category_id AND name = 'Hawksmoor';

  -- Dinner by Heston Blumenthal
  UPDATE venues SET
    mentor_note = 'Tarihi İngiliz yemeklerini modern tekniklerle yeniden yorumlayan, Michelin yıldızlı bir deneyim. Hyde Park manzarası bonus.',
    reviews_summary = ARRAY[
      '🔥 Açık mutfak konsepti, şefleri çalışırken izlemek büyüleyici.',
      '📜 Her yemeğin yanında tarihi (örn. 1720) yazıyor, çok ilginç bir konsept.',
      '🍖 Meat Fruit (portakal görünümlü pate) ikonik, mutlaka deneyin.'
    ],
    must_order = 'Meat Fruit (c.1500)',
    lat = 51.5034,
    lng = -0.1594
  WHERE food_category_id = v_category_id AND name = 'Dinner by Heston Blumenthal';

  -- Duck & Waffle
  UPDATE venues SET
    mentor_note = '24 saat açık, 40. katta, panoramik Londra manzarası eşliğinde yemek yiyebileceğiniz tek yer. Gece kuşları için ideal.',
    reviews_summary = ARRAY[
      '🌆 Gün doğumu veya gün batımı için mükemmel, manzara inanılmaz.',
      '🦆 İmza yemeği Duck & Waffle ilginç bir kombinasyon ama işe yarıyor.',
      '⏰ Gece 3''te bile açık, gece kulübü sonrası iyi bir seçenek.'
    ],
    must_order = 'Duck & Waffle',
    lat = 51.5155,
    lng = -0.0754
  WHERE food_category_id = v_category_id AND name = 'Duck & Waffle';

  -- The Wolseley
  UPDATE venues SET
    mentor_note = 'Viyana grand cafe''lerinden ilham alan, sabahtan geceye kadar canlı olan ikonik bir mekan. Kahvaltısı Londra''nın en iyilerinden.',
    reviews_summary = ARRAY[
      '🥐 Kahvaltı ve brunch için müthiş, Avusturya tarzı hamur işleri harika.',
      '👔 Dress code yok ama insanlar genelde şık giyinmiş, atmosferin bir parçası.',
      '📚 Kitap gibi menü, klasik Avrupa yemekleri, her şey güvenilir.'
    ],
    must_order = 'Eggs Benedict',
    lat = 51.5085,
    lng = -0.1415
  WHERE food_category_id = v_category_id AND name = 'The Wolseley';

  -- Aqua Shard
  UPDATE venues SET
    mentor_note = 'Shard''ın 31. katında, Londra''nın en iyi manzarasına sahip restoranlardan biri. Yemek iyidir ama manzara yıldızdır.',
    reviews_summary = ARRAY[
      '🏙️ Sunset zamanı için rezervasyon yapın, Thames manzarası muhteşem.',
      '🍸 Sadece içki içmek için de gidebilirsiniz, bar alanı rahat.',
      '💷 Pahalı tarafta ama manzara için değer, özel günler için ideal.'
    ],
    must_order = 'Afternoon Tea with View',
    lat = 51.5045,
    lng = -0.0865
  WHERE food_category_id = v_category_id AND name = 'Aqua Shard';

  -- Chiltern Firehouse
  UPDATE venues SET
    mentor_note = 'Eski bir itfaiye binasında, ünlülerin ve Londra sosyetesinin favori mekanı. Yemekler kadar, kim oturduğu da önemli bir yer.',
    reviews_summary = ARRAY[
      '🌟 Ünlü görmek istiyorsanız burası doğru adres, paparazzi bile kapıda bekliyor.',
      '🔥 Avlu yaz akşamları çok popüler, kış aylarında içerisi daha samimi.',
      '🍽️ Nando Parrado''nun mutfağı hem lezzetli hem Instagram''lık.'
    ],
    must_order = 'Corn Ribs',
    lat = 51.5235,
    lng = -0.1570
  WHERE food_category_id = v_category_id AND name = 'Chiltern Firehouse';

  -- Bob Bob Ricard
  UPDATE venues SET
    mentor_note = '\"Press for Champagne\" butonu olan tek restoran. Abartılı, lüks ve eğlenceli bir Rus-İngiliz deneyimi.',
    reviews_summary = ARRAY[
      '🍾 Her masada şampanya butonu var, basınca garson geliyor, çok eğlenceli.',
      '🎨 Art deco tasarım ve mavi kadife koltuklar çok Instagram''lık.',
      '🥧 Beef Wellington ve Chicken Kiev gibi klasikler çok iyi yapılıyor.'
    ],
    must_order = 'Beef Wellington',
    lat = 51.5132,
    lng = -0.1345
  WHERE food_category_id = v_category_id AND name = 'Bob Bob Ricard';

END $$;
