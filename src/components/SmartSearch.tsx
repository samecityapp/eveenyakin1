import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { Search, MapPin, Tag, Building, UtensilsCrossed } from 'lucide-react';
import type { City, CityCategory, FoodCategory } from '../types';

interface SearchResult {
  type: 'Şehir' | 'Kategori' | 'Marka' | 'Lezzet Kategorisi' | 'Mekan';
  name: string;
  context: string;
  href: string;
}

interface SmartSearchProps {
  cities: City[];
  allCategories: CityCategory[];
  foodGuides?: Map<string, FoodCategory[]>;
}

export function SmartSearch({ cities, allCategories, foodGuides }: SmartSearchProps) {
  const navigate = useNavigate();
  const [query, setQuery] = useState('');
  const [results, setResults] = useState<SearchResult[]>([]);
  const [showResults, setShowResults] = useState(false);

  useEffect(() => {
    if (query.length < 2) {
      setResults([]);
      setShowResults(false);
      return;
    }

    const newResults: SearchResult[] = [];
    const lowerCaseQuery = query.toLowerCase();
    const addedKeys = new Set<string>();

    cities.forEach((city) => {
      if (city.name.toLowerCase().includes(lowerCaseQuery)) {
        const key = `city-${city.slug}`;
        if (!addedKeys.has(key)) {
          newResults.push({
            type: 'Şehir',
            name: city.name,
            context: city.country,
            href: `/city/${city.slug}`,
          });
          addedKeys.add(key);
        }
      }

      const cityFoodGuide = foodGuides?.get(city.slug);
      if (cityFoodGuide) {
        cityFoodGuide.forEach((category) => {
          const categoryHref = `/city/${city.slug}?section=food-guide&tab=${category.slug}`;

          if (category.name.toLowerCase().includes(lowerCaseQuery)) {
            const key = `food-category-${city.slug}-${category.slug}`;
            if (!addedKeys.has(key)) {
              newResults.push({
                type: 'Lezzet Kategorisi',
                name: category.name,
                context: `${city.name}'daki Lezzet Durakları`,
                href: categoryHref,
              });
              addedKeys.add(key);
            }
          }

          category.venues.forEach((venue) => {
            if (venue.name.toLowerCase().includes(lowerCaseQuery)) {
              const key = `venue-${city.slug}-${venue.id}`;
              if (!addedKeys.has(key)) {
                newResults.push({
                  type: 'Mekan',
                  name: venue.name,
                  context: `${category.name} - ${city.name}`,
                  href: categoryHref,
                });
                addedKeys.add(key);
              }
            }
          });
        });
      }
    });

    allCategories.forEach((cityCategory) => {
      const categoryName = cityCategory.category.name;
      const cityName = cities.find(c => c.id === cityCategory.city_id)?.name || '';
      const citySlug = cities.find(c => c.id === cityCategory.city_id)?.slug || '';

      if (categoryName.toLowerCase().includes(lowerCaseQuery)) {
        const key = `category-${citySlug}-${categoryName}`;
        if (!addedKeys.has(key)) {
          newResults.push({
            type: 'Kategori',
            name: categoryName,
            context: `${cityName}'da bir kategori`,
            href: `/city/${citySlug}?section=practical-info`,
          });
          addedKeys.add(key);
        }
      }

      cityCategory.source_brands.forEach((sb) => {
        if (sb.brand.name.toLowerCase().includes(lowerCaseQuery)) {
          const key = `brand-source-${citySlug}-${categoryName}-${sb.brand.name}`;
          if (!addedKeys.has(key)) {
            newResults.push({
              type: 'Marka',
              name: sb.brand.name,
              context: `${categoryName} kategorisinde kaynak marka (${cityName})`,
              href: `/city/${citySlug}?section=practical-info`,
            });
            addedKeys.add(key);
          }
        }
      });

      cityCategory.equivalent_brands.forEach((eb) => {
        if (eb.brand.name.toLowerCase().includes(lowerCaseQuery)) {
          const key = `brand-equiv-${citySlug}-${categoryName}-${eb.brand.name}`;
          if (!addedKeys.has(key)) {
            newResults.push({
              type: 'Marka',
              name: eb.brand.name,
              context: `${categoryName} kategorisinde yerel marka (${cityName})`,
              href: `/city/${citySlug}?section=practical-info`,
            });
            addedKeys.add(key);
          }
        }
      });
    });

    setResults(newResults.slice(0, 7));
    setShowResults(true);
  }, [query, cities, allCategories]);

  const handleResultClick = (href: string) => {
    setQuery('');
    setShowResults(false);
    navigate(href);
  };

  return (
    <div className="relative w-full max-w-2xl mx-auto">
      <div className="relative">
        <input
          type="text"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          onFocus={() => query.length >= 2 && setShowResults(true)}
          onBlur={() => setTimeout(() => setShowResults(false), 200)}
          placeholder="Bir şehir, kategori veya marka ara... (örn: 'Londra', 'Taksi', 'Getir')"
          className="w-full p-4 pl-12 border border-gray-300 rounded-full shadow-sm focus:ring-2 focus:ring-blue-500 focus:outline-none transition-shadow"
        />
        <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400" size={20} />
      </div>

      {showResults && results.length > 0 && (
        <div className="absolute top-full mt-2 w-full bg-white border border-gray-200 rounded-lg shadow-xl z-20 max-h-96 overflow-y-auto">
          <ul>
            {results.map((result, index) => {
              const icon = result.type === 'Şehir'
                ? <MapPin size={18} className="text-blue-500" />
                : result.type === 'Kategori'
                ? <Tag size={18} className="text-green-500" />
                : result.type === 'Lezzet Kategorisi'
                ? <UtensilsCrossed size={18} className="text-orange-500" />
                : result.type === 'Mekan'
                ? <UtensilsCrossed size={18} className="text-red-500" />
                : <Building size={18} className="text-gray-500" />;

              const colorClass = result.type === 'Şehir'
                ? 'bg-blue-100 text-blue-800'
                : result.type === 'Kategori'
                ? 'bg-green-100 text-green-800'
                : result.type === 'Lezzet Kategorisi'
                ? 'bg-orange-100 text-orange-800'
                : result.type === 'Mekan'
                ? 'bg-red-100 text-red-800'
                : 'bg-gray-100 text-gray-800';

              return (
                <li key={index}>
                  <button
                    onClick={() => handleResultClick(result.href)}
                    className="w-full text-left block p-4 hover:bg-gray-50 transition-colors border-b border-gray-100 last:border-b-0"
                  >
                    <div className="flex items-center gap-4">
                      <div className="flex-shrink-0 w-10 h-10 bg-gray-100 rounded-lg flex items-center justify-center">
                        {icon}
                      </div>
                      <div className="flex-1 min-w-0">
                        <div className="flex items-center gap-2 mb-1">
                          <span className="font-semibold text-gray-800">{result.name}</span>
                          <span className={`text-xs font-bold uppercase px-2 py-0.5 rounded ${colorClass}`}>
                            {result.type}
                          </span>
                        </div>
                        <p className="text-sm text-gray-500 truncate">{result.context}</p>
                      </div>
                    </div>
                  </button>
                </li>
              );
            })}
          </ul>
        </div>
      )}

      {showResults && query.length >= 2 && results.length === 0 && (
        <div className="absolute top-full mt-2 w-full bg-white border border-gray-200 rounded-lg shadow-xl z-20 p-4">
          <p className="text-gray-500 text-center">Sonuç bulunamadı</p>
        </div>
      )}
    </div>
  );
}
