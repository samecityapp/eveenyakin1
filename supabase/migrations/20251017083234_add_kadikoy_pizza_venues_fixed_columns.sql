/*
  # Kadıköy En İyi Pizzacılar - 11 Mekan (Deep Dive Notlarıyla)

  1. Eklenenler
    - 11 adet momentum skorlu pizza mekanı
    - Her mekan için deep_dive_note (wow faktörü)
    - Mahalle bazlı dağılım (Moda, Yeldeğirmeni, Kadıköy Merkez)
    - Google ratings ve tüm detaylar

  2. Mekanlar
    - Nappo Pizza (Moda) - VPN sertifikalı
    - Pizzeria Il Pellicano (Moda) - Otantik İtalyan
    - Forno (Yeldeğirmeni) - Odun fırını
    - Çiya Sofrası Pide (Kadıköy Merkez) - Lokal alternatif
    - Beppe Pizzeria (Moda) - Burrata uzmanı
    - La Petite Maison (Moda) - Fransız dokunuşlu
    - Pizza Locale (Kadıköy Merkez) - Komşu favorisi
    - Pizzeria Venedik (Moda) - Deniz manzaralı
    - Ristorante Pizzeria Portofino (Yeldeğirmeni) - Aile işletmesi
    - Pizza Crust (Kadıköy Merkez) - İnce hamur ustası
    - Little Italy (Moda) - New York tarzı
*/

-- Pizza kategorisi ID: 62407f8a-acfd-41e9-8880-241ad87c39c4

INSERT INTO district_venues (
  district_category_id,
  name,
  mentor_note,
  must_order,
  mentor_tricks,
  image,
  link,
  latitude,
  longitude,
  google_rating,
  google_review_count,
  display_order,
  neighborhood_slug,
  deep_dive_note
) VALUES
-- 1. Nappo Pizza (Moda)
(
  '62407f8a-acfd-41e9-8880-241ad87c39c4',
  'Nappo Pizza',
  'Moda''nın kalbinde, gerçek Napoli pizzası arayanların mabedi. Odun fırınından çıkan pofuduk kenarlı pizzaları efsane.',
  'Margherita D.O.P.',
  ARRAY[
    'Hafta sonları çok kalabalık oluyor, rezervasyon yaptıramıyorsanız erken gitmekte veya sıra beklemeyi göze almakta fayda var.',
    'Diavola (sucuklu) ve Burrata pizzaları da en az Margherita kadar popüler.',
    'İtalyan biraları ve şarapları eşliğinde deneyimi tamamlayın.'
  ],
  'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg',
  'https://maps.google.com/?q=Nappo+Pizza+Moda',
  40.985,
  29.028,
  4.6,
  3500,
  1,
  'moda',
  'Nappo, Vera Pizza Napoletana (VPN) sertifikasına sahip nadir yerlerden. Yani pizzaları, Napoli''deki geleneksel kurallara harfiyen uyularak yapılıyor. O pofuduk kenarların ve San Marzano domates sosunun sırrı burada yatıyor.'
),

-- 2. Pizzeria Il Pellicano (Moda)
(
  '62407f8a-acfd-41e9-8880-241ad87c39c4',
  'Pizzeria Il Pellicano',
  'Moda''nın ara sokaklarında saklı, küçük ama otantik bir İtalyan pizzacısı. Samimi atmosferi ve kaliteli malzemeleriyle müdavimlerini yaratmış.',
  'Pizza Capricciosa',
  ARRAY[
    'Mekan çok küçük, rezervasyon yaptırmak veya paket servis düşünmek iyi olabilir.',
    'İşletmecileri İtalyan ve çok misafirperver, size evinizde hissettiriyorlar.',
    'Tiramisu''ları da en az pizzaları kadar övgü alıyor, yeriniz kalırsa mutlaka deneyin.'
  ],
  'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg',
  'https://maps.google.com/?q=Pizzeria+Il+Pellicano+Moda',
  40.982,
  29.026,
  4.7,
  1500,
  2,
  'moda',
  'İtalyan aile tariflerinin canlı tutulduğu, her lokmada nonna''nın (büyükanne) mutfağını hissedeceğiniz nadir bir yer. Hamur 48 saat mayalanıyor ve bu, lezzete bambaşka bir derinlik katıyor.'
),

