import { useState, useEffect } from 'react';
import { VenueCard } from './VenueCard';
import { MapLoader } from './MapLoader';
import type { FoodCategory } from '../types';
import { List, Map } from 'lucide-react';

interface FoodGuideProps {
  guide: FoodCategory[];
  initialTab?: string;
}

export function FoodGuide({ guide, initialTab }: FoodGuideProps) {
  const [activeTab, setActiveTab] = useState(initialTab || guide[0]?.slug || '');
  const [viewMode, setViewMode] = useState<'list' | 'map'>('list');

  useEffect(() => {
    if (initialTab && guide.find(cat => cat.slug === initialTab)) {
      setActiveTab(initialTab);
    }
  }, [initialTab, guide]);

  const activeCategory = guide.find(cat => cat.slug === activeTab);

  if (!guide || guide.length === 0) {
    return null;
  }

  return (
    <div className="py-16 bg-gradient-to-b from-gray-50 to-white">
      <div className="container mx-auto px-4">
        <div className="text-center mb-12">
          <h2 className="text-4xl md:text-5xl font-black tracking-tight text-gray-900 mb-4">
            Şehrin Lezzet Durakları
          </h2>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto">
            Yerel uzmanlar tarafından seçilmiş, şehrin en iyi mekanları
          </p>
        </div>

        <div className="flex flex-col items-center gap-4 mb-12">
          <div className="flex rounded-full bg-white p-1 shadow-md border border-gray-200">
            <button
              onClick={() => setViewMode('list')}
              className={`flex items-center gap-2 px-6 py-2.5 text-sm font-semibold rounded-full transition-all ${
                viewMode === 'list'
                  ? 'bg-gray-900 text-white'
                  : 'text-gray-700 hover:text-gray-900'
              }`}
            >
              <List size={16} />
              Liste
            </button>
            <button
              onClick={() => setViewMode('map')}
              className={`flex items-center gap-2 px-6 py-2.5 text-sm font-semibold rounded-full transition-all ${
                viewMode === 'map'
                  ? 'bg-gray-900 text-white'
                  : 'text-gray-700 hover:text-gray-900'
              }`}
            >
              <Map size={16} />
              Harita
            </button>
          </div>

          {viewMode === 'list' && (
            <div className="flex justify-center flex-wrap gap-3">
              {guide.map(cat => (
                <button
                  key={cat.slug}
                  onClick={() => setActiveTab(cat.slug)}
                  className={`px-6 py-2.5 text-sm font-semibold rounded-full transition-all duration-200 ${
                    activeTab === cat.slug
                      ? 'bg-blue-600 text-white shadow-lg scale-105'
                      : 'bg-white text-gray-700 hover:bg-gray-100 shadow-sm'
                  }`}
                >
                  {cat.name}
                </button>
              ))}
            </div>
          )}
        </div>

        {viewMode === 'map' ? (
          <MapLoader guide={guide} />
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 max-w-7xl mx-auto">
            {activeCategory?.venues.map((venue, index) => (
              <VenueCard key={venue.id} venue={venue} index={index} />
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
