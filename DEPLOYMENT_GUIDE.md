# 🚀 Deployment Rehberi

## Hızlı Deploy (Vercel - Önerilen)

### Adım 1: Vercel'e Deploy Et
```bash
# Vercel CLI kur (tek seferlik)
npm i -g vercel

# Deploy et
vercel --prod
```

### Adım 2: Environment Variables Ekle
Vercel dashboard'da:
1. Project Settings → Environment Variables
2. `.env` dosyasındaki tüm değişkenleri ekle:
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_ANON_KEY`

### Adım 3: Redeploy
```bash
vercel --prod
```

---

## Alternatif: Netlify

```bash
# Netlify CLI kur
npm i -g netlify-cli

# Deploy et
netlify deploy --prod --dir=dist

# Environment variables:
# Netlify dashboard → Site settings → Environment variables
```

---

## Proje Bilgileri

**Şehirler:** Londra, Berlin, Paris, Roma, **Tokyo** (YENİ!)

**Database:** Supabase (otomatik bağlı)

**Build Komutu:** `npm run build`

**Output Klasörü:** `dist/`

---

## Tokyo Özellikleri ✨

- 🏪 Don Quijote, AEON, Gyomu Super
- 🍜 Uber Eats JP, Demae-can, Wolt
- 🚕 Uber JP, GO Taxi, DiDi
- 💰 Mercari, Rakuma, Yahoo Auctions

Başarılar! 🎉
