/*
  # Add London Local Specialties
  
  ## Summary
  Adds local specialties category featuring iconic British and London-specific foods
  
  ## Category
  - Londra'nın Meşhur Lezzetleri (London's Famous Specialties)
  
  ## Venues (11 total)
  Traditional British food, pubs, markets, and iconic London treats
*/

DO $$
DECLARE
  v_london_id uuid;
  v_category_id uuid;
BEGIN
  SELECT id INTO v_london_id FROM cities WHERE slug = 'londra';

  INSERT INTO food_categories (city_id, name, slug, sort_order)
  VALUES (v_london_id, 'Londra''nın Meşhur Lezzetleri', 'yerel-lezzetler', 6)
  RETURNING id INTO v_category_id;

  INSERT INTO venues (food_category_id, name, description, image, map_link, google_rating, google_review_count, sort_order) VALUES
    (
      v_category_id,
      'Borough Market',
      'Londra''nın en eski ve en ünlü gıda pazarı. Peynirden balığa, taze ürünlerden sokak yemeğine kadar her şey burada.',
      'https://images.pexels.com/photos/264636/pexels-photo-264636.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/BoroughMarket',
      4.6,
      28000,
      1
    ),
    (
      v_category_id,
      'The Breakfast Club',
      'En iyi İngiliz kahvaltısı ve brunch için. Pancake''leri ve full English breakfast''ı meşhur.',
      'https://images.pexels.com/photos/101533/pexels-photo-101533.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/BreakfastClub',
      4.4,
      12000,
      2
    ),
    (
      v_category_id,
      'Pieminister',
      'Klasik İngiliz turta (pie) konsepti. Biftek & böbrek, tavuk mantarlı ve vejetaryen seçenekler.',
      'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Pieminister',
      4.5,
      2800,
      3
    ),
    (
      v_category_id,
      'Poppies Fish & Chips',
      'Geleneksel İngiliz balık ekmek (fish & chips). 1950''ler dekorasyonlu nostaljik bir mekan.',
      'https://images.pexels.com/photos/2374946/pexels-photo-2374946.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Poppies',
      4.3,
      8900,
      4
    ),
    (
      v_category_id,
      'Greggs',
      'İngiliz sokak yemeğinin simgesi. Ucuz, lezzetli ve her köşede bulunan sosis bohçası (sausage roll) zinciri.',
      'https://images.pexels.com/photos/205961/pexels-photo-205961.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Greggs',
      4.2,
      15000,
      5
    ),
    (
      v_category_id,
      'Beigel Bake',
      '24 saat açık, efsanevi Brick Lane simiti (beigel). Dumanlı somon ve krem peynirli simiti unutulmaz.',
      'https://images.pexels.com/photos/162971/bagel-sesame-roll-baked-goods-162971.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/BeigelBake',
      4.4,
      5600,
      6
    ),
    (
      v_category_id,
      'The Windmill (pub)',
      'Otantik İngiliz pub deneyimi. Sunday roast (pazar kızartması) Londra''nın en iyilerinden.',
      'https://images.pexels.com/photos/1267696/pexels-photo-1267696.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Windmill',
      4.5,
      3400,
      7
    ),
    (
      v_category_id,
      'Bao',
      'Tayvan tarzı bao (buharda pişmiş hamur) restoranı. Modern ve Asyalı twist ile Londra''nın favorisi.',
      'https://images.pexels.com/photos/4518843/pexels-photo-4518843.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Bao',
      4.5,
      6700,
      8
    ),
    (
      v_category_id,
      'Fortnum & Mason',
      '1707''den beri kraliyet ailesinin tedarikçisi. Çay seçkisi, hamur işleri ve lüks yiyecekler için.',
      'https://images.pexels.com/photos/1055270/pexels-photo-1055270.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/FortnumMason',
      4.6,
      16000,
      9
    ),
    (
      v_category_id,
      'St. John',
      '''Nose to tail'' (baştan kuyruğa) felsefesiyle tanınan, İngiliz mutfağını yeniden popülerleştiren restoran.',
      'https://images.pexels.com/photos/769289/pexels-photo-769289.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/StJohn',
      4.6,
      1800,
      10
    ),
    (
      v_category_id,
      'Brick Lane Curry Houses',
      'Londra''nın ünlü Bangla mahallesi. Otantik hint/Bangladeş mutfağı için onlarca restoran.',
      'https://images.pexels.com/photos/1340116/pexels-photo-1340116.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/BrickLane',
      4.3,
      22000,
      11
    );

END $$;
