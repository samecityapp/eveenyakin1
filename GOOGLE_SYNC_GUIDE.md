# 🚀 Google Places API - Canlı Veri Motoru

## ✅ **Kurulum Tamamlandı!**

Projenize **Google Places API entegrasyonu** eklendi. Bu sistem, canlı verilerle venue (mekan) bilgilerini otomatik güncelleyebilir.

---

## 🎯 **Sistem Nasıl Çalışıyor?**

### **1. Mimari:**

```
Frontend (Kadıköy Sayfası)
    ↓ (Butona Tıklama)
Supabase Edge Function (sync-venues-google)
    ↓ (Google Places API Çağrısı)
Google Places API
    ↓ (Canlı Veri)
Momentum Score Algoritması
    ↓ (Sıralama & Filtreleme)
Supabase Database (district_venues tablosu)
    ↓ (Güncelleme)
Frontend (Yenilenen Veriler)
```

### **2. Momentum Score Algoritması:**

**Kalite Barajı:**
- Minimum puan: 4.2 ⭐
- Minimum yorum: 100
- Sadece açık işletmeler

**Skor Hesaplama:**
- **QualityScore (60%):** Puan + Yorum dengesi
- **MomentumScore (40%):** Popülerlik trendi
- **FinalScore:** Ağırlıklı toplam

**Sonuç:** En iyi 11 mekan sıralanır ve database'e yazılır.

---

## 🔧 **Kurulum Adımları**

### **Adım 1: Google API Anahtarı Al**

1. [Google Cloud Console](https://console.cloud.google.com/) aç
2. Yeni proje oluştur veya mevcut projeyi seç
3. **APIs & Services** → **Library** → **"Places API"** ara ve etkinleştir
4. **APIs & Services** → **Credentials** → **Create Credentials** → **API Key**
5. API anahtarını kopyala

**Güvenlik Önerisi:** API anahtarını kısıtla:
- **Application restrictions:** HTTP referrers (websites)
- **API restrictions:** Places API
- **Website restrictions:** `eveenyakin.com/*`

### **Adım 2: Supabase'e API Anahtarı Ekle**

#### **Seçenek A: Supabase Dashboard (Önerilen)**

1. [Supabase Dashboard](https://supabase.com/dashboard) aç
2. Projenizi seçin
3. **Settings** → **Edge Functions** → **Secrets**
4. **New Secret** butonuna tıkla:
   - **Name:** `GOOGLE_API_KEY`
   - **Value:** `AIzaSy...` (kendi anahtarınız)
5. **Save** butonuna tıkla

#### **Seçenek B: Supabase CLI**

```bash
# Supabase CLI ile secret ekle
supabase secrets set GOOGLE_API_KEY=AIzaSy...
```

### **Adım 3: Test Et!**

1. Uygulamayı aç: `http://localhost:5173/istanbul/kadikoy`
2. Bir kategori seç (örn. "Kahve")
3. Sağ üstteki **"Google'dan Güncelle"** butonuna tıkla
4. Sistem otomatik olarak:
   - Google'dan canlı veri çeker
   - Momentum algoritmasından geçirir
   - En iyi 11 mekanı database'e yazar
   - Sayfayı yeniler

---

## 📊 **Kullanım**

### **Frontend'den Kullanım:**

Kadıköy sayfasında zaten hazır buton var:

```typescript
<GoogleSyncButton
  districtSlug="kadikoy"
  categorySlug="kahve"
  onSyncComplete={loadData}
/>
```

### **Programatik Kullanım:**

```typescript
import { syncVenuesFromGoogle } from './lib/google-sync';

const result = await syncVenuesFromGoogle({
  districtSlug: 'kadikoy',
  categorySlug: 'kahve',
  customParams: {
    minRating: 4.5,        // Daha yüksek kalite barajı
    minReviews: 200,       // Daha fazla yorum gereksinimi
    qualityWeight: 0.7,    // Kaliteye daha fazla ağırlık
    momentumWeight: 0.3,
  }
});

console.log(`${result.totalQualified} mekan güncellendi`);
```

### **Manuel Test (run-test.ts):**

```bash
# Doğrudan Google API'yi test et (console'a yazdırır, DB'ye yazmaz)
export GOOGLE_API_KEY="AIzaSy..."
npx tsx run-test.ts
```

---

## 🎨 **Özelleştirme**

### **Farklı Algoritmalar:**

```typescript
// Hamburger için agresif parametreler
const burgerParams = {
  minRating: 4.3,
  minReviews: 150,
  qualityWeight: 0.5,
  momentumWeight: 0.5, // Trendy yerlere daha fazla ağırlık
  ratingReviewBalancePoint: 800,
};

// Fine dining için kalite odaklı
const fineDiningParams = {
  minRating: 4.7,
  minReviews: 50,
  qualityWeight: 0.8, // Kalite öncelikli
  momentumWeight: 0.2,
  ratingReviewBalancePoint: 300,
};
```

### **Başka Şehirler/Bölgeler:**

```typescript
<GoogleSyncButton
  districtSlug="besiktas"
  categorySlug="pizza"
  onSyncComplete={loadData}
/>
```

---

## 🔒 **Güvenlik Notları**

1. ✅ **Edge Function JWT korumalı** - Sadece giriş yapmış kullanıcılar çağırabilir
2. ✅ **API anahtarı server-side** - Frontend'de görünmez
3. ✅ **CORS korumalı** - Sadece belirlenen domainlerden erişilebilir
4. ⚠️ **Google API quota:** Günlük kullanım limiti var, ücretsiz plan yeterli

---

## 📈 **İleriye Dönük İyileştirmeler**

- [ ] **Scheduled cron job:** Günde 1 kez otomatik güncelleme
- [ ] **Batch processing:** Tüm kategorileri aynı anda güncelle
- [ ] **Place Details API:** Fotoğraf, telefon, website al
- [ ] **Opening hours:** Gerçek zamanlı açık/kapalı durumu
- [ ] **Review analysis:** Yorumlardan otomatik "must_order" çıkar
- [ ] **Price level:** Fiyat aralığı bilgisi ekle

---

## 🎉 **Özet**

Artık projeniz **canlı, gerçek zamanlı Google verisiyle** çalışıyor!

**Aktif Özellikler:**
- ✅ Google Places API entegrasyonu
- ✅ Momentum Score algoritması
- ✅ Otomatik sıralama & filtreleme
- ✅ Database güncelleme
- ✅ Frontend buton ve feedback
- ✅ Build başarılı (7.25s)

**Kullanım:**
1. Google API anahtarını Supabase'e ekle
2. `/istanbul/kadikoy` sayfasına git
3. "Google'dan Güncelle" butonuna tıkla
4. Gerçek zamanlı veri akışını izle!