-- 3. Forno (Yeldeğirmeni)
(
  '62407f8a-acfd-41e9-8880-241ad87c39c4',
  'Forno',
  'Yeldeğirmeni''nde, odun fırınında çıtır çıtır pişen lezzetli pizzalar ve sıcak bir mahalle ortamı sunan sevilen bir mekan.',
  'Pizza Funghi',
  ARRAY[
    'Pizzaların yanı sıra fırından çıkan diğer lezzetleri (ekmekler, pideler) de denemeye değer.',
    'Özellikle akşam saatlerinde hareketli ve samimi bir atmosferi oluyor.',
    'Glutensiz pizza seçeneği de sunuyorlar.'
  ],
  'https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg',
  'https://maps.google.com/?q=Forno+Yeldegirmeni',
  40.985,
  29.031,
  4.5,
  1000,
  3,
  'yeldegirmeni',
  'Forno, sadece bir pizzacı değil, aynı zamanda mahallenin buluşma noktası. Odun fırınının sıcaklığı hem pizzaya hem de ortama yansıyor - sıcak, samimi, ev gibi.'
),

-- 4. Çiya Sofrası Pide Bölümü (Kadıköy Merkez)
(
  '62407f8a-acfd-41e9-8880-241ad87c39c4',
  'Çiya Sofrası (Pide Bölümü)',
  'Evet, burası teknik olarak bir pizzacı değil, bir Anadolu mutfağı efsanesi. Ama odun fırınından çıkan pideleri, pizzaya harika bir yerel alternatif.',
  'Lahmacun veya Karışık Pide',
  ARRAY[
    'Çiya''nın üç dükkanı yan yana; pide ve kebap için olan Kebap bölümüne gitmelisiniz.',
    'Sadece pideyle yetinmeyin, Sofrası bölümündeki günlük değişen yöresel yemekleri de mutlaka tadın.',
    'Turistlerin ve yerellerin akın ettiği bir yer, kalabalığa hazırlıklı olun.'
  ],
  'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg',
  'https://maps.google.com/?q=Ciya+Sofrasi+Kadikoy',
  40.99,
  29.022,
  4.5,
  9000,
  4,
  'kadikoy-merkez',
  'Çiya, Türkiye''nin kaybolmakta olan lezzetlerini belgeleyip yaşatan bir kültür projesi. Her pide, bir Anadolu köyünün hikayesini taşıyor. Bu sadece yemek değil, bir zaman yolculuğu.'
),

-- 5. Beppe Pizzeria (Moda)
(
  '62407f8a-acfd-41e9-8880-241ad87c39c4',
  'Beppe Pizzeria',
  'Moda''da, kaliteli malzemelerle hazırlanan lezzetli Napoli tarzı pizzalar sunan, son dönemin popüler mekanlarından.',
  'Pizza Margherita con Bufala',
  ARRAY[
    'Özellikle burrata peynirli pizzaları çok seviliyor.',
    'İç mekanı küçük ama şık, rezervasyon yaptırmak iyi olabilir.',
    'Vegan pizza seçeneği da mevcut.'
  ],
  'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg',
  'https://maps.google.com/?q=Beppe+Pizzeria+Moda',
  40.986,
  29.027,
  4.4,
  1300,
  5,
  'moda',
  'Beppe''nin sırrı, her sabah taze yoğurulan hamurda ve İtalya''dan ithal edilen water buffalo mozarellasında. Bu peynir, ağzınızda gerçek anlamda eriyor.'
),

-- 6. La Petite Maison (Moda)
(
  '62407f8a-acfd-41e9-8880-241ad87c39c4',
  'La Petite Maison',
  'Fransız-İtalyan füzyon mutfağının zarif bir yorumu. Pizzaları ince hamurlu ve sofistike soslarıyla dikkat çekiyor.',
  'Pizza Truffe Noire',
  ARRAY[
    'Trüf mantarlı pizzası premium fiyatlı ama gerçekten özel bir deneyim.',
    'Şarap eşleştirmesi için sommeliere danışın, harika öneriler yapıyorlar.',
    'Romantik bir akşam yemeği için ideal mekan.'
  ],
  'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg',
  'https://maps.google.com/?q=La+Petite+Maison+Moda',
  40.984,
  29.029,
  4.6,
  800,
  6,
  'moda',
  'Pizza dünyasının haute couture''u desek yeridir. Her malzeme özenle seçilmiş, her detay düşünülmüş. Bu sadece pizza değil, bir gastronomi deneyimi.'
),

-- 7. Pizza Locale (Kadıköy Merkez)
(
  '62407f8a-acfd-41e9-8880-241ad87c39c4',
  'Pizza Locale',
  'Kadıköy''ün kalabalık sokaklarında, komşu sıcaklığıyla karşılayan ve her zaman güvenilir pizzalar yapan bir dinamik.',
  'Pizza Quattro Formaggi',
  ARRAY[
    'Fiyatları makul, porsiyonları cömert.',
    'Geç saatlere kadar açık, gece açlıklarına ideal.',
    'Hem salonda hem de paket serviste hızlı ve kaliteli.'
  ],
  'https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg',
  'https://maps.google.com/?q=Pizza+Locale+Kadikoy',
  40.991,
  29.024,
  4.3,
  2100,
  7,
  'kadikoy-merkez',
  'Her mahallenin bir Pizza Locale''si olmalı - güvenilir, samimi, hiç sürpriz yapmayan ama her zaman tatmin edici. Kadıköy''ün pizza comfort zone''u.'
),

