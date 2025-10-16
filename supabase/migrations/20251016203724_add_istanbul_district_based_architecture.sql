/*
  # İstanbul İlçe Bazlı Mimari

  1. Yeni Tablolar
    - `districts` (ilçeler)
      - `id` (uuid, primary key)
      - `name` (text) - İlçe adı (örn: Kadıköy, Karaköy)
      - `slug` (text, unique) - URL için (örn: kadikoy)
      - `city_id` (uuid, foreign key) - Hangi şehre ait
      - `description` (text, optional) - İlçe açıklaması
      - `created_at` (timestamptz)
    
    - `district_food_categories` (ilçe - gurme kategori bağlantıları)
      - `id` (uuid, primary key)
      - `district_id` (uuid, foreign key)
      - `category_name` (text) - Kategori adı (örn: "En İyi Kahveciler")
      - `category_slug` (text) - URL için (örn: "kahve")
      - `category_icon` (text) - Icon adı (örn: "Coffee")
      - `display_order` (integer) - Gösterim sırası
      - `created_at` (timestamptz)
    
    - `district_venues` (ilçelere ait mekanlar)
      - `id` (uuid, primary key)
      - `district_category_id` (uuid, foreign key)
      - `name` (text) - Mekan adı
      - `link` (text, optional) - Website
      - `image` (text, optional) - Görsel URL
      - `latitude` (numeric)
      - `longitude` (numeric)
      - `google_rating` (numeric)
      - `google_review_count` (integer)
      - `mentor_note` (text) - Mentor'ın özel notu
      - `must_order` (text) - Mutlaka sipariş edilmesi gereken
      - `mentor_tricks` (text[]) - Mentor ipuçları (array)
      - `display_order` (integer)
      - `created_at` (timestamptz)

  2. Güvenlik
    - RLS tüm tablolarda etkin
    - Herkese okuma izni (anonim kullanıcılar dahil)
    - Yazma yok (sadece admin migration'lar ile ekler)

  3. İndeksler
    - İlçe slug'larına unique index
    - Foreign key'lere index
    - Venue koordinatlarına index (harita için)
*/

-- Districts (İlçeler) Tablosu
CREATE TABLE IF NOT EXISTS districts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text UNIQUE NOT NULL,
  city_id uuid NOT NULL REFERENCES cities(id) ON DELETE CASCADE,
  description text,
  created_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_districts_city_id ON districts(city_id);
CREATE INDEX IF NOT EXISTS idx_districts_slug ON districts(slug);

ALTER TABLE districts ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Districts are viewable by everyone"
  ON districts FOR SELECT
  TO public
  USING (true);

-- District Food Categories (İlçe Gurme Kategorileri) Tablosu
CREATE TABLE IF NOT EXISTS district_food_categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  district_id uuid NOT NULL REFERENCES districts(id) ON DELETE CASCADE,
  category_name text NOT NULL,
  category_slug text NOT NULL,
  category_icon text DEFAULT 'Utensils',
  display_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now(),
  UNIQUE(district_id, category_slug)
);

CREATE INDEX IF NOT EXISTS idx_district_food_categories_district_id ON district_food_categories(district_id);
CREATE INDEX IF NOT EXISTS idx_district_food_categories_slug ON district_food_categories(category_slug);

ALTER TABLE district_food_categories ENABLE ROW LEVEL SECURITY;

CREATE POLICY "District food categories are viewable by everyone"
  ON district_food_categories FOR SELECT
  TO public
  USING (true);

-- District Venues (İlçe Mekanları) Tablosu
CREATE TABLE IF NOT EXISTS district_venues (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  district_category_id uuid NOT NULL REFERENCES district_food_categories(id) ON DELETE CASCADE,
  name text NOT NULL,
  link text,
  image text,
  latitude numeric,
  longitude numeric,
  google_rating numeric CHECK (google_rating >= 0 AND google_rating <= 5),
  google_review_count integer DEFAULT 0,
  mentor_note text,
  must_order text,
  mentor_tricks text[] DEFAULT '{}',
  display_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_district_venues_category_id ON district_venues(district_category_id);
CREATE INDEX IF NOT EXISTS idx_district_venues_coordinates ON district_venues(latitude, longitude);
CREATE INDEX IF NOT EXISTS idx_district_venues_rating ON district_venues(google_rating DESC);

ALTER TABLE district_venues ENABLE ROW LEVEL SECURITY;

CREATE POLICY "District venues are viewable by everyone"
  ON district_venues FOR SELECT
  TO public
  USING (true);