import { useEffect, useState } from 'react';
import { useParams, Navigate, useSearchParams } from 'react-router-dom';
import { getCityBySlug, getFoodGuideByCity } from '../lib/api';
import { ComparisonCard } from '../components/ComparisonCard';
import { FoodGuide } from '../components/FoodGuide';
import { CityNavigation } from '../components/CityNavigation';
import { ScrollHandler } from '../components/ScrollHandler';
import { SEO } from '../components/SEO';
import type { CityWithCategories, FoodCategory } from '../types';
import { ArrowLeft } from 'lucide-react';

export function CityDetailPage() {
  const { slug } = useParams<{ slug: string }>();
  const [searchParams] = useSearchParams();
  const [city, setCity] = useState<CityWithCategories | null>(null);
  const [foodGuide, setFoodGuide] = useState<FoodCategory[]>([]);
  const [loading, setLoading] = useState(true);
  const [notFound, setNotFound] = useState(false);

  const tabParam = searchParams.get('tab');

  useEffect(() => {
    if (slug) {
      loadCity(slug);
    }
  }, [slug]);

  async function loadCity(citySlug: string) {
    setLoading(true);
    const data = await getCityBySlug(citySlug);
    if (data) {
      setCity(data);
      const guide = await getFoodGuideByCity(data.id);
      setFoodGuide(guide);
    } else {
      setNotFound(true);
    }
    setLoading(false);
  }

  if (notFound) {
    return <Navigate to="/" replace />;
  }

  if (loading) {
    return (
      <div className="container mx-auto px-4 py-12">
        <div className="text-center text-gray-500">Yükleniyor...</div>
      </div>
    );
  }

  if (!city) {
    return null;
  }

  // YENİ SIRALAMA: Lezzet Durakları önce, Pratik Bilgiler sonra
  const pageSections = [];
  if (foodGuide && foodGuide.length > 0) {
    pageSections.push({ id: 'food-guide', title: 'Lezzet Durakları' });
  }
  pageSections.push({ id: 'practical-info', title: 'Pratik Bilgiler' });

  const generateFaqSchema = () => {
    const questionsAndAnswers = city.categories.map(cityCategory => {
      const category = cityCategory.category;
      const equivalentBrands = cityCategory.equivalent_brands
        .map(eb => eb.brand?.name)
        .filter(Boolean)
        .join(', ');

      const question = `${city.name} şehrindeki ${category.name} karşılıkları nelerdir?`;
      const answer = equivalentBrands
        ? `${city.name} şehrindeki ${category.name} karşılıkları: ${equivalentBrands}.`
        : `${city.name} şehrinde ${category.name} için henüz karşılık eklenmemiş.`;

      return {
        "@type": "Question",
        "name": question,
        "acceptedAnswer": {
          "@type": "Answer",
          "text": answer
        }
      };
    });

    return {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": questionsAndAnswers
    };
  };

  const faqSchema = generateFaqSchema();

  return (
    <>
      <SEO
        title={`${city.name} Şehir Rehberi`}
        description={`SameCityApp ile ${city.name} şehrindeki tüm alışkanlıklarınızın yerel karşılıklarını ve en iyi lezzet duraklarını keşfedin. ${city.country} için pratik rehberiniz.`}
        canonical={`https://samecityapp.com/city/${city.slug}`}
        schema={faqSchema}
      />
      <ScrollHandler />
      <CityNavigation sections={pageSections} />
      <main className="container mx-auto px-4 py-12">
        <a
          href="/"
          className="inline-flex items-center space-x-2 text-blue-600 hover:text-blue-800 mb-8"
        >
          <ArrowLeft className="w-5 h-5" />
          <span>Ana Sayfaya Dön</span>
        </a>

        <div className="text-center mb-12">
          <h1 className="text-5xl font-bold text-gray-800">{city.name}</h1>
          <p className="text-xl text-gray-600 mt-2">
            {city.country} için pratik rehberiniz
          </p>
        </div>

      </main>

      {/* YENİ SIRALAMA: Lezzet Durakları önce gösteriliyor */}
      {foodGuide && foodGuide.length > 0 && (
        <section id="food-guide" className="scroll-mt-20">
          <FoodGuide guide={foodGuide} initialTab={tabParam || undefined} />
        </section>
      )}

      {/* Pratik Bilgiler sonra gösteriliyor */}
      <section id="practical-info" className="pt-24 scroll-mt-20">
        <div className="container mx-auto px-4">
          {city.categories.length === 0 ? (
            <div className="text-center text-gray-500 mt-8">
              Bu şehir için henüz kategori eklenmemiş.
            </div>
          ) : (
            <div className="space-y-8 max-w-4xl mx-auto">
              {city.categories.map((cityCategory, index) => (
                <div
                  key={cityCategory.id}
                  className={`p-2 rounded-3xl ${
                    index % 2 === 0 ? 'bg-transparent' : 'bg-slate-100/70'
                  }`}
                >
                  <ComparisonCard
                    cityCategory={cityCategory}
                    cityName={city.name}
                  />
                </div>
              ))}
            </div>
          )}
        </div>
      </section>
    </>
  );
}
