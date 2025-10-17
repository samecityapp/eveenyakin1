import { supabase } from './supabase';

export interface SyncVenuesParams {
  districtSlug: string;
  categorySlug: string;
  customParams?: {
    minRating?: number;
    minReviews?: number;
    qualityWeight?: number;
    momentumWeight?: number;
    ratingReviewBalancePoint?: number;
  };
}

export interface SyncVenuesResult {
  success: boolean;
  query: string;
  totalFetched: number;
  totalQualified: number;
  updates: Array<{
    action: 'updated' | 'inserted';
    name: string;
  }>;
}

export async function syncVenuesFromGoogle(
  params: SyncVenuesParams
): Promise<SyncVenuesResult> {
  const { data: session } = await supabase.auth.getSession();

  if (!session?.session) {
    throw new Error('Authentication required');
  }

  const functionUrl = `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/sync-venues-google`;

  const response = await fetch(functionUrl, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(params),
  });

  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.error || 'Failed to sync venues');
  }

  return await response.json();
}
