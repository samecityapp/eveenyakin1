import { useState } from 'react';
import { MapPin, Utensils, Zap, ExternalLink, Lightbulb } from 'lucide-react';
import { RatingBadge } from './RatingBadge';
import { Modal } from './Modal';
import type { Venue } from '../types';

interface VenueCardProps {
  venue: Venue;
  index: number;
}

export function VenueCard({ venue, index }: VenueCardProps) {
  const [isDetailOpen, setIsDetailOpen] = useState(false);

  return (
    <>
      <div
        className="group bg-white rounded-xl overflow-hidden shadow-lg hover:shadow-2xl transition-all duration-300 animate-fade-in h-full flex flex-col"
        style={{ animationDelay: `${index * 100}ms` }}
      >
        {/* KARTIN ÜST KISMI: Görsel ve metin alanı. Tıklandığında modalı açar. */}
        <div
          className="flex-grow cursor-pointer"
          onClick={() => setIsDetailOpen(true)}
        >
          <div className="relative h-56 overflow-hidden">
            <img
              src={venue.image}
              alt={venue.name}
              className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
              loading="lazy"
            />
            <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
            <h3 className="absolute bottom-4 left-4 text-2xl font-black text-white tracking-tight drop-shadow-lg">
              {venue.name}
            </h3>
          </div>

          <div className="p-5">
            <p className="text-gray-600 leading-relaxed">{venue.mentor_note}</p>
          </div>
        </div>

        {/* KARTIN ALT KISMI: Bağımsız aksiyonlar. Ana tıklamayı etkilemez. */}
        <div className="flex justify-between items-center mt-auto p-5 pt-4 border-t border-gray-100">
          <a
            href={venue.map_link}
            target="_blank"
            rel="noopener noreferrer"
            onClick={(e) => e.stopPropagation()}
            className="inline-flex items-center gap-2 text-sm font-semibold text-blue-600 hover:text-blue-700 hover:underline transition-colors z-10"
          >
            <MapPin size={16} />
            Haritada Görüntüle
          </a>

          {venue.google_rating && venue.google_review_count && (
            <div>
              <RatingBadge
                rating={venue.google_rating}
                reviewCount={venue.google_review_count}
              />
            </div>
          )}
        </div>
      </div>

      {/* Mekan Detay Modalı */}
      <Modal
        isOpen={isDetailOpen}
        onClose={() => setIsDetailOpen(false)}
        title={venue.name}
      >
        <div className="space-y-6">
          {venue.deep_dive_note && (
            <div className="bg-gradient-to-r from-yellow-50 to-amber-50 rounded-lg p-5 border-l-4 border-yellow-400 shadow-sm">
              <h4 className="flex items-center gap-2 text-lg font-bold text-yellow-900 mb-3">
                <Lightbulb size={22} className="text-yellow-600" />
                Mentorun Notu
              </h4>
              <p className="text-gray-800 leading-relaxed">{venue.deep_dive_note}</p>
            </div>
          )}

          <div className="bg-gradient-to-r from-blue-50 to-indigo-50 rounded-lg p-4 border border-blue-200">
            <h4 className="flex items-center gap-2 text-lg font-bold text-gray-900 mb-3">
              <Utensils size={20} className="text-blue-600" />
              Ne Sipariş Etmeli?
            </h4>
            <p className="text-lg font-semibold text-blue-900">{venue.must_order}</p>
          </div>

          {venue.mentor_tricks && venue.mentor_tricks.length > 0 ? (
            <div>
              <h4 className="flex items-center gap-2 text-lg font-bold text-gray-900 mb-3">
                <Zap size={20} className="text-yellow-500" />
                Mentorun Taktikleri
              </h4>
              <ul className="space-y-3">
                {venue.mentor_tricks.map((trick, i) => (
                  <li key={i} className="flex items-start gap-3 text-gray-700 bg-gradient-to-r from-yellow-50 to-orange-50 p-4 rounded-lg border border-yellow-200">
                    <span className="text-yellow-600 font-bold flex-shrink-0 text-lg">#</span>
                    <span className="leading-relaxed">{trick}</span>
                  </li>
                ))}
              </ul>
            </div>
          ) : (
            <div>
              <h4 className="flex items-center gap-2 text-lg font-bold text-gray-900 mb-3">
                <Zap size={20} className="text-yellow-500" />
                Mentorun Taktikleri
              </h4>
              <ul className="space-y-3">
                {venue.reviews_summary.map((review, i) => (
                  <li key={i} className="flex items-start gap-3 text-gray-700 bg-gray-50 p-3 rounded-lg">
                    <span className="text-lg flex-shrink-0">{review.split(' ')[0]}</span>
                    <span className="leading-relaxed">{review.substring(review.indexOf(' ') + 1)}</span>
                  </li>
                ))}
              </ul>
            </div>
          )}

          <div className="pt-4 border-t border-gray-200 flex flex-wrap gap-4">
            <a
              href={venue.map_link}
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-2 text-sm font-semibold text-blue-600 hover:text-blue-700 hover:underline transition-colors"
            >
              <MapPin size={16} />
              Haritada Görüntüle
            </a>
            {venue.website_url && (
              <a
                href={venue.website_url}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 text-sm font-semibold text-green-600 hover:text-green-700 hover:underline transition-colors"
              >
                <ExternalLink size={16} />
                Web Sitesini Ziyaret Et
              </a>
            )}
          </div>
        </div>
      </Modal>
    </>
  );
}
