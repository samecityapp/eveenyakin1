/*
  # Add London Coffee Venues
  
  ## Summary
  Adds coffee category and 11 premium coffee venues for London
  
  ## Category
  - En İyi Kahveciler (Best Coffee Shops)
  
  ## Venues (11 total)
  All venues include Google ratings and review counts for credibility
*/

DO $$
DECLARE
  v_london_id uuid;
  v_category_id uuid;
BEGIN
  -- Get London city ID
  SELECT id INTO v_london_id FROM cities WHERE slug = 'londra';

  -- Create coffee category
  INSERT INTO food_categories (city_id, name, slug, sort_order)
  VALUES (v_london_id, 'En İyi Kahveciler', 'kahve', 2)
  RETURNING id INTO v_category_id;

  -- Add 11 coffee venues
  INSERT INTO venues (food_category_id, name, description, image, map_link, google_rating, google_review_count, sort_order) VALUES
    (
      v_category_id,
      'Monmouth Coffee',
      'Londra''nın kahve sahnesinin öncüsü. Borough Market''teki şubesi her zaman kalabalıktır, beklemeye değer.',
      'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/MonmouthCoffee',
      4.7,
      2200,
      1
    ),
    (
      v_category_id,
      'Prufrock Coffee',
      'Barista eğitimleri de veren, kahveyi bir bilim gibi ele alan, ödüllü bir mekan. Kahve gurmeleri için.',
      'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/PrufrockCoffee',
      4.6,
      1100,
      2
    ),
    (
      v_category_id,
      'Ozone Coffee Roasters',
      'Kendi kahvelerini kavuran, endüstriyel şık bir tasarıma sahip, kahvaltı ve brunch için de harika bir yer.',
      'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/OzoneCoffee',
      4.6,
      1900,
      3
    ),
    (
      v_category_id,
      'Kaffeine',
      'Avustralya ve Yeni Zelanda kahve kültüründen ilham alan, küçük ama her zaman mükemmel kahveler sunan bir mekan.',
      'https://images.pexels.com/photos/324028/pexels-photo-324028.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Kaffeine',
      4.6,
      1500,
      4
    ),
    (
      v_category_id,
      'Rosslyn Coffee',
      'Finans merkezi City of London''da, hızlı, kaliteli ve tutarlı kahve arayan profesyonellerin favorisi.',
      'https://images.pexels.com/photos/851555/pexels-photo-851555.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/RosslynCoffee',
      4.8,
      900,
      5
    ),
    (
      v_category_id,
      'WatchHouse',
      'Tarihi binaları modern tasarımla birleştiren, estetiğe önem veren ve harika kahveler sunan bir zincir.',
      'https://images.pexels.com/photos/1251175/pexels-photo-1251175.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/WatchHouse',
      4.5,
      1200,
      6
    ),
    (
      v_category_id,
      'Grind',
      'Gündüzleri kahveci, geceleri kokteyl barı konseptiyle öne çıkan, pembe neon ışıklarıyla ünlü, popüler bir zincir.',
      'https://images.pexels.com/photos/1833769/pexels-photo-1833769.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Grind',
      4.4,
      2500,
      7
    ),
    (
      v_category_id,
      'Caravan',
      'Büyük, havadar ve her zaman hareketli. Kendi kahvelerini kavururlar ve yemek menüleri de çok başarılıdır.',
      'https://images.pexels.com/photos/373639/pexels-photo-373639.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Caravan',
      4.5,
      3800,
      8
    ),
    (
      v_category_id,
      'The Gentlemen Baristas',
      'Viktoryen dönemin centilmenlik kültüründen ilham alan, kendine has karakteri olan, kaliteli kahve dükkanları zinciri.',
      'https://images.pexels.com/photos/1002740/pexels-photo-1002740.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/GentlemenBaristas',
      4.5,
      800,
      9
    ),
    (
      v_category_id,
      'Workshop Coffee',
      'Kahve çekirdeğinin kalitesine ve tedarik zincirine büyük önem veren, minimalist ve aydınlık mekanlar.',
      'https://images.pexels.com/photos/1251180/pexels-photo-1251180.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/WorkshopCoffee',
      4.4,
      1000,
      10
    ),
    (
      v_category_id,
      'Flat White Soho',
      '''Flat White'' kahvesini Londra''da popülerleştiren ilk mekanlardan biri. Küçük, samimi ve otantik bir deneyim.',
      'https://images.pexels.com/photos/1415555/pexels-photo-1415555.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/FlatWhiteSoho',
      4.4,
      950,
      11
    );

END $$;
