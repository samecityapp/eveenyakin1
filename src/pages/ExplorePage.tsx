import { useEffect, useState } from 'react';
import { useParams, Navigate } from 'react-router-dom';
import { getAllCities } from '../lib/api';
import { CitySearch } from '../components/CitySearch';
import { SEO } from '../components/SEO';
import type { City } from '../types';
import { Beef, Pizza, Coffee, Building, UtensilsCrossed, Grape } from 'lucide-react';

const categoryConfig: Record<string, { title: string; icon: any; color: string }> = {
  hamburger: { title: 'Hamburgerciler', icon: Beef, color: 'from-orange-500 to-red-500' },
  pizza: { title: 'Pizzacılar', icon: Pizza, color: 'from-red-500 to-pink-500' },
  kahve: { title: 'Kahveciler', icon: Coffee, color: 'from-amber-600 to-orange-500' },
  kafe: { title: 'Kafeler', icon: Building, color: 'from-blue-500 to-indigo-500' },
  patates: { title: 'Patates Kızartması Mekanları', icon: UtensilsCrossed, color: 'from-yellow-500 to-orange-500' },
  'yerel-lezzetler': { title: 'Yerel Lezzetler', icon: Grape, color: 'from-purple-500 to-pink-500' },
};

export function ExplorePage() {
  const { category } = useParams<{ category: string }>();
  const [cities, setCities] = useState<City[]>([]);
  const [loading, setLoading] = useState(true);
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    loadCities();
    setTimeout(() => setIsVisible(true), 100);
  }, []);

  async function loadCities() {
    setLoading(true);
    const citiesData = await getAllCities();
    setCities(citiesData);
    setLoading(false);
  }

  if (!category || !categoryConfig[category]) {
    return <Navigate to="/" replace />;
  }

  const config = categoryConfig[category];
  const Icon = config.icon;

  return (
    <>
      <SEO
        title={`En İyi ${config.title} - Hangi Şehirde?`}
        description={`Dünyanın en iyi ${config.title.toLowerCase()}ını keşfet. Şehir seç, favorilerini bul!`}
        canonical={`https://samecityapp.com/explore/${category}`}
      />
      <main className="min-h-screen bg-gradient-to-br from-white via-blue-50/30 to-indigo-50/20">
        <div className="container mx-auto px-4 py-16 md:py-24">
          <div className="text-center max-w-3xl mx-auto">
            {/* Icon with Gradient Background */}
            <div
              className={`inline-flex items-center justify-center w-20 h-20 rounded-2xl bg-gradient-to-br ${config.color} shadow-lg mb-6 transition-all duration-700 ${
                isVisible ? 'opacity-100 scale-100' : 'opacity-0 scale-75'
              }`}
            >
              <Icon size={36} className="text-white" />
            </div>

            {/* Title */}
            <h1
              className={`text-4xl md:text-5xl lg:text-6xl font-black tracking-tight text-gray-900 mb-4 transition-all duration-700 delay-100 ${
                isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-5'
              }`}
            >
              Hangi Şehirdeki En İyi{' '}
              <span className={`bg-gradient-to-r ${config.color} bg-clip-text text-transparent`}>
                {config.title}
              </span>
              'ı arıyorsun?
            </h1>

            {/* Subtitle */}
            <p
              className={`mt-4 text-lg md:text-xl text-gray-600 transition-all duration-700 delay-200 ${
                isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-5'
              }`}
            >
              Aşağıdaki arama kutusuna bir şehir yazarak o şehrin en iyi mekanlarını keşfet.
            </p>

            {/* Search Component */}
            <div
              className={`mt-10 transition-all duration-700 delay-300 ${
                isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-5'
              }`}
            >
              {loading ? (
                <div className="w-full max-w-xl mx-auto p-4 border-2 border-gray-300 rounded-full bg-white/80 backdrop-blur-sm text-gray-400 text-center shadow-lg">
                  Yükleniyor...
                </div>
              ) : (
                <CitySearch cities={cities} categorySlug={category} categoryName={config.title} />
              )}
            </div>

            {/* Popular Cities Quick Links */}
            {!loading && cities.length > 0 && (
              <div
                className={`mt-12 transition-all duration-700 delay-400 ${
                  isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-5'
                }`}
              >
                <p className="text-sm font-semibold text-gray-500 mb-4">POPÜLER ŞEHİRLER</p>
                <div className="flex flex-wrap justify-center gap-3">
                  {cities.slice(0, 6).map((city) => (
                    <a
                      key={city.slug}
                      href={`/city/${city.slug}?tab=${category}`}
                      className="px-4 py-2 bg-white border border-gray-200 rounded-full text-sm font-medium text-gray-700 hover:border-blue-500 hover:text-blue-600 hover:shadow-md transition-all"
                    >
                      {city.name}
                    </a>
                  ))}
                </div>
              </div>
            )}
          </div>
        </div>
      </main>
    </>
  );
}
