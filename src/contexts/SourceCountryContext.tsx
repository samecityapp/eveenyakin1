import { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import type { Country } from '../types';

interface SourceCountryContextType {
  sourceCountry: string;
  setSourceCountry: (code: string) => void;
  countries: Country[];
  setCountries: (countries: Country[]) => void;
  selectedCountryData: Country | undefined;
}

const SourceCountryContext = createContext<SourceCountryContextType | undefined>(
  undefined
);

const STORAGE_KEY = 'samecityapp_source_country';

export function SourceCountryProvider({ children }: { children: ReactNode }) {
  const [sourceCountry, setSourceCountryState] = useState<string>(() => {
    if (typeof window !== 'undefined') {
      return localStorage.getItem(STORAGE_KEY) || 'tr';
    }
    return 'tr';
  });

  const [countries, setCountries] = useState<Country[]>([]);

  const setSourceCountry = (code: string) => {
    setSourceCountryState(code);
    if (typeof window !== 'undefined') {
      localStorage.setItem(STORAGE_KEY, code);
    }
  };

  const selectedCountryData = countries.find((c) => c.code === sourceCountry);

  useEffect(() => {
    if (typeof window !== 'undefined') {
      localStorage.setItem(STORAGE_KEY, sourceCountry);
    }
  }, [sourceCountry]);

  return (
    <SourceCountryContext.Provider
      value={{
        sourceCountry,
        setSourceCountry,
        countries,
        setCountries,
        selectedCountryData,
      }}
    >
      {children}
    </SourceCountryContext.Provider>
  );
}

export function useSourceCountry() {
  const context = useContext(SourceCountryContext);
  if (context === undefined) {
    throw new Error('useSourceCountry must be used within a SourceCountryProvider');
  }
  return context;
}
