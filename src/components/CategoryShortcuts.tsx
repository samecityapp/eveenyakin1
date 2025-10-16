import { Link } from 'react-router-dom';
import { Beef, Pizza, Coffee, Building, UtensilsCrossed, Grape, MapPin } from 'lucide-react';

const shortcuts = [
  { title: 'Kadıköy Rehberi', slug: 'istanbul/kadikoy', icon: MapPin, type: 'district' },
  { title: 'En iyi hamburgerciler', slug: 'hamburger', icon: Beef, type: 'category' },
  { title: 'En iyi pizzacılar', slug: 'pizza', icon: Pizza, type: 'category' },
  { title: 'En iyi kahveciler', slug: 'kahve', icon: Coffee, type: 'category' },
  { title: 'En güzel kafeler', slug: 'kafe', icon: Building, type: 'category' },
  { title: 'En İyi Patates Kızartması', slug: 'patates', icon: UtensilsCrossed, type: 'category' },
  { title: 'O şehre özel lezzetler', slug: 'yerel-lezzetler', icon: Grape, type: 'category' },
];

export function CategoryShortcuts() {
  return (
    <div className="flex flex-wrap justify-center gap-3 mt-8">
      {shortcuts.map((shortcut) => {
        const Icon = shortcut.icon;
        const linkPath = shortcut.type === 'district' ? `/${shortcut.slug}` : `/explore/${shortcut.slug}`;
        const isDistrict = shortcut.type === 'district';

        return (
          <Link
            key={shortcut.slug}
            to={linkPath}
            className={`group flex items-center gap-2 px-5 py-2.5 rounded-full shadow-sm text-sm font-semibold transition-all duration-200 ${
              isDistrict
                ? 'bg-gradient-to-r from-red-500 to-red-600 text-white hover:from-red-600 hover:to-red-700 hover:shadow-lg border-2 border-red-400'
                : 'bg-white border-2 border-gray-200 text-gray-700 hover:border-blue-500 hover:text-blue-600 hover:shadow-md'
            }`}
          >
            <Icon size={18} className="transition-transform group-hover:scale-110" />
            <span>{shortcut.title}</span>
          </Link>
        );
      })}
    </div>
  );
}
