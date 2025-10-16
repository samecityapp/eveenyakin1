import { MapContainer, TileLayer, Marker, Popup } from 'react-leaflet';
import 'leaflet/dist/leaflet.css';
import L from 'leaflet';
import { renderToString } from 'react-dom/server';
import type { FoodCategory, Venue } from '../types';
import {
  Beef,
  Coffee,
  Pizza,
  UtensilsCrossed,
  Star,
  Utensils,
  MapPin,
  ExternalLink
} from 'lucide-react';

const iconComponents: { [key: string]: React.ElementType } = {
  Beef,
  Coffee,
  Pizza,
  UtensilsCrossed,
  Star,
  Utensils,
  MapPin
};

const categoryColors: { [key: string]: string } = {
  'hamburger': '#ef4444',
  'kahve': '#78350f',
  'pizza': '#f97316',
  'fine-dining': '#1f2937',
  'michelin': '#eab308',
  'yerel-lezzetler': '#16a34a'
};

const createCategoryIcon = (iconName: string, categorySlug: string) => {
  const IconComponent = iconComponents[iconName] || MapPin;
  const color = categoryColors[categorySlug] || '#6b7280';

  const iconHtml = renderToString(
    <div style={{
      backgroundColor: color,
      borderRadius: '50%',
      padding: '6px',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      boxShadow: '0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1)'
    }}>
      <IconComponent size={18} color="white" strokeWidth={2.5} />
    </div>
  );

  return new L.DivIcon({
    html: iconHtml,
    className: 'bg-transparent border-0',
    iconSize: [32, 32],
    iconAnchor: [16, 32],
    popupAnchor: [0, -32]
  });
};

interface MapViewProps {
  guide: FoodCategory[];
}

interface VenueWithCategory extends Venue {
  category: FoodCategory;
}

export default function MapView({ guide }: MapViewProps) {
  const venuesWithCategory: VenueWithCategory[] = guide.flatMap(category =>
    category.venues
      .filter(v => v.lat && v.lng)
      .map(venue => ({ ...venue, category }))
  );

  if (venuesWithCategory.length === 0) {
    return (
      <div className="h-[600px] w-full bg-gray-100 rounded-xl flex items-center justify-center">
        <p className="text-gray-500">Konum bilgisi bulunamadı</p>
      </div>
    );
  }

  const avgLat = venuesWithCategory.reduce((sum, v) => sum + v.lat, 0) / venuesWithCategory.length;
  const avgLng = venuesWithCategory.reduce((sum, v) => sum + v.lng, 0) / venuesWithCategory.length;

  return (
    <MapContainer
      center={[avgLat, avgLng]}
      zoom={13}
      style={{ height: '600px', width: '100%' }}
      className="rounded-xl z-0"
    >
      <TileLayer
        url="https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png"
        attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors &copy; <a href="https://carto.com/attributions">CARTO</a>'
      />
      {venuesWithCategory.map(venue => (
        <Marker
          key={venue.id}
          position={[venue.lat, venue.lng]}
          icon={createCategoryIcon(venue.category.icon, venue.category.slug)}
        >
          <Popup>
            <div className="w-64">
              <div className="relative h-32 mb-3 overflow-hidden rounded-lg">
                <img
                  src={venue.image}
                  alt={venue.name}
                  className="w-full h-full object-cover"
                />
              </div>
              <div className="flex items-center gap-2 mb-2">
                <span
                  className="text-xs font-semibold px-2 py-1 rounded-full text-white"
                  style={{ backgroundColor: categoryColors[venue.category.slug] || '#6b7280' }}
                >
                  {venue.category.name}
                </span>
              </div>
              <h4 className="font-bold text-base mb-2">{venue.name}</h4>
              <p className="text-sm text-gray-600 mb-3 line-clamp-2">{venue.mentor_note}</p>
              <div className="flex items-center justify-between">
                {venue.google_rating && (
                  <div className="flex items-center gap-1 text-sm">
                    <span className="text-yellow-500">★</span>
                    <span className="font-semibold">{venue.google_rating}</span>
                  </div>
                )}
                <a
                  href={venue.map_link}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center gap-1 text-xs text-blue-600 hover:text-blue-700 font-semibold"
                >
                  Google Maps
                  <ExternalLink size={12} />
                </a>
              </div>
            </div>
          </Popup>
        </Marker>
      ))}
    </MapContainer>
  );
}
