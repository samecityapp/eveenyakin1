/*
  # Add Paris Hamburger Venues
  
  11 burger venues in Paris with full details
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT id INTO v_category_id FROM food_categories 
  WHERE city_id = (SELECT id FROM cities WHERE slug = 'paris') 
  AND slug = 'hamburger';
  
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, website_url, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_category_id, 'Blend Hamburger', 
   'Gourmet burger''ın Paris''teki öncüsü, et kalitesi mükemmel',
   'Blend Signature Burger',
   'https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg',
   'https://maps.google.com/?q=Blend+Hamburger+Paris',
   'https://www.blend-hamburger.com/',
   48.8566, 2.3522, 1, 4.5, 2800,
   ARRAY['Öğle saatlerinde çok kalabalık, rezervasyon yapın', 'Patates kızartmaları efsane, ekstra sipariş edin', 'Set menüler tek tek almaktan daha ekonomik', 'Craft beer seçenekleri çok iyi']),
  
  (v_category_id, 'Big Fernand', 
   'Fransız usulü burger, yerel peynirler ve soslar',
   'Le Victor',
   'https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg',
   'https://maps.google.com/?q=Big+Fernand+Paris',
   'https://www.bigfernand.com/',
   48.8584, 2.3470, 2, 4.4, 3200,
   ARRAY['Tüm malzemeler Fransız, kalite garanti', 'Sweet potato fries deneyin', 'Paris''te birçok şubesi var', 'Vejetaryen seçenekleri de mükemmel']),
  
  (v_category_id, 'PNY Burger', 
   'New York tarzı, büyük porsiyonlar',
   'The PNY Burger',
   'https://images.pexels.com/photos/3738730/pexels-photo-3738730.jpeg',
   'https://maps.google.com/?q=PNY+Burger+Paris',
   'https://www.pnyburger.com/',
   48.8628, 2.3447, 3, 4.3, 2100,
   ARRAY['Amerikan tarzı dev porsiyonlar', 'Milkshake''ler çok kalın ve doyurucu', 'Gece geç saatlere kadar açık', 'Paket servisi de var']),
  
  (v_category_id, 'Schwartz''s Deli', 
   'Montreal tarzı burger ve deli sandviçler',
   'Smoked Meat Burger',
   'https://images.pexels.com/photos/1556688/pexels-photo-1556688.jpeg',
   'https://maps.google.com/?q=Schwartz+Deli+Paris',
   null,
   48.8701, 2.3416, 4, 4.6, 890,
   ARRAY['Montreal usulü smoked meat mükemmel', 'Pickle''lar ev yapımı', 'Küçük mekan, kalabalık olabilir', 'Takeaway için ideal']),
  
  (v_category_id, 'East Side Burgers', 
   'Paris''in en hipster burger yeri',
   'East Side Classic',
   'https://images.pexels.com/photos/1624487/pexels-photo-1624487.jpeg',
   'https://maps.google.com/?q=East+Side+Burgers+Paris',
   null,
   48.8529, 2.3811, 5, 4.5, 1600,
   ARRAY['Marais semtinde, trendy atmosfer', 'DJ setleri akşamları', 'Vegan burger seçenekleri harika', 'Brunch menüsü var']),
  
  (v_category_id, 'Five Guys', 
   'Amerikan zinciri, Paris''te de var',
   'Bacon Cheeseburger',
   'https://images.pexels.com/photos/3738748/pexels-photo-3738748.jpeg',
   'https://maps.google.com/?q=Five+Guys+Paris',
   'https://restaurants.fiveguys.fr/',
   48.8738, 2.3364, 6, 4.2, 4500,
   ARRAY['Ücretsiz yer fıstığı', 'Patates unlimited, istediğiniz kadar', 'Standart kalite garanti', 'Champs-Élysées''de şubesi var']),
  
  (v_category_id, 'Cantine California', 
   'California tarzı sağlıklı burgerler',
   'Avocado Burger',
   'https://images.pexels.com/photos/1633525/pexels-photo-1633525.jpeg',
   'https://maps.google.com/?q=Cantine+California+Paris',
   'https://www.cantinecalifornia.fr/',
   48.8671, 2.3296, 7, 4.4, 1800,
   ARRAY['Glutensiz ekmek seçeneği', 'Organic malzemeler', 'Smoothie bar var', 'Fitness yapanlara ideal']),
  
  (v_category_id, 'Le Camion qui Fume', 
   'Parisli gourmet food truck''ın mağazası',
   'Signature Smokey Burger',
   'https://images.pexels.com/photos/580612/pexels-photo-580612.jpeg',
   'https://maps.google.com/?q=Le+Camion+qui+Fume+Paris',
   'https://www.lecamionquifume.com/',
   48.8522, 2.3711, 8, 4.6, 2200,
   ARRAY['Paris burger akımının öncüsü', 'BBQ sosu efsane', 'Öğle sırası uzun kuyruk', 'Online sipariş verin']),
  
  (v_category_id, 'Burger & Lobster', 
   'Premium burger ve lobster kombinasyonu',
   'Surf & Turf Combo',
   'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg',
   'https://maps.google.com/?q=Burger+Lobster+Paris',
   'https://www.burgerandlobster.com/',
   48.8699, 2.3076, 9, 4.5, 1400,
   ARRAY['Çok pahalı ama kalite üst düzey', 'Lobster roll da deneyin', 'Şık ortam, romantik akşam yemeği için', 'Rezervasyon şart']),
  
  (v_category_id, 'Fric Frac Club', 
   'Gizli bar konsepti, burger çok iyi',
   'Secret Burger',
   'https://images.pexels.com/photos/1556698/pexels-photo-1556698.jpeg',
   'https://maps.google.com/?q=Fric+Frac+Club+Paris',
   null,
   48.8656, 2.3589, 10, 4.3, 620,
   ARRAY['Gizli giriş, eğlenceli konsept', 'Kokteyller de mükemmel', 'Canlı müzik bazen', 'Gece geç saatlere kadar']),
  
  (v_category_id, 'HD Diner', 
   'Amerikan diner konsepti',
   'HD Classic Burger',
   'https://images.pexels.com/photos/2983101/pexels-photo-2983101.jpeg',
   'https://maps.google.com/?q=HD+Diner+Paris',
   'https://www.hddiner.com/',
   48.8584, 2.2945, 11, 4.1, 3800,
   ARRAY['50''s Amerikan diner dekorasyonu', 'Milkshake seçenekleri bol', 'Çocuk dostu', '24 saat açık bazı şubeler']);
  
END $$;
