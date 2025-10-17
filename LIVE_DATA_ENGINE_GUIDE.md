# 🚀 Canlı Veri Motoru - Kullanım Kılavuzu

## 📦 **Kurulum**

```bash
# 1. Gerekli paketlerin yüklü olduğundan emin ol
npm install

# 2. Google API anahtarını ortam değişkeni olarak ayarla
export GOOGLE_API_KEY="AIzaSy..."  # Kendi anahtarınızı buraya yazın
```

---

## 🎯 **Kullanım Senaryoları**

### **Senaryo 1: Kadıköy Hamburger Mekanları**

```bash
export GOOGLE_API_KEY="AIzaSy..."
export DISTRICT="Kadıköy"
export CATEGORIES="hamburger"

npx tsx run-test.ts
```

**Sonuç:**
- Google'dan canlı veri çeker
- Momentum Score algoritmasından geçirir
- En iyi 11 hamburgercıyı bulur
- Supabase database'e yazar
- `/istanbul/kadikoy` sayfasında görünür

---

### **Senaryo 2: Kadıköy Pizza Mekanları**

```bash
export GOOGLE_API_KEY="AIzaSy..."
export DISTRICT="Kadıköy"
export CATEGORIES="pizza"

npx tsx run-test.ts
```

---

### **Senaryo 3: Kadıköy Kahve Mekanları**

```bash
export GOOGLE_API_KEY="AIzaSy..."
export DISTRICT="Kadıköy"
export CATEGORIES="kahve"

npx tsx run-test.ts
```

---

## 🔧 **Script Nasıl Çalışıyor?**

### **Adım 1: Google Places API**
```
Google'a sorgu gönderir:
"hamburger restaurant in Kadıköy, Istanbul"
```

### **Adım 2: Momentum Score Algoritması**
```javascript
// Kalite Barajı
minRating: 4.2
minReviews: 100

// Skor Hesaplama
QualityScore = (rating * 0.7) + (reviewCount * 0.3)
MomentumScore = reviewCount / 500
FinalScore = (QualityScore * 0.6) + (MomentumScore * 0.4)
```

### **Adım 3: Database Güncelleme**
```sql
1. Mevcut venue'leri sil (category_id'ye göre)
2. Yeni venue'leri ekle (top 11)
3. Sıralama algoritmasına göre display_order ayarla
```

---

## 📊 **Çıktı Örneği**

```
🔎 Google'a soruluyor → "hamburger restaurant in Kadıköy, Istanbul"
✅ Google'dan 20 adet mekan bilgisi alındı.
🧠 Momentum Skoru algoritması çalıştırılıyor...

🏆 Kadıköy'ün En İyi hamburger Mekanları (Canlı Veri):

 1. Burger Lab — ⭐ 4.5 (3200 yorum) | Final Skoru: 0.872
 2. Big Chefs — ⭐ 4.4 (2800 yorum) | Final Skoru: 0.845
 3. The Populist — ⭐ 4.6 (1500 yorum) | Final Skoru: 0.823
 ...

📝 Supabase database'e yazılıyor...
✅ 11 mekan başarıyla database'e yazıldı!

🎯 Sonuç: Kadıköy -> hamburger kategorisi Google'dan güncellendi.
```

---

## 🌐 **Mevcut Kategoriler**

Kadıköy'de şu kategoriler kullanılabilir:

| Kategori Slug | Kategori Adı |
|---------------|--------------|
| `hamburger` | En İyi Hamburgerciler |
| `pizza` | En İyi Pizzacılar |
| `kahve` | En İyi Kahveciler |
| `kafe` | En Güzel Kafeler |
| `meyhane` | En İyi Meyhaneler |
| `esnaf-lokantasi` | En İyi Esnaf Lokantaları |

---

## ⚙️ **Ortam Değişkenleri**

| Değişken | Açıklama | Varsayılan |
|----------|----------|------------|
| `GOOGLE_API_KEY` | Google Places API anahtarı | *(zorunlu)* |
| `DISTRICT` | İlçe adı | `Kadıköy` |
| `CATEGORIES` | Kategori slug | `hamburger` |

---

## 🔒 **Güvenlik Notları**

1. ✅ **API anahtarını asla commit etmeyin**
2. ✅ **`.env` dosyası `.gitignore`'da var**
3. ✅ **Supabase RLS (Row Level Security) aktif**
4. ⚠️ **Google API quota limitine dikkat edin**

---

## 📈 **Sonraki Adımlar**

- [ ] **Otomatik Güncelleme:** Cron job ile günlük güncelleme
- [ ] **Batch Processing:** Tüm kategorileri tek seferde güncelle
- [ ] **Place Details API:** Fotoğraf, telefon, açılış saatleri ekle
- [ ] **Review Analysis:** Yorumlardan "must_order" önerisi çıkar

---

## 🎉 **Hızlı Test**

```bash
# Tek komutla test et (Google API anahtarını değiştir!)
GOOGLE_API_KEY="AIzaSy..." DISTRICT="Kadıköy" CATEGORIES="hamburger" npx tsx run-test.ts
```

Database'e yazılan veriler anında `/istanbul/kadikoy` sayfasında görünecektir!
