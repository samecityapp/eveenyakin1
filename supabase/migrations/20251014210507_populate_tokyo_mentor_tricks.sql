/*
  # Populate Tokyo Venues with Mentor Tricks

  Adding insider tips for all 66 Tokyo venues
*/

DO $$
BEGIN
  -- SUSHI CATEGORY
  UPDATE venues SET mentor_tricks = ARRAY[
    'Bu bir yemek değil, bir ayindir. Yemek 30 dakika sürer, şefin temposuna uyun.',
    'Parfüm veya kolonya sıkmayın. Sadece sushinin kokusuna odaklanın.',
    'Sushi, soya sosuna balık tarafıyla batırılır, pirinç tarafıyla asla.',
    'Fotoğraf çekmek hoş karşılanmaz, ana odak yemeğin kendisidir.'
  ] WHERE name = 'Sukiyabashi Jiro';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Rezervasyon neredeyse imkansız, lüks otel concierge servisleri deneyin.',
    'Sessizce yiyin, şefle gereksiz konuşmayın, saygı gösterin.',
    'Her nigiri hemen yenmelidir, bekletmeyin.',
    'Çok pahalıdır, ama dünyanın en iyi sushi deneyimi için hazır olun.'
  ] WHERE name = 'Sushi Saito';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Öğle menüsü akşama göre çok daha uygun, 11:30''da gidin.',
    'Dans eden karides için mutlaka sor, canlı geliyor.',
    'İngilizce bilen şefler var, soru sormaktan çekinmeyin.',
    'Ginza''da yürüyüş mesafesinde çok mekan var, birleştirin.'
  ] WHERE name = 'Kyubey';

  UPDATE venues SET mentor_tricks = ARRAY[
    'En az 2 hafta önceden rezervasyon yapın.',
    'Şef her parçayı açıklar, dinleyin ve öğrenin.',
    'Omakase dışında à la carte yok, menüye güvenin.',
    'Sake eşleştirmesi mükemmel, deneyin.'
  ] WHERE name = 'Manten Sushi';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Shibuya şubesinde en az 1.5 saat sıra var, sabırlı olun.',
    'Açılıştan 30 dk önce gelin, ilk turda yer kapın.',
    'Set menüler çok doyurucu ve ekonomik.',
    'Soya sosu ve wasabi masada, kendiniz ayarlayın.'
  ] WHERE name = 'Midori Sushi';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Ayakta yenir, hızlı bir deneyimdir.',
    'İstasyon içinde, tren öncesi ideal.',
    'Çok ucuz ama taze, beklentiyi ayarlayın.',
    'Sabah saatleri daha sakin.'
  ] WHERE name = 'Uogashi Nihon-Ichi';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Gizli bir mekan, adres bulmak zor, Google Maps kullanın.',
    'Sadece bar oturması var, şefle göz göze.',
    'İngilizce kısıtlı, ama şef çok samimi.',
    'Fiyat/kalite oranı harika.'
  ] WHERE name = 'Sushi Tokami';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Genç şefin modern yorumları ilginç.',
    'Rezervasyon yapmak kolay, turistik değil.',
    'Seasonal omakase için mevsime göre gelin.',
    'Ginza''da ama fiyatlar makul.'
  ] WHERE name = 'Ginza Sushi Ichi';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Tsukiji''deki şube 24 saat açık, gece açlığı için ideal.',
    'Tuna Tower gösterişli ama küçük, paylaşın.',
    'Turist yoğun, beklenti yönetimi yapın.',
    'Havalimanına yakın şubeler var, son gün için uygun.'
  ] WHERE name = 'Sushi Zanmai';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Yanında gelen iki sos farklı, ikisini de deneyin.',
    'Erişte sertliğini "al dente" seçin.',
    'Yerel halk çok sever, gözlem yapın.',
    'Hızlı servis, masada uzun oturmayın.'
  ] WHERE name = 'Dai';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Eski Tsukiji balık pazarında, sabah 6''da açılır.',
    'Kuyruk sabah 5''te başlar, çok erken gidin.',
    'Balıklar o gün yakalanmış, maximum tazelik.',
    'Soğuk olabilir, kat giyin.'
  ] WHERE name = 'Daiwa Sushi';

  -- RAMEN CATEGORY
  UPDATE venues SET mentor_tricks = ARRAY[
    'Kapıdaki otomattan bilet alın, nakit bulundurun.',
    'Formdaki tüm seçenekleri ilk seferinizde "orta" yapın.',
    'Erişte biterse "Kaedama" (ekstra erişte) sipariş edin.',
    'Slurping (sesli yeme) iltifattır, çekinmeyin!'
  ] WHERE name = 'Ichiran';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Trüf aromasını almak için önce koklayın.',
    'Yanındaki etler farklı pişirilmiş, ayrı ayrı tadın.',
    'Michelin yıldızlı ama fiyatlar uygun.',
    'Yemeği bitirin ve çıkın, masada uzun oturmayın.'
  ] WHERE name = 'Tsuta';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Tantanmen çok baharatlı, acıya hazır olun.',
    'Öğle saatlerinde 2 saat sıra normaldir.',
    'Bilet makinesinde "Spicy" seviyesini seçin.',
    'Su ücretsiz, bol bol için.'
  ] WHERE name = 'Nakiryu';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Yuzu (Japon limonu) aroması çok belirgin, sevin ya da sevmeyin.',
    'Vegan ramen seçeneği var, nadir bulunur.',
    'Dışarıdaki kuyruğa katlanmaya değer.',
    'Yanında bira mükemmel gider.'
  ] WHERE name = 'Afuri';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Tokyo Station içinde "Ramen Street"te, kolay bulunur.',
    'Tsukemen sosu çok yoğun, erişteyi tam batırın.',
    'Sosa limon sıkın, yeni bir tat açar.',
    'Trenden inmeden önce veya sonra ideal.'
  ] WHERE name = 'Rokurinsha';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Tori paitan (tavuk) çorbası kremalı, sağlam kahvaltı yapın.',
    'Mevsimsel sebzeler değişir, şefa sorun.',
    'Ginza''da nadir bulunur bütçe dostu ramen.',
    'Öğle 11:30-14:00 arası çok kalabalık,일찍 gelin.'
  ] WHERE name = 'Ginza Kagari';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Ramen ve tsukemen karışımı, ikisini birden alın.',
    'Çorba çok yoğun, hepsini içmeye çalışmayın.',
    'Shinjuku''da, gece hayatı öncesi ideal.',
    'Ekstra chashu (domuz) eklemeye değer.'
  ] WHERE name = 'Fuunji';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Dünya çapında zincir, Tokyo''da 10+ şube var.',
    'Shiromaru Classic en popüler, güvenli seçim.',
    'Modern, temiz, turistlere uygun.',
    'İngilizce menü var, kolay sipariş.'
  ] WHERE name = 'Ippudo';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Erişte inanılmaz kalın, çiğnemesi zor.',
    'Samurai temalı dekor eğlenceli.',
    'Niku Soba (etli) en iyisi.',
    'Porsiyon çok büyük, aç gelin.'
  ] WHERE name = 'Menya Musashi';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Vejetaryen ramen nadir bulunur, burada mükemmel.',
    'Sebze çorbası bile çok lezzetli.',
    'Renkli sunumlar Instagram için harika.',
    'Sağlıklı yemek arayanlar için ideal.'
  ] WHERE name = 'Soranoiro';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Harajuku''nun gençlere hitap eden zinciri.',
    'Müzik yüksek, parti atmosferi.',
    'Ekstralar (yumurta, et) ucuz, bol bol ekleyin.',
    'Gece geç saatlere kadar açık.'
  ] WHERE name = 'Kyushu Jangara';

  -- HAMBURGER CATEGORY
  UPDATE venues SET mentor_tricks = ARRAY[
    'ShackBurger klasiktir, ilk seferinizde bunu alın.',
    'Milkshake mükemmel, concrete (dondurmalı) deneyin.',
    'Gaienmae şubesi park içinde, atmosfer en iyisi.',
    'Kuyruk olabilir, mobil sipariş kullanın.'
  ] WHERE name = 'Shake Shack';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Günlük taze et kullanılır, lezzet farkı belli.',
    'Soslar ev yapımı, özel sos isteyin.',
    'Küçük mekan, takeaway düşünün.',
    'Fiyatlar makul, kalite yüksek.'
  ] WHERE name = 'Burger Mania';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Burgerler dev boyutta, paylaşmayı düşünün.',
    'Genç kitle, yüksek enerji.',
    'Amerikan tarzı, nostaljik.',
    'Patates kızartması sınırsız olan günler var, sorun.'
  ] WHERE name = 'Brozers''';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Truffle burger trüf yağıyla, çok aromatik.',
    'Japon umami tatları eklenmiş, farklı deneyim.',
    'Fiyatlar yüksek, özel günler için.',
    'Craft beer seçkisi geniş.'
  ] WHERE name = 'Umami Burger';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Beer selection 20+ çeşit, burger beer pairing sorun.',
    'BBQ Burger en popüler.',
    'Pub atmosferi, arkadaş grubuyla ideal.',
    'Happy hour''da bira indirimi var.'
  ] WHERE name = 'Fire House';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Roppongi''daki lüks seçenek.',
    'Wagyu burger çok pahalı ama yumuşacık.',
    'Şık giyinin, dress code yok ama atmosfer öyle.',
    'Rezervasyon önerilir.'
  ] WHERE name = 'The Great Burger';

  UPDATE venues SET mentor_tricks = ARRAY[
    '100% Japon Wagyu, başka yerde bulamazsınız.',
    'Çok yumuşak, bıçağa gerek yok.',
    'Ebisu''da, trenden 5 dk.',
    'Fiyat çok yüksek, bütçe ayırın.'
  ] WHERE name = 'Blacows';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Fast casual, hızlı servis.',
    'Shinjuku''da, alışveriş molasına ideal.',
    'Fiyatlar turist dostu.',
    '24 saat açık bazı şubeler, gece atıştırması için.'
  ] WHERE name = 'Burgers Tokyo';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Retro dekor 1950''ler tarzı.',
    'Aile dostu, çocuk menüsü var.',
    'Porsiyon çok bol, aç gelin.',
    'Asakusa''da, tapınak gezisi sonrası uğrayın.'
  ] WHERE name = 'Henry''s Burger';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Kendiniz tasarlayın konsepti eğlenceli.',
    '50+ topping seçeneği var.',
    'Arkadaşlarla gidip herkese farklı burger yapın.',
    'Tablet üzerinden sipariş, kolay.'
  ] WHERE name = 'The Counter';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Hawaii temalı, tropikal atmosfer.',
    'Kokteyl menüsü geniş, Mai Tai alın.',
    'Aloha Burger ananaslı, seveni çok sever.',
    'Shibuya''da, eğlence bölgesinde.'
  ] WHERE name = 'Burger Cafe Honolu';

  -- KAHVE CATEGORY (11 venues)
  UPDATE venues SET mentor_tricks = ARRAY[
    'Pour over (filtre kahve) sipariş edin, en iyisi bu.',
    'Minimalist tasarım Instagram için mükemmel.',
    'Sabah erken sakin, öğleden sonra kalabalık.',
    'New Orleans Iced Coffee en popüler.'
  ] WHERE name = 'Blue Bottle Coffee';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Kendi kavurması var, çekirdek de satın alabilirsiniz.',
    'Barista çok bilgili, kahve hakkında soru sorun.',
    'Küçük mekan, 10 kişi kapasiteli.',
    'Yoyogi yakınında, park yürüyüşüyle birleştirin.'
  ] WHERE name = 'Onibus Coffee';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Moda markası Maison Kitsune''nin kafesi.',
    'Instagram için harika, estetik çok güzel.',
    'Fiyatlar yüksek, atmosfer için ödüyorsunuz.',
    'Flat white alın, latte art mükemmel.'
  ] WHERE name = 'Cafe Kitsune';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Geleneksel Japon evi içinde kahve servisi.',
    'Benzersiz atmosfer, başka yerde yok.',
    'Çok sakin, kitap okumak için ideal.',
    'Küçük bahçesi var, yaz aylarında dışarıda oturun.'
  ] WHERE name = 'Omotesando Koffee';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Norveç''ten specialty kahve.',
    'Gündüz kafe, gece bar olarak açık.',
    'Vintage mobilyalar satılık.',
    'Cortado (küçük latte) deneyin.'
  ] WHERE name = 'Fuglen Tokyo';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Dünyanın en büyük Starbucks''ı, 4 kat.',
    'Turistik ama görülmeye değer.',
    '3. katta teavana bar var.',
    'Reserve kahveler normal Starbucks''ta yok.'
  ] WHERE name = 'Starbucks Reserve Roastery';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Latte art dünya şampiyonu sahibi.',
    'Bardağınıza çizileni fotoğraflayın.',
    'Barista ile sohbet edin, çok samimi.',
    'Shibuya''da, alışveriş arası ideal.'
  ] WHERE name = 'Streamer Coffee';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Yerel halk gider, turistik değil.',
    'Taze kavurma her hafta değişir.',
    'Fiyat/performans mükemmel.',
    'Drip coffee (filtre) alın.'
  ] WHERE name = 'Arise Coffee';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Tiny kahve standı, sadece takeaway.',
    '3-4 kişi sığar, beklemeye hazır olun.',
    'Kahve muhteşem, mekan değil.',
    'Yoyogi Park''a götürün.'
  ] WHERE name = 'Little Nap Coffee';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Sanat galerisi + kafe.',
    'Sergilere bakarken kahve için.',
    'Huzurlu, sakin atmosfer.',
    'Ueno''da, müze gezisi sonrası uğrayın.'
  ] WHERE name = 'Nozy Coffee';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Yanesen''in vintage kafesi.',
    'Retro dekor, nostaljik.',
    'Sakin mahallede, yerel atmosfer.',
    'Cold brew yazın mükemmel.'
  ] WHERE name = 'Turret Coffee';

  -- FINE DINING CATEGORY (11 venues)
  UPDATE venues SET mentor_tricks = ARRAY[
    '"Orman Ekmeği" performansı unutulmaz.',
    'Sürdürülebilirlik odaklı, hikayesini dinleyin.',
    '2-3 ay önceden rezervasyon şart.',
    'Dress code akıllı-gündelik, şık giyinin.'
  ] WHERE name = 'Narisawa';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Open kitchen, şefleri izleyin.',
    '2 Michelin yıldızlı ama atmosfer rahat.',
    'Şarap eşleştirmesi alın, sommelieri dinleyin.',
    'Her tabak açıklanır, soru sorun.'
  ] WHERE name = 'Florilege';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Modern French, Japon malzemeleri.',
    'Roppongi''da ama sakin sokakta.',
    'Degustation menü 8-10 tabak.',
    'Fotoğraf izni var, çekinmeyin.'
  ] WHERE name = 'L''Effervescence';

  UPDATE venues SET mentor_tricks = ARRAY[
    '3 Michelin yıldızlı, en prestijli.',
    'Klasik French teknikler.',
    'Rezervasyon aylar öncesinden.',
    'Bütçe en az 40,000 yen/kişi.'
  ] WHERE name = 'Quintessence';

  UPDATE venues SET mentor_tricks = ARRAY[
    '3 Michelin yıldızlı kaiseki.',
    'Mevsimsel menü, her ay değişir.',
    'Sadece omakase, seçenek yok.',
    'Japon fine dining zirvesi.'
  ] WHERE name = 'Azabu Kadowaki';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Modern kaiseki yorumu.',
    'Genç şef, yenilikçi.',
    'Çok rafine sunumlar.',
    'Sake pairing mükemmel.'
  ] WHERE name = 'Kohaku';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Eğlenceli fine dining, sürprizler var.',
    'Signature "Dentucky Fried Chicken" şaka değil.',
    'Şef Hasegawa çok enerjik.',
    'Asia''s 50 Best listesinde.'
  ] WHERE name = 'Den';

  UPDATE venues SET mentor_tricks = ARRAY[
    '3 Michelin yıldızlı efsane.',
    'Çok prestijli, en pahalılardan.',
    'Servis kusursuz.',
    'Ömürde bir kere deneyimi.'
  ] WHERE name = 'Nihonryori RyuGin';

  UPDATE venues SET mentor_tricks = ARRAY[
    '2 Michelin yıldızlı French.',
    'Ginza''nın zarif restoranı.',
    'Business lunch uygun fiyatlı.',
    'Şık giyinin.'
  ] WHERE name = 'Esquisse';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Four Seasons içinde, çok lüks.',
    'Contemporary French.',
    'Yeni Michelin yıldızı aldı.',
    'Rezervasyon zor, otelden yaptırın.'
  ] WHERE name = 'Sezanne';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Shibuya''da, erişimi kolay.',
    'Genç şef, modern yorumlar.',
    'Fiyatlar diğer Michelin''lere göre makul.',
    'Rahat atmosfer.'
  ] WHERE name = 'Tirpse';

  -- LOCAL SPECIALTIES CATEGORY (11 venues)
  UPDATE venues SET mentor_tricks = ARRAY[
    'Eski hamam binasında, tarihi atmosfer.',
    'Kurobuta (premium domuz) alın.',
    'Set menü çok doyurucu.',
    'Lahana salatası sınırsız, yenileyin.'
  ] WHERE name = 'Tonkatsu @ Maisen';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Kendiniz masada pişirin, eğlenceli.',
    'Spatula ile karıştırıp çizik yapın.',
    'Mochi cheese mentaiko favorimiz.',
    'Sokakta 20+ farklı mekan var, gezin.'
  ] WHERE name = 'Monjayaki @ Tsukishima Monja Street';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Eski Tsukiji''de, sabah 5''te açılır.',
    'Balık pazarı atmosferi.',
    'Çok taze balık.',
    'Soğuk hava, kat giyin.'
  ] WHERE name = 'Tsukiji';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Sumo güreşçilerinin yediği nabe (güveç).',
    'Porsiyonlar dev, 2-3 kişilik.',
    'Besleyici ve sağlıklı.',
    'Ryogoku''da, sumo stadyumu yakınında.'
  ] WHERE name = 'Chanko Tomoegata';

  UPDATE venues SET mentor_tricks = ARRAY[
    '130 yıllık tarihi mekan.',
    'Soba (karabuğday eriştesi) el yapımı.',
    'Zaru Soba (soğuk) yazın ideal.',
    'Geleneksel tatami odaları var.'
  ] WHERE name = 'Kanda Yabu Soba';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Asakusa''nın premium sukiyaki yeri.',
    'Wagyu et çok yumuşak.',
    'Zarif atmosfer, özel günler için.',
    'Çok pahalı, bütçe ayırın.'
  ] WHERE name = 'Asakusa Imahan';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Park Hyatt 41. katta.',
    'Tokyo manzarası inanılmaz.',
    'Gün batımında rezervasyon ideal.',
    'Lost in Translation filminde çekildi.'
  ] WHERE name = 'Kozue';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Tsukishima''da otantik monja.',
    'Yerel halk gider.',
    'Kendiniz pişirin, personel yardım eder.',
    'Ucuz ve eğlenceli.'
  ] WHERE name = 'Monjayaki Hiyoko';

  UPDATE venues SET mentor_tricks = ARRAY[
    '120 yıllık curry-udon restoranı.',
    'Nostalji dolu atmosfer.',
    'Çok ucuz, 500 yen civarı.',
    'Hızlı servis, öğle yemeği için ideal.'
  ] WHERE name = 'Kanda Matsuya';

  UPDATE venues SET mentor_tricks = ARRAY[
    'All-you-can-eat shabu-shabu.',
    'Sınırsız et ve sebze.',
    'Öğrencilere popüler.',
    '90 dakika limit var, hızlı yiyin.'
  ] WHERE name = 'Nabezo';

  UPDATE venues SET mentor_tricks = ARRAY[
    'Okonomiyaki kendiniz yapın.',
    'Asakusa''da, turistik bölgede.',
    'Tatami odaları var.',
    'Personel yardım eder, çekinmeyin.'
  ] WHERE name = 'Sometaro';

END $$;
