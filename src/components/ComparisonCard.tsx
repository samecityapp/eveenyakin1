import { useState } from 'react';
import type { CityCategory } from '../types';
import { Sparkles, CheckCircle } from 'lucide-react';
import { useSourceCountry } from '../contexts/SourceCountryContext';
import { motion, AnimatePresence } from 'framer-motion';

interface ComparisonCardProps {
  cityCategory: CityCategory;
  cityName: string;
}

interface BrandTagProps {
  name: string;
  logo_url: string | null;
  website_url?: string | null;
}

const BrandTag = ({ name, logo_url, website_url }: BrandTagProps) => {
  const content = (
    <>
      {logo_url && (
        <img
          src={logo_url}
          alt={name}
          className="w-5 h-5 object-contain rounded-full"
        />
      )}
      <span className="font-semibold text-sm text-brand-dark">{name}</span>
    </>
  );

  if (website_url) {
    return (
      <a
        href={website_url}
        target="_blank"
        rel="noopener noreferrer"
        onClick={(e) => e.stopPropagation()}
        className="flex items-center gap-2 px-4 py-2 bg-white/80 backdrop-blur-sm border border-white/30 rounded-full shadow-md hover:shadow-lg hover:scale-105 transition-all duration-200 cursor-pointer"
      >
        {content}
      </a>
    );
  }

  return (
    <div className="flex items-center gap-2 px-4 py-2 bg-white/80 backdrop-blur-sm border border-white/30 rounded-full shadow-md">
      {content}
    </div>
  );
};

export function ComparisonCard({ cityCategory, cityName }: ComparisonCardProps) {
  const { category, source_brands, equivalent_brands, pro_tips, mentor_note } = cityCategory;
  const { sourceCountry, selectedCountryData } = useSourceCountry();
  const [isExpanded, setIsExpanded] = useState(false);

  const filteredSourceBrands = source_brands.filter(
    (sb) => sb.country_code === sourceCountry
  );

  const hasTips = pro_tips && pro_tips.length > 0;

  return (
    <div className="bg-gradient-to-br from-white/90 to-white/60 backdrop-blur-lg border border-white/40 rounded-2xl shadow-xl overflow-hidden hover:shadow-2xl transition-all duration-300">
      <div className="p-6 md:p-8">
        <h2 className="text-2xl md:text-3xl font-bold text-brand-dark">{category.name}</h2>
        {mentor_note && (
          <p className="text-brand-secondary mt-2">{mentor_note}</p>
        )}
      </div>
      <div className="grid grid-cols-1 md:grid-cols-2">
        <div className="p-6 md:p-8 border-t border-black/5">
          <h3 className="mb-5 text-xs font-bold text-brand-secondary uppercase tracking-widest">
            {selectedCountryData?.name || 'Kaynak Ülke'}'deki Alışkanlığın
          </h3>
          <div className="flex flex-wrap gap-3">
            {filteredSourceBrands.length > 0 ? (
              filteredSourceBrands.map((sb) => (
                <BrandTag
                  key={sb.id}
                  name={sb.brand.name}
                  logo_url={sb.brand.logo_url}
                  website_url={sb.brand.website_url}
                />
              ))
            ) : (
              <p className="text-sm text-gray-500 italic">
                Bu ülke için henüz marka eklenmemiş
              </p>
            )}
          </div>
        </div>
        <div className="p-6 md:p-8 md:border-l border-t md:border-t-0 border-black/5 bg-gradient-to-br from-blue-50/80 to-indigo-50/40 backdrop-blur-sm">
          <h3 className="mb-5 text-xs font-bold text-brand-primary uppercase tracking-widest">
            {cityName}'daki Karşılıkların
          </h3>
          <div className="flex flex-wrap gap-3">
            {equivalent_brands.map((eb) => (
              <BrandTag
                key={eb.id}
                name={eb.brand.name}
                logo_url={eb.brand.logo_url}
                website_url={eb.brand.website_url}
              />
            ))}
          </div>
        </div>
      </div>

      {hasTips && (
        <>
          <div className="px-6 md:px-8 py-4 border-t border-black/5">
            <button
              onClick={() => setIsExpanded(!isExpanded)}
              className="flex items-center gap-2 font-semibold text-brand-primary hover:text-blue-700 transition-colors group"
            >
              <Sparkles size={18} className="text-yellow-500 group-hover:scale-110 transition-transform" />
              <span>✨ Hayat Kurtaran İpuçları</span>
            </button>
          </div>

          <AnimatePresence>
            {isExpanded && (
              <motion.div
                initial={{ height: 0, opacity: 0 }}
                animate={{ height: 'auto', opacity: 1 }}
                exit={{ height: 0, opacity: 0 }}
                transition={{ duration: 0.4, ease: "easeInOut" }}
                className="overflow-hidden"
              >
                <div className="px-6 md:px-8 pb-6 pt-2 bg-gradient-to-br from-yellow-50/50 to-orange-50/30">
                  <ul className="space-y-3">
                    {pro_tips.map((tip, index) => (
                      <li key={index} className="flex items-start gap-3 text-gray-700">
                        <CheckCircle size={20} className="text-green-500 mt-0.5 flex-shrink-0" />
                        <span className="leading-relaxed">{tip}</span>
                      </li>
                    ))}
                  </ul>
                </div>
              </motion.div>
            )}
          </AnimatePresence>
        </>
      )}
    </div>
  );
}
