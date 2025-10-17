import axios from 'axios';
import { createClient } from '@supabase/supabase-js';
import { getRankedPlaces, GooglePlace, defaultParamsKadikoyHamburger } from './src/data/momentum-score';
import * as dotenv from 'dotenv';

dotenv.config();

const YOUR_GOOGLE_API_KEY = process.env.GOOGLE_API_KEY || 'BURAYA_KENDİ_GOOGLE_API_ANAHTARINI_YAPIŞTIR';
const SUPABASE_URL = process.env.VITE_SUPABASE_URL!;
const SUPABASE_ANON_KEY = process.env.VITE_SUPABASE_ANON_KEY!;

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

interface ExtendedGooglePlace extends GooglePlace {
  geometry?: {
    location: {
      lat: number;
      lng: number;
    };
  };
}

async function fetchTextSearch(query: string): Promise<ExtendedGooglePlace[]> {
  const url = 'https://maps.googleapis.com/maps/api/place/textsearch/json';
  const params = new URLSearchParams({
    query,
    key: YOUR_GOOGLE_API_KEY,
    language: 'tr',
    region: 'tr',
  });

  const { data } = await axios.get(`${url}?${params.toString()}`);

  if (data.status && data.status !== 'OK' && data.status !== 'ZERO_RESULTS') {
    throw new Error(`Google Places API hatası: ${data.status} - ${data.error_message || ''}`);
  }

  const places: ExtendedGooglePlace[] = (data.results || []).map((r: any) => ({
    place_id: r.place_id,
    name: r.name,
    rating: r.rating,
    user_ratings_total: r.user_ratings_total,
    business_status: r.business_status,
    opening_hours: r.opening_hours ? { open_now: r.opening_hours.open_now } : undefined,
    geometry: r.geometry,
  }));

  return places;
}

async function main() {
  if (!YOUR_GOOGLE_API_KEY || YOUR_GOOGLE_API_KEY === 'BURAYA_KENDİ_GOOGLE_API_ANAHTARINI_YAPIŞTIR') {
    console.error('❌ Lütfen Google API anahtarını ayarla (GOOGLE_API_KEY ortam değişkeni).');
    process.exit(1);
  }

  const district = process.env.DISTRICT || 'Kadıköy';
  const categorySlug = process.env.CATEGORIES || 'hamburger';
  const query = `${categorySlug} restaurant in ${district}, Istanbul`;

  console.log(`\n🔎 Google'a soruluyor → "${query}"`);

  const googlePlaces = await fetchTextSearch(query);
  console.log(`✅ Google'dan ${googlePlaces.length} adet mekan bilgisi alındı.`);
  console.log('🧠 Momentum Skoru algoritması çalıştırılıyor...\n');

  const ranked = getRankedPlaces(googlePlaces, defaultParamsKadikoyHamburger);

  const topVenues = ranked
    .filter(p => !p.rejectedReason)
    .slice(0, 11);

  console.log(`🏆 ${district}'ün En İyi ${categorySlug} Mekanları (Canlı Veri):\n`);
  topVenues.forEach((p, i) => {
    console.log(
      `${String(i + 1).padStart(2, ' ')}. ${p.name} — ⭐ ${p.rating?.toFixed(1)} (${p.user_ratings_total} yorum) | Final Skoru: ${p.FinalScore.toFixed(3)}`
    );
  });

  // Supabase'e yaz
  console.log('\n📝 Supabase database\'e yazılıyor...');

  // Önce category ID'yi bul
  const { data: category } = await supabase
    .from('district_food_categories')
    .select('id, district_id')
    .eq('category_slug', categorySlug)
    .limit(1)
    .maybeSingle();

  if (!category) {
    console.error(`❌ Kategori bulunamadı: ${categorySlug}`);
    process.exit(1);
  }

  // Mevcut venue'leri sil
  await supabase
    .from('district_venues')
    .delete()
    .eq('district_category_id', category.id);

  // Yeni venue'leri ekle
  const inserts = topVenues.map((venue, index) => ({
    district_category_id: category.id,
    name: venue.name,
    google_rating: venue.rating,
    google_review_count: venue.user_ratings_total,
    latitude: (venue as ExtendedGooglePlace).geometry?.location.lat,
    longitude: (venue as ExtendedGooglePlace).geometry?.location.lng,
    display_order: index + 1,
    mentor_note: `${venue.rating} yıldız, ${venue.user_ratings_total} yorum. Final Skoru: ${venue.FinalScore.toFixed(3)}`,
    must_order: 'Önerilen menü',
  }));

  const { error } = await supabase
    .from('district_venues')
    .insert(inserts);

  if (error) {
    console.error('❌ Database yazma hatası:', error);
    process.exit(1);
  }

  console.log(`✅ ${topVenues.length} mekan başarıyla database'e yazıldı!`);
  console.log(`\n🎯 Sonuç: ${district} -> ${categorySlug} kategorisi Google'dan güncellendi.`);
}

main().catch((err) => {
  console.error('❌ Test sırasında bir hata oluştu:', err?.message || err);
  process.exit(1);
});
