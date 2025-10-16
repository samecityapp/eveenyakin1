/*
  # Add Remaining Roma Venues
  
  Kahve, Kafe, Michelin, Yerel = 44 venues
*/

DO $$
DECLARE
  v_kahve_id uuid;
  v_kafe_id uuid;
  v_michelin_id uuid;
  v_yerel_id uuid;
BEGIN
  SELECT id INTO v_kahve_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'roma') AND slug = 'kahve';
  SELECT id INTO v_kafe_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'roma') AND slug = 'kafe';
  SELECT id INTO v_michelin_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'roma') AND slug = 'michelin';
  SELECT id INTO v_yerel_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'roma') AND slug = 'yerel-lezzetler';
  
  -- KAHVE
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_kahve_id, 'Sant''Eustachio Il Caffè', '1938 efsane, odun ateşi', 'Gran Caffè', 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg', 'https://maps.google.com/?q=Sant+Eustachio+Rome', 41.8986, 12.4756, 1, 4.3, 17000, ARRAY['Şekerli gelir standart', 'Al banco içilir', 'Önce kasa', 'Pantheon yakın']),
  
  (v_kahve_id, 'Tazza D''Oro', 'Pantheon''un kahvesi', 'Granita di Caffè', 'https://images.pexels.com/photos/1251175/pexels-photo-1251175.jpeg', 'https://maps.google.com/?q=Tazza+Oro+Rome', 41.8992, 12.4767, 2, 4.4, 8900, ARRAY['Coffee granita summer', 'Tourist spot ama good', 'Standing bar', 'Fast service']),
  
  (v_kahve_id, 'Caffè Peru', 'Local Roman favorite', 'Espresso', 'https://images.pexels.com/photos/1002740/pexels-photo-1002740.jpeg', 'https://maps.google.com/?q=Caffe+Peru+Rome', 41.8945, 12.4834, 3, 4.5, 3200, ARRAY['Less touristy', 'Good price', 'Local crowd', 'Quick stop']),
  
  (v_kahve_id, 'Sciascia Caffè', 'Historic roastery', 'Cappuccino', 'https://images.pexels.com/photos/1415555/pexels-photo-1415555.jpeg', 'https://maps.google.com/?q=Sciascia+Caffe+Rome', 41.9067, 12.4589, 4, 4.6, 2400, ARRAY['Prati neighborhood', 'Since 1919', 'Own roasting', 'Sit down allowed']),
  
  (v_kahve_id, 'Caffè Sant''Eustachio (Prati)', 'Branch location', 'Gran Caffè', 'https://images.pexels.com/photos/851555/pexels-photo-851555.jpeg', 'https://maps.google.com/?q=Sant+Eustachio+Prati+Rome', 41.9034, 12.4623, 5, 4.4, 1800, ARRAY['Less crowded', 'Same quality', 'Vatican area', 'Easier access']),
  
  (v_kahve_id, 'Roscioli Caffè', 'Bakery + coffee', 'Espresso + Cornetto', 'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg', 'https://maps.google.com/?q=Roscioli+Caffe+Rome', 41.8945, 12.4712, 6, 4.5, 5600, ARRAY['Breakfast combo', 'Fresh pastries', 'Always queue', 'Worth it']),
  
  (v_kahve_id, 'Faro Caffè', 'Specialty third wave', 'Filter Coffee', 'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg', 'https://maps.google.com/?q=Faro+Caffe+Rome', 41.8989, 12.4834, 7, 4.6, 980, ARRAY['Modern approach', 'Single origin', 'Barista passionate', 'Small space']),
  
  (v_kahve_id, 'Barnum Café', 'Testaccio local', 'Latte Art', 'https://images.pexels.com/photos/373639/pexels-photo-373639.jpeg', 'https://maps.google.com/?q=Barnum+Cafe+Rome', 41.8789, 12.4789, 8, 4.5, 1600, ARRAY['Brunch spot', 'WiFi available', 'Work friendly', 'Good food too']),
  
  (v_kahve_id, 'Antico Caffè Brasile', 'Via Veneto classic', 'Espresso Lungo', 'https://images.pexels.com/photos/2467281/pexels-photo-2467281.jpeg', 'https://maps.google.com/?q=Antico+Caffe+Brasile+Rome', 41.9067, 12.4889, 9, 4.3, 2200, ARRAY['1940s atmosphere', 'Old school', 'Tourist area', 'Classic service']),
  
  (v_kahve_id, 'Caffè Farnese', 'Square view cafe', 'Macchiato', 'https://images.pexels.com/photos/1307692/pexels-photo-1307692.jpeg', 'https://maps.google.com/?q=Caffe+Farnese+Rome', 41.8945, 12.4689, 10, 4.2, 3400, ARRAY['Piazza seating', 'People watching', 'Pricier terrace', 'Beautiful square']),
  
  (v_kahve_id, 'Caffè Capitolino', 'Museum cafe', 'Cappuccino + View', 'https://images.pexels.com/photos/1251176/pexels-photo-1251176.jpeg', 'https://maps.google.com/?q=Caffe+Capitolino+Rome', 41.8931, 12.4828, 11, 4.4, 4200, ARRAY['Capitoline terrace', 'Forum view', 'Museum ticket free cafe', 'Hidden gem']);
  
  -- KAFE
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_kafe_id, 'Antico Caffè Greco', '1760 historic legend', 'Espresso al tavolo', 'https://images.pexels.com/photos/1907227/pexels-photo-1907227.jpeg', 'https://maps.google.com/?q=Antico+Caffe+Greco+Rome', 41.9056, 12.4823, 1, 4.2, 8900, ARRAY['Museum-like', 'Very expensive sitting', 'Historic experience', 'Tuxedo waiters']),
  
  (v_kafe_id, 'Caffè Propaganda', 'Modern bistro cafe', 'Brunch Menu', 'https://images.pexels.com/photos/4518844/pexels-photo-4518844.jpeg', 'https://maps.google.com/?q=Caffe+Propaganda+Rome', 41.8912, 12.4889, 2, 4.4, 3800, ARRAY['Colosseum area', 'All day dining', 'Good cocktails', 'Trendy spot']),
  
  (v_kafe_id, 'Caffè della Pace', 'Beautiful ivy covered', 'Aperitivo', 'https://images.pexels.com/photos/1907226/pexels-photo-1907226.jpeg', 'https://maps.google.com/?q=Caffe+della+Pace+Rome', 41.8989, 12.4712, 3, 4.3, 6200, ARRAY['Piazza Navona near', 'Ivy walls', 'Evening aperitivo', 'See and be seen']),
  
  (v_kafe_id, 'Giolitti', 'Legendary gelato cafe', 'Gelato + Espresso', 'https://images.pexels.com/photos/8951425/pexels-photo-8951425.jpeg', 'https://maps.google.com/?q=Giolitti+Rome', 41.9012, 12.4789, 4, 4.3, 24000, ARRAY['Since 1900', 'Gelato heaven', 'Always crowded', 'Institution']),
  
  (v_kafe_id, 'Caffè Ciampini', 'Villa Borghese terrace', 'Afternoon Tea', 'https://images.pexels.com/photos/8951547/pexels-photo-8951547.jpeg', 'https://maps.google.com/?q=Caffe+Ciampini+Rome', 41.9089, 12.4856, 5, 4.4, 2800, ARRAY['Park setting', 'Elegant', 'Expensive', 'Beautiful terrace']),
  
  (v_kafe_id, 'Pasticceria Regoli', 'Historic pastry shop', 'Maritozzo', 'https://images.pexels.com/photos/5409010/pexels-photo-5409010.jpeg', 'https://maps.google.com/?q=Pasticceria+Regoli+Rome', 41.8934, 12.5089, 6, 4.5, 3200, ARRAY['Since 1916', 'Best maritozzo', 'Local secret', 'Morning best']),
  
  (v_kafe_id, 'Dagnino', 'Sicilian pastries', 'Cannoli', 'https://images.pexels.com/photos/5409011/pexels-photo-5409011.jpeg', 'https://maps.google.com/?q=Dagnino+Rome', 41.9023, 12.4967, 7, 4.3, 4600, ARRAY['Sicilian specialties', 'Termini area', 'Tourist friendly', 'Good breakfast']),
  
  (v_kafe_id, 'Caffè Letterario', 'Book cafe', 'Light Lunch', 'https://images.pexels.com/photos/5409012/pexels-photo-5409012.jpeg', 'https://maps.google.com/?q=Caffe+Letterario+Rome', 41.8756, 12.4812, 8, 4.4, 2400, ARRAY['Ostiense cultural', 'Events venue', 'Books everywhere', 'Hip crowd']),
  
  (v_kafe_id, 'Said dal 1923', 'Chocolate heaven', 'Hot Chocolate', 'https://images.pexels.com/photos/8951546/pexels-photo-8951546.jpeg', 'https://maps.google.com/?q=Said+dal+1923+Rome', 41.9012, 12.4856, 9, 4.6, 5200, ARRAY['Winter hot chocolate', 'Artisan chocolates', 'Gift worthy', 'Worth the price']),
  
  (v_kafe_id, 'Caffè Perù Monti', 'Neighborhood gem', 'Aperitivo Hour', 'https://images.pexels.com/photos/4518848/pexels-photo-4518848.jpeg', 'https://maps.google.com/?q=Caffe+Peru+Monti+Rome', 41.8945, 12.4889, 10, 4.5, 1800, ARRAY['Monti district', 'Local vibe', 'Good prices', 'Outdoor seating']),
  
  (v_kafe_id, 'Caffè Rosati', 'Piazza del Popolo icon', 'Coffee + View', 'https://images.pexels.com/photos/8951548/pexels-photo-8951548.jpeg', 'https://maps.google.com/?q=Caffe+Rosati+Rome', 41.9106, 12.4767, 11, 4.1, 6800, ARRAY['Historic square', 'People watching', 'Tourist prices', 'Beautiful location']);
  
  -- MICHELIN
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_michelin_id, 'La Pergola', '3 yıldız, Heinz Beck', 'Tasting Menu', 'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg', 'https://maps.google.com/?q=La+Pergola+Rome', 41.9167, 12.4456, 1, 4.7, 2200, ARRAY['Roma''nın tek 3 yıldızı', 'View incredible', 'Jacket required', 'Months ahead booking']),
  
  (v_michelin_id, 'Il Pagliaccio', '2 yıldız, creative', 'Surprise Menu', 'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg', 'https://maps.google.com/?q=Il+Pagliaccio+Rome', 41.8956, 12.4723, 2, 4.6, 890, ARRAY['Asian influences', 'Innovative', 'Small intimate', 'Wine pairing excellent']),
  
  (v_michelin_id, 'Imàgo', '1 yıldız, rooftop Hassler', 'Roman Tasting', 'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg', 'https://maps.google.com/?q=Imago+Rome', 41.9067, 12.4834, 3, 4.5, 1200, ARRAY['Spanish Steps view', 'Sunset timing', 'Elegant', 'Terrace dining']),
  
  (v_michelin_id, 'Acquolina Hostaria', '1 yıldız, seafood', 'Crudo Selection', 'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg', 'https://maps.google.com/?q=Acquolina+Hostaria+Rome', 41.9134, 12.4912, 4, 4.6, 680, ARRAY['Raw fish specialist', 'Parioli area', 'Fresh daily', 'Intimate setting']),
  
  (v_michelin_id, 'Per Me', '1 yıldız, Giulio Terrinoni', 'Chef''s Selection', 'https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg', 'https://maps.google.com/?q=Per+Me+Rome', 41.8967, 12.4756, 5, 4.5, 520, ARRAY['Modern Italian', 'Seasonal focus', 'Creative plating', 'Relaxed atmosphere']),
  
  (v_michelin_id, 'All''Oro', '2 yıldız, Riccardo Di Giacinto', 'Gold Menu', 'https://images.pexels.com/photos/2456435/pexels-photo-2456435.jpeg', 'https://maps.google.com/?q=All+Oro+Rome', 41.9056, 12.4889, 6, 4.7, 780, ARRAY['Contemporary cuisine', 'Open kitchen', 'Michelin value', 'Central location']),
  
  (v_michelin_id, 'Tordomatto', '1 yıldız, Adriano Baldassarre', 'Market Menu', 'https://images.pexels.com/photos/2456436/pexels-photo-2456436.jpeg', 'https://maps.google.com/?q=Tordomatto+Rome', 41.9012, 12.4912, 7, 4.4, 620, ARRAY['Traditional meets modern', 'Roman classics elevated', 'Good wine cellar', 'Casual elegant']),
  
  (v_michelin_id, 'Enoteca La Torre', '1 yıldız, Villa Laetitia', 'Seasonal Tasting', 'https://images.pexels.com/photos/262047/pexels-photo-262047.jpeg', 'https://maps.google.com/?q=Enoteca+La+Torre+Rome', 41.9123, 12.4612, 8, 4.5, 420, ARRAY['Boutique hotel', 'Garden dining', 'Romantic', 'Seasonal ingredients']),
  
  (v_michelin_id, 'Moma', '1 yıldız, contemporary', 'Tasting Journey', 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg', 'https://maps.google.com/?q=Moma+Rome', 41.9089, 12.4823, 9, 4.4, 580, ARRAY['Modern art inspired', 'Creative dishes', 'Young chef', 'Good value']),
  
  (v_michelin_id, 'Metamorfosi', '1 yıldız, Roy Caceres', 'Metamorphosis Menu', 'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg', 'https://maps.google.com/?q=Metamorfosi+Rome', 41.9167, 12.4934, 10, 4.6, 720, ARRAY['Colombian chef', 'Fusion approach', 'Elegant space', 'Wine pairing unique']),
  
  (v_michelin_id, 'Pascucci al Porticciolo', '1 yıldız, seafood specialist', 'Fish Tasting', 'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg', 'https://maps.google.com/?q=Pascucci+al+Porticciolo+Rome', 41.7234, 12.2567, 11, 4.5, 890, ARRAY['Fiumicino location', 'Beach nearby', 'Fresh catch', 'Day trip worthy']);
  
  -- YEREL LEZZETLER
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_yerel_id, 'Roscioli', 'Carbonara masterpiece', 'Carbonara', 'https://images.pexels.com/photos/2456437/pexels-photo-2456437.jpeg', 'https://maps.google.com/?q=Roscioli+Rome', 41.8945, 12.4712, 1, 4.5, 8900, ARRAY['No cream in carbonara', 'Cheese shop too', 'Book impossible', 'Worth the effort']),
  
  (v_yerel_id, 'Felice a Testaccio', 'Cacio e pepe show', 'Cacio e Pepe', 'https://images.pexels.com/photos/5409011/pexels-photo-5409011.jpeg', 'https://maps.google.com/?q=Felice+Testaccio+Rome', 41.8789, 12.4734, 2, 4.4, 9200, ARRAY['Table-side mixing', 'Testaccio authentic', 'Call ahead', 'Roman tradition']),
  
  (v_yerel_id, 'Flavio al Velavevodetto', 'Testaccio trattoria', 'Rigatoni Pajata', 'https://images.pexels.com/photos/1907227/pexels-photo-1907227.jpeg', 'https://maps.google.com/?q=Flavio+al+Velavevodetto+Rome', 41.8778, 12.4756, 3, 4.5, 6800, ARRAY['Ancient wall setting', 'True Roman dishes', 'Local crowd', 'Reservation essential']),
  
  (v_yerel_id, 'Armando al Pantheon', 'Pantheon area classic', 'Amatriciana', 'https://images.pexels.com/photos/8951425/pexels-photo-8951425.jpeg', 'https://maps.google.com/?q=Armando+al+Pantheon+Rome', 41.8989, 12.4756, 4, 4.4, 4200, ARRAY['Family run since 1961', 'All Roman classics', 'Tourist but authentic', 'Lunch better']),
  
  (v_yerel_id, 'Trattoria Monti', 'Le Marche cuisine', 'Tajarin al Tartufo', 'https://images.pexels.com/photos/5409010/pexels-photo-5409010.jpeg', 'https://maps.google.com/?q=Trattoria+Monti+Rome', 41.8934, 12.5012, 5, 4.6, 3800, ARRAY['Truffle season best', 'Regional cooking', 'Family atmosphere', 'Good value']),
  
  (v_yerel_id, 'Supplizio', 'Supplì specialists', 'Classic Supplì', 'https://images.pexels.com/photos/8951547/pexels-photo-8951547.jpeg', 'https://maps.google.com/?q=Supplizio+Rome', 41.8912, 12.4689, 6, 4.5, 5400, ARRAY['Street food elevated', 'Many varieties', 'Takeaway perfect', 'Try all flavors']),
  
  (v_yerel_id, 'Trapizzino', 'Hybrid pizza pocket', 'Pollo alla Cacciatora', 'https://images.pexels.com/photos/4518844/pexels-photo-4518844.jpeg', 'https://maps.google.com/?q=Trapizzino+Rome', 41.8878, 12.4678, 7, 4.4, 8200, ARRAY['Roman invention', 'Quick lunch', 'Multiple locations', 'Cheap eats']),
  
  (v_yerel_id, 'Da Enzo al 29', 'Trastevere gem', 'All Pastas', 'https://images.pexels.com/photos/8951546/pexels-photo-8951546.jpeg', 'https://maps.google.com/?q=Da+Enzo+29+Rome', 41.8889, 12.4689, 8, 4.6, 12000, ARRAY['No reservation', 'Queue inevitable', 'Worth the wait', 'Daily specials']),
  
  (v_yerel_id, 'Checchino dal 1887', 'Quinto quarto masters', 'Coda alla Vaccinara', 'https://images.pexels.com/photos/4518848/pexels-photo-4518848.jpeg', 'https://maps.google.com/?q=Checchino+dal+1887+Rome', 41.8767, 12.4789, 9, 4.4, 2800, ARRAY['Offal specialists', 'Historic institution', 'Adventurous eaters', 'Wine cellar great']),
  
  (v_yerel_id, 'Gelateria del Teatro', 'Artisan gelato', 'Seasonal Flavors', 'https://images.pexels.com/photos/2467281/pexels-photo-2467281.jpeg', 'https://maps.google.com/?q=Gelateria+del+Teatro+Rome', 41.8967, 12.4689, 10, 4.7, 8600, ARRAY['Natural ingredients', 'Creative flavors', 'Small batches', 'Worth the queue']),
  
  (v_yerel_id, 'Forno Campo de'' Fiori', 'Pizza bianca icon', 'Pizza Bianca + Mortadella', 'https://images.pexels.com/photos/8951548/pexels-photo-8951548.jpeg', 'https://maps.google.com/?q=Forno+Campo+Fiori+Rome', 41.8956, 12.4723, 11, 4.4, 12000, ARRAY['Street food classic', 'Morning best', 'Mortadella panino', 'Always fresh']);
  
END $$;
