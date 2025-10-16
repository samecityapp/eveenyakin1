import { supabase } from './supabase';
import type { City, CityWithCategories, CityCategory, Country, FoodCategory } from '../types';

function normalizeBrandRelation(data: any) {
  return Array.isArray(data) ? data[0] : data;
}

export async function getAllCities(): Promise<City[]> {
  const { data, error } = await supabase
    .from('cities')
    .select('*')
    .order('name');

  if (error) {
    console.error('Error fetching cities:', error);
    return [];
  }

  return data || [];
}

export async function getAllCountries(): Promise<Country[]> {
  const { data, error } = await supabase
    .from('countries')
    .select('*')
    .order('name');

  if (error) {
    console.error('Error fetching countries:', error);
    return [];
  }

  return data || [];
}

export async function getAllCityCategories(): Promise<CityCategory[]> {
  const { data: mappingsData, error: mappingsError } = await supabase
    .from('city_category_mappings')
    .select(`
      id,
      city_id,
      category_id,
      created_at,
      mentor_note,
      pro_tips,
      category:categories(id, name, description, created_at, updated_at)
    `);

  if (mappingsError) {
    console.error('Error fetching all categories:', mappingsError);
    return [];
  }

  const categories: CityCategory[] = await Promise.all(
    (mappingsData || []).map(async (mapping: any) => {
      const [sourceBrandsData, equivalentBrandsData] = await Promise.all([
        supabase
          .from('source_country_brands')
          .select(`
            id,
            brand_id,
            country_code,
            sort_order,
            brand:brands(id, name, logo_url, website_url, created_at, updated_at)
          `)
          .eq('mapping_id', mapping.id)
          .order('sort_order'),
        supabase
          .from('equivalent_brands')
          .select(`
            id,
            brand_id,
            sort_order,
            brand:brands(id, name, logo_url, website_url, created_at, updated_at)
          `)
          .eq('mapping_id', mapping.id)
          .order('sort_order'),
      ]);

      const normalizedSourceBrands = (sourceBrandsData.data || []).map((sb: any) => ({
        ...sb,
        brand: normalizeBrandRelation(sb.brand)
      }));

      const normalizedEquivalentBrands = (equivalentBrandsData.data || []).map((eb: any) => ({
        ...eb,
        brand: normalizeBrandRelation(eb.brand)
      }));

      return {
        id: mapping.id,
        city_id: mapping.city_id,
        category_id: mapping.category_id,
        created_at: mapping.created_at,
        mentor_note: mapping.mentor_note,
        pro_tips: mapping.pro_tips || [],
        category: normalizeBrandRelation(mapping.category),
        source_brands: normalizedSourceBrands,
        equivalent_brands: normalizedEquivalentBrands,
      } as CityCategory;
    })
  );

  return categories;
}

export async function getCityBySlug(slug: string): Promise<CityWithCategories | null> {
  const { data: cityData, error: cityError } = await supabase
    .from('cities')
    .select('*')
    .eq('slug', slug)
    .maybeSingle();

  if (cityError || !cityData) {
    console.error('Error fetching city:', cityError);
    return null;
  }

  const { data: mappingsData, error: mappingsError } = await supabase
    .from('city_category_mappings')
    .select(`
      id,
      city_id,
      category_id,
      created_at,
      mentor_note,
      pro_tips,
      category:categories(id, name, description, created_at, updated_at)
    `)
    .eq('city_id', cityData.id);

  if (mappingsError) {
    console.error('Error fetching mappings:', mappingsError);
    return { ...cityData, categories: [] };
  }

  const categories: CityCategory[] = await Promise.all(
    (mappingsData || []).map(async (mapping: any) => {
      const [sourceBrandsData, equivalentBrandsData] = await Promise.all([
        supabase
          .from('source_country_brands')
          .select(`
            id,
            brand_id,
            country_code,
            sort_order,
            brand:brands(id, name, logo_url, website_url, created_at, updated_at)
          `)
          .eq('mapping_id', mapping.id)
          .order('sort_order'),
        supabase
          .from('equivalent_brands')
          .select(`
            id,
            brand_id,
            sort_order,
            brand:brands(id, name, logo_url, website_url, created_at, updated_at)
          `)
          .eq('mapping_id', mapping.id)
          .order('sort_order'),
      ]);

      const normalizedSourceBrands = (sourceBrandsData.data || []).map((sb: any) => ({
        ...sb,
        brand: normalizeBrandRelation(sb.brand)
      }));

      const normalizedEquivalentBrands = (equivalentBrandsData.data || []).map((eb: any) => ({
        ...eb,
        brand: normalizeBrandRelation(eb.brand)
      }));

      return {
        id: mapping.id,
        city_id: mapping.city_id,
        category_id: mapping.category_id,
        created_at: mapping.created_at,
        mentor_note: mapping.mentor_note,
        pro_tips: mapping.pro_tips || [],
        category: normalizeBrandRelation(mapping.category),
        source_brands: normalizedSourceBrands,
        equivalent_brands: normalizedEquivalentBrands,
      } as CityCategory;
    })
  );

  return {
    ...cityData,
    categories,
  };
}

