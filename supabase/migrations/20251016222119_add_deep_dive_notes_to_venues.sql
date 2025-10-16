/*
  # Mentorun Derin Notları (Deep Dive Notes)

  1. Yeni Alan
    - `district_venues` tablosuna `deep_dive_note` alanı ekleniyor
    - Her mekanın hikayesini, ruhunu ve özel yanını anlatan detaylı not

  2. Amaç
    - Kullanıcılara "insider" bilgiler sunmak
    - Her mekanı özel kılan detayları paylaşmak
    - Sadece Google'dan bulamayacakları bilgileri vermek

  3. Örnekler
    - Montag: "Tarladan bardağa" felsefesi
    - Story Coffee: Yeldeğirmeni'nin sanat ruhunu yansıtması
    - RAF: Kalabalığın içinde sığınak atmosferi
*/

-- Deep dive note alanını ekle
ALTER TABLE district_venues
ADD COLUMN IF NOT EXISTS deep_dive_note text;

-- Kadıköy kahvecilerine wow dipnotlarını ekle
UPDATE district_venues
SET deep_dive_note = CASE name
  WHEN 'Montag Coffee Roasters' THEN 
    'Montag sadece bir kahve dükkanı değil, bir felsefedir. "Tarladan bardağa" (from farm to cup) akımını Kadıköy''de ilk başlatanlardandır. İçtiğiniz her yudumun hikayesini, hangi çiftçiden geldiğini önemserler. Burası, kahvenin bir tarım ürünü olduğunu ve ardındaki emeği hissetmek isteyenler için bir tapınaktır. Minimalist tasarımı ve doğal ışık alan geniş pencereleri, kahveye odaklanmanızı sağlar.'

  WHEN 'Story Coffee Roasting' THEN
    'Story, Yeldeğirmeni''nin ruhunu yansıtır: samimi, sanatla iç içe ve telaşsız. Mahalle sanatçılarının eserlerine ev sahipliği yapar ve kapısının önündeki basamaklar, gelip geçeni izleyerek anın tadını çıkarmak için en iyi yerdir. Bir kahveden fazlasını, mahallenin bir parçasını deneyimlersiniz. Baristalar her müşteriyi tanır ve adınızı hatırlar - işte bu yüzden "mahalle kahvecisi" derler.'

  WHEN 'Drip Coffeeist' THEN
    'Drip Coffeeist, kahve demlemeyi bir sanat formu olarak ele alır. Her bir demleme yönteminin (V60, Chemex, AeroPress) kendine özgü tadı ve ritüeli vardır. Baristalar, kahve hazırlarken adeta bir seramoni gerçekleştirir - izlemesi büyüleyicidir. Yeldeğirmeni''nin sessiz sokaklarında, sabahın ilk ışıklarında buraya gelip pencere kenarına oturmak, şehirle yeniden bağ kurmanın en güzel yollarından biri.'

  WHEN 'Benazio Coffee' THEN
    'Kadıköy Çarşısı''nın girişindeki bu küçük kahve durağı, stratejik konumuyla çarşı turuna başlamadan önce mükemmel bir enerji deposudur. San Sebastian Cheesecake''leri şehir efsanesi haline gelmiştir - kremsi dokusu ve hafif yanık üstüyle mükemmel denge. Kahveleri güçlü ve kararlıdır, tıpkı çarşının enerjisi gibi. Burası aceleyle değil, ama zamansız bir mola için idealdir.'

  WHEN 'Coffee Manifesto' THEN
    'Manifesto, adından da anlaşılacağı üğü gibi bir bildirgesi vardır: kaliteli kahve, hızlı servis, makul fiyat. Kadıköy''ün en işlek caddelerinden birinde, sürekli akan insan trafiğinin tam ortasında durur. Burası "otur-takıl" mekanı değil, güne kaliteli bir kahveyle başlamak isteyenlerin sabah ritüelidir. Kahveleri cesur ve belirgindir, vegan süt alternatifleriyle de öncüdürler.'

  WHEN 'RAF' THEN
    'RAF, "kalabalığın içinde bir sığınak" arayanlar içindir. Yüzlerce kitapla dolu rafları, ahşap masaları ve loş ışığıyla, özellikle yağmurlu bir günde sığınılacak en güzel limanlardan biridir. Burada zaman yavaşlar, laptoplar açılır, romanlar okunur ve sessizce düşüncelere dalınır. Üst katın penceresinden Kadıköy''ü izlemek, şehri anlamanın en huzurlu yoludur. Flat White''ları İtalyan tarzı kahvelerin Yeni Zelanda yorumudur - kremalı ve yumuşak.'

  WHEN 'Çekirdek' THEN
    'Çekirdek, Moda''nın ara sokaklarında saklı, adeta bir komşu evine konuk oluyormuş gibi hissettiren samimi bir köşedir. Sadece birkaç tabure ve pencere kenarındaki küçük masa vardır; çoğu müşteri kahvesini alıp kapının önünde sohbet eder. İşletmecileri, mahallenin yaşayan hafızası gibidir - size sadece kahve değil, mahalle hikayelerini de sunarlar. Burası, Moda''yı turistik değil, yerli gözüyle deneyimlemek isteyenler için gizli bir şifre gibidir.'

  WHEN 'Brekkie Croissant & Cookie' THEN
    'Brekkie, Kadıköy''ün en Instagram''lanabilir kahvaltı mekanıdır ama asla görüntüden ibaret değildir. Kruvasanları gerçekten el emeğiyle, Fransız tarifiyle hazırlanır - dışı çıtır çıtır, içi kabarık katmanlarla dolu. Hem tatlı (çikolata, badem) hem tuzlu (peynir, jambon) seçenekleri vardır ve hepsi kahvenin mükemmel eşlikçisidir. Hafta sonları kuyrukları görmezden gelin, çünkü beklemeye değer. Sahile 2 dakika yürüyüş mesafesinde - kruvasanınızı deniz kenarında yemek, Moda''da yaşamak demektir.'

  WHEN 'Heim' THEN
    'Heim, Almanca "ev" demektir ve burası tam da bunu hissettirir: sıcak, kucaklayıcı ve rahat. Yeldeğirmeni''nin endüstriyel dokusunu Berlin''in rahat şıklığıyla birleştiren tasarımı, hem gözlere hem ruha hitap eder. Brunch menüsü geniş ve yaratıcıdır - Heim Benedict''i, poşe yumurtası ve hollandaise sosuyla klasik bir başyapıttır. Gruplar için ideal çünkü geniş masaları ve rahat koltukları vardır. Kahvenin ötesinde, bir öğünü keyifle paylaşabileceğiniz sosyal bir mekan.'

  WHEN 'Fahriye Cafe' THEN
    'Fahriye, zaman makinesidir. Eski radyolar, vinil plaklar, vintage mobilyalar ve duvarları kaplayan nostaljik fotoğraflar sizi 70''lere götürür. Burası sadece kahve içmek değil, İstanbul''un eski mahallelerin ruhunu hissetmek içindir. Arka bahçesi, şehrin gürültüsünden tamamen izole edilmiş, yeşilliklerle çevrili gizli bir vahadır. Türk kahvesi geleneksel yöntemle pişirilir ve yanında ikram edilen lokumlar ev yapımıdır. Ev yapımı limonataları yaz aylarının kurtarıcısıdır. Buraya geldiğinizde aceleniz varsa, bırakın gitsin.'

  ELSE deep_dive_note
END
WHERE district_category_id IN (
  SELECT id FROM district_food_categories 
  WHERE category_slug = 'kahve'
    AND district_id = (SELECT id FROM districts WHERE slug = 'kadikoy')
);
