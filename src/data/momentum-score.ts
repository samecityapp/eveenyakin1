export interface GooglePlace {
  place_id: string;
  name: string;
  rating?: number;
  user_ratings_total?: number;
  business_status?: string;
  opening_hours?: {
    open_now?: boolean;
  };
}

export interface RankedPlace extends GooglePlace {
  QualityScore: number;
  MomentumScore: number;
  FinalScore: number;
  rejectedReason?: string;
}

export interface RankingParams {
  minRating: number;
  minReviews: number;
  qualityWeight: number;
  momentumWeight: number;
  ratingReviewBalancePoint: number;
}

export const defaultParamsKadikoyHamburger: RankingParams = {
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

export function getRankedPlaces(
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