export async function getAllFoodGuides(): Promise<Map<string, FoodCategory[]>> {
  const cities = await getAllCities();
  const foodGuidesMap = new Map<string, FoodCategory[]>();

  await Promise.all(
    cities.map(async (city) => {
      const guide = await getFoodGuideByCity(city.id);
      if (guide.length > 0) {
        foodGuidesMap.set(city.slug, guide);
      }
    })
  );

  return foodGuidesMap;
}

export async function getFoodGuideByCity(cityId: string): Promise<FoodCategory[]> {
  const { data, error } = await supabase
    .from('food_categories')
    .select(`
      id,
      city_id,
      name,
      slug,
      icon,
      sort_order,
      created_at,
      venues (
        id,
        food_category_id,
        name,
        mentor_note,
        reviews_summary,
        mentor_tricks,
        must_order,
        image,
        map_link,
        website_url,
        lat,
        lng,
        sort_order,
        google_rating,
        google_review_count,
        created_at
      )
    `)
    .eq('city_id', cityId)
    .order('sort_order');

  if (error) {
    console.error('Error fetching food guide:', error);
    return [];
  }

  return (data || []).map(category => ({
    ...category,
    venues: (category.venues || []).sort((a, b) => a.sort_order - b.sort_order)
  }));
}

// İlçe bazlı API fonksiyonları (İstanbul için)
export async function getDistrictsByCity(citySlug: string) {
  const { data: city } = await supabase
    .from('cities')
    .select('id')
    .eq('slug', citySlug)
    .maybeSingle();

  if (!city) return [];

  const { data, error } = await supabase
    .from('districts')
    .select('*')
    .eq('city_id', city.id)
    .order('name');

  if (error) {
    console.error('Error fetching districts:', error);
    return [];
  }

  return data || [];
}

export async function getDistrictFoodGuide(districtSlug: string) {
  const { data: district } = await supabase
    .from('districts')
    .select('id')
    .eq('slug', districtSlug)
    .maybeSingle();

  if (!district) return [];

  const { data, error } = await supabase
    .from('district_food_categories')
    .select(`
      id,
      district_id,
      category_name,
      category_slug,
      category_icon,
      display_order,
      created_at
    `)
    .eq('district_id', district.id)
    .order('display_order');

  if (error) {
    console.error('Error fetching district food categories:', error);
    return [];
  }

  // Her kategori için venue'ları çek
  const categoriesWithVenues = await Promise.all(
    (data || []).map(async (category) => {
      const { data: venues, error: venuesError } = await supabase
        .from('district_venues')
        .select('*')
        .eq('district_category_id', category.id)
        .order('display_order');

      if (venuesError) {
        console.error('Error fetching district venues:', venuesError);
        return { ...category, venues: [] };
      }

      return {
        ...category,
        venues: venues || []
      };
    })
  );

  return categoriesWithVenues;
}
