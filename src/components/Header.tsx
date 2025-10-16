import { useEffect, useState } from 'react';
import { ChevronDown } from 'lucide-react';
import { useSourceCountry } from '../contexts/SourceCountryContext';
import { getAllCountries } from '../lib/api';

export function Header() {
  const { sourceCountry, setSourceCountry, countries, setCountries, selectedCountryData } =
    useSourceCountry();
  const [showDropdown, setShowDropdown] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadCountries();
  }, []);

  async function loadCountries() {
    setLoading(true);
    const data = await getAllCountries();
    setCountries(data);
    setLoading(false);
  }

  const handleCountrySelect = (code: string) => {
    setSourceCountry(code);
    setShowDropdown(false);
  };

  const scrollToGlobal = (e: React.MouseEvent<HTMLAnchorElement>) => {
    e.preventDefault();
    const element = document.getElementById('global-guides');
    if (element) {
      element.scrollIntoView({ behavior: 'smooth' });
    }
  };

  return (
    <header className="bg-white/80 backdrop-blur-lg border-b border-white/40 shadow-sm sticky top-0 z-30">
      <nav className="container mx-auto px-4 py-4 flex justify-between items-center">
        <div className="flex items-center gap-8">
          <a
            href="/"
            className="text-2xl font-black text-brand-dark hover:text-brand-primary transition-all duration-300 transform hover:scale-105"
          >
            eveenyakin
          </a>
          <a
            href="#global-guides"
            onClick={scrollToGlobal}
            className="hidden md:block font-semibold text-brand-secondary hover:text-brand-primary transition-colors"
          >
            Yurt Dışı Rehberleri
          </a>
        </div>

        <div className="relative">
          {loading ? (
            <div className="px-4 py-2 text-sm text-gray-400">Yükleniyor...</div>
          ) : (
            <>
              <button
                onClick={() => setShowDropdown(!showDropdown)}
                className="flex items-center gap-2 px-4 py-2.5 bg-gradient-to-br from-white/90 to-white/70 backdrop-blur-sm border border-white/40 hover:shadow-lg rounded-xl transition-all duration-200 hover:scale-105"
              >
                <span className="text-2xl">{selectedCountryData?.flag_emoji || '🌍'}</span>
                <span className="font-semibold text-brand-dark">
                  {selectedCountryData?.name || 'Ülke Seç'}
                </span>
                <ChevronDown size={16} className="text-brand-secondary" />
              </button>

              {showDropdown && (
                <>
                  <div
                    className="fixed inset-0 z-10"
                    onClick={() => setShowDropdown(false)}
                  />
                  <div className="absolute right-0 mt-2 w-56 bg-white/95 backdrop-blur-lg border border-white/40 rounded-xl shadow-2xl z-20 overflow-hidden">
                    <div className="p-2">
                      <div className="px-3 py-2 text-xs font-bold text-brand-secondary uppercase tracking-wider">
                        Kaynak Ülkenizi Seçin
                      </div>
                      {countries.map((country) => (
                        <button
                          key={country.code}
                          onClick={() => handleCountrySelect(country.code)}
                          className={`w-full flex items-center gap-3 px-3 py-2.5 rounded-lg transition-all duration-200 ${
                            sourceCountry === country.code
                              ? 'bg-gradient-to-r from-blue-50 to-indigo-50 text-brand-primary shadow-sm'
                              : 'hover:bg-gray-50 text-brand-dark'
                          }`}
                        >
                          <span className="text-2xl">{country.flag_emoji}</span>
                          <span className="font-semibold">{country.name}</span>
                          {sourceCountry === country.code && (
                            <span className="ml-auto text-brand-primary font-bold">✓</span>
                          )}
                        </button>
                      ))}
                    </div>
                  </div>
                </>
              )}
            </>
          )}
        </div>
      </nav>
    </header>
  );
}
