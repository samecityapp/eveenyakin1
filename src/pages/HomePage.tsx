import { useEffect, useState } from 'react';
import { getAllCities, getAllCityCategories, getAllFoodGuides } from '../lib/api';
import { SmartSearch } from '../components/SmartSearch';
import { CategoryShortcuts } from '../components/CategoryShortcuts';
import { SEO } from '../components/SEO';
import type { City, CityCategory, FoodCategory } from '../types';
import { ArrowRight } from 'lucide-react';

export function HomePage() {
  const [cities, setCities] = useState<City[]>([]);
  const [allCategories, setAllCategories] = useState<CityCategory[]>([]);
  const [foodGuides, setFoodGuides] = useState<Map<string, FoodCategory[]>>(new Map());
  const [loading, setLoading] = useState(true);
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    loadData();
    setTimeout(() => setIsVisible(true), 100);
  }, []);

  async function loadData() {
    setLoading(true);
    const [citiesData, categoriesData, foodGuidesData] = await Promise.all([
      getAllCities(),
      getAllCityCategories(),
      getAllFoodGuides(),
    ]);
    // İstanbul'u ve global şehirleri ayır
    const istanbul = citiesData.find(c => c.slug === 'istanbul');
    const globalCities = citiesData.filter(c => c.slug !== 'istanbul');
    setCities(istanbul ? [istanbul, ...globalCities] : citiesData);
    setAllCategories(categoriesData);
    setFoodGuides(foodGuidesData);
    setLoading(false);
  }

  return (
    <>
      <SEO
        title="İstanbul'u Keşfet - eveenyakin"
        description="İstanbul'un en iyi mekanlarını ve saklı kalmış cevherlerini keşfet. Yurt dışı rehberleri için pratik karşılıklar."
        canonical="https://eveenyakin.com"
      />
      <main>
      {/* BÖLÜM 1: İSTANBUL VİTRİNİ */}
      <div className="relative overflow-hidden bg-white">
        <div className="container mx-auto px-4 py-20 md:py-32 text-center">
          <h1
            className={`text-4xl md:text-6xl font-black tracking-tighter text-brand-dark transition-all duration-700 ${
              isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-5'
            }`}
          >
            İstanbul Avucunun İçinde
          </h1>
          <p
            className={`mt-4 text-lg md:text-xl max-w-2xl mx-auto text-brand-secondary transition-all duration-700 delay-100 ${
              isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-5'
            }`}
          >
            Şehrin en iyi mekanlarını ve saklı kalmış cevherlerini keşfet.
          </p>
          <div
            className={`mt-8 transition-all duration-700 delay-200 ${
              isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-5'
            }`}
          >
            {loading ? (
              <div className="w-full max-w-xl mx-auto p-4 border border-gray-300 rounded-full bg-white/80 backdrop-blur-sm text-gray-400 text-center shadow-lg">
                Yükleniyor...
              </div>
            ) : (
              <SmartSearch cities={cities} allCategories={allCategories} foodGuides={foodGuides} />
            )}
          </div>

          <div
            className={`mt-8 transition-all duration-700 delay-300 ${
              isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-5'
            }`}
          >
            <CategoryShortcuts />
          </div>
        </div>
      </div>

      {/* BÖLÜM 2: YURT DIŞI REHBERLERİ */}
      <div id="global-guides" className="container mx-auto px-4 pt-16 pb-24 scroll-mt-20">
        <h2 className="text-3xl md:text-4xl font-bold text-center text-brand-dark mb-4">
          Yurt Dışına mı Çıkıyorsun?
        </h2>
        <p className="text-center text-brand-secondary mb-10 max-w-2xl mx-auto">
          Rehberin hazır. Alışkanlıklarınızın yerel karşılıklarını anında bulun.
        </p>
        {loading ? (
          <div className="text-center mt-8 text-gray-500">Yükleniyor...</div>
        ) : cities.length === 0 ? (
          <div className="text-center mt-8 text-gray-500">
            Henüz şehir eklenmemiş.
          </div>
        ) : (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
            {cities.filter(c => c.slug !== 'istanbul').map((city, i) => (
              <a
                href={`/city/${city.slug}`}
                key={city.slug}
                className="group relative block h-80 overflow-hidden rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-300"
                style={{
                  animation: `slideUp 0.5s ease-out ${i * 0.1}s both`
                }}
              >
                {/* Background Image with Zoom Effect - Dynamic Unsplash */}
                <div className="absolute inset-0 transition-transform duration-500 group-hover:scale-105">
                  <img
                    src={`https://source.unsplash.com/800x600/?${city.slug},city,landmark`}
                    alt={city.name}
                    className="w-full h-full object-cover"
                  />
                </div>

                {/* Gradient Overlay */}
                <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/30 to-transparent" />

                {/* Content Panel - Expands on Hover */}
                <div className="absolute bottom-0 left-0 right-0 p-6 transition-all duration-500 group-hover:pb-8">
                  <div className="transform transition-transform duration-500 group-hover:-translate-y-2">
                    <h3
                      className="text-3xl font-black text-white mb-1"
                      style={{ textShadow: '2px 2px 10px rgba(0,0,0,0.7)' }}
                    >
                      {city.name}
                    </h3>
                    <p
                      className="text-white/90 text-lg mb-4"
                      style={{ textShadow: '1px 1px 5px rgba(0,0,0,0.7)' }}
                    >
                      {city.country}
                    </p>
                  </div>

                  {/* "Keşfet" Button - Appears on Hover */}
                  <div className="flex items-center gap-2 text-white font-semibold opacity-0 translate-y-4 transition-all duration-500 group-hover:opacity-100 group-hover:translate-y-0">
                    <span>Keşfet</span>
                    <ArrowRight className="w-5 h-5 transition-transform group-hover:translate-x-1" />
                  </div>
                </div>
              </a>
            ))}
          </div>
        )}
      </div>
      </main>
    </>
  );
}
