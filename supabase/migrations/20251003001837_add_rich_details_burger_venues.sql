/*
  # Add Rich Details to London Burger Venues
  
  ## Summary
  Adds mentor notes, customer review summaries, and must-order items to all 11 burger venues
  
  ## Content Strategy
  - Mentor Note: Concise, personality-driven one-liner
  - Reviews Summary: 3 authentic customer insights with emojis
  - Must Order: Signature dish recommendation
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT fc.id INTO v_category_id
  FROM food_categories fc
  JOIN cities c ON c.id = fc.city_id
  WHERE c.slug = 'londra' AND fc.slug = 'hamburger';

  -- Bleecker St. Burger
  UPDATE venues SET
    mentor_note = 'Burası ''az laf, çok lezzet'' diyenlerin mabedi. Londra''daki en iyi, en saf hamburger deneyimi için ilk durak.',
    reviews_summary = ARRAY[
      '🍔 Köftesi o kadar iyi ki başka hiçbir sosa veya malzemeye ihtiyaç duymuyor.',
      '🍟 Patatesleri hem yumuşak hem çıtır, yanında gelen gizli sosları efsane.',
      '🥤 Yaptıkları milkshake''ler çok yoğun ve lezzetli, mutlaka deneyin.'
    ],
    must_order = 'Double Cheeseburger'
  WHERE food_category_id = v_category_id AND name = 'Bleecker St. Burger';

  -- Patty & Bun
  UPDATE venues SET
    mentor_note = 'Peçetelerinizi hazırlayın, çünkü burası dağılan, akan, bol soslu ve aşırı lezzetli bir deneyim vaat ediyor.',
    reviews_summary = ARRAY[
      '🍞 Brioche ekmeği o kadar yumuşak ki burgerle birlikte eriyip gidiyor.',
      '🌶️ ''Smokey Robinson'' burgerindeki karamelize soğan ve acı mayonez dengesi harika.',
      '🎶 Müzikler ve atmosfer her zaman çok enerjik, arkadaş grubuyla gitmek için ideal.'
    ],
    must_order = 'Ari Gold Cheeseburger'
  WHERE food_category_id = v_category_id AND name = 'Patty & Bun';

  -- Black Bear Burger
  UPDATE venues SET
    mentor_note = 'Gurme dokunuşlar arayanlar için. Yavaş pişirilmiş dana kaburga (brisket) eklenmiş burgerleriyle fark yaratıyor.',
    reviews_summary = ARRAY[
      '🥩 Brisket''li burgerleri yumuşacık, et kalitesi gerçekten üst seviye.',
      '🧀 Peynir seçenekleri çok geniş, blue cheese''li olanı muhteşem.',
      '🎨 Mekan küçük ama şık, rezervasyon yapmanızı öneririm.'
    ],
    must_order = 'Black Bear Brisket Burger'
  WHERE food_category_id = v_category_id AND name = 'Black Bear Burger';

  -- Honest Burgers
  UPDATE venues SET
    mentor_note = 'Kalitesini asla bozmayan, güvenilir bir zincir. Her şubesi aynı kalitede ve daima doyurucu.',
    reviews_summary = ARRAY[
      '🌿 Biberiyeli patates kızartmaları Londra''nın en iyisi, bağımlılık yapıyor.',
      '🍔 Burgerler her zaman taze ve sulu, hiç hayal kırıklığına uğratmadılar.',
      '🍺 Craft beer seçkisi çok geniş, burger ile mükemmel gidiyor.'
    ],
    must_order = 'Honest Burger with Rosemary Chips'
  WHERE food_category_id = v_category_id AND name = 'Honest Burgers';

  -- MEATliquor
  UPDATE venues SET
    mentor_note = 'Kirli ama lezzetli! Amerikan ''diner'' konsepti, cesur tatlar ve harika kokteyller.',
    reviews_summary = ARRAY[
      '🎸 Ortam çok rock''n''roll, karanlık ve hareketli, gençlerin favorisi.',
      '🍔 ''Dead Hippie'' burgeri efsane, hardal ve turşuyla mükemmel uyum.',
      '🍹 Kokteylleri en az burgerleri kadar iyi, ''MEATshake'' deneyin.'
    ],
    must_order = 'Dead Hippie Burger'
  WHERE food_category_id = v_category_id AND name = 'MEATliquor';

  -- Mother Flipper
  UPDATE venues SET
    mentor_note = 'Sokak yemeği efsanesi. Genellikle pazar yerlerinde bulunan, her zaman kalabalık ve beklemeye değer.',
    reviews_summary = ARRAY[
      '⏰ Kuyruğu göz korkutmasın, hızlı hareket ediyorlar ve gerçekten beklemeye değer.',
      '🥓 Bacon''ları mükemmel çıtır, butternut squash burgeri vegetaryenler için harika.',
      '📍 Genelde Borough Market''te bulunuyorlar, Instagram''dan konum takip edin.'
    ],
    must_order = 'The Mother Flipper (Classic)'
  WHERE food_category_id = v_category_id AND name = 'Mother Flipper';

  -- Burger & Beyond
  UPDATE venues SET
    mentor_note = 'Eski bir sokak yemeği standından, şehrin en iyi restoranlarından birine dönüştü. Kalın ve sulu köfteleriyle ünlü.',
    reviews_summary = ARRAY[
      '🍔 Köfteler gerçekten kalın ve orta pişmiş olarak geliyor, çok lezzetli.',
      '🧈 ''Wagyu Cheeseburger'' pahalı ama tadına doyum olmuyor.',
      '🍟 Sweet potato fries''ları da harika, yanında dip soslarını deneyin.'
    ],
    must_order = 'Wagyu Cheeseburger'
  WHERE food_category_id = v_category_id AND name = 'Burger & Beyond';

  -- Four Legs
  UPDATE venues SET
    mentor_note = 'Bir pub''ın içinde saklı bir cevher. Menüsü sürekli değişse de ''Dexter'' burgerleri kült bir takipçi kitlesine sahip.',
    reviews_summary = ARRAY[
      '🍺 Önce pub, sonra burger yeri, bu yüzden ortam çok samimi ve rahat.',
      '🍔 Burgerler sürekli değişiyor ama hepsi harika, günün özel burgerini sorun.',
      '🎯 Küçük ve popüler, erken gitmenizi öneririm yoksa yer bulamayabilirsiniz.'
    ],
    must_order = 'Dexter Burger (if available)'
  WHERE food_category_id = v_category_id AND name = 'Four Legs';

  -- Quality Chop House
  UPDATE venues SET
    mentor_note = 'Bir burgerciden çok, efsanevi bir et restoranı. Ama menülerindeki burger, yiyebileceğiniz en kaliteli ve lezzetlilerden biri.',
    reviews_summary = ARRAY[
      '🥩 Et kalitesi başka seviyede, butcher''dan direkt geliyor hissi veriyor.',
      '💰 Fiyatlar yüksek ama özel günler için mükemmel bir seçim.',
      '🍷 Şarap listesi çok zengin, burger ile şarap deneyimini yaşayın.'
    ],
    must_order = 'The Chop House Burger'
  WHERE food_category_id = v_category_id AND name = 'Quality Chop House';

  -- Dip & Flip
  UPDATE venues SET
    mentor_note = 'Burgerinizi ''gravy'' sosuna batırma konsepti. Farklı ve doyurucu bir deneyim arayanlar için.',
    reviews_summary = ARRAY[
      '🥘 Gravy sosuna batırma fikri ilk başta garip gelebilir ama inanılmaz lezzetli.',
      '🍔 Burgerler zaten lezzetli ama sos onları bir başka boyuta taşıyor.',
      '🤤 Çok doyurucu, hafif bir atıştırmalık arayanlar dikkat etsin!'
    ],
    must_order = 'Classic Dip Burger with Gravy'
  WHERE food_category_id = v_category_id AND name = 'Dip & Flip';

  -- The Beefsteaks
  UPDATE venues SET
    mentor_note = 'Et kalitesine odaklanan, pazar yerlerinin bir başka yıldızı. Steak sandviçleri de en az burgerleri kadar iyi.',
    reviews_summary = ARRAY[
      '🥩 Et doğramıyorlar, tam steak parçalarını burger haline getiriyorlar.',
      '📍 Maltby Street Market''te bulunuyorlar, hafta sonu gitmek en iyisi.',
      '🧂 Baharatlandırma mükemmel, kırmızı et severler bayılacak.'
    ],
    must_order = 'The Beefsteak Burger'
  WHERE food_category_id = v_category_id AND name = 'The Beefsteaks';

END $$;
