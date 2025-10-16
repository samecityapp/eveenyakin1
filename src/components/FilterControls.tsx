import { motion } from 'framer-motion';

interface FilterItem {
  name: string;
  slug: string;
  icon?: string;
}

interface FilterControlsProps {
  items: FilterItem[];
  activeSlug: string;
  setActiveSlug: (slug: string) => void;
  title: string;
  type?: 'neighborhood' | 'category';
}

export function FilterControls({
  items,
  activeSlug,
  setActiveSlug,
  title,
  type = 'neighborhood'
}: FilterControlsProps) {
  return (
    <div className="w-full mb-8">
      <h2 className="text-lg font-bold text-brand-secondary mb-4 text-center">
        {title}
      </h2>
      <div className="flex justify-center flex-wrap gap-3">
        {items.map((item, index) => (
          <motion.button
            key={item.slug}
            onClick={() => setActiveSlug(item.slug)}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: index * 0.05 }}
            className={`px-5 py-2.5 text-sm font-semibold rounded-full transition-all duration-300 ${
              activeSlug === item.slug
                ? 'bg-brand-dark text-white shadow-lg scale-105'
                : 'bg-white text-brand-secondary hover:bg-gray-100 border border-gray-200'
            }`}
          >
            {item.slug === 'all' && '✨ '}
            {item.name}
          </motion.button>
        ))}
      </div>
    </div>
  );
}
