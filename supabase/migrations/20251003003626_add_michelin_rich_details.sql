/*
  # Add Rich Details to Michelin Starred Venues
  
  ## Summary
  Adds mentor notes, review summaries, must-order items, and coordinates to Michelin venues
  
  ## Content
  11 Michelin-starred restaurants with star ratings in venue names
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT fc.id INTO v_category_id
  FROM food_categories fc
  JOIN cities c ON c.id = fc.city_id
  WHERE c.slug = 'londra' AND fc.slug = 'michelin';

  -- Restaurant Gordon Ramsay
  UPDATE venues SET
    mentor_note = 'Londra''nın sadece bir avuç 3 yıldızlı restoranından biri. Gordon Ramsay''in kişisel imzası her detayda hissediliyor.',
    reviews_summary = ARRAY[
      '⭐ Üç yıldız hakkını veriyor, her tabak mükemmel işçilik.',
      '💰 Çok pahalı ama ömürde bir deneyim kategorisinde, tadım menüsü şart.',
      '🎩 Dress code var, şık giyinin, atmosfer çok formal ama sıcak.'
    ],
    must_order = '7-Course Tasting Menu',
    lat = 51.4845,
    lng = -0.1590
  WHERE food_category_id = v_category_id AND name = 'Restaurant Gordon Ramsay';

  -- Alain Ducasse at The Dorchester
  UPDATE venues SET
    mentor_note = 'Fransız haute cuisine''in İngiliz zarafetlе buluştuğu yer. Alain Ducasse''ın vizyonu, Dorchester''ın lüksü.',
    reviews_summary = ARRAY[
      '🍽️ Table Lumière (özel masa) inanılmaz bir deneyim, önceden rezerve edin.',
      '🧀 Peynir arabası Avrupa''nın en iyilerinden, peynir severler bayılacak.',
      '✨ Servis kusursuz, her konuk kraliyet muamelesi görüyor.'
    ],
    must_order = 'Dorchester Signature Menu',
    lat = 51.5074,
    lng = -0.1523
  WHERE food_category_id = v_category_id AND name = 'Alain Ducasse at The Dorchester';

  -- The Ledbury
  UPDATE venues SET
    mentor_note = 'Modern Avrupa mutfağının zirvesi. Brett Graham''ın yaratıcı tabaklarıyla dünya''nın en iyi restoranları listelerinde.',
    reviews_summary = ARRAY[
      '🎨 Her tabak bir sanat eseri, hem görsel hem lezzet olarak mükemmel.',
      '🍷 Şarap eşleştirmesi çok iyi düşünülmüş, sommelier tavsiyelerine güvenin.',
      '🪑 Rahat ama zarif atmosfer, çok rahat hissediyorsunuz.'
    ],
    must_order = 'Flame Grilled Mackerel',
    lat = 51.5113,
    lng = -0.2087
  WHERE food_category_id = v_category_id AND name = 'The Ledbury';

  -- Core by Clare Smyth
  UPDATE venues SET
    mentor_note = 'Gordon Ramsay''nin ilk kadın 3 yıldızlı şefi Clare Smyth''in kendi restoranı. Modern İngiliz mutfağının en üst seviyesi.',
    reviews_summary = ARRAY[
      '🥔 İmza yemeği "Charlotte Potato" çok basit görünüyor ama lezzet patlaması.',
      '🌱 Yerel ve sürdürülebilir malzemelere odaklanıyor, hikaye anlatımı güzel.',
      '🏆 3 yıldız için halen bekleniyor ama 2 yıldız bile olağanüstü.'
    ],
    must_order = 'Charlotte Potato',
    lat = 51.5145,
    lng = -0.2065
  WHERE food_category_id = v_category_id AND name = 'Core by Clare Smyth';

  -- The Clove Club
  UPDATE venues SET
    mentor_note = 'Shoreditch''in en iyi restoranı. İngiliz malzemelerini modern tekniklerle sunan, rahat ama sofistike bir atmosfer.',
    reviews_summary = ARRAY[
      '🦞 İskoç ıstakoz yemeği ikonik, deniz ürünleri çok taze.',
      '🍞 Ekmeği ve tereyağı bile sıradan değil, her detay düşünülmüş.',
      '🎭 Açık mutfak konsepti, şeflerin çalışmasını izlemek eğlenceli.'
    ],
    must_order = 'Scottish Langoustine',
    lat = 51.5267,
    lng = -0.0788
  WHERE food_category_id = v_category_id AND name = 'The Clove Club';

  -- Pollen Street Social
  UPDATE venues SET
    mentor_note = 'Jason Atherton''un modern İngiliz mutfağını rahat bir atmosferde sunduğu mekan. Tatlı barı meşhur.',
    reviews_summary = ARRAY[
      '🍰 Dessert bar ayrı bir deneyim, sadece tatlı için bile gidilebilir.',
      '🍸 Bar menüsü ve kokteylleri çok iyi, yemeğe başlamadan önce deneyin.',
      '👨‍🍳 Açık mutfak ve şeflerle etkileşim çok keyifli.'
    ],
    must_order = 'Tasting Menu with Dessert Bar',
    lat = 51.5132,
    lng = -0.1415
  WHERE food_category_id = v_category_id AND name = 'Pollen Street Social';

  -- Sabor
  UPDATE venues SET
    mentor_note = 'İspanya''nın farklı bölgelerinden lezzetler sunan, enerjik ve canlı bir tapas barı. Michelin yıldızlı ama rahat.',
    reviews_summary = ARRAY[
      '🦐 Tezgahta oturun, şefleri izlemek ve sohbet etmek çok keyifli.',
      '🍷 İspanyol şarap seçkisi inanılmaz geniş ve kaliteli.',
      '🥘 Küçük tabaklar sipariş edin, çeşit çeşit tatmak en iyisi.'
    ],
    must_order = 'Octopus a la Gallega',
    lat = 51.5095,
    lng = -0.1412
  WHERE food_category_id = v_category_id AND name = 'Sabor';

  -- Gymkhana
  UPDATE venues SET
    mentor_note = 'Hint fine dining''in en iyi örneği. Kolonyal dönem Hint kulüplerinden ilham alan dekoru ve ödüllü mutfağı.',
    reviews_summary = ARRAY[
      '🍛 Biryani ve tandoori yemekleri Michelin standardında.',
      '🏏 Dekorasyon çok özgün, kolonyal Hindistan kulübü teması harika işlenmiş.',
      '🌶️ Baharatlı ama dengeli, lezzet derinliği inanılmaz.'
    ],
    must_order = 'Wild Muntjac Biryani',
    lat = 51.5095,
    lng = -0.1445
  WHERE food_category_id = v_category_id AND name = 'Gymkhana';

  -- Sketch (The Lecture Room)
  UPDATE venues SET
    mentor_note = 'Pierre Gagnaire''nin mutfağı ve David Shrigley''nin sanatıyla buluşuyor. 3 Michelin yıldızlı ve tamamen sürreal.',
    reviews_summary = ARRAY[
      '🎨 Her oda farklı bir sanatçı tarafından tasarlanmış, gezin ve keşfedin.',
      '🍽️ Yemekler kadar sunum da sanat eseri, fotoğraf çekmeye hazır olun.',
      '💷 Londra''nın en pahalı restoranlarından biri ama deneyim benzersiz.'
    ],
    must_order = 'Pierre Gagnaire Tasting Menu',
    lat = 51.5153,
    lng = -0.1418
  WHERE food_category_id = v_category_id AND name = 'Sketch (The Lecture Room)';

  -- A Wong
  UPDATE venues SET
    mentor_note = 'Londra''nın en iyi Çin restoranı. Dim sum arabası geleneği modern tekniklerle yeniden yorumlanıyor.',
    reviews_summary = ARRAY[
      '🥟 Dim sum tadım menüsü 10 çeşit sunuyor, hepsi muhteşem.',
      '🎯 Çin''in farklı bölgelerinden lezzetler, menü çok çeşitli.',
      '👨‍🍳 Andrew Wong''un yaratıcılığı her tabakta hissediliyor.'
    ],
    must_order = 'Taste of China Dim Sum Menu',
    lat = 51.4949,
    lng = -0.1357
  WHERE food_category_id = v_category_id AND name = 'A Wong';

  -- Ikoyi
  UPDATE venues SET
    mentor_note = 'Batı Afrika baharatlarını modern tekniklerle birleştiren, dünyanın en yenilikçi mutfaklarından biri. 2 Michelin yıldızlı.',
    reviews_summary = ARRAY[
      '🌶️ Baharat kullanımı çok ustaca, hiç tatmadığınız lezzetler.',
      '🎭 Tadım menüsü bir yolculuk gibi, her tabak sürpriz.',
      '🏆 Çok genç ama 2 yıldızı hak ediyor, gelecek vaat ediyor.'
    ],
    must_order = '12-Course Tasting Menu',
    lat = 51.4985,
    lng = -0.1312
  WHERE food_category_id = v_category_id AND name = 'Ikoyi';

END $$;
