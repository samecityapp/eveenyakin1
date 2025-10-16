/*
  # Add London Fine Dining Venues
  
  ## Summary
  Adds fine dining category and 11 premium restaurants for London
  
  ## Category
  - Fine Dining (Özel Günler İçin)
  
  ## Venues (11 total)
  High-end restaurants for special occasions with exceptional service
*/

DO $$
DECLARE
  v_london_id uuid;
  v_category_id uuid;
BEGIN
  SELECT id INTO v_london_id FROM cities WHERE slug = 'londra';

  INSERT INTO food_categories (city_id, name, slug, sort_order)
  VALUES (v_london_id, 'Fine Dining', 'fine-dining', 4)
  RETURNING id INTO v_category_id;

  INSERT INTO venues (food_category_id, name, description, image, map_link, google_rating, google_review_count, sort_order) VALUES
    (
      v_category_id,
      'Sketch',
      'Pembe kadife kaplı salonu, Instagram''ın en çok fotoğraflanan mekanlarından biri. Yemekler kadar ortam da unutulmaz.',
      'https://images.pexels.com/photos/1126728/pexels-photo-1126728.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Sketch',
      4.5,
      8200,
      1
    ),
    (
      v_category_id,
      'The Ivy',
      'Klasik İngiliz fine dining. Ünlülerin favorisi, zarif dekorasyonu ve güvenilir mutfağıyla her zaman popüler.',
      'https://images.pexels.com/photos/941861/pexels-photo-941861.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/TheIvy',
      4.4,
      12000,
      2
    ),
    (
      v_category_id,
      'Clos Maggiore',
      'Londra''nın en romantik restoranı olarak biliniyor. Çiçeklerle süslü tavanı ve muhteşem Fransız mutfağı.',
      'https://images.pexels.com/photos/696218/pexels-photo-696218.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/ClosMaggiore',
      4.6,
      3800,
      3
    ),
    (
      v_category_id,
      'Dishoom',
      'Bombay''ın nostaljik café kültürünü Londra''ya taşıyan, her zaman kalabalık, harika bir Hint restoranı zinciri.',
      'https://images.pexels.com/photos/1211887/pexels-photo-1211887.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Dishoom',
      4.5,
      9500,
      4
    ),
    (
      v_category_id,
      'Hawksmoor',
      'Londra''nın en iyi steakhouse''larından biri. Et kalitesi, servis ve kokteylleriyle ödüllü bir restoran.',
      'https://images.pexels.com/photos/769289/pexels-photo-769289.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Hawksmoor',
      4.6,
      6700,
      5
    ),
    (
      v_category_id,
      'Dinner by Heston Blumenthal',
      'İngiliz mutfak tarihinden ilham alan, yaratıcı ve Michelin yıldızlı bir deneyim. Pahalı ama unutulmaz.',
      'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/DinnerHeston',
      4.5,
      3200,
      6
    ),
    (
      v_category_id,
      'Duck & Waffle',
      '40. katta, Londra manzaralı, 24 saat açık olan bir restoran. Özel günleriniz için harika.',
      'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/DuckWaffle',
      4.4,
      8900,
      7
    ),
    (
      v_category_id,
      'The Wolseley',
      'Eski bir araç showroom''undan dönüştürülmüş, görkemli bir grand café. Kahvaltıları özellikle ünlü.',
      'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/TheWolseley',
      4.4,
      7500,
      8
    ),
    (
      v_category_id,
      'Aqua Shard',
      'The Shard''ın 31. katında, Londra''nın en iyi manzaralarından biriyle modern İngiliz mutfağı.',
      'https://images.pexels.com/photos/260922/pexels-photo-260922.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/AquaShard',
      4.3,
      5600,
      9
    ),
    (
      v_category_id,
      'Chiltern Firehouse',
      'Eski bir itfaiye binasından lüks bir restorana dönüşmüş. Ünlülerin ve sosyetenin favorisi.',
      'https://images.pexels.com/photos/1395967/pexels-photo-1395967.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/ChilternFirehouse',
      4.4,
      2100,
      10
    ),
    (
      v_category_id,
      'Bob Bob Ricard',
      'Her masada ''Press for Champagne'' (Şampanya için butona basın) düğmesi var. Lüks ve eğlenceli bir ortam.',
      'https://images.pexels.com/photos/696218/pexels-photo-696218.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/BobBobRicard',
      4.5,
      4800,
      11
    );

END $$;
