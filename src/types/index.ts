export interface Brand {
  id: string;
  name: string;
  logo_url: string | null;
  website_url?: string | null;
  created_at?: string;
  updated_at?: string;
}

export interface Category {
  id: string;
  name: string;
  description: string | null;
  created_at?: string;
  updated_at?: string;
}

export interface City {
  id: string;
  name: string;
  slug: string;
  country: string;
  image?: string | null;
  bg_color?: string;
  icon_names?: string[];
  icon_color?: string;
  created_at?: string;
  updated_at?: string;
}

export interface Country {
  id: string;
  code: string;
  name: string;
  flag_emoji: string | null;
  created_at?: string;
  updated_at?: string;
}

export interface CityCategory {
  id: string;
  city_id: string;
  category_id: string;
  created_at?: string;
  mentor_note?: string;
  pro_tips?: string[];
  category: Category;
  source_brands: SourceBrandWithOrder[];
  equivalent_brands: BrandWithOrder[];
}

export interface SourceBrandWithOrder {
  id: string;
  brand_id: string;
  country_code: string;
  sort_order: number;
  brand: Brand;
}

export interface BrandWithOrder {
  id: string;
  brand_id: string;
  sort_order: number;
  brand: Brand;
}

export interface CityWithCategories extends City {
  categories: CityCategory[];
}

export interface Venue {
  id: string;
  food_category_id: string;
  name: string;
  mentor_note: string;
  reviews_summary: string[];
  mentor_tricks?: string[];
  must_order: string;
  image: string;
  map_link: string;
  website_url?: string | null;
  lat: number;
  lng: number;
  sort_order: number;
  google_rating?: number;
  google_review_count?: number;
  deep_dive_note?: string;
  neighborhood_slug?: string;
  created_at?: string;
}

export interface FoodCategory {
  id: string;
  city_id: string;
  name: string;
  slug: string;
  icon: string;
  sort_order: number;
  created_at?: string;
  venues: Venue[];
}
