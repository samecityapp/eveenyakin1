import { lazy, Suspense } from 'react';
import type { FoodCategory } from '../types';

const MapView = lazy(() => import('./MapView'));

interface MapLoaderProps {
  guide: FoodCategory[];
}

export function MapLoader({ guide }: MapLoaderProps) {
  return (
    <Suspense
      fallback={
        <div className="h-[600px] w-full bg-gray-100 rounded-xl flex items-center justify-center animate-pulse">
          <p className="text-gray-500">Harita Yükleniyor...</p>
        </div>
      }
    >
      <MapView guide={guide} />
    </Suspense>
  );
}
