/*
  # Add Paris Boulangerie Venues

  1. New Data
    - 11 iconic Paris bakeries
    - Complete details with ratings and coordinates
    
  2. Notes
    - Showcases Paris's legendary baking culture
    - Matches gold standard (11 venues)
*/

DO $$
DECLARE
  v_category_id uuid;
BEGIN
  SELECT id INTO v_category_id 
  FROM food_categories 
  WHERE city_id = (SELECT id FROM cities WHERE slug = 'paris')
  AND slug = 'firin';

  INSERT INTO venues (food_category_id, name, image, map_link, website_url, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, sort_order) VALUES
    (v_category_id, 'Du Pain et des Idées', 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=800', 'https://maps.google.com/?q=Du+Pain+et+des+Idées+Paris', 'https://dupainetdesidees.com/', 48.871, 2.366, 4.6, 3500,
    'Rustik ve geleneksel lezzetlerin modern bir dokunuşla sunulduğu, Paris''in en meşhur fırınlarından. Escargot (salyangoz) şeklindeki hamur işleri efsane.',
    ARRAY['🥐 Pain des Amis (Arkadaşların Ekmeği) mutlaka denenmeli.', '🐌 Escargot aux Pistaches (Fıstıklı Salyangoz) inanılmaz lezzetli.', '⏳ Her zaman sıra var, sabırlı olun.'],
    'Escargot Pistache-Chocolat', 1),
    
    (v_category_id, 'Poilâne', 'https://images.unsplash.com/photo-1585478259715-876acc5be8eb?w=800', 'https://maps.google.com/?q=Poilâne+Paris', 'https://www.poilane.com/', 48.852, 2.331, 4.6, 2000,
    'Ekşi mayalı dev ekmekleriyle (miche) dünya çapında bir üne sahip, tarihi ve ikonik bir fırın.',
    ARRAY['🍞 Ekşi mayalı ekmekleri bir sanat eseri.', '🍎 Elmalı tartları (chausson aux pommes) harika.', '🍪 Tereyağlı kurabiyeleri (punitions) hediye almak için mükemmel.'],
    'Dilim Ekşi Mayalı Ekmek', 2),
    
    (v_category_id, 'Mamiche', 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800', 'https://maps.google.com/?q=Mamiche+Paris', 'https://www.mamiche.fr/', 48.867, 2.381, 4.7, 1800,
    'Japonya''dan gelen şef Kaoru Aoki''nin Paris''teki fırını. Japon hassasiyetiyle Fransız geleneği birleşiyor.',
    ARRAY['🇯🇵 Japon titizliği ve Fransız lezzetinin muhteşem kombinasyonu.', '🥐 Croissant''ları kat kat katmanlı ve tereyağlı.', '🍰 Pastalarını da denemeyi unutmayın.'],
    'Croissant', 3),
    
    (v_category_id, 'Boulangerie Utopie', 'https://images.unsplash.com/photo-1608198093002-ad4e005484ec?w=800', 'https://maps.google.com/?q=Boulangerie+Utopie+Paris', 'https://www.boulangerieutopie.com/', 48.868, 2.361, 4.6, 1500,
    'Organik malzemelerle, tamamen el yapımı ve geleneksel yöntemlerle çalışan bir fırın.',
    ARRAY['🌾 Organik un ve doğal mayalarla yapılan ekmekler.', '🥖 Baguette''leri Paris''in en iyilerinden.', '🥨 Pretzel ve diğer özel hamur işlerini de deneyebilirsiniz.'],
    'Baguette Tradition', 4),
    
    (v_category_id, 'Des Gâteaux et du Pain', 'https://images.unsplash.com/photo-1549946973-070b2e13bc66?w=800', 'https://maps.google.com/?q=Des+Gâteaux+et+du+Pain', 'https://www.desgateauxetdupain.com/', 48.859, 2.372, 4.5, 2200,
    'Claire Damon''un harika pastalarıyla ünlü fırını. Sabah kahvaltısı için de, öğleden sonra çayı için de mükemmel.',
    ARRAY['🍰 Pastaları gerçekten olağanüstü, özellikle Paris-Brest.', '🥐 Croissant ve pain au chocolat da çok başarılı.', '☕ Oturup kahve içebileceğiniz alanı var.'],
    'Paris-Brest', 5),
    
    (v_category_id, 'La Parisienne', 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=800', 'https://maps.google.com/?q=La+Parisienne+Boulangerie', 'https://www.laparisienne.com/', 48.843, 2.356, 4.7, 1900,
    'Yerel bir favorisi, sabah erken saatlerde fırından yeni çıkan ekmeğin kokusunu almak için.',
    ARRAY['🌅 Sabah 7''de açıyorlar, taze ekmek kokusu harika.', '🥖 Klasik Fransız baguette''inin en güzel örneklerinden.', '👨‍🍳 Aileden geçme tarifler kullanıyorlar.'],
    'Baguette', 6),
    
    (v_category_id, 'Bo & Mie', 'https://images.unsplash.com/photo-1558961363-fa8fdf82db35?w=800', 'https://maps.google.com/?q=Bo+Mie+Paris', 'https://www.boetmie.com/', 48.853, 2.373, 4.6, 1400,
    'Modern ve yaratıcı hamur işleriyle tanınan, genç bir fırın.',
    ARRAY['🎨 Yaratıcı tatlar ve modern sunumlar.', '🥐 Vişneli ve bademli croissant denemeye değer.', '📍 Birden fazla şubesi var.'],
    'Croissant Cerise-Amande', 7),
    
    (v_category_id, 'Le Grenier à Pain', 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800', 'https://maps.google.com/?q=Le+Grenier+à+Pain', 'https://www.legrenierainpain.com/', 48.881, 2.347, 4.5, 3000,
    'Paris''in en iyi baguette''ini yapan fırınlardan biri olarak birçok ödül kazanmış.',
    ARRAY['🏆 Çok sayıda ödül kazanmış, özellikle baguette kategorisinde.', '🥖 Baguette seçenekleri çok çeşitli.', '🌰 Fındık ve kuruyemişli ekmekleri de harika.'],
    'Baguette Montorgueil', 8),
    
    (v_category_id, 'Eric Kayser', 'https://images.unsplash.com/photo-1608198093002-ad4e005484ec?w=800', 'https://maps.google.com/?q=Eric+Kayser+Paris', 'https://www.maison-kayser.com/', 48.856, 2.347, 4.5, 2800,
    'Dünya çapında şubeleri olan, ama kalitesini hiç kaybetmeyen ünlü zincir fırın.',
    ARRAY['🌍 Uluslararası başarısına rağmen kaliteyi koruyor.', '🥐 Viennoiserie''leri (hamur işleri) çok iyi.', '📍 Paris''te çok sayıda şubesi var, kolayca bulabilirsiniz.'],
    'Pain au Chocolat', 9),
    
    (v_category_id, 'Blé Sucré', 'https://images.unsplash.com/photo-1549946973-070b2e13bc66?w=800', 'https://maps.google.com/?q=Blé+Sucré+Paris', 'https://www.blesucre.com/', 48.846, 2.377, 4.7, 1600,
    'Küçük, butik bir fırın. Her şey el yapımı ve çok özenli.',
    ARRAY['👩‍🍳 Fabrice Le Bourdat''nın hassas işçiliği her hamur işinde görülüyor.', '🍓 Mevsimlik meyveli tartları mükemmel.', '🏡 Samimi ve sıcak bir atmosferi var.'],
    'Tarte aux Fraises', 10),
    
    (v_category_id, 'Vandermeersch', 'https://images.unsplash.com/photo-1585478259715-876acc5be8eb?w=800', 'https://maps.google.com/?q=Vandermeersch+Paris', 'https://www.vandermeersch.fr/', 48.824, 2.348, 4.6, 1300,
    'Geleneksel yöntemlere sadık kalan, 3 kuşaktır aile tarafından işletilen fırın.',
    ARRAY['👨‍👩‍👧 Aile işletmesi olmanın sıcaklığı her detayda hissediliyor.', '🥖 Ekşi mayalı ekmekleri çok ünlü.', '🏛️ 1970''lerden beri aynı yerde hizmet veriyor.'],
    'Pain au Levain', 11);

END $$;
