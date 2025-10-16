/*
  # Add Remaining Paris Venues
  
  Pizza, Kahve, Kafe, Michelin, Yerel Lezzetler
  11 venues each = 55 venues
*/

DO $$
DECLARE
  v_pizza_id uuid;
  v_kahve_id uuid;
  v_kafe_id uuid;
  v_michelin_id uuid;
  v_yerel_id uuid;
BEGIN
  SELECT id INTO v_pizza_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'paris') AND slug = 'pizza';
  SELECT id INTO v_kahve_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'paris') AND slug = 'kahve';
  SELECT id INTO v_kafe_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'paris') AND slug = 'kafe';
  SELECT id INTO v_michelin_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'paris') AND slug = 'michelin';
  SELECT id INTO v_yerel_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'paris') AND slug = 'yerel-lezzetler';
  
  -- PIZZA
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_pizza_id, 'Pizzeria Popolare', 'İtalyan zinciri Big Mamma, her zaman kuyruk', 'Burrata Pizza', 'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg', 'https://maps.google.com/?q=Pizzeria+Popolare+Paris', 48.8706, 2.3376, 1, 4.3, 8500, ARRAY['Rezervasyon almıyor, erken gidin', 'Kuyruk 1 saat olabilir', 'Pizza dev boyutta', 'Aperol spritz alın']),
  
  (v_pizza_id, 'Pink Mamma', 'Big Mamma''nın en instagrammable mekanı', 'Truffle Pizza', 'https://images.pexels.com/photos/803963/pexels-photo-803963.jpeg', 'https://maps.google.com/?q=Pink+Mamma+Paris', 48.8821, 2.3387, 2, 4.4, 12000, ARRAY['4 kat, çiçek bahçesi gibi', 'Rezervasyon şart', 'Sosyal medya fenomeni', 'Akşam çok kalabalık']),
  
  (v_pizza_id, 'Ober Mamma', 'Big Mamma ailesi, odun fırını', 'Diavola', 'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg', 'https://maps.google.com/?q=Ober+Mamma+Paris', 48.8656, 2.3711, 3, 4.5, 9200, ARRAY['Napoli tarzı pizza', 'Hamur 48 saat mayalanır', 'Şarap seçimi geniş', 'Tatlılar harika']),
  
  (v_pizza_id, 'Faggio', 'Yerel İtalyan, otantik', 'Margherita', 'https://images.pexels.com/photos/1146760/pexels-photo-1146760.jpeg', 'https://maps.google.com/?q=Faggio+Paris', 48.8522, 2.3411, 4, 4.6, 1800, ARRAY['Küçük yer, samimi', 'Sahip İtalyan', 'Malzemeler İtalya''dan', 'Fiyatlar makul']),
  
  (v_pizza_id, 'Grazie', 'Modern İtalyan mutfağı', 'Burrata e Prosciutto', 'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg', 'https://maps.google.com/?q=Grazie+Paris', 48.8734, 2.3298, 5, 4.4, 2600, ARRAY['Şık dekorasyon', 'Aperitivo saati', 'Wine bar', 'Rahat ortam']),
  
  (v_pizza_id, 'Tripletta', 'Roma tarzı al taglio', 'Pizza by Slice', 'https://images.pexels.com/photos/803963/pexels-photo-803963.jpeg', 'https://maps.google.com/?q=Tripletta+Paris', 48.8589, 2.3477, 6, 4.5, 3400, ARRAY['Dilim satışı', 'Hızlı yemek için', 'Kalın hamur', 'Takeaway ideal']),
  
  (v_pizza_id, 'East Mamma', 'Big Mamma, 20. bölgede', 'Carbonara Pizza', 'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg', 'https://maps.google.com/?q=East+Mamma+Paris', 48.8656, 2.3956, 7, 4.3, 5200, ARRAY['Daha az turistik', 'Aynı kalite', 'Yerel atmosfer', 'Rezervasyon kolay']),
  
  (v_pizza_id, 'Il Brigante', 'Napoli efsanesi', 'Marinara', 'https://images.pexels.com/photos/1146760/pexels-photo-1146760.jpeg', 'https://maps.google.com/?q=Il+Brigante+Paris', 48.8823, 2.3556, 8, 4.7, 1200, ARRAY['Çok otantik', 'Küçük mekan', 'Napoli usulü', 'Tatlı yok']),
  
  (v_pizza_id, 'Amici Miei', 'Aile işletmesi', 'Quattro Formaggi', 'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg', 'https://maps.google.com/?q=Amici+Miei+Paris', 48.8467, 2.3523, 9, 4.4, 2100, ARRAY['Yerel halk gider', 'Sıcak karşılama', 'Ucuz', 'Rahat']),
  
  (v_pizza_id, 'Sacro Cuore', 'Montmartre''da İtalyan', 'Pesto Pizza', 'https://images.pexels.com/photos/803963/pexels-photo-803963.jpeg', 'https://maps.google.com/?q=Sacro+Cuore+Paris', 48.8867, 2.3431, 10, 4.2, 1600, ARRAY['Turistik bölge', 'Manzara var', 'Fiyat yüksek', 'Konum güzel']),
  
  (v_pizza_id, 'Bonnie', 'Fusion pizza', 'Korean BBQ Pizza', 'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg', 'https://maps.google.com/?q=Bonnie+Pizza+Paris', 48.8712, 2.3589, 11, 4.3, 980, ARRAY['Deneysel tatlar', 'Genç crowd', 'Trendy', 'Instagram worthy']);
  
  -- KAHVE
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_kahve_id, 'Café de Flore', 'Efsanevi Parisli kafe', 'Espresso', 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg', 'https://maps.google.com/?q=Cafe+de+Flore+Paris', 48.8543, 2.3324, 1, 4.2, 15000, ARRAY['Çok turistik ve pahalı', 'Tarih için gidin', 'Terrace''ta oturun', 'Sabah daha sakin']),
  
  (v_kahve_id, 'Terres de Café', 'Specialty coffee öncüsü', 'Pour Over', 'https://images.pexels.com/photos/1251175/pexels-photo-1251175.jpeg', 'https://maps.google.com/?q=Terres+de+Cafe+Paris', 48.8701, 2.3589, 2, 4.6, 1200, ARRAY['Kendi kavurması', 'Barista çok bilgili', 'Çekirdek satışı', 'Latte art kursu']),
  
  (v_kahve_id, 'Ten Belles', 'Hipster kahve tapınağı', 'Flat White', 'https://images.pexels.com/photos/1002740/pexels-photo-1002740.jpeg', 'https://maps.google.com/?q=Ten+Belles+Paris', 48.8711, 2.3645, 3, 4.5, 2800, ARRAY['Brunch harika', 'WiFi var', 'Çalışmak için ideal', 'Küçük yer']),
  
  (v_kahve_id, 'Café Kitsuné', 'Japon-Fransız fusion', 'Matcha Latte', 'https://images.pexels.com/photos/1415555/pexels-photo-1415555.jpeg', 'https://maps.google.com/?q=Cafe+Kitsune+Paris', 48.8634, 2.3356, 4, 4.4, 3500, ARRAY['Fashion brand cafe', 'Instagrammable', 'Pahalı', 'Palais Royal bahçesinde']),
  
  (v_kahve_id, 'Loustic', 'Marais''deki gizli cevher', 'Cold Brew', 'https://images.pexels.com/photos/851555/pexels-photo-851555.jpeg', 'https://maps.google.com/?q=Loustic+Paris', 48.8589, 2.3634, 5, 4.6, 890, ARRAY['Küçük ama kaliteli', 'Yerel favorisi', 'Oturma az', 'Takeaway yapın']),
  
  (v_kahve_id, 'Coutume Café', 'Paris specialty''nin kalbi', 'Chemex', 'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg', 'https://maps.google.com/?q=Coutume+Cafe+Paris', 48.8512, 2.3156, 6, 4.5, 1800, ARRAY['Geniş mekan', 'Brunch menü', 'Roastery var', 'Workshop yapıyorlar']),
  
  (v_kahve_id, 'Fragments', 'Minimalist Japon tarzı', 'Espresso Tonic', 'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg', 'https://maps.google.com/?q=Fragments+Paris', 48.8667, 2.3589, 7, 4.7, 620, ARRAY['Çok küçük', 'Sessiz', 'Quality focus', 'Pahalı']),
  
  (v_kahve_id, 'Boot Café', 'Cozy neighborhood spot', 'Cappuccino', 'https://images.pexels.com/photos/373639/pexels-photo-373639.jpeg', 'https://maps.google.com/?q=Boot+Cafe+Paris', 48.8734, 2.3678, 8, 4.5, 980, ARRAY['Yerel vibe', 'Samimi', 'Good playlist', 'Laptop friendly']),
  
  (v_kahve_id, 'La Caféothèque', 'Coffee geek paradise', 'Single Origin', 'https://images.pexels.com/photos/2467281/pexels-photo-2467281.jpeg', 'https://maps.google.com/?q=La+Cafeotheque+Paris', 48.8534, 2.3656, 9, 4.4, 1500, ARRAY['Dünya kahveleri', 'Cupping sessions', 'Çekirdek çeşidi çok', 'Bilgili staff']),
  
  (v_kahve_id, 'Télescope', 'Tiny but mighty', 'Espresso', 'https://images.pexels.com/photos/1307692/pexels-photo-1307692.jpeg', 'https://maps.google.com/?q=Telescope+Paris', 48.8656, 2.3411, 10, 4.6, 780, ARRAY['3-4 kişilik yer', 'Çok küçük', 'Kalite A+', 'Takeaway best']),
  
  (v_kahve_id, 'Café Oberkampf', 'All-day cafe', 'Café Crème', 'https://images.pexels.com/photos/1251176/pexels-photo-1251176.jpeg', 'https://maps.google.com/?q=Cafe+Oberkampf+Paris', 48.8656, 2.3789, 11, 4.3, 2100, ARRAY['Geniş', 'Rahat', 'Good food', 'WiFi güçlü']);
  
  -- KAFE (Beautiful Cafes)
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_kafe_id, 'Angelina Paris', 'Legendary hot chocolate', 'Chocolat Chaud L''Africain', 'https://images.pexels.com/photos/1907227/pexels-photo-1907227.jpeg', 'https://maps.google.com/?q=Angelina+Paris', 48.8656, 2.3278, 1, 4.3, 28000, ARRAY['Çok turistik', 'Sıra var', 'Mont Blanc pastası', 'Sabah erken gidin']),
  
  (v_kafe_id, 'Café des Deux Moulins', 'Amelie filminden', 'Crème Brûlée', 'https://images.pexels.com/photos/4518844/pexels-photo-4518844.jpeg', 'https://maps.google.com/?q=Cafe+des+Deux+Moulins+Paris', 48.8845, 2.3334, 2, 4.1, 8900, ARRAY['Film yüzünden turistik', 'Normal kafe', 'Montmartre''da', 'Fotoğraf için']),
  
  (v_kafe_id, 'Les Deux Magots', 'Hemingway''in yeri', 'Café au Lait', 'https://images.pexels.com/photos/1907226/pexels-photo-1907226.jpeg', 'https://maps.google.com/?q=Les+Deux+Magots+Paris', 48.8539, 2.3328, 3, 4.2, 18000, ARRAY['Pahalı', 'Tarihi', 'Terrace best', 'People watching']),
  
  (v_kafe_id, 'Café de la Paix', 'Opera yakını klasik', 'Éclair', 'https://images.pexels.com/photos/8951425/pexels-photo-8951425.jpeg', 'https://maps.google.com/?q=Cafe+de+la+Paix+Paris', 48.8711, 2.3312, 4, 4.3, 12000, ARRAY['Belle Époque dekoru', 'Çok şık', 'Dress code var', 'Pahalı']),
  
  (v_kafe_id, 'Carette', 'Place des Vosges', 'Millefeuille', 'https://images.pexels.com/photos/8951547/pexels-photo-8951547.jpeg', 'https://maps.google.com/?q=Carette+Paris', 48.8556, 2.3656, 5, 4.4, 8500, ARRAY['Muhteşem meydan', 'Weekend brunch', 'Reservation için', 'Tatlı kalitesi yüksek']),
  
  (v_kafe_id, 'Le Comptoir Général', 'Secret garden cafe', 'Cocktails', 'https://images.pexels.com/photos/5409010/pexels-photo-5409010.jpeg', 'https://maps.google.com/?q=Le+Comptoir+General+Paris', 48.8745, 2.3678, 6, 4.5, 4200, ARRAY['Hidden gem', 'Bahçe var', 'Event space', 'Akşam bar']),
  
  (v_kafe_id, 'Merci Café', 'Concept store içinde', 'Organic Lunch', 'https://images.pexels.com/photos/5409011/pexles-photo-5409011.jpeg', 'https://maps.google.com/?q=Merci+Cafe+Paris', 48.8601, 2.3656, 7, 4.4, 3800, ARRAY['Shopping yapın', 'Trendy', 'Good vibe', 'Instagram heaven']),
  
  (v_kafe_id, 'Shakespeare & Company Café', 'Bookstore cafe', 'American Brunch', 'https://images.pexels.com/photos/5409012/pexels-photo-5409012.jpeg', 'https://maps.google.com/?q=Shakespeare+Company+Cafe+Paris', 48.8523, 2.3467, 8, 4.3, 2600, ARRAY['Seine view', 'Kitap okuyun', 'Turistik', 'Kahvaltı güzel']),
  
  (v_kafe_id, 'Le Jardin du Petit Palais', 'Museum garden', 'Terrace Lunch', 'https://images.pexels.com/photos/8951546/pexels-photo-8951546.jpeg', 'https://maps.google.com/?q=Jardin+Petit+Palais+Paris', 48.8656, 2.3145, 9, 4.6, 1800, ARRAY['Gizli bahçe', 'Ücretsiz giriş', 'Sakin', 'Romantic']),
  
  (v_kafe_id, 'Café Charlot', 'Marais classic', 'Tartine', 'https://images.pexels.com/photos/4518848/pexels-photo-4518848.jpeg', 'https://maps.google.com/?q=Cafe+Charlot+Paris', 48.8634, 2.3623, 10, 4.2, 4500, ARRAY['See and be seen', 'Fashionista crowd', 'Weekend brunch', 'Terrace prime']),
  
  (v_kafe_id, 'Le Perchoir', 'Rooftop cafe bar', 'Sunset Drinks', 'https://images.pexels.com/photos/8951548/pexels-photo-8951548.jpeg', 'https://maps.google.com/?q=Le+Perchoir+Paris', 48.8656, 2.3823, 11, 4.4, 5200, ARRAY['360 view', 'Sunset için', 'Rezervasyon şart', 'Instagram must']);
  
  -- MICHELIN
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_michelin_id, 'Le Jules Verne', '2 yıldız, Eiffel Tower''da', 'Tasting Menu', 'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg', 'https://maps.google.com/?q=Le+Jules+Verne+Paris', 48.8584, 2.2945, 1, 4.5, 2800, ARRAY['Alain Ducasse imzalı', 'Manzara inanılmaz', 'Çok pahalı', '3 ay önceden rezervasyon']),
  
  (v_michelin_id, 'L''Arpège', '3 yıldız, vegetable focus', 'Vegetable Tasting', 'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg', 'https://maps.google.com/?q=L+Arpege+Paris', 48.8556, 2.3145, 2, 4.6, 980, ARRAY['Alain Passard efsane', 'Sebze bahçesi var', 'Seasonal menu', 'Minimum 400€']),
  
  (v_michelin_id, 'Guy Savoy', '3 yıldız, klasik Fransız', 'Artichoke Soup', 'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg', 'https://maps.google.com/?q=Guy+Savoy+Paris', 48.8578, 2.3312, 3, 4.7, 1200, ARRAY['Legendary', 'Seine view', 'Çok formal', 'Jacket required']),
  
  (v_michelin_id, 'Le Cinq', '3 yıldız, Four Seasons', 'Signature Tasting', 'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg', 'https://maps.google.com/?q=Le+Cinq+Paris', 48.8689, 2.3045, 4, 4.6, 1800, ARRAY['Christian Le Squer', 'Palace hotel içinde', 'Luxury ultimate', 'Wine pairing must']),
  
  (v_michelin_id, 'Alain Ducasse au Plaza Athénée', '3 yıldız, naturalité', 'Fish & Vegetables', 'https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg', 'https://maps.google.com/?q=Alain+Ducasse+Plaza+Athenee+Paris', 48.8656, 2.3045, 5, 4.5, 1600, ARRAY['No meat menu', 'Çok innovative', 'Avenue Montaigne', 'Fashion crowd']),
  
  (v_michelin_id, 'Septime', '1 yıldız, neo-bistro', 'Market Menu', 'https://images.pexels.com/photos/2456435/pexels-photo-2456435.jpeg', 'https://maps.google.com/?q=Septime+Paris', 48.8534, 2.3789, 6, 4.6, 2400, ARRAY['Rezervasyon imkansız', '2 ay önceden', 'Hipster michelin', 'Natural wine']),
  
  (v_michelin_id, 'Astrance', '3 yıldız, intimate', 'Chef''s Choice', 'https://images.pexels.com/photos/2456436/pexels-photo-2456436.jpeg', 'https://maps.google.com/?q=Astrance+Paris', 48.8612, 2.2878, 7, 4.7, 680, ARRAY['25 kişilik', 'Çok küçük', 'Pascal Barbot', 'Surprise menu']),
  
  (v_michelin_id, 'Le Meurice Alain Ducasse', '2 yıldız, palace', 'Versailles Menu', 'https://images.pexels.com/photos/262047/pexels-photo-262047.jpeg', 'https://maps.google.com/?q=Le+Meurice+Alain+Ducasse+Paris', 48.8656, 2.3289, 8, 4.5, 1400, ARRAY['Versailles dekoru', 'Çok baroque', 'Tourist favorite', 'Brunch legendary']),
  
  (v_michelin_id, 'Kei', '3 yıldız, Franco-Japonais', 'Fusion Tasting', 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg', 'https://maps.google.com/?q=Kei+Paris', 48.8656, 2.3278, 9, 4.6, 520, ARRAY['Kei Kobayashi', 'Japanese technique', 'French ingredients', 'Harmony perfect']),
  
  (v_michelin_id, 'Le Pré Catelan', '3 yıldız, Bois de Boulogne', 'Garden Tasting', 'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg', 'https://maps.google.com/?q=Le+Pre+Catelan+Paris', 48.8612, 2.2467, 10, 4.5, 890, ARRAY['Park içinde', 'Romantic ultimate', 'Frederic Anton', 'Summer terrace']),
  
  (v_michelin_id, 'Pierre Gagnaire', '3 yıldız, artistic', 'Multiple Plates', 'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg', 'https://maps.google.com/?q=Pierre+Gagnaire+Paris', 48.8712, 2.3089, 11, 4.6, 1100, ARRAY['Çok innovative', 'Art on plate', 'Complex flavors', 'Adventurous eaters']);
  
  -- YEREL LEZZETLER
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_yerel_id, 'Breizh Café', 'En iyi crêpe ve galette', 'Galette Complète', 'https://images.pexels.com/photos/2456437/pexels-photo-2456437.jpeg', 'https://maps.google.com/?q=Breizh+Cafe+Paris', 48.8589, 2.3634, 1, 4.5, 4800, ARRAY['Breton uzmanı', 'Cidre pairing', 'Organik malzeme', 'Reservation öneriliir']),
  
  (v_yerel_id, 'L''As du Fallafel', 'Marais''in efsane falafeli', 'Falafel Sandwich', 'https://images.pexels.com/photos/5409011/pexels-photo-5409011.jpeg', 'https://maps.google.com/?q=L+As+du+Fallafel+Paris', 48.8578, 2.3589, 2, 4.3, 12000, ARRAY['Uzun kuyruk', 'Pazar kapalı', 'Takeaway yapın', 'Çok ucuz']),
  
  (v_yerel_id, 'Chez Janou', 'Provençal mutfak', 'Ratatouille', 'https://images.pexels.com/photos/1907227/pexels-photo-1907227.jpeg', 'https://maps.google.com/?q=Chez+Janou+Paris', 48.8534, 2.3656, 3, 4.4, 5600, ARRAY['Terrace güzel', 'Pastis unlimited', 'Güneyfransa havası', 'Romantic']),
  
  (v_yerel_id, 'Bouillon Chartier', 'Historic bouillon', 'Boeuf Bourguignon', 'https://images.pexels.com/photos/8951425/pexels-photo-8951425.jpeg', 'https://maps.google.com/?q=Bouillon+Chartier+Paris', 48.8723, 2.3445, 4, 4.1, 28000, ARRAY['1896''dan beri', 'Çok ucuz', 'Turistik ama otantik', 'Art Nouveau dekoru']),
  
  (v_yerel_id, 'Le Comptoir du Relais', 'Bistro efsanesi', 'Confit de Canard', 'https://images.pexels.com/photos/4518844/pexels-photo-4518844.jpeg', 'https://maps.google.com/?q=Le+Comptoir+du+Relais+Paris', 48.8512, 2.3389, 5, 4.4, 3800, ARRAY['Yves Camdeborde', 'Bistronomy öncüsü', 'Rezervasyon zor', 'Öğle walk-in']),
  
  (v_yerel_id, 'Berthillon', 'Paris''in en iyi dondurmasi', 'Glace Artisanale', 'https://images.pexels.com/photos/2467281/pexels-photo-2467281.jpeg', 'https://maps.google.com/?q=Berthillon+Paris', 48.8523, 2.3556, 6, 4.5, 8900, ARRAY['Kuyruk var', 'Seine kenarında yiyin', 'Seasonal flavors', 'Ağustos kapalı']),
  
  (v_yerel_id, 'Du Pain et des Idées', 'En iyi ekmek', 'Pain des Amis', 'https://images.pexels.com/photos/8951547/pexels-photo-8951547.jpeg', 'https://maps.google.com/?q=Du+Pain+et+des+Idees+Paris', 48.8712, 2.3634, 7, 4.7, 2800, ARRAY['Sabah erken gidin', 'Escargot deneyin', 'Organic', 'Pazar pazartesi kapalı']),
  
  (v_yerel_id, 'Chez l''Ami Jean', 'Basque mutfağı', 'Riz au Lait', 'https://images.pexels.com/photos/5409010/pexels-photo-5409010.jpeg', 'https://maps.google.com/?q=Chez+l+Ami+Jean+Paris', 48.8578, 2.3078, 8, 4.5, 2400, ARRAY['Porsiyonlar dev', 'Paylaşmalı', 'Gürültülü ortam', 'Natural wine']),
  
  (v_yerel_id, 'Le Relais de l''Entrecôte', 'Sadece biftek', 'Steak Frites', 'https://images.pexels.com/photos/8951548/pexels-photo-8951548.jpeg', 'https://maps.google.com/?q=Le+Relais+de+l+Entrecote+Paris', 48.8534, 2.3289, 9, 4.3, 11000, ARRAY['Menü yok', 'Sadece biftek', 'Secret sos', 'Kuyruk var']),
  
  (v_yerel_id, 'Frenchie', 'Modern bistro', 'Market Menu', 'https://images.pexels.com/photos/4518848/pexels-photo-4518848.jpeg', 'https://maps.google.com/?q=Frenchie+Paris', 48.8656, 2.3411, 10, 4.6, 3200, ARRAY['Rezervasyon zor', 'Gregory Marchand', 'Neo-bistro', 'Wine bar next door']),
  
  (v_yerel_id, 'Pierre Hermé', 'Macaron tanrısı', 'Ispahan Macaron', 'https://images.pexels.com/photos/8951546/pexels-photo-8951546.jpeg', 'https://maps.google.com/?q=Pierre+Herme+Paris', 48.8534, 2.3323, 11, 4.6, 6800, ARRAY['En iyi macaron', 'Pahalı', 'Gift box alın', 'Signature Ispahan']);
  
END $$;
