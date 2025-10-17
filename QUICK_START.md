# ⚡ Hızlı Başlangıç - Canlı Veri Motoru

## 🎯 **3 Adımda Kullan**

### **1. Google API Anahtarı Al**

[Google Cloud Console](https://console.cloud.google.com/) → Places API → Create API Key

### **2. Terminal Komutları**

```bash
# Ortam değişkenlerini ayarla
export GOOGLE_API_KEY="AIzaSy..."  # Kendi anahtarınızı buraya yazın
export DISTRICT="Kadıköy"
export CATEGORIES="hamburger"

# Canlı veri motorunu çalıştır
npx tsx run-test.ts
```

### **3. Sonucu Gör**

- Terminal'de: Top 11 mekan listesi
- Database'de: Supabase `district_venues` tablosu
- Web'de: `/istanbul/kadikoy` sayfası

---

## 📋 **Komut Örnekleri**

### **Hamburger Mekanları**
```bash
GOOGLE_API_KEY="AIzaSy..." DISTRICT="Kadıköy" CATEGORIES="hamburger" npx tsx run-test.ts
```

### **Pizza Mekanları**
```bash
GOOGLE_API_KEY="AIzaSy..." DISTRICT="Kadıköy" CATEGORIES="pizza" npx tsx run-test.ts
```

### **Kahve Mekanları**
```bash
GOOGLE_API_KEY="AIzaSy..." DISTRICT="Kadıköy" CATEGORIES="kahve" npx tsx run-test.ts
```

---

## ✅ **Sistem Gereksinimleri**

- ✅ Node.js 18+
- ✅ npm paketleri yüklü (`npm install`)
- ✅ Google Places API anahtarı
- ✅ Supabase database aktif
- ✅ `.env` dosyası doğru yapılandırılmış

---

## 🔧 **Ne Yapar?**

1. **Google Places API'den** canlı veri çeker
2. **Momentum Score algoritması** ile sıralar
3. **Supabase database'e** yazar
4. **Frontend'de** anında görünür

---

## 📊 **Çıktı Formatı**

```
🔎 Google'a soruluyor → "hamburger restaurant in Kadıköy, Istanbul"
✅ Google'dan 20 adet mekan bilgisi alındı.
🧠 Momentum Skoru algoritması çalıştırılıyor...

🏆 Kadıköy'ün En İyi hamburger Mekanları (Canlı Veri):

 1. Burger Lab — ⭐ 4.5 (3200 yorum) | Final Skoru: 0.872
 2. Big Chefs — ⭐ 4.4 (2800 yorum) | Final Skoru: 0.845
 ...

📝 Supabase database'e yazılıyor...
✅ 11 mekan başarıyla database'e yazıldı!
```

---

## 🚨 **Hata Giderme**

### **"Google API anahtarını ayarla" Hatası**
```bash
# Anahtarı export et
export GOOGLE_API_KEY="AIzaSy..."

# Doğrula
echo $GOOGLE_API_KEY
```

### **"Kategori bulunamadı" Hatası**
```bash
# Mevcut kategorileri kontrol et
psql -d <DB_URL> -c "SELECT category_slug FROM district_food_categories WHERE district_id = (SELECT id FROM districts WHERE slug = 'kadikoy');"
```

### **Database Yazma Hatası**
- Supabase URL ve ANON_KEY'in `.env`'de doğru olduğundan emin ol
- RLS (Row Level Security) politikalarını kontrol et

---

## 🎉 **Başarı!**

Script başarıyla çalıştıysa:
- ✅ Terminal'de top 11 liste görünür
- ✅ Supabase'de `district_venues` tablosu güncellenir
- ✅ Web sayfasında `/istanbul/kadikoy` görünür

Detaylı bilgi için: `LIVE_DATA_ENGINE_GUIDE.md`
