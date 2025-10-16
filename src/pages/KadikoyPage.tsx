import { useEffect, useState, useMemo } from 'react';
import { getDistrictFoodGuide } from '../lib/api';
import { FilterControls } from '../components/FilterControls';
import { FoodGuide } from '../components/FoodGuide';
import { SEO } from '../components/SEO';
import { VenueCard } from '../components/VenueCard';
import { motion } from 'framer-motion';
import type { Venue } from '../types';

interface DistrictCategory {
  id: string;
  category_name: string;
  category_slug: string;
  category_icon: string;
  venues: Venue[];
}

const neighborhoods = [
  { name: 'Tümü', slug: 'all' },
  { name: 'Moda', slug: 'moda' },
  { name: 'Yeldeğirmeni', slug: 'yeldegirmeni' },
  { name: 'Kadıköy Merkez', slug: 'kadikoy-merkez' },
];

export function KadikoyPage() {
  const [foodGuide, setFoodGuide] = useState<DistrictCategory[]>([]);
  const [loading, setLoading] = useState(true);
  const [activeNeighborhood, setActiveNeighborhood] = useState('all');
  const [activeCategory, setActiveCategory] = useState('');

  useEffect(() => {
    loadData();
  }, []);

  async function loadData() {
    setLoading(true);
    const data = await getDistrictFoodGuide('kadikoy');
    setFoodGuide(data);
    if (data.length > 0) {
      setActiveCategory(data[0].category_slug);
    }
    setLoading(false);
  }

  const filteredFoodGuide = useMemo(() => {
    return foodGuide
      .map((category) => ({
        ...category,
        venues:
          activeNeighborhood === 'all'
            ? category.venues
            : category.venues.filter(
                (venue) => venue.neighborhood_slug === activeNeighborhood
              ),
      }))
      .filter((category) => category.venues.length > 0);
  }, [activeNeighborhood, foodGuide]);

  const availableCategories = useMemo(() => {
    return filteredFoodGuide.map((cat) => ({
      name: cat.category_name,
      slug: cat.category_slug,
      icon: cat.category_icon,
    }));
  }, [filteredFoodGuide]);

  const currentCategory = filteredFoodGuide.find(
    (cat) => cat.category_slug === activeCategory
  );

  const venueCount = filteredFoodGuide.reduce(
    (sum, cat) => sum + cat.venues.length,
    0
  );

  return (
    <>
      <SEO
        title="Kadıköy - En İyi Mekanlar | eveenyakin"
        description="Kadıköy'ün en iyi kahvecileri, hamburgercileri ve daha fazlası. Moda, Yeldeğirmeni ve Merkez'deki saklı cevherleri keşfet."
        canonical="https://eveenyakin.com/istanbul/kadikoy"
      />
      <main className="container mx-auto px-4 py-12">
        {/* Hero Section */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          className="text-center mb-12"
        >
          <h1 className="text-5xl md:text-6xl font-black tracking-tighter text-brand-dark mb-3">
            Kadıköy
          </h1>
          <p className="text-xl text-brand-secondary max-w-2xl mx-auto">
            Anadolu Yakası'nın hiç uyumayan, bohem ve enerjik kalbi
          </p>
          {!loading && (
            <p className="mt-4 text-sm text-gray-500">
              {venueCount} mekan • {availableCategories.length} kategori
            </p>
          )}
        </motion.div>

        {loading ? (
          <div className="text-center py-20">
            <div className="inline-block animate-spin rounded-full h-12 w-12 border-4 border-brand-primary border-t-transparent"></div>
            <p className="mt-4 text-brand-secondary">Yükleniyor...</p>
          </div>
        ) : (
          <div className="space-y-12">
            {/* Mahalle Filtreleri */}
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.1 }}
            >
              <FilterControls
                title="📍 Mahalle Seç"
                items={neighborhoods}
                activeSlug={activeNeighborhood}
                setActiveSlug={setActiveNeighborhood}
                type="neighborhood"
              />
            </motion.div>

            {/* Kategori Filtreleri */}
            {availableCategories.length > 0 && (
              <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.2 }}
              >
                <FilterControls
                  title="🍴 Kategori Seç"
                  items={availableCategories}
                  activeSlug={activeCategory}
                  setActiveSlug={setActiveCategory}
                  type="category"
                />
              </motion.div>
            )}

            {/* Mekan Listesi */}
            {currentCategory && (
              <motion.div
                key={activeCategory + activeNeighborhood}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.3 }}
              >
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                  {currentCategory.venues.map((venue, index) => (
                    <VenueCard key={venue.id} venue={venue} index={index} />
                  ))}
                </div>
              </motion.div>
            )}

            {filteredFoodGuide.length === 0 && (
              <div className="text-center py-20">
                <p className="text-2xl font-bold text-gray-400 mb-2">🔍</p>
                <p className="text-gray-500">
                  Bu mahallede henüz mekan eklenmemiş.
                </p>
                <button
                  onClick={() => setActiveNeighborhood('all')}
                  className="mt-4 px-6 py-2 bg-brand-primary text-white rounded-full hover:bg-brand-dark transition-colors"
                >
                  Tümünü Göster
                </button>
              </div>
            )}
          </div>
        )}
      </main>
    </>
  );
}
