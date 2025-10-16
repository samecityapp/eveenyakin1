/*
  # Add Rich Details to Local Specialties
  
  ## Summary
  Adds mentor notes, review summaries, must-order items, and coordinates to local London specialties
  
  ## Content
  11 iconic London food experiences from markets to traditional dishes
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT fc.id INTO v_category_id
  FROM food_categories fc
  JOIN cities c ON c.id = fc.city_id
  WHERE c.slug = 'londra' AND fc.slug = 'yerel-lezzetler';

  -- Borough Market
  UPDATE venues SET
    mentor_note = 'Londra''nın en ünlü gıda pazarı. Tek bir yemek değil, yüzlerce lezzet deneyimi. Cumartesi sabahları en canlı hali.',
    reviews_summary = ARRAY[
      '🦪 Richard Haward''s Oysters''dan taze istiridye deneyimi unutulmaz.',
      '🧀 Kappacasein Dairy''nin erimiş peynirli sandviçi için kuyrukta beklemek bile değer.',
      '☕ Cumartesi sabahı kahve alıp pazarı gezmek en keyifli aktivite.'
    ],
    must_order = 'Kappacasein Raclette Sandwich',
    lat = 51.5055,
    lng = -0.0910
  WHERE food_category_id = v_category_id AND name = 'Borough Market';

  -- The Breakfast Club
  UPDATE venues SET
    mentor_note = 'Full English Breakfast için en sevilen zincir. Retro Amerikan diner atmosferi ve doyurucu kahvaltılar.',
    reviews_summary = ARRAY[
      '🍳 Porsiyon boyutları çok cömert, aç gitmek şart.',
      '☕ Hafta sonları kuyruk oluyor, hafta içi sabahları daha rahat.',
      '🎨 Her şube farklı tema, hepsi renkli ve Instagram''lık.'
    ],
    must_order = 'The Full Monty (Full English)',
    lat = 51.5201,
    lng = -0.0820
  WHERE food_category_id = v_category_id AND name = 'The Breakfast Club';

  -- Pieminister
  UPDATE venues SET
    mentor_note = 'İngiliz pie geleneğinin modern yorumu. Hem tatlı hem tuzlu pies, hepsi taze ve doyurucu.',
    reviews_summary = ARRAY[
      '🥧 Vejetaryen seçenekleri de çok iyi, sadece etli olanlar değil.',
      '🍟 Patates püresi ve gravy sosu ile mükemmel kombinasyon.',
      '🎯 Hızlı öğle yemeği için ideal, fiyat/performans çok iyi.'
    ],
    must_order = 'Steak & Ale Pie with Mash',
    lat = 51.5145,
    lng = -0.1195
  WHERE food_category_id = v_category_id AND name = 'Pieminister';

  -- Poppies Fish & Chips
  UPDATE venues SET
    mentor_note = '1952''den beri, en otantik fish & chips deneyimi. Nostaljik dekoruyla 1950''lere yolculuk.',
    reviews_summary = ARRAY[
      '🐟 Balık çok taze ve hamuru mükemmel çıtır, klasik tarif.',
      '🎭 Eski gazete kağıdına sarılı servis seçeneği çok nostaljik.',
      '🥤 Mushy peas ve tartare sosunu mutlaka deneyin.'
    ],
    must_order = 'Traditional Cod & Chips',
    lat = 51.5201,
    lng = -0.0690
  WHERE food_category_id = v_category_id AND name = 'Poppies Fish & Chips';

  -- Greggs
  UPDATE venues SET
    mentor_note = 'İngiltere''nin en sevilen bakery zinciri. Ucuz, hızlı ve lezzetli. Sausage roll efsanesi gerçek.',
    reviews_summary = ARRAY[
      '🥐 Sausage roll İngiltere''nin ulusal hazinesi, vegan versiyonu da var.',
      '☕ Kahve + pastry £2-3 arası, bütçe dostu.',
      '📍 Her köşede bir Greggs var, hayat kurtarıcı.'
    ],
    must_order = 'Sausage Roll',
    lat = 51.5074,
    lng = -0.1278
  WHERE food_category_id = v_category_id AND name = 'Greggs';

  -- Beigel Bake
  UPDATE venues SET
    mentor_note = '7/24 açık olan efsanevi fırın. Brick Lane''in ikonik salt beef beigel''ı için gece 3''te bile kuyruk oluyor.',
    reviews_summary = ARRAY[
      '🥯 Salt beef beigel hardal ve turşuyla efsane, £5''a inanılmaz değer.',
      '⏰ Gece kulüplerinden sonra dolu oluyor, her saat kalabalık.',
      '💷 Çok ucuz, çok lezzetli, hızlı servis.'
    ],
    must_order = 'Salt Beef Beigel with Mustard',
    lat = 51.5201,
    lng = -0.0615
  WHERE food_category_id = v_category_id AND name = 'Beigel Bake';

  -- The Windmill (pub)
  UPDATE venues SET
    mentor_note = 'Otantik İngiliz pub deneyimi için mükemmel. Sunday roast geleneğini en iyi şekilde yaşayabileceğiniz yer.',
    reviews_summary = ARRAY[
      '🍖 Sunday roast porsiyonları çok büyük ve lezzetli, Yorkshire pudding harika.',
      '🍺 Gerçek ale seçkisi geniş, pub atmosferi samimi.',
      '📅 Pazar günleri rezervasyon şart, çok popüler.'
    ],
    must_order = 'Sunday Roast Beef',
    lat = 51.4612,
    lng = -0.2145
  WHERE food_category_id = v_category_id AND name = 'The Windmill (pub)';

  -- Bao
  UPDATE venues SET
    mentor_note = 'Tayvan bao''ları Londra''ya getiren kült mekan. Genellikle kuyruklu ama beklemeye değer.',
    reviews_summary = ARRAY[
      '🥟 Braised pork bao imza yemek, yumuşacık et ve mükemmel bao.',
      '🌶️ Spicy fried chicken de çok iyi, acı seven severler bayılacak.',
      '⏱️ Rezervasyon almıyorlar, kuyrukta beklemeye hazırlıklı olun.'
    ],
    must_order = 'Classic Pork Bao',
    lat = 51.5132,
    lng = -0.1312
  WHERE food_category_id = v_category_id AND name = 'Bao';

  -- Fortnum & Mason
  UPDATE venues SET
    mentor_note = '1707''den beri Londra''nın en lüks gourmet mağazası. Afternoon tea geleneğinin zirvesi.',
    reviews_summary = ARRAY[
      '☕ Afternoon tea en klasik ve lüks deneyim, dress code var.',
      '🎁 Çayları ve hampers''ları mükemmel hedyelik eşya.',
      '🏛️ Bina kendisi bir müze, gezmek bile keyifli.'
    ],
    must_order = 'Traditional Afternoon Tea',
    lat = 51.5077,
    lng = -0.1377
  WHERE food_category_id = v_category_id AND name = 'Fortnum & Mason';

  -- St. John
  UPDATE venues SET
    mentor_note = '\"Nose to Tail Eating\" (Burundan Kuyruğa) felsefesinin öncüsü. Kemik iliği ve maydanoz salatası ikonik.',
    reviews_summary = ARRAY[
      '🦴 Bone marrow & parsley salad İngiltere''nin en ünlü başlangıç yemeği.',
      '🍷 Şarap listesi mükemmel, özellikle doğal şaraplar.',
      '🥖 Kendi ekmeklerini yapıyorlar, çok lezzetli ve taze.'
    ],
    must_order = 'Roast Bone Marrow & Parsley Salad',
    lat = 51.5201,
    lng = -0.0987
  WHERE food_category_id = v_category_id AND name = 'St. John';

  -- Brick Lane Curry Houses
  UPDATE venues SET
    mentor_note = 'Londra''nın Bangladeş mahallesi. Onlarca curry house''dan birini seçin, hepsi otantik ve lezzetli.',
    reviews_summary = ARRAY[
      '🌶️ Geç saatlere kadar açık, gece hayatı sonrası popüler.',
      '🍛 BYOB (Bring Your Own Bottle) - kendi içkinizi götürebilirsiniz.',
      '💷 Fiyatlar çok uygun, büyük porsiyonlar.'
    ],
    must_order = 'Chicken Tikka Masala',
    lat = 51.5220,
    lng = -0.0711
  WHERE food_category_id = v_category_id AND name = 'Brick Lane Curry Houses';

END $$;
