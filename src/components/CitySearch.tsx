import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { Search, MapPin } from 'lucide-react';
import type { City } from '../types';

interface CitySearchProps {
  cities: City[];
  categorySlug: string;
  categoryName: string;
}

export function CitySearch({ cities, categorySlug }: CitySearchProps) {
  const [query, setQuery] = useState('');
  const [results, setResults] = useState<City[]>([]);

  useEffect(() => {
    if (query.length > 0) {
      const lowerCaseQuery = query.toLowerCase();
      setResults(
        cities.filter((city) =>
          city.name.toLowerCase().includes(lowerCaseQuery) ||
          city.country.toLowerCase().includes(lowerCaseQuery)
        )
      );
    } else {
      setResults([]);
    }
  }, [query, cities]);

  return (
    <div className="relative w-full max-w-xl mx-auto">
      <div className="relative">
        <input
          type="text"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Bir şehir ara... (örn: 'Tokyo', 'Amsterdam')"
          className="w-full p-4 pl-12 pr-4 border-2 border-gray-300 rounded-full shadow-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500 focus:outline-none transition-all text-base"
        />
        <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
      </div>

      {results.length > 0 && (
        <div className="absolute top-full mt-2 w-full bg-white border border-gray-200 rounded-xl shadow-xl z-20 overflow-hidden animate-slideDown">
          <ul className="max-h-96 overflow-y-auto">
            {results.map((city) => (
              <li key={city.slug} className="border-b border-gray-100 last:border-b-0">
                <Link
                  to={`/city/${city.slug}?tab=${categorySlug}`}
                  className="flex items-center gap-4 p-4 hover:bg-blue-50 transition-colors group"
                  onClick={() => {
                    setQuery('');
                    setResults([]);
                  }}
                >
                  <div className="flex-shrink-0 w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center group-hover:bg-blue-200 transition-colors">
                    <MapPin size={20} className="text-blue-600" />
                  </div>
                  <div className="flex-1">
                    <div className="font-semibold text-gray-900 group-hover:text-blue-600 transition-colors">
                      {city.name}
                    </div>
                    <div className="text-sm text-gray-500">{city.country}</div>
                  </div>
                </Link>
              </li>
            ))}
          </ul>
        </div>
      )}

      {query.length > 0 && results.length === 0 && (
        <div className="absolute top-full mt-2 w-full bg-white border border-gray-200 rounded-xl shadow-xl z-20 p-4 text-center text-gray-500">
          Sonuç bulunamadı
        </div>
      )}
    </div>
  );
}
