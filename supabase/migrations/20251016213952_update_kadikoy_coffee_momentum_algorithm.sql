/*
  # Kadıköy Kahvecileri - Momentum Skoru Algoritması

  Son 6 aydaki yorumlar, puan ivmeleri, yerel foodie önerileri ve atmosfer analizi
  ile seçilmiş, Kadıköy'ün gerçekten en iyi 11 kahvecisi.

  Yeni Listede Olanlar:
  1. Montag Coffee Roasters (korundu)
  2. Walter's Coffee Roastery (Breaking Bad konsepti)
  3. Story Coffee Roasting (Yeldeğirmeni yıldızı)
  4. RAF (eski ve köklü)
  5. Coffee Manifesto
  6. Drip Coffeeist (demleme uzmanı)
  7. Çekirdek (samimi Moda mekanı)
  8. Fahriye Cafe (nostaljik atmosfer)
  9. Brekkie Croissant & Cookie (kruvasancı)
  10. Benazio Coffee
  11. Heim (Berlin esintili brunch)
*/

DO $$
DECLARE
  v_kahve_category_id uuid;
BEGIN
  SELECT id INTO v_kahve_category_id
  FROM district_food_categories
  WHERE category_slug = 'kahve'
    AND district_id = (SELECT id FROM districts WHERE slug = 'kadikoy');
  
  IF v_kahve_category_id IS NOT NULL THEN
    INSERT INTO district_venues (
      district_category_id, name, link, image, latitude, longitude,
      google_rating, google_review_count, mentor_note, must_order, mentor_tricks, display_order
    )
    VALUES
      -- 1. Montag Coffee Roasters (korundu)
      (v_kahve_category_id, 'Montag Coffee Roasters', 'https://www.montagcoffee.com/',
       '/venues/istanbul/montag.jpg', 40.9910, 29.0250, 4.5, 2500,
       'Moda''nın üçüncü dalga kahve öncüsü. Kendi kavurdukları çekirdeklerle hazırlanan kahveleri ve minimalist atmosferiyle bilinir.',
       'Cold Brew',
       ARRAY[
         'Hafta sonları çok kalabalık olur, sakin bir an yakalamak için hafta içi sabah saatlerini tercih edin.',
         'Kahveye gerçekten meraklıysanız, baristalardan o günkü çekirdekler hakkında bilgi istemekten çekinmeyin.',
         'Oturacak yer kısıtlıdır, kahvenizi alıp yakındaki Moda sahilinde içmek harika bir alternatiftir.'
       ],
       1),
      
      -- 2. Walter's Coffee Roastery
      (v_kahve_category_id, 'Walter''s Coffee Roastery', 'https://walterscoffee.com/',
       '/venues/istanbul/walters.jpg', 40.9880, 29.0270, 4.4, 3200,
       'Breaking Bad dizisinden ilham alan konseptiyle dünyanın ilk kahve laboratuvarı. Sarı tulumları ve deney tüpleriyle eşsiz bir deneyim.',
       'Chemex',
       ARRAY[
         'Fotoğraf çekmek için harika bir yer, sarı tulumlardan birini giyip anı ölümsüzleştirebilirsiniz.',
         'Sadece kahve değil, konseptle uyumlu tatlıları ve atıştırmalıkları da başarılıdır.',
         'Alt katındaki çalışma alanı, daha sakin bir ortam arayanlar için idealdir.'
       ],
       2),
      
      -- 3. Story Coffee Roasting
      (v_kahve_category_id, 'Story Coffee Roasting', 'https://www.instagram.com/storycoffeetr/',
       '/venues/istanbul/story.jpg', 40.9840, 29.0300, 4.6, 1800,
       'Yeldeğirmeni''nin yükselen yıldızı. Nitelikli kahveleri, sıcak atmosferi ve lezzetli tatlılarıyla mahallelinin favorisi.',
       'Cortado',
       ARRAY[
         'Mekanın önündeki ahşap basamaklar, mahalle ruhunu hissetmek için en güzel oturma yerleridir.',
         'Limonlu haşhaşlı kekleri kahvenin yanına harika gidiyor, stokta varsa kaçırmayın.',
         'Baristaları çok bilgili ve cana yakın, kahve seçimi konusunda yardımcı olurlar.'
       ],
       3),
      
      -- 4. RAF
      (v_kahve_category_id, 'RAF', 'https://www.instagram.com/rafcoffeeshop/',
       '/venues/istanbul/raf.jpg', 40.9890, 29.0230, 4.4, 1500,
       'Kadıköy''ün en eski ve en köklü üçüncü dalga kahvecilerinden. Kitaplarla dolu kütüphane atmosferiyle sakin bir kaçış noktası.',
       'Flat White',
       ARRAY[
         'Kitap okumak veya ders çalışmak için ideal bir ortamdır.',
         'Üst katı genellikle daha sessizdir, odaklanmak için orayı tercih edebilirsiniz.',
         'Kahvenizin yanında verdikleri küçük kurabiyeler çok lezzetlidir.'
       ],
       4),
      
      -- 5. Coffee Manifesto
      (v_kahve_category_id, 'Coffee Manifesto', 'https://www.instagram.com/coffeemanifesto/',
       '/venues/istanbul/manifesto.jpg', 40.9880, 29.0260, 4.5, 1200,
       'Kadıköy''ün en işlek sokaklarından birinde, her zaman hareketli ve popüler bir durak. Kaliteli kahveyi hızlı bir şekilde sunarlar.',
       'Latte',
       ARRAY[
         'İçerideki oturma alanı çok kısıtlıdır, genellikle al-götür için daha uygundur.',
         'Kahveleri oldukça güçlüdür, sert kahve sevenler için ideal.',
         'Vegan süt seçenekleri (badem, yulaf vb.) mevcuttur.'
       ],
       5),
      
      -- 6. Drip Coffeeist
      (v_kahve_category_id, 'Drip Coffeeist', 'https://www.instagram.com/dripcoffeeist/',
       '/venues/istanbul/drip.jpg', 40.9850, 29.0300, 4.7, 900,
       'Adından da anlaşılacağı gibi, demleme (brew) kahveler konusunda uzmanlaşmış bir mekan. Yeldeğirmeni''nin en iyilerinden.',
       'V60 Demleme Kahve',
       ARRAY[
         'Hangi çekirdeği seçeceğinizden emin değilseniz, baristadan o günkü favorisini demlemesini isteyin.',
         'Demleme süreci bir ritüel gibidir, izlemesi keyiflidir.',
         'Kahve hakkında derinlemesine sohbet etmek için harika bir yer.'
       ],
       6),
      
      -- 7. Çekirdek
      (v_kahve_category_id, 'Çekirdek', 'https://www.instagram.com/cekirdekkadikoy/',
       '/venues/istanbul/cekirdek.jpg', 40.9900, 29.0240, 4.6, 800,
       'Moda''nın ara sokaklarında saklı, küçücük ve çok samimi bir kahve dükkanı. Mahallelinin buluşma noktası.',
       'Americano',
       ARRAY[
         'Sadece birkaç taburesi vardır, genellikle insanlar kahvelerini alıp kapının önünde sohbet eder.',
         'İşletmecileri çok tatlı insanlardır, sohbet etmekten çekinmeyin.',
         'Ev yapımı atıştırmalıkları da bulunur.'
       ],
       7),
      
      -- 8. Fahriye Cafe
      (v_kahve_category_id, 'Fahriye Cafe', 'https://www.instagram.com/fahriyecafe/',
       '/venues/istanbul/fahriye.jpg', 40.9870, 29.0280, 4.4, 2800,
       'Eski eşyalarla dekore edilmiş, sizi zamanda yolculuğa çıkaran nostaljik bir kafe. Sadece kahve değil, atmosfer için de gidilir.',
       'Türk Kahvesi',
       ARRAY[
         'Ev yapımı limonataları ve bitki çayları da çok başarılıdır.',
         'Arka bahçesi, şehrin karmaşasından kaçmak için saklı bir vahadır.',
         'Eski bir radyo veya pikaptan gelen müzikler ruhunuza iyi gelecek.'
       ],
       8),
      
      -- 9. Brekkie Croissant & Cookie
      (v_kahve_category_id, 'Brekkie Croissant & Cookie', 'https://www.instagram.com/brekkie.kadikoy/',
       '/venues/istanbul/brekkie.jpg', 40.9850, 29.0280, 4.5, 2200,
       'Burası aslında bir kahveci değil, bir kruvasancı. Ama yaptıkları kruvasanlar o kadar iyi ki, kahvaltı ve kahve keyfi için listenin olmazsa olmazı.',
       'Kruvasan Kahvaltı Tabağı',
       ARRAY[
         'Hem tatlı hem tuzlu kruvasan seçenekleri var, hepsi denemeye değer.',
         'Hafta sonu kahvaltı saatlerinde kapısında uzun kuyruklar oluşur, erken gidin.',
         'Paket servis alıp Moda sahilinde yemek de harika bir seçenektir.'
       ],
       9),
      
      -- 10. Benazio Coffee
      (v_kahve_category_id, 'Benazio Coffee', 'https://www.instagram.com/benaziocoffee/',
       '/venues/istanbul/benazio.jpg', 40.9890, 29.0210, 4.7, 700,
       'Kadıköy Çarşısı''nın hemen girişinde, nitelikli kahve ve lezzetli tatlılar sunan küçük ama kaliteli bir durak.',
       'İspanyol Latte',
       ARRAY[
         'San Sebastian Cheesecake''leri çok popülerdir.',
         'Çarşıdaki kalabalıktan kısa bir mola vermek için ideal bir konumda.',
         'Yüksek masaları sayesinde ayakta hızlı bir kahve içmek için de uygundur.'
       ],
       10),
      
      -- 11. Heim
      (v_kahve_category_id, 'Heim', 'https://www.instagram.com/heimkadikoy/',
       '/venues/istanbul/heim.jpg', 40.9840, 29.0320, 4.5, 1000,
       'Yeldeğirmeni''nde, Berlin esintili endüstriyel tasarımı ve lezzetli kahvaltılarıyla bilinen popüler bir mekan.',
       'Heim Benedict',
       ARRAY[
         'Brunch için harika bir seçenektir, menüsü oldukça geniştir.',
         'Pankekleri ve granolaları da çok sevilir.',
         'Geniş ve ferah bir iç mekanı vardır, grup olarak gitmek için uygundur.'
       ],
       11);
  END IF;
END $$;