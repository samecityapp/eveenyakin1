/*
  # Add Phuket Food Guide - Correct Schema

  6 food categories with 4 venues each (24 total)
  Using correct column names: food_category_id, lat/lng, image, map_link
*/

DO $$
DECLARE
  v_phuket_id UUID;
  v_cat_id UUID;
BEGIN
  SELECT id INTO v_phuket_id FROM cities WHERE slug = 'phuket';

  -- 1. Thai Food
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order)
  VALUES (v_phuket_id, 'En İyi Tayland Restoranları', 'thai-food', 'Utensils', 1)
  RETURNING id INTO v_cat_id;

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Raya Restaurant', 'https://maps.google.com/?q=7.886,98.390', 7.886, 98.390, 4.4, 2500, 'Phuket Town''daki tarihi binada otantik Güney Tayland mutfağı.', ARRAY['Yengeçli köri imza yemeği', 'Atmosfer otantik', 'Baharatlı yemekler'], 'Moo Hong', '/venues/phuket/raya.jpg', 1, 'https://www.rayarestaurant.com/'),
    (v_cat_id, 'Blue Elephant', 'https://maps.google.com/?q=7.878,98.390', 7.878, 98.390, 4.5, 3200, 'Royal Thai mutfağını modern yorumlarla sunan lüks restoran.', ARRAY['Şık atmosfer', 'Fiyatlar yüksek', 'Tasting menü tavsiye'], 'Massaman Curry', '/venues/phuket/blueelephant.jpg', 2, 'https://www.blueelephant.com/phuket/'),
    (v_cat_id, 'Ka Jok See', 'https://maps.google.com/?q=7.882,98.392', 7.882, 98.392, 4.6, 1800, 'Canlı müzik ve dans şovu eşliğinde yemek.', ARRAY['Rezervasyon şart', 'Dans pisti var', 'Enerji dolu'], 'Grilled Chicken', '/venues/phuket/kajoksee.jpg', 3, 'https://kajoksee.com/'),
    (v_cat_id, 'Suay Restaurant', 'https://maps.google.com/?q=7.884,98.388', 7.884, 98.388, 4.7, 2100, 'Farm-to-table organik Thai mutfağı.', ARRAY['Sağlıklı yemekler', 'Vejetaryen seçenekler', 'İyi fiyat/performans'], 'Green Curry', '/venues/phuket/suay.jpg', 4, 'https://www.suayrestaurant.com/');

  -- 2. Seafood
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order)
  VALUES (v_phuket_id, 'En İyi Deniz Ürünleri', 'seafood', 'Fish', 2)
  RETURNING id INTO v_cat_id;

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Kan Eang @ Pier', 'https://maps.google.com/?q=7.830,98.396', 7.830, 98.396, 4.5, 3000, 'Chalong İskelesi yanında taze deniz ürünleri.', ARRAY['Akvaryumdan seçebilirsiniz', 'Gün batımı manzarası', 'Fiyatlar yüksek'], 'Grilled Tiger Prawns', '/venues/phuket/kaneang.jpg', 1, 'https://www.kaneang.com/'),
    (v_cat_id, 'Bang Rong Pier', 'https://maps.google.com/?q=8.043,98.433', 8.043, 98.433, 4.6, 2500, 'Mangrove ormanları arasında ağaç evler.', ARRAY['Atmosfer eşsiz', 'Taze ürünler', 'Ulaşım zor'], 'Mantis Shrimp', '/venues/phuket/bangrong.jpg', 2, 'https://www.bangrongseafood.com/'),
    (v_cat_id, 'The Boathouse', 'https://maps.google.com/?q=7.775,98.302', 7.775, 98.302, 4.4, 1800, 'Kata Beach''de lüks deniz ürünleri.', ARRAY['Şarap listesi muhteşem', 'Çok yüksek fiyat', 'Plaja sıfır'], 'Grilled Lobster', '/venues/phuket/boathouse.jpg', 3, 'https://www.boathousephuket.com/'),
    (v_cat_id, 'Rawai Seafood Market', 'https://maps.google.com/?q=7.780,98.318', 7.780, 98.318, 4.3, 5000, 'Taze ürün alıp pişirtme sistemi.', ARRAY['Pazarlık yapabilirsiniz', 'Yerel deneyim', 'Hijyen değişken'], 'Your Own Catch', '/venues/phuket/rawaimarket.jpg', 4, 'https://www.rawaimarket.com/');

  -- 3. Street Food
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order)
  VALUES (v_phuket_id, 'Sokak Lezzetleri & Pazarlar', 'street-food', 'UtensilsCrossed', 3)
  RETURNING id INTO v_cat_id;

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Old Town Sunday Market', 'https://maps.google.com/?q=7.884,98.391', 7.884, 98.391, 4.6, 8000, 'Pazar akşamları yürüyüş sokağı.', ARRAY['Her türlü yiyecek', 'Canlı müzik', 'Çok kalabalık'], 'Coconut Ice Cream', '/venues/phuket/sundaymarket.jpg', 1, 'https://www.facebook.com/phuketoldtown/'),
    (v_cat_id, 'Chillva Market', 'https://maps.google.com/?q=7.885,98.392', 7.885, 98.392, 4.5, 6500, 'Her gece açık genç pazar.', ARRAY['Streetwear alışveriş', 'Yemek bol', 'Canlı müzik'], 'Mango Sticky Rice', '/venues/phuket/chillva.jpg', 2, 'https://www.facebook.com/chillvamarket/'),
    (v_cat_id, 'Malin Plaza Patong', 'https://maps.google.com/?q=7.896,98.296', 7.896, 98.296, 4.3, 4200, 'Patong''un en büyük yemek caddesi.', ARRAY['İnanılmaz çeşit', 'Çok uygun', 'Hijyen değişken'], 'Pad Thai', '/venues/phuket/malinplaza.jpg', 3, 'https://www.malinplaza.com/'),
    (v_cat_id, 'Banzaan Fresh Market', 'https://maps.google.com/?q=7.893,98.296', 7.893, 98.296, 4.4, 3800, 'Yerel pazar, üst katta food court.', ARRAY['Yerel pazarı', 'Taze ürünler', 'Food court ucuz'], 'Som Tam', '/venues/phuket/banzaan.jpg', 4, 'https://www.facebook.com/banzaanmarket/');

  -- 4. Beach Bars
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order)
  VALUES (v_phuket_id, 'En İyi Plaj Barları', 'beach-bars', 'Waves', 4)
  RETURNING id INTO v_cat_id;

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'Catch Beach Club', 'https://maps.google.com/?q=7.798,98.306', 7.798, 98.306, 4.5, 4200, 'Phuket''in en lüks beach club''ı.', ARRAY['Sunset rezervasyon şart', 'Çok yüksek fiyat', 'Infinity pool'], 'Mojito', '/venues/phuket/catchbeach.jpg', 1, 'https://www.catchbeachclub.com/'),
    (v_cat_id, 'Cafe Del Mar', 'https://maps.google.com/?q=7.815,98.327', 7.815, 98.327, 4.4, 3800, 'İbiza tarzı sunset bar.', ARRAY['DJ setleri', 'Geniş kokteyl menüsü', 'Happy hour'], 'Pina Colada', '/venues/phuket/cafedelmar.jpg', 2, 'https://www.cafedelmar-phuket.com/'),
    (v_cat_id, 'Bimi Beach Club', 'https://maps.google.com/?q=7.815,98.324', 7.815, 98.324, 4.6, 2100, 'Şık ve modern beach club.', ARRAY['Lezzetli yemekler', 'Güzel ambiyans', 'İyi fiyat/performans'], 'Watermelon Shake', '/venues/phuket/bimi.jpg', 3, 'https://www.bimibeachclub.com/'),
    (v_cat_id, 'Reggae Bar Patong', 'https://maps.google.com/?q=7.899,98.297', 7.899, 98.297, 4.2, 5600, 'Patong''un ünlü parti barı.', ARRAY['Muay Thai gösterisi', 'Ucuz alkol', 'Genç kitle'], 'Bucket Cocktail', '/venues/phuket/reggaebar.jpg', 4, 'https://www.facebook.com/reggaebarphuket/');

  -- 5. Cafes
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order)
  VALUES (v_phuket_id, 'En İyi Kafeler', 'cafes', 'Coffee', 5)
  RETURNING id INTO v_cat_id;

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'The Gallery Cafe', 'https://maps.google.com/?q=7.880,98.388', 7.880, 98.388, 4.7, 1800, 'Sanat galerisi ve kafe.', ARRAY['Mükemmel kahve', 'Huzurlu atmosfer', 'Harika brunch'], 'Flat White', '/venues/phuket/gallerycafe.jpg', 1, 'https://www.thegalleryphuket.com/'),
    (v_cat_id, 'Torry''s Ice Cream', 'https://maps.google.com/?q=7.882,98.390', 7.882, 98.390, 4.6, 3200, 'El yapımı dondurma.', ARRAY['Zengin çeşit', 'Uygun fiyat', 'Aileler için'], 'Coconut Ice Cream', '/venues/phuket/torrys.jpg', 2, 'https://www.torrysicecream.com/'),
    (v_cat_id, 'Chalong Bay Rum Cafe', 'https://maps.google.com/?q=7.820,98.365', 7.820, 98.365, 4.5, 2100, 'Rom fabrikası içinde kafe.', ARRAY['Fabrika turu', 'Rom kokteylleri', 'Yüksek fiyat'], 'Rom Espresso Tonic', '/venues/phuket/chalongbay.jpg', 3, 'https://www.chalongbayrum.com/'),
    (v_cat_id, 'Dibuk Coffee', 'https://maps.google.com/?q=7.885,98.389', 7.885, 98.389, 4.4, 1600, 'Trendy specialty kahve.', ARRAY['Pour-over mükemmel', 'Bilgili barista', 'Dar mekan'], 'V60 Pour Over', '/venues/phuket/dibuk.jpg', 4, 'https://www.dibukcoffee.com/');

  -- 6. International
  INSERT INTO food_categories (city_id, name, slug, icon, sort_order)
  VALUES (v_phuket_id, 'Uluslararası Mutfaklar', 'international', 'Globe', 6)
  RETURNING id INTO v_cat_id;

  INSERT INTO venues (food_category_id, name, map_link, lat, lng, google_rating, google_review_count, mentor_note, reviews_summary, must_order, image, sort_order, website_url)
  VALUES
    (v_cat_id, 'La Gritta', 'https://maps.google.com/?q=7.785,98.310', 7.785, 98.310, 4.6, 2100, 'Deniz manzaralı İtalyan restoranı.', ARRAY['Romantik manzara', 'Yüksek pasta kalitesi', 'Çok pahalı'], 'Carbonara', '/venues/phuket/lagritta.jpg', 1, 'https://www.lagritta.com/'),
    (v_cat_id, 'Joe''s Downstairs', 'https://maps.google.com/?q=7.890,98.293', 7.890, 98.293, 4.5, 3400, 'İtalyan-Amerikan, şarap barı.', ARRAY['Geniş şarap listesi', 'Harika pizza', 'İyi fiyat/performans'], 'Margherita Pizza', '/venues/phuket/joesdownstairs.jpg', 2, 'https://www.joesdownstairs.com/'),
    (v_cat_id, 'Mad Hog Tavern', 'https://maps.google.com/?q=7.883,98.387', 7.883, 98.387, 4.4, 1600, 'Gastropub, burger uzmanı.', ARRAY['Zengin burger menüsü', 'Craft beer', 'Makul fiyat'], 'Mad Hog Burger', '/venues/phuket/madhog.jpg', 3, 'https://www.madhogtavern.com/'),
    (v_cat_id, 'Diavolo Pizzeria', 'https://maps.google.com/?q=7.881,98.389', 7.881, 98.389, 4.6, 2400, 'Napoli tarzı otantik pizza.', ARRAY['Gerçek İtalyan pizza', 'Makul fiyat', 'Küçük mekan'], 'Diavola Pizza', '/venues/phuket/diavolo.jpg', 4, 'https://www.facebook.com/diavolophuket/');

  RAISE NOTICE 'Phuket food guide completed with 24 venues!';
END $$;