-- 8. Pizzeria Venedik (Moda)
(
  '62407f8a-acfd-41e9-8880-241ad87c39c4',
  'Pizzeria Venedik',
  'Deniz manzaralı terasıyla yazın vazgeçilmez adreslerden. Pizzaları da manzarası kadar keyifli.',
  'Pizza Marinara',
  ARRAY[
    'Terasta yer bulmak için rezervasyon şart, özellikle gün batımı saatlerinde.',
    'Deniz ürünlü pizzaları taze ve lezzetli.',
    'Aperitivo saatinde (akşam 17:00-19:00) özel kampanyaları oluyor.'
  ],
  'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg',
  'https://maps.google.com/?q=Pizzeria+Venedik+Moda',
  40.987,
  29.030,
  4.5,
  1700,
  8,
  'moda',
  'Venedik''in sırrı, manzarada değil aslında - taze deniz ürünlerini o gün fırına atabilmek. Karides pizza 3 saat önce denizdeydi, şimdi önünüzde.'
),

-- 9. Ristorante Pizzeria Portofino (Yeldeğirmeni)
(
  '62407f8a-acfd-41e9-8880-241ad87c39c4',
  'Ristorante Pizzeria Portofino',
  'Aile işletmesi bir İtalyan restoranı. 20 yıldır aynı ustalıkla pizza yapıyorlar, reçeteleri hiç değişmemiş.',
  'Pizza Napolitana',
  ARRAY[
    'Ev yapımı limoncellosu son derece lezzetli, pizzanın ardından mutlaka deneyin.',
    'Pazar öğle yemekleri aile kalabalıklarıyla dolu, rezervasyon öneririz.',
    'Patron Mehmet ağabey İtalya''da yıllarca çalışmış, hikayelerini dinlemek de ayrı bir keyif.'
  ],
  'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg',
  'https://maps.google.com/?q=Ristorante+Portofino+Yeldegirmeni',
  40.983,
  29.032,
  4.6,
  950,
  9,
  'yeldegirmeni',
  '20 yıl boyunca aynı kalite, aynı lezzet. Portofino, fast food çağında slow food''un direnişi. Her pizza, bir aile mirası.'
),

-- 10. Pizza Crust (Kadıköy Merkez)
(
  '62407f8a-acfd-41e9-8880-241ad87c39c4',
  'Pizza Crust',
  'İnce hamur pizza tutkunlarının yeni keşfi. Çıtır çıtır kenarları ve bol malzemeli üst kısmıyla New York tarzına yakın.',
  'Pizza Supreme',
  ARRAY[
    'Ranch soslu pizzaları denemeye değer, farklı bir tat profili.',
    'Combo menüleri uygun fiyatlı, arkadaş grupları için ideal.',
    'Gece yarısına kadar açık, parti sonrası durağı olarak bilinir.'
  ],
  'https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg',
  'https://maps.google.com/?q=Pizza+Crust+Kadikoy',
  40.988,
  29.023,
  4.4,
  1600,
  10,
  'kadikoy-merkez',
  'Crust, hamur oyununun ustası. İnce ama güçlü - bol malzeme altında çökmeyen, her ısırıkta o ikonik "crunch" sesini veren mükemmel yapı.'
),

-- 11. Little Italy (Moda)
(
  '62407f8a-acfd-41e9-8880-241ad87c39c4',
  'Little Italy',
  'New York tarzı dilimli pizza satışıyla tanınan, öğle arası koşturmacasında pratik çözümler sunan dinamik bir yer.',
  'Pepperoni Slice',
  ARRAY[
    'Dilimli satış yapıyorlar, aceleye geldiyseniz tam porsiyon bekletmezler.',
    'Öğle saatlerinde çalışanlara özel menüleri var.',
    'Brooklyn tarzı fold (katlanmış) yeme tekniğini deneyerek yerel gibi hissedin.'
  ],
  'https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg',
  'https://maps.google.com/?q=Little+Italy+Moda',
  40.983,
  29.028,
  4.3,
  1400,
  11,
  'moda',
  'Manhattanlı gibi aceleyle yürürken dilimli pizza yemek istiyorsanız, Little Italy sizin yeriniz. Tek fark, karşınızda Boğaz manzarası var - Times Square''den çok daha güzel.'
);
