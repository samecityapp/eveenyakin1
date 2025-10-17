import axios from 'axios';
import { getRankedPlaces, GooglePlace, defaultParamsKadikoyHamburger } from './src/data/momentum-score';

const YOUR_GOOGLE_API_KEY = process.env.GOOGLE_API_KEY || 'BURAYA_KENDİ_GOOGLE_API_ANAHTARINI_YAPIŞTIR';

async function fetchTextSearch(query: string): Promise<GooglePlace[]> {
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

  const places: GooglePlace[] = (data.results || []).map((r: any) => ({
    place_id: r.place_id,
    name: r.name,
    rating: r.rating,
    user_ratings_total: r.user_ratings_total,
    business_status: r.business_status,
    opening_hours: r.opening_hours ? { open_now: r.opening_hours.open_now } : undefined,
  }));

  return places;
}

async function main() {
  if (!YOUR_GOOGLE_API_KEY || YOUR_GOOGLE_API_KEY === 'BURAYA_KENDİ_GOOGLE_API_ANAHTARINI_YAPIŞTIR') {
    console.error('Lütfen Google API anahtarını ayarla (run-test.ts dosyasının içinde veya ortam değişkeni olarak).');
    process.exit(1);
  }

  const query = 'hamburger restaurant in Kadıköy, Istanbul';
  console.log(`\n🔎 Google'a soruluyor → "${query}"`);

  const googlePlaces = await fetchTextSearch(query);
  console.log(`✅ Google'dan ${googlePlaces.length} adet mekan bilgisi alındı.`);
  console.log('🧠 Momentum Skoru algoritması çalıştırılıyor...\n');

  const ranked = getRankedPlaces(googlePlaces, defaultParamsKadikoyHamburger);

  console.log('🏆 İşte Kadıköy\'ün En İyi Hamburgercileri (Canlı Veri):\n');
  ranked
    .filter(p => !p.rejectedReason)
    .slice(0, 15)
    .forEach((p, i) => {
    console.log(
      `${String(i + 1).padStart(2, ' ')}. ${p.name} — ⭐ ${p.rating?.toFixed(1)} (${p.user_ratings_total} yorum) | Final Skoru: ${p.FinalScore.toFixed(3)}`
    );
  });
}

main().catch((err) => {
  console.error('❌ Test sırasında bir hata oluştu:', err?.message || err);
  process.exit(1);
});
