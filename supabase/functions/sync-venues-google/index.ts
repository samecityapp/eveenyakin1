import { createClient } from 'npm:@supabase/supabase-js@2';
import axiom from 'npm:axios@1.6.0';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Client-Info, Apikey',
};

interface GooglePlace {
  place_id: string;
  name: string;
  rating?: number;
  user_ratings_total?: number;
  business_status?: string;
  opening_hours?: {
    open_now?: boolean;
  };
  geometry?: {
    location: {
      lat: number;
      lng: number;
    };
  };
}

interface RankingParams {
  minRating: number;
  minReviews: number;
  qualityWeight: number;
  momentumWeight: number;
  ratingReviewBalancePoint: number;
}

interface RankedPlace extends GooglePlace {
  QualityScore: number;
  MomentumScore: number;
  FinalScore: number;
  rejectedReason?: string;
}

const defaultParams: RankingParams = {
  minRating: 4.2,
  minReviews: 100,
  qualityWeight: 0.6,
  momentumWeight: 0.4,
  ratingReviewBalancePoint: 500,
};

function calculateQualityScore(
  rating: number,
  reviewCount: number,
  params: RankingParams
): number {
  const normalizedRating = (rating - params.minRating) / (5 - params.minRating);
  const normalizedReviews = Math.min(
    reviewCount / params.ratingReviewBalancePoint,
    1
  );
  return normalizedRating * 0.7 + normalizedReviews * 0.3;
}

function calculateMomentumScore(reviewCount: number, params: RankingParams): number {
  return Math.min(reviewCount / params.ratingReviewBalancePoint, 1);
}

function getRankedPlaces(
  places: GooglePlace[],
  params: RankingParams
): RankedPlace[] {
  const rankedPlaces: RankedPlace[] = places.map((place) => {
    const rating = place.rating || 0;
    const reviewCount = place.user_ratings_total || 0;

    let rejectedReason: string | undefined;
    if (rating < params.minRating) {
      rejectedReason = `Rating too low (${rating} < ${params.minRating})`;
    } else if (reviewCount < params.minReviews) {
      rejectedReason = `Not enough reviews (${reviewCount} < ${params.minReviews})`;
    } else if (place.business_status && place.business_status !== 'OPERATIONAL') {
      rejectedReason = `Business not operational (${place.business_status})`;
    }

    const QualityScore = calculateQualityScore(rating, reviewCount, params);
    const MomentumScore = calculateMomentumScore(reviewCount, params);
    const FinalScore =
      QualityScore * params.qualityWeight + MomentumScore * params.momentumWeight;

    return {
      ...place,
      QualityScore,
      MomentumScore,
      FinalScore,
      rejectedReason,
    };
  });

  return rankedPlaces.sort((a, b) => {
    if (a.rejectedReason && !b.rejectedReason) return 1;
    if (!a.rejectedReason && b.rejectedReason) return -1;
    return b.FinalScore - a.FinalScore;
  });
}

async function fetchGooglePlaces(
  query: string,
  apiKey: string
): Promise<GooglePlace[]> {
  const url = 'https://maps.googleapis.com/maps/api/place/textsearch/json';
  const params = new URLSearchParams({
    query,
    key: apiKey,
    language: 'tr',
    region: 'tr',
  });

  const { data } = await axiom.get(`${url}?${params.toString()}`);

  if (data.status && data.status !== 'OK' && data.status !== 'ZERO_RESULTS') {
    throw new Error(`Google Places API error: ${data.status} - ${data.error_message || ''}`);
  }

  return (data.results || []).map((r: any) => ({
    place_id: r.place_id,
    name: r.name,
    rating: r.rating,
    user_ratings_total: r.user_ratings_total,
    business_status: r.business_status,
    opening_hours: r.opening_hours ? { open_now: r.opening_hours.open_now } : undefined,
    geometry: r.geometry,
  }));
}

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, {
      status: 200,
      headers: corsHeaders,
    });
  }

  try {
    const supabaseUrl = Deno.env.get('SUPABASE_URL')!;
    const supabaseKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;
    const googleApiKey = Deno.env.get('GOOGLE_API_KEY');

    if (!googleApiKey) {
      throw new Error('GOOGLE_API_KEY environment variable is required');
    }

    const supabase = createClient(supabaseUrl, supabaseKey);

    const { districtSlug, categorySlug, customParams } = await req.json();

    if (!districtSlug || !categorySlug) {
      throw new Error('districtSlug and categorySlug are required');
    }

    const { data: district } = await supabase
      .from('districts')
      .select('id, name')
      .eq('slug', districtSlug)
      .maybeSingle();

    if (!district) {
      throw new Error(`District not found: ${districtSlug}`);
    }

    const { data: category } = await supabase
      .from('district_food_categories')
      .select('id, category_name')
      .eq('district_id', district.id)
      .eq('category_slug', categorySlug)
      .maybeSingle();

    if (!category) {
      throw new Error(`Category not found: ${categorySlug}`);
    }

    const searchQuery = `${category.category_name} in ${district.name}, Istanbul`;
    console.log(`Fetching: ${searchQuery}`);

    const googlePlaces = await fetchGooglePlaces(searchQuery, googleApiKey);
    const params = customParams || defaultParams;
    const ranked = getRankedPlaces(googlePlaces, params);

    const topVenues = ranked
      .filter((p) => !p.rejectedReason)
      .slice(0, 11);

    const updates = [];
    for (let i = 0; i < topVenues.length; i++) {
      const venue = topVenues[i];
      
      const { data: existing } = await supabase
        .from('district_venues')
        .select('id')
        .eq('district_category_id', category.id)
        .eq('name', venue.name)
        .maybeSingle();

      const venueData = {
        google_rating: venue.rating,
        google_review_count: venue.user_ratings_total,
        latitude: venue.geometry?.location.lat,
        longitude: venue.geometry?.location.lng,
        display_order: i + 1,
      };

      if (existing) {
        await supabase
          .from('district_venues')
          .update(venueData)
          .eq('id', existing.id);
        updates.push({ action: 'updated', name: venue.name });
      } else {
        await supabase
          .from('district_venues')
          .insert({
            ...venueData,
            district_category_id: category.id,
            name: venue.name,
            mentor_note: `${venue.rating} yıldız, ${venue.user_ratings_total} yorum`,
            must_order: 'Önerilen menü',
          });
        updates.push({ action: 'inserted', name: venue.name });
      }
    }

    return new Response(
      JSON.stringify({
        success: true,
        query: searchQuery,
        totalFetched: googlePlaces.length,
        totalQualified: topVenues.length,
        updates,
      }),
      {
        headers: {
          ...corsHeaders,
          'Content-Type': 'application/json',
        },
      }
    );
  } catch (error) {
    console.error('Error:', error);
    return new Response(
      JSON.stringify({ error: error.message }),
      {
        status: 500,
        headers: {
          ...corsHeaders,
          'Content-Type': 'application/json',
        },
      }
    );
  }
});
