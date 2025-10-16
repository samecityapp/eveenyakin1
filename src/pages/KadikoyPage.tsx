import { useEffect, useState, useMemo } from 'react';
import { getDistrictFoodGuide } from '../lib/api';
import { FilterControls } from '../components/FilterControls';
import { FoodGuide } from '../components/FoodGuide';
import { SEO } from '../components/SEO';
import { motion } from 'framer-motion';

interface DistrictVenue {
  id: string;
  name: string;
  link?: string;
  image?: string;
  latitude?: number;
  longitude?: number;
  google_rating?: number;
  google_review_count?: number;
  mentor_note?: string;
  must_order?: string;
  mentor_tricks?: string[];
  neighborhood_slug?: string;
}

interface DistrictCategory {
  id: string;
  category_name: string;
  category_slug: string;
  category_icon: string;
  venues: DistrictVenue[];
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
                    <motion.div
                      key={venue.id}
                      initial={{ opacity: 0, scale: 0.95 }}
                      animate={{ opacity: 1, scale: 1 }}
                      transition={{ delay: index * 0.05 }}
                      className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all duration-300 group"
                    >
                      {venue.image && (
                        <div className="h-48 overflow-hidden">
                          <img
                            src={venue.image}
                            alt={venue.name}
                            className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                            onError={(e) => {
                              e.currentTarget.src = `https://source.unsplash.com/800x600/?${venue.name},cafe,restaurant`;
                            }}
                          />
                        </div>
                      )}
                      <div className="p-6">
                        <h3 className="text-xl font-bold text-brand-dark mb-2">
                          {venue.name}
                        </h3>
                        {venue.google_rating && (
                          <div className="flex items-center gap-2 mb-3">
                            <span className="text-yellow-500 font-bold">
                              ⭐ {venue.google_rating}
                            </span>
                            <span className="text-gray-400 text-sm">
                              ({venue.google_review_count?.toLocaleString()} yorum)
                            </span>
                          </div>
                        )}
                        {venue.mentor_note && (
                          <p className="text-sm text-gray-600 mb-4 line-clamp-3">
                            {venue.mentor_note}
                          </p>
                        )}
                        {venue.must_order && (
                          <div className="bg-blue-50 rounded-lg p-3 mb-4">
                            <p className="text-xs font-bold text-blue-600 mb-1">
                              MUTLAKA DENEYİN
                            </p>
                            <p className="text-sm font-semibold text-blue-900">
                              {venue.must_order}
                            </p>
                          </div>
                        )}
                        {venue.link && (
                          <a
                            href={venue.link}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="text-brand-primary hover:text-brand-dark text-sm font-semibold transition-colors"
                          >
                            Detayları Gör →
                          </a>
                        )}
                      </div>
                    </motion.div>
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
