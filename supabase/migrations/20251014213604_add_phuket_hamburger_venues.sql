/*
  # Add Phuket Hamburger Venues
  
  11 burger venues in Phuket with full details
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT id INTO v_category_id FROM food_categories 
  WHERE city_id = (SELECT id FROM cities WHERE slug = 'phuket') 
  AND slug = 'hamburger';
  
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, website_url, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_category_id, 'The Charm Dining Gallery', 
   'Patong''un en şık burger mekanı, premium malzemelerle hazırlanan gurme burgerler',
   'Wagyu Beef Burger',
   'https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg',
   'https://maps.google.com/?q=The+Charm+Dining+Gallery+Phuket',
   'https://www.facebook.com/TheCharmDiningGallery',
   7.8964, 98.2964, 1, 4.5, 850,
   ARRAY['Rezervasyon yapın, akşamları çok kalabalık', 'Sunset saatinde terastaki masa isteyin', 'Truffle fries ekstra sipariş edin', 'Happy hour''da kokteyl promosyonları var']),
  
  (v_category_id, 'Home Made Burger', 
   'Yerel halkın favorisi, ev yapımı ekmek ve soslarla',
   'Classic Homemade Burger',
   'https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg',
   'https://maps.google.com/?q=Home+Made+Burger+Phuket',
   null,
   7.8854, 98.2923, 2, 4.4, 650,
   ARRAY['Öğle saatlerinde set menü çok uygun', 'Ekmekler her sabah taze yapılır, erken gidin', 'Porsiyonlar çok büyük, paylaşmayı düşünün', 'Nakit ödemede küçük indirim yapıyorlar']),
  
  (v_category_id, 'Burger & Lobster', 
   'Lüks konsept, burger ve lobster kombinasyonu sunan tek yer',
   'Surf & Turf Burger',
   'https://images.pexels.com/photos/3738730/pexels-photo-3738730.jpeg',
   'https://maps.google.com/?q=Burger+Lobster+Phuket',
   'https://www.burgerandlobster.com/',
   7.8834, 98.3912, 3, 4.6, 920,
   ARRAY['Çok pahalı ama kalitesi buna değer', 'Online rezervasyonda %10 indirim', 'Lobster burger her zaman taze, kontrol edin', 'Dress code var, şık giyinin']),
  
  (v_category_id, 'Two Chefs Bar & Grill', 
   'Karon Beach''in en popüler burger yeri, canlı müzik eşliğinde',
   'Two Chefs Signature Burger',
   'https://images.pexels.com/photos/1556688/pexels-photo-1556688.jpeg',
   'https://maps.google.com/?q=Two+Chefs+Karon+Phuket',
   'https://www.twochefs.com/',
   7.8391, 98.2994, 4, 4.5, 1200,
   ARRAY['Akşam 7''den sonra canlı müzik başlar', 'Burger sosları çok ünlü, satın alabilirsiniz', 'Plaja 2 dk mesafede, yüzdükten sonra ideal', 'WiFi hızlı, çalışma için de kullanılabilir']),
  
  (v_category_id, 'The Green Man', 
   'İngiliz pub atmosferi, otantik İngiliz burgerleri',
   'London Burger',
   'https://images.pexels.com/photos/1624487/pexels-photo-1624487.jpeg',
   'https://maps.google.com/?q=The+Green+Man+Phuket',
   null,
   7.8923, 98.2961, 5, 4.3, 580,
   ARRAY['Premier League maçlarını büyük ekrandan izleyin', 'Fish & chips de mükemmel', 'Öğleden sonra 4-7 arası happy hour', 'Yerel biraları deneyin, tavsiye isteyin']),
  
  (v_category_id, 'Ribs & Rumps', 
   'Avustralya tarzı steak house, burgerleri de çok iyi',
   'Aussie Beef Burger',
   'https://images.pexels.com/photos/3738748/pexels-photo-3738748.jpeg',
   'https://maps.google.com/?q=Ribs+Rumps+Phuket',
   'https://www.ribsandrumps.com/',
   7.8892, 98.2989, 6, 4.4, 890,
   ARRAY['Et kalitesi çok yüksek', 'Gluten-free ekmek seçeneği var', 'Pazar brunch''ı çok popüler', 'Çocuk menüsü var, aile dostu']),
  
  (v_category_id, 'Aroi Burger', 
   'Tayland usulü baharatlı burgerler, farklı tatlar arayanlar için',
   'Thai Spicy Burger',
   'https://images.pexels.com/photos/1633525/pexels-photo-1633525.jpeg',
   'https://maps.google.com/?q=Aroi+Burger+Phuket',
   null,
   7.8745, 98.3123, 7, 4.2, 420,
   ARRAY['Acı seviyesini söyleyin, ayarlarlar', 'Tayland usulü patates kızartması deneyin', 'Çok ucuz, öğrenci dostu', 'Sadece öğle saatlerinde açık']),
  
  (v_category_id, 'Paradise Burger', 
   'Rawai''deki gizli cevher, plaj manzaralı',
   'Paradise Cheeseburger',
   'https://images.pexels.com/photos/580612/pexels-photo-580612.jpeg',
   'https://maps.google.com/?q=Paradise+Burger+Rawai',
   null,
   7.7834, 98.3278, 8, 4.6, 350,
   ARRAY['Sunset saatinde gidin, manzara muhteşem', 'Küçük mekan, rezervasyon şart', 'Sahibi çok samimi, sohbet edin', 'Mayo sosları ev yapımı, hepsini isteyin']),
  
  (v_category_id, 'Bimi Beach Club', 
   'Lüks beach club, pool party atmosferinde burger',
   'Poolside Burger',
   'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg',
   'https://maps.google.com/?q=Bimi+Beach+Club+Phuket',
   'https://www.bimibeach.com/',
   7.8123, 98.3456, 9, 4.4, 670,
   ARRAY['Giriş ücreti var ama yemekten düşülür', 'Havuz kenarı yatakları sabah 10''da rezerve edin', 'DJ setleri öğleden sonra başlar', 'Instagram için mükemmel, çok fotojenik']),
  
  (v_category_id, 'The Dock', 
   'Marina''da tekne sahiplerinin uğrak yeri',
   'Marina Burger',
   'https://images.pexels.com/photos/1556698/pexels-photo-1556698.jpeg',
   'https://maps.google.com/?q=The+Dock+Phuket',
   null,
   7.8067, 98.3189, 10, 4.3, 480,
   ARRAY['Yacht''lardan manzara eşliğinde yiyin', 'Akşam 6''da happy hour başlar', 'Balık sandviçleri de denemeye değer', 'Parking çok geniş']),
  
  (v_category_id, 'Fat Burger', 
   'Amerikan zinciri, standart kalite garanti',
   'Original Fat Burger',
   'https://images.pexels.com/photos/2983101/pexels-photo-2983101.jpeg',
   'https://maps.google.com/?q=Fat+Burger+Phuket',
   'https://www.fatburger.com/',
   7.8901, 98.2934, 11, 4.2, 920,
   ARRAY['24 saat açık, gece açlığı kurtarır', 'Drive-through var', 'Milkshake''ler çok kalın, pipet işe yaramaz', 'Set menüler tek başına sipariş etmekten ucuz']);
  
END $$;
