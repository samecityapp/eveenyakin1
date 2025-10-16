/*
  # Add London Pizza Venues
  
  ## Summary
  Adds pizza category and 11 top-rated pizza venues for London
  
  ## Category
  - En İyi Pizzacılar (Best Pizza Places)
  
  ## Venues (11 total)
  Mix of Neapolitan, New York style, and creative pizzas with ratings
*/

DO $$
DECLARE
  v_london_id uuid;
  v_category_id uuid;
BEGIN
  SELECT id INTO v_london_id FROM cities WHERE slug = 'londra';

  INSERT INTO food_categories (city_id, name, slug, sort_order)
  VALUES (v_london_id, 'En İyi Pizzacılar', 'pizza', 3)
  RETURNING id INTO v_category_id;

  INSERT INTO venues (food_category_id, name, description, image, map_link, google_rating, google_review_count, sort_order) VALUES
    (
      v_category_id,
      'Pizza Pilgrims',
      'Napoli tarzı pizzanın en eğlenceli ve en lezzetli hali. Kenarları pofuduk, malzemeleri kaliteli.',
      'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/PizzaPilgrims',
      4.6,
      3200,
      1
    ),
    (
      v_category_id,
      'Franco Manca',
      'Ekşi mayalı (sourdough) pizza konseptini uygun fiyata sunan, her zaman kalabalık ve popüler bir zincir.',
      'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/FrancoManca',
      4.5,
      2800,
      2
    ),
    (
      v_category_id,
      'Homeslice',
      'Paylaşmak için ideal olan devasa, 20-inç''lik pizzalarıyla ünlü. Dilimle de satış yapıyorlar.',
      'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Homeslice',
      4.6,
      2100,
      3
    ),
    (
      v_category_id,
      'L''Antica Pizzeria da Michele',
      'Napoli''deki ''Eat, Pray, Love'' filmiyle ünlenen efsane pizzacının Londra şubesi. Sadece iki çeşit pizza var: Margherita ve Marinara.',
      'https://images.pexels.com/photos/905847/pexels-photo-905847.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/DaMichele',
      4.4,
      3500,
      4
    ),
    (
      v_category_id,
      'Yard Sale Pizza',
      'Ödüllü, mahalleli pizzacısı konsepti. Yaratıcı ve lezzetli üst malzemeleriyle tanınıyorlar.',
      'https://images.pexels.com/photos/1435907/pexels-photo-1435907.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/YardSale',
      4.7,
      1200,
      5
    ),
    (
      v_category_id,
      'Rudy''s Pizza Napoletana',
      'Manchester''dan çıkıp Londra''yı fetheden, otantik Napoli pizzası konusunda en iyilerden biri.',
      'https://images.pexels.com/photos/1260968/pexels-photo-1260968.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/Rudys',
      4.8,
      2500,
      6
    ),
    (
      v_category_id,
      'Santa Maria',
      'Londra''daki otantik Napoli pizzası öncülerinden. Kaliteden asla ödün vermeyen, klasik bir mekan.',
      'https://images.pexels.com/photos/803290/pexels-photo-803290.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/SantaMaria',
      4.5,
      1400,
      7
    ),
    (
      v_category_id,
      'Voodoo Ray''s',
      'New York tarzı, devasa dilim pizzalar. Özellikle gece hayatının bir parçası olarak çok popüler.',
      'https://images.pexels.com/photos/1566837/pexels-photo-1566837.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/VoodooRays',
      4.3,
      1300,
      8
    ),
    (
      v_category_id,
      'Pizza Union',
      'Süper hızlı, süper ince ve süper ucuz. Bütçesi kısıtlı öğrenciler ve hızlı bir atıştırmalık arayanlar için ideal.',
      'https://images.pexels.com/photos/2531546/pexels-photo-2531546.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/PizzaUnion',
      4.6,
      4000,
      9
    ),
    (
      v_category_id,
      'Bad Boy Pizza Society',
      'Ödüllü bir sokak yemeği markasından restorana dönüştü. Sicilya ve New York tarzı arasında, kare ve pofuduk pizzalar.',
      'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/BadBoy',
      4.8,
      600,
      10
    ),
    (
      v_category_id,
      'Circolo Popolare',
      'Abartılı ve göz alıcı dekorasyonuyla ünlü bir İtalyan restoranı, ama pizzaları da gerçekten çok başarılı.',
      'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://maps.app.goo.gl/CircoloPopolare',
      4.5,
      7000,
      11
    );

END $$;
