/*
  # Add Remaining Phuket Venues
  
  Pizza, Kahve, Yerel Lezzetler, Manzaralı Barlar, Deniz Ürünleri
  11 venues each = 55 total venues
*/

DO $$
DECLARE
  v_pizza_id uuid;
  v_kahve_id uuid;
  v_yerel_id uuid;
  v_bar_id uuid;
  v_deniz_id uuid;
BEGIN
  -- Get category IDs
  SELECT id INTO v_pizza_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'phuket') AND slug = 'pizza';
  SELECT id INTO v_kahve_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'phuket') AND slug = 'kahve-kafe';
  SELECT id INTO v_yerel_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'phuket') AND slug = 'yerel-lezzetler';
  SELECT id INTO v_bar_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'phuket') AND slug = 'manzarali-barlar';
  SELECT id INTO v_deniz_id FROM food_categories WHERE city_id = (SELECT id FROM cities WHERE slug = 'phuket') AND slug = 'deniz-urunleri';
  
  -- PIZZA VENUES
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_pizza_id, 'Da Maurizio', 'İtalyan sahipli, odun fırınında pişen otantik Napoli pizzası', 'Margherita DOC', 'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg', 'https://maps.google.com/?q=Da+Maurizio+Phuket', 7.8923, 98.2978, 1, 4.7, 1200, ARRAY['Rezervasyon şart, 2 gün önceden', 'Hamur 48 saat mayalanır', 'San Marzano domatesi İtalya''dan gelir', 'Tatlıları da mükemmel']),
  
  (v_pizza_id, 'The Pizza Company', 'Tayland zinciri, yerel damak tadına uygun', 'Tom Yum Pizza', 'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg', 'https://maps.google.com/?q=Pizza+Company+Phuket', 7.8867, 98.2912, 2, 4.1, 890, ARRAY['Tayland usulü pizzalar ilginç', 'Delivery çok hızlı', 'Büyük boy alın, daha ekonomik', 'Garlic bread ücretsiz geliyor']),
  
  (v_pizza_id, 'Crust', 'Modern yorumlar, ince hamur uzmanı', 'Truffle Mushroom Pizza', 'https://images.pexels.com/photos/803963/pexels-photo-803963.jpeg', 'https://maps.google.com/?q=Crust+Phuket', 7.8956, 98.3001, 3, 4.5, 670, ARRAY['Vegan seçenekler var', 'Glutensiz hamur mevcut', 'Açık mutfak, pizzacıyı izleyin', 'Wine pairing önerin']),
  
  (v_pizza_id, 'Italiano Delight', 'Aile işletmesi, ev yapımı malzemeler', 'Four Seasons', 'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg', 'https://maps.google.com/?q=Italiano+Delight+Phuket', 7.8712, 98.2889, 4, 4.4, 520, ARRAY['Küçük mekan, samimi', 'Soslar ev yapımı', 'Çocuklara hamur yoğurma öğretiyorlar', 'Fiyatlar çok makul']),
  
  (v_pizza_id, 'Fire Grill', 'Steak house ama pizzaları da ünlü', 'BBQ Meat Lovers', 'https://images.pexels.com/photos/1146760/pexels-photo-1146760.jpeg', 'https://maps.google.com/?q=Fire+Grill+Phuket', 7.8845, 98.2945, 5, 4.3, 780, ARRAY['Et pizza kombinasyonu', 'Porsiyonlar dev', 'Happy hour 5-7', 'Parking ücretsiz']),
  
  (v_pizza_id, 'New York Slice', 'Amerikan tarzı dilim pizza', 'Pepperoni Slice', 'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg', 'https://maps.google.com/?q=New+York+Slice+Phuket', 7.8923, 98.2967, 6, 4.2, 620, ARRAY['Dilim pizza satışı var', 'Gece 2''ye kadar açık', 'Brooklyn lager var', 'Turistik bölgede']),
  
  (v_pizza_id, 'Rustico', 'Farm to table konsept', 'Garden Fresh Pizza', 'https://images.pexels.com/photos/803963/pexels-photo-803963.jpeg', 'https://maps.google.com/?q=Rustico+Phuket', 7.8656, 98.3123, 7, 4.6, 450, ARRAY['Sebzeler organik', 'Haftalık menü değişir', 'Chef''s table rezerve edin', 'Cooking class veriyorlar']),
  
  (v_pizza_id, 'Mamma Mia', 'Turist favorisi, hızlı servis', 'Mamma''s Special', 'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg', 'https://maps.google.com/?q=Mamma+Mia+Phuket', 7.8912, 98.2956, 8, 4.3, 980, ARRAY['Plaja çok yakın', 'Çocuk indirimi var', 'WiFi hızlı', 'Servis bazen yavaş']),
  
  (v_pizza_id, 'Paradise Pizza', 'Beach delivery yapan tek yer', 'Hawaiian Paradise', 'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg', 'https://maps.google.com/?q=Paradise+Pizza+Phuket', 7.8234, 98.3289, 9, 4.1, 340, ARRAY['Plaja delivery', 'Pickup indirimli', 'Soğuk pizza garantisi', 'Nakit ödemede %5 off']),
  
  (v_pizza_id, 'Sotto', 'Fine dining pizza', 'White Truffle Pizza', 'https://images.pexels.com/photos/1146760/pexels-photo-1146760.jpeg', 'https://maps.google.com/?q=Sotto+Phuket', 7.8878, 98.2989, 10, 4.7, 560, ARRAY['Çok pahalı', 'Şık ortam', 'Wine selection geniş', 'Tasting menu var']),
  
  (v_pizza_id, 'Pizza Hot', 'Yerel zincir, ekonomik', 'Thai Seafood Pizza', 'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg', 'https://maps.google.com/?q=Pizza+Hot+Phuket', 7.8956, 98.2934, 11, 4.0, 710, ARRAY['Çok ucuz', 'Kalite orta', 'Öğrenci popüler', 'Yerel içecekler var']);
  
  -- KAHVE & KAFE VENUES
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_kahve_id, 'Phuket Coffee Roaster', 'Kendi kavurması, specialty coffee', 'Single Origin Pour Over', 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg', 'https://maps.google.com/?q=Phuket+Coffee+Roaster', 7.8845, 98.2923, 1, 4.6, 820, ARRAY['Barista çok bilgili', 'Çekirdek satışı var', 'Latte art kursu veriyorlar', 'AC çok soğuk']),
  
  (v_kahve_id, 'Acqua Restaurant', 'İtalyan restoranı ama kahvesi efsane', 'Espresso Macchiato', 'https://images.pexels.com/photos/1251175/pexels-photo-1251175.jpeg', 'https://maps.google.com/?q=Acqua+Phuket', 7.8912, 98.2978, 2, 4.7, 1100, ARRAY['Sabah kahvaltı harika', 'Lüks ortam', 'Manzara muhteşem', 'Pahalı ama değer']),
  
  (v_kahve_id, 'Coffee Club', 'Tayland zinciri, her yerde var', 'Thai Iced Coffee', 'https://images.pexels.com/photos/1002740/pexels-photo-1002740.jpeg', 'https://maps.google.com/?q=Coffee+Club+Phuket', 7.8889, 98.2945, 3, 4.2, 950, ARRAY['AVM''lerde şube var', 'WiFi iyi', 'Çalışmak için ideal', 'AC güçlü']),
  
  (v_kahve_id, 'Boathouse Wine & Grill', 'Beach club cafe', 'Cold Brew', 'https://images.pexels.com/photos/1415555/pexels-photo-1415555.jpeg', 'https://maps.google.com/?q=Boathouse+Phuket', 7.8234, 98.3312, 4, 4.5, 780, ARRAY['Plaj kenarında', 'Sunset için perfect', 'Brunch harika', 'Rezervasyon yapın']),
  
  (v_kahve_id, 'Café del Mar', 'İspanyol tarzı beach cafe', 'Café Con Leche', 'https://images.pexels.com/photos/851555/pexels-photo-851555.jpeg', 'https://maps.google.com/?q=Cafe+del+Mar+Phuket', 7.8156, 98.3378, 5, 4.4, 620, ARRAY['Lounge müzik', 'Shisha var', 'Akşamları DJ', 'Turistik']),
  
  (v_kahve_id, 'Local Cafe', 'Yerel halk gider, otantik', 'Traditional Thai Coffee', 'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg', 'https://maps.google.com/?q=Local+Cafe+Phuket', 7.8678, 98.3089, 6, 4.3, 340, ARRAY['Çok ucuz', 'İngilizce kısıtlı', 'Tayland kahvesi', 'Breakfast set 60 baht']),
  
  (v_kahve_id, 'Starbucks Reserve', 'Premium Starbucks', 'Nitro Cold Brew', 'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg', 'https://maps.google.com/?q=Starbucks+Reserve+Phuket', 7.8901, 98.2967, 7, 4.4, 1500, ARRAY['Central Festival içinde', 'Geniş mekan', 'Turist çok', 'WiFi hızlı']),
  
  (v_kahve_id, 'Tunk Ka Cafe', 'Manzaralı tepedeki cafe', 'Cappuccino with View', 'https://images.pexels.com/photos/373639/pexels-photo-373639.jpeg', 'https://maps.google.com/?q=Tunk+Ka+Cafe+Phuket', 7.8123, 98.3489, 8, 4.8, 1200, ARRAY['360 derece manzara', 'Sunset için gidin', 'Yokuş çıkış zor', 'Instagram heaven']),
  
  (v_kahve_id, 'Torry''s Ice Cream', 'Dondurma + kahve', 'Affogato', 'https://images.pexels.com/photos/2467281/pexels-photo-2467281.jpeg', 'https://maps.google.com/?q=Torry+Ice+Cream+Phuket', 7.8845, 98.2934, 9, 4.5, 680, ARRAY['Dondurma ev yapımı', 'Thai tea flavor deneyin', 'Çocuklar seviyor', 'Küçük mekan']),
  
  (v_kahve_id, 'The Coffee Tribe', 'Hipster kafe', 'V60 Pour Over', 'https://images.pexels.com/photos/1307692/pexels-photo-1307692.jpeg', 'https://maps.google.com/?q=Coffee+Tribe+Phuket', 7.8756, 98.3012, 10, 4.3, 420, ARRAY['Yerel sanat sergisi', 'Vegan süt var', 'Sessiz ortam', 'Kitap okuma köşesi']),
  
  (v_kahve_id, 'Black Canyon Coffee', 'Tayland zinciri', 'Thai Coffee Frappe', 'https://images.pexels.com/photos/1251176/pexels-photo-1251176.jpeg', 'https://maps.google.com/?q=Black+Canyon+Phuket', 7.8923, 98.2945, 11, 4.1, 890, ARRAY['Food menü geniş', 'AC çok güçlü', 'WiFi free', 'Masa başı şarj var']);
  
  -- YEREL LEZZETLER (Thai Street Food)
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_yerel_id, 'Raya Restaurant', 'Eski Phuket evinde, authentic Thai', 'Phuket Lobster', 'https://images.pexels.com/photos/1907227/pexels-photo-1907227.jpeg', 'https://maps.google.com/?q=Raya+Restaurant+Phuket', 7.8812, 98.3912, 1, 4.6, 1500, ARRAY['Tarihi bina', 'Yerel aileler gider', 'Porsiyonlar büyük', 'Nakit only']),
  
  (v_yerel_id, 'Pad Thai Shop', 'En iyi pad thai', 'Original Pad Thai', 'https://images.pexels.com/photos/4518844/pexels-photo-4518844.jpeg', 'https://maps.google.com/?q=Pad+Thai+Shop+Phuket', 7.8845, 98.2923, 2, 4.7, 890, ARRAY['Sıra var, sabırlı olun', 'Teflon wok kullanmıyorlar', 'Acılık ayarlanabilir', '50 baht, çok ucuz']),
  
  (v_yerel_id, 'Phuket Old Town Market', 'Sunday walking street, sokak yemekleri', 'Mixed Street Food', 'https://images.pexels.com/photos/5409010/pexels-photo-5409010.jpeg', 'https://maps.google.com/?q=Old+Town+Market+Phuket', 7.8889, 98.3889, 3, 4.5, 2200, ARRAY['Sadece pazar günleri', '17:00-22:00 arası', 'Her stant deneyin', 'Nakit getirin']),
  
  (v_yerel_id, 'Som Tam Jay So', 'Som tam (papaya salatası) uzmanı', 'Som Tam Thai', 'https://images.pexels.com/photos/1907226/pexels-photo-1907226.jpeg', 'https://maps.google.com/?q=Som+Tam+Jay+So+Phuket', 7.8767, 98.3823, 4, 4.4, 620, ARRAY['Çok acı yapıyorlar', 'Yerel halk kuyrukta', 'Oturma yeri yok', 'Takeaway yapın']),
  
  (v_yerel_id, 'Mee Ton Poe', 'Hokkien noodle ünlü', 'Hokkien Mee', 'https://images.pexels.com/photos/8951425/pexels-photo-8951425.jpeg', 'https://maps.google.com/?q=Mee+Ton+Poe+Phuket', 7.8823, 98.3901, 5, 4.6, 780, ARRAY['3 kuşak aile işletmesi', 'Secret recipe', 'Öğle 11-14 arası', 'Tükenir, erken gidin']),
  
  (v_yerel_id, 'Laem Hin Seafood', 'Yerel deniz ürünleri', 'Crab Curry', 'https://images.pexels.com/photos/5409011/pexels-photo-5409011.jpeg', 'https://maps.google.com/?q=Laem+Hin+Seafood+Phuket', 7.9123, 98.3567, 6, 4.5, 1100, ARRAY['Akşam çok kalabalık', 'Balıkları seçin, tartın', 'Fiyat kg başına', 'Baharat seviyesi sorun']),
  
  (v_yerel_id, 'Nai Harn Beach Vendors', 'Plaj satıcıları, mango sticky rice', 'Mango Sticky Rice', 'https://images.pexels.com/photos/8951547/pexels-photo-8951547.jpeg', 'https://maps.google.com/?q=Nai+Harn+Beach+Phuket', 7.7812, 98.3023, 7, 4.3, 450, ARRAY['Plajda gezerler', 'Taze mango', 'Pazarlık yapılır', 'Yüzmeden sonra ideal']),
  
  (v_yerel_id, 'Kopitiam by Wilai', 'Kahvaltı uzmanı, yerel', 'Kaya Toast Set', 'https://images.pexels.com/photos/5409012/pexels-photo-5409012.jpeg', 'https://maps.google.com/?q=Kopitiam+Wilai+Phuket', 7.8856, 98.3878, 8, 4.4, 520, ARRAY['Sabah 6''da açılır', 'Traditional breakfast', 'Iced coffee mükemmel', 'Yerel ambiyans']),
  
  (v_yerel_id, 'Suwannee Seafood', 'Rawai''de fresh seafood', 'Grilled Fish', 'https://images.pexels.com/photos/8951548/pexels-photo-8951548.jpeg', 'https://maps.google.com/?q=Suwannee+Seafood+Rawai', 7.7845, 98.3289, 9, 4.5, 680, ARRAY['Balık taze, o gün tutulmuş', 'Deniz manzarası', 'Sunset perfect', 'Rezervasyon yapın']),
  
  (v_yerel_id, 'Pak Nam Seafood', 'Pier''de seafood stalls', 'Mixed Seafood Grill', 'https://images.pexels.com/photos/4518848/pexels-photo-4518848.jpeg', 'https://maps.google.com/?q=Pak+Nam+Seafood+Phuket', 7.8234, 98.4123, 10, 4.4, 890, ARRAY['Her stant farklı', 'En kalabalık olanı seçin', 'Çok ucuz', 'Turistik değil']),
  
  (v_yerel_id, 'One Chun Cafe', 'Dim sum + breakfast', 'Dim Sum Set', 'https://images.pexels.com/photos/8951546/pexels-photo-8951546.jpeg', 'https://maps.google.com/?q=One+Chun+Cafe+Phuket', 7.8878, 98.3856, 11, 4.6, 920, ARRAY['Sabah 7-11 arası', 'Taze dim sum', 'Yerel çok sever', 'Sıra var weekendlerde']);
  
  -- MANZARALI BARLAR
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_bar_id, 'KEE Sky Lounge', 'Rooftop bar, 360 manzara', 'Signature Cocktail', 'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg', 'https://maps.google.com/?q=KEE+Sky+Lounge+Phuket', 7.8923, 98.2989, 1, 4.7, 1800, ARRAY['Sunset için 18:00''de gidin', 'Dress code var', 'Rezervasyon şart', 'Minimum spend var']),
  
  (v_bar_id, 'Bimi Beach Club', 'Beach club bar, infinity pool', 'Mojito', 'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg', 'https://maps.google.com/?q=Bimi+Beach+Club+Phuket', 7.8123, 98.3456, 2, 4.6, 1500, ARRAY['Giriş ücreti var', 'Pool party cumartesi', 'DJ sets', 'Instagram perfect']),
  
  (v_bar_id, 'Catch Beach Club', 'Bang Tao beach', 'Passion Fruit Martini', 'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg', 'https://maps.google.com/?q=Catch+Beach+Club+Phuket', 7.9812, 98.2923, 3, 4.5, 1200, ARRAY['Lüks crowd', 'Pahalı', 'Müzik yüksek', 'Sunset amazing']),
  
  (v_bar_id, 'After Beach Bar', 'Rawai sunset bar', 'Chang Beer Bucket', 'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg', 'https://maps.google.com/?q=After+Beach+Bar+Rawai', 7.7834, 98.3267, 4, 4.4, 680, ARRAY['Çok ucuz', 'Yerel vibe', 'Pool table var', 'Backpacker popüler']),
  
  (v_bar_id, 'Xana Beach Club', 'Bang Tao luxury', 'Champagne', 'https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg', 'https://maps.google.com/?q=Xana+Beach+Club+Phuket', 7.9923, 98.2878, 5, 4.7, 890, ARRAY['Çok lüks', 'Influencer çok', 'Private cabanas', 'Çok pahalı']),
  
  (v_bar_id, 'Joe''s Downstairs', 'Kata beach institution', 'Long Island Iced Tea', 'https://images.pexels.com/photos/2456435/pexels-photo-2456435.jpeg', 'https://maps.google.com/?q=Joe+Downstairs+Phuket', 7.8134, 98.2989, 6, 4.3, 1400, ARRAY['Gece 2''ye kadar', 'Çok kalabalık', 'Ucuz drinks', 'Backpacker favorisi']),
  
  (v_bar_id, 'Babylon Beach Club', 'Patong beach party', 'Tequila Shots', 'https://images.pexels.com/photos/2456436/pexels-photo-2456436.jpeg', 'https://maps.google.com/?q=Babylon+Beach+Club+Phuket', 7.8945, 98.2945, 7, 4.2, 780, ARRAY['Party hard', 'Fire show', 'Foam party bazen', 'Genç crowd']),
  
  (v_bar_id, 'Stereo Lab', 'Kamala hidden gem', 'Craft Beer Selection', 'https://images.pexels.com/photos/262047/pexels-photo-262047.jpeg', 'https://maps.google.com/?q=Stereo+Lab+Kamala', 7.9534, 98.2812, 8, 4.5, 420, ARRAY['Vinyl müzik', 'Craft beer focus', 'Chill vibe', 'Sakin']),
  
  (v_bar_id, 'Ska Bar', 'Kata viewpoint', 'Red Bull Vodka', 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg', 'https://maps.google.com/?q=Ska+Bar+Kata', 7.8089, 98.3012, 9, 4.4, 890, ARRAY['Tepe manzarası', 'Rasta vibe', 'Reggae müzik', 'Chill crowd']),
  
  (v_bar_id, 'Phuket Balcony', 'Old town cocktail bar', 'Thai Basil Smash', 'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg', 'https://maps.google.com/?q=Phuket+Balcony', 7.8845, 98.3889, 10, 4.6, 560, ARRAY['Speakeasy style', 'Craft cocktails', 'Trendy', 'Rezervasyon önerilir']),
  
  (v_bar_id, 'Rum Jungle', 'Patong party zone', 'Rum Selection', 'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg', 'https://maps.google.com/?q=Rum+Jungle+Patong', 7.8923, 98.2956, 11, 4.1, 920, ARRAY['Gece hayatı merkez', 'Çok gürültülü', 'Happy hour 6-8', 'Turistik']);
  
  -- DENİZ ÜRÜNLERİ
  INSERT INTO venues (food_category_id, name, mentor_note, must_order, image, map_link, lat, lng, sort_order, google_rating, google_review_count, mentor_tricks) VALUES
  
  (v_deniz_id, 'Kan Eang@Pier', 'Chalong''da deniz kenarı, fresh seafood', 'Whole Grilled Fish', 'https://images.pexels.com/photos/2456437/pexels-photo-2456437.jpeg', 'https://maps.google.com/?q=Kan+Eang+Pier+Phuket', 7.8156, 98.3756, 1, 4.6, 2800, ARRAY['Rezervasyon şart', 'Balığı seçip tartın', 'Sunset perfect', 'Turistik ama kaliteli']),
  
  (v_deniz_id, 'Rockfish', 'Kata beach seafood', 'Grilled Lobster', 'https://images.pexels.com/photos/5409011/pexels-photo-5409011.jpeg', 'https://maps.google.com/?q=Rockfish+Kata+Phuket', 7.8134, 98.3001, 2, 4.5, 1200, ARRAY['Plaj manzarası', 'Romantic', 'Şık ortam', 'Wine selection iyi']),
  
  (v_deniz_id, 'Savoey Seafood', 'Tayland zinciri, güvenilir', 'Garlic Prawns', 'https://images.pexels.com/photos/1907227/pexels-photo-1907227.jpeg', 'https://maps.google.com/?q=Savoey+Seafood+Phuket', 7.8889, 98.2934, 3, 4.4, 3500, ARRAY['Birkaç şube var', 'Fiyatlar orta', 'Aile dostu', 'İngilizce menü']),
  
  (v_deniz_id, 'Bang Rong Seafood', 'Kuzey Phuket, yerel', 'Steamed Crab', 'https://images.pexels.com/photos/4518848/pexels-photo-4518848.jpeg', 'https://maps.google.com/?q=Bang+Rong+Seafood', 8.0234, 98.4123, 4, 4.7, 890, ARRAY['Çok ucuz', 'Yerel ambiyans', 'Taksi zor bulunur', 'Nakit only']),
  
  (v_deniz_id, 'Rawai Seafood Market', 'Seafood market + restaurants', 'Your Choice Grilled', 'https://images.pexels.com/photos/8951425/pexels-photo-8951425.jpeg', 'https://maps.google.com/?q=Rawai+Seafood+Market', 7.7845, 98.3278, 5, 4.5, 1800, ARRAY['Önce balık alın', 'Restoran pişirsin', 'Ucuz yöntem', 'Pazarlık yapın']),
  
  (v_deniz_id, 'Laem Sai Seafood', 'Yerel secret spot', 'Fried Fish Thai Style', 'https://images.pexels.com/photos/5409010/pexels-photo-5409010.jpeg', 'https://maps.google.com/?q=Laem+Sai+Seafood+Phuket', 7.9123, 98.3567, 6, 4.6, 620, ARRAY['Turist yok', 'Çok taze', 'İngilizce az', 'Google translate kullanın']),
  
  (v_deniz_id, 'Kruvit Raft Restaurant', 'Raft üzerinde seafood', 'Mixed Seafood BBQ', 'https://images.pexels.com/photos/8951547/pexels-photo-8951547.jpeg', 'https://maps.google.com/?q=Kruvit+Raft+Phuket', 7.8212, 98.3989, 7, 4.4, 780, ARRAY['Unique experience', 'Su üzerinde', 'Romantik', 'Fotoğraf için harika']),
  
  (v_deniz_id, 'Phuket Lobster', 'Lobster specialist', 'Canadian Lobster', 'https://images.pexels.com/photos/5409012/pexels-photo-5409012.jpeg', 'https://maps.google.com/?q=Phuket+Lobster', 7.8923, 98.2978, 8, 4.5, 890, ARRAY['Pahalı', 'Kalite garanti', 'Tank''tan seçin', 'Tereyağ sos deneyin']),
  
  (v_deniz_id, 'Fisherman''s Way', 'Chalong marina', 'Seafood Platter', 'https://images.pexels.com/photos/8951548/pexels-photo-8951548.jpeg', 'https://maps.google.com/?q=Fishermans+Way+Phuket', 7.8167, 98.3812, 9, 4.3, 560, ARRAY['Marina view', 'Yacht''lar', 'Brunch harika', 'Parking kolay']),
  
  (v_deniz_id, 'Nai Yang Seafood Stalls', 'Airport yakın, beach stalls', 'Grilled Squid', 'https://images.pexels.com/photos/4518848/pexels-photo-4518848.jpeg', 'https://maps.google.com/?q=Nai+Yang+Beach+Phuket', 8.0823, 98.2967, 10, 4.4, 420, ARRAY['Havaalanı 10 dk', 'Son öğün için', 'Çok ucuz', 'Plaj kenarı']),
  
  (v_deniz_id, 'Suay Restaurant', 'Fine dining seafood', 'Sea Bass Fillet', 'https://images.pexels.com/photos/2456437/pexels-photo-2456437.jpeg', 'https://maps.google.com/?q=Suay+Restaurant+Phuket', 7.8934, 98.2989, 11, 4.7, 680, ARRAY['Lüks ortam', 'Tasting menu var', 'Wine pairing', 'Romantic dinner']);
  
END $$;
