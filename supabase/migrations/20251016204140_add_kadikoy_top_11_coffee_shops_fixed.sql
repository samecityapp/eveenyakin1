/*
  # Kadıköy'ün En İyi 11 Kahvecisi

  Montag Coffee, Petra, Kronotrop, Fazıl Bey ve diğer popüler kahveciler
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
      (v_kahve_category_id, 'Montag Coffee Roasters', 'https://www.montagcoffee.com/', 
       '/venues/istanbul/kadikoy/montag.jpg', 40.9910, 29.0258, 4.5, 2500,
       'Kadıköy''ün üçüncü dalga kahve sahnesinin öncülerinden. Soğuk demleme kahveleri ve minimalist atmosferiyle bilinir.',
       'Cold Brew',
       ARRAY['Hafta sonları çok kalabalık, sakin saatleri kollayın.', 'Kendi kavurdukları çekirdeklerden alın.'],
       1),
      
      (v_kahve_category_id, 'Petra Roasting Co.', 'https://www.instagram.com/petraroastingco/',
       '/venues/istanbul/kadikoy/petra.jpg', 40.9885, 29.0265, 4.6, 1800,
       'Kendi kavurduğu özel çekirdekleriyle tanınan butik kahveci.',
       'V60 Pour Over',
       ARRAY['Günlük kavrulan çekirdekler öğleden sonra hazır.', 'Barista''ya tercihlerinizi anlatın.'],
       2),
      
      (v_kahve_category_id, 'Kronotrop', 'https://www.kronotrop.com.tr/',
       '/venues/istanbul/kadikoy/kronotrop.jpg', 40.9895, 29.0271, 4.4, 3200,
       'Modern kahve deneyimi sunan, specialty coffee''ye odaklanan popüler zincir.',
       'Flat White',
       ARRAY['Wifi hızlı, laptop''la çalışmak için uygun.', 'Sabah 08:00''da açılıyor.'],
       3),
      
      (v_kahve_category_id, 'Fazıl Bey Türk Kahvesi', 'https://www.instagram.com/fazilbey/',
       '/venues/istanbul/kadikoy/fazilbey.jpg', 40.9902, 29.0250, 4.7, 4500,
       'Geleneksel Türk kahvesinin modern yorumu. Kadıköy''de bir efsane! 40''dan fazla çeşit Türk kahvesi.',
       'Damla Sakızlı Türk Kahvesi',
       ARRAY['Farklı aromalar deneyin.', 'Lokum ikramı harika.'],
       4),
      
      (v_kahve_category_id, 'Norm Coffee Roasters', 'https://www.normcoffee.com/',
       '/venues/istanbul/kadikoy/norm.jpg', 40.9905, 29.0268, 4.5, 1600,
       'Specialty coffee tutkunu barista''ların mekanı. Her fincan bir sanat eseri gibi hazırlanıyor.',
       'Chemex',
       ARRAY['Kahve workshoplarına katılın.', 'Çekirdek satışları yapılıyor.'],
       5),
      
      (v_kahve_category_id, '% Coffee', 'https://www.percentcoffee.com/',
       '/venues/istanbul/kadikoy/percent.jpg', 40.9888, 29.0255, 4.6, 1400,
       'Minimal tasarım ve maksimum lezzet felsefesiyle çalışan modern kahve dükkanı.',
       'Aeropress',
       ARRAY['Bahçe kısmı harika.', 'Filter kahveleri başarılı.'],
       6),
      
      (v_kahve_category_id, 'Café Privé', 'https://www.cafeprive.com.tr/',
       '/venues/istanbul/kadikoy/cafeprive.jpg', 40.9892, 29.0262, 4.3, 2100,
       'Şık atmosferi ve geniş menüsüyle bilinen zincir cafe.',
       'Cappuccino',
       ARRAY['Yemek menüsü geniş.', 'Wifi var.'],
       7),
      
      (v_kahve_category_id, 'Brew Lab', 'https://www.instagram.com/brewlabistanbul/',
       '/venues/istanbul/kadikoy/brewlab.jpg', 40.9898, 29.0270, 4.7, 900,
       'Deney tadında kahve deneyimleri sunan butik mekan.',
       'Siphon Coffee',
       ARRAY['Her ayın özel kahvesi var.', 'Barista''lar çok bilgili.'],
       8),
      
      (v_kahve_category_id, 'Walter''s Coffee Roastery', 'https://www.walterscoffee.com/',
       '/venues/istanbul/kadikoy/walters.jpg', 40.9908, 29.0263, 4.5, 2800,
       'Filter coffee uzmanı, dünya çapında tanınan çekirdeklerle çalışıyorlar.',
       'V60 Ethiopia Yirgacheffe',
       ARRAY['Farklı ülkelerin çekirdeklerini deneyin.', 'Hafta sonu kahve atölyeleri var.'],
       9),
      
      (v_kahve_category_id, 'Espressolab', 'https://www.espressolab.com/',
       '/venues/istanbul/kadikoy/espressolab.jpg', 40.9900, 29.0257, 4.2, 5200,
       'Zincir olmasına rağmen kalitesinden ödün vermeyen popüler kahveci.',
       'Spanish Latte',
       ARRAY['Her yerde bulabilirsiniz.', 'Soğuk kahve çeşitleri harika.'],
       10),
      
      (v_kahve_category_id, 'Starbucks Reserve Kadıköy', 'https://www.starbucks.com.tr/',
       '/venues/istanbul/kadikoy/starbucks-reserve.jpg', 40.9895, 29.0266, 4.4, 6800,
       'Premium Starbucks deneyimi. Özel çekirdekler ve brewing yöntemleri.',
       'Nitro Cold Brew',
       ARRAY['Reserve serisini deneyin.', 'İç tasarım Instagram''lık.'],
       11);
  END IF;
END $$;