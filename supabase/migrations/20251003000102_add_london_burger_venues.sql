/*
  # Add London Burger Venues
  
  ## Summary
  Adds the first food category for London: Best Burgers (11 venues)
  
  ## Categories Added
  - En İyi Hamburgerciler (Best Burgers)
  
  ## Venues Added (11 total)
  1. Bleecker St. Burger - Minimalist perfection
  2. Patty & Bun - Sauce-heavy flavor bombs
  3. Black Bear Burger - Gourmet with brisket
  4. Honest Burgers - Reliable quality chain
  5. MEATliquor - Dirty but delicious American diner
  6. Mother Flipper - Street food legend
  7. Burger & Beyond - Thick and juicy patties
  8. Four Legs - Hidden pub gem
  9. Quality Chop House - Premium steakhouse burger
  10. Dip & Flip - Gravy-dipping concept
  11. The Beefsteaks - Market star focused on meat quality
*/

DO $$
DECLARE
  v_london_id uuid;
  v_category_id uuid;
BEGIN
  -- Get London city ID
  SELECT id INTO v_london_id FROM cities WHERE slug = 'londra';

  -- Create "En İyi Hamburgerciler" category
  INSERT INTO food_categories (city_id, name, slug, sort_order)
  VALUES (v_london_id, 'En İyi Hamburgerciler', 'hamburger', 1)
  RETURNING id INTO v_category_id;

  -- Add 11 burger venues
  INSERT INTO venues (food_category_id, name, description, image, map_link, sort_order) VALUES
    (
      v_category_id,
      'Bleecker St. Burger',
      'Sadeliğin zaferi. Kusursuz et, peynir ve ekmek. Felsefesi "daha azı daha çoktur" olanlar için.',
      'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/BleeckerBurger',
      1
    ),
    (
      v_category_id,
      'Patty & Bun',
      'Bol soslu, dağılan, lezzet bombası burgerler. Brioche ekmeği ve özel "Patty" sosuyla ikonik.',
      'https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/PattyAndBun',
      2
    ),
    (
      v_category_id,
      'Black Bear Burger',
      'Gurme dokunuşlar. Yavaş pişirilmiş dana kaburga (brisket) eklenmiş burgerleri ile fark yaratıyor.',
      'https://images.pexels.com/photos/1556698/pexels-photo-1556698.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/BlackBearBurger',
      3
    ),
    (
      v_category_id,
      'Honest Burgers',
      'Kalitesini asla bozmayan, güvenilir bir zincir. Biberiyeli patates kızartmaları en az burgerleri kadar meşhur.',
      'https://images.pexels.com/photos/1841108/pexels-photo-1841108.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/HonestBurgers',
      4
    ),
    (
      v_category_id,
      'MEATliquor',
      'Kirli ama lezzetli! Amerikan "diner" konsepti, cesur tatlar ve harika kokteyller.',
      'https://images.pexels.com/photos/2271107/pexels-photo-2271107.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/MEATliquor',
      5
    ),
    (
      v_category_id,
      'Mother Flipper',
      'Sokak yemeği efsanesi. Genellikle pazar yerlerinde bulunan, her zaman kalabalık ve beklemeye değer.',
      'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/MotherFlipper',
      6
    ),
    (
      v_category_id,
      'Burger & Beyond',
      'Eski bir sokak yemeği standından, şehrin en iyi restoranlarından birine dönüştü. Kalın ve sulu köfteleriyle ünlü.',
      'https://images.pexels.com/photos/1552635/pexels-photo-1552635.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/BurgerAndBeyond',
      7
    ),
    (
      v_category_id,
      'Four Legs',
      'Bir pub''ın içinde saklı bir cevher. Menüsü sürekli değişse de "Dexter" burgerleri kült bir takipçi kitlesine sahip.',
      'https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/FourLegs',
      8
    ),
    (
      v_category_id,
      'Quality Chop House',
      'Bir burgerciden çok, efsanevi bir et restoranı. Ama menülerindeki burger, yiyebileceğiniz en kaliteli ve lezzetlilerden biri.',
      'https://images.pexels.com/photos/1633525/pexels-photo-1633525.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/QualityChopHouse',
      9
    ),
    (
      v_category_id,
      'Dip & Flip',
      'Burgerinizi "gravy" sosuna batırma konsepti. Farklı ve doyurucu bir deneyim arayanlar için.',
      'https://images.pexels.com/photos/1633527/pexels-photo-1633527.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/DipAndFlip',
      10
    ),
    (
      v_category_id,
      'The Beefsteaks',
      'Et kalitesine odaklanan, pazar yerlerinin bir başka yıldızı. Steak sandviçleri de en az burgerleri kadar iyi.',
      'https://images.pexels.com/photos/1600711/pexels-photo-1600711.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/TheBeefsteaks',
      11
    );

END $$;
