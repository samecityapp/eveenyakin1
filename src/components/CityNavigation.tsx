import { useState, useEffect } from 'react';

interface Section {
  id: string;
  title: string;
}

interface CityNavigationProps {
  sections: Section[];
}

export function CityNavigation({ sections }: CityNavigationProps) {
  const [isSticky, setIsSticky] = useState(false);
  const [activeSection, setActiveSection] = useState<string>('');

  useEffect(() => {
    const handleScroll = () => {
      if (window.scrollY > 200) {
        setIsSticky(true);
      } else {
        setIsSticky(false);
      }

      const sectionOffsets = sections.map(section => {
        const element = document.getElementById(section.id);
        if (element) {
          const rect = element.getBoundingClientRect();
          return {
            id: section.id,
            top: rect.top + window.scrollY,
            bottom: rect.bottom + window.scrollY
          };
        }
        return null;
      }).filter(Boolean);

      const currentScroll = window.scrollY + 100;
      const active = sectionOffsets.find(
        section => section && currentScroll >= section.top && currentScroll < section.bottom
      );

      if (active) {
        setActiveSection(active.id);
      }
    };

    window.addEventListener('scroll', handleScroll);
    handleScroll();

    return () => window.removeEventListener('scroll', handleScroll);
  }, [sections]);

  const scrollToSection = (id: string) => {
    const element = document.getElementById(id);
    if (element) {
      const offset = 80;
      const elementPosition = element.getBoundingClientRect().top + window.scrollY;
      const offsetPosition = elementPosition - offset;

      window.scrollTo({
        top: offsetPosition,
        behavior: 'smooth'
      });
    }
  };

  return (
    <div
      className={`transition-all duration-300 sticky top-0 z-40 ${
        isSticky
          ? 'bg-white/95 backdrop-blur-lg shadow-md border-b border-gray-200'
          : 'bg-transparent'
      }`}
    >
      <div className="container mx-auto px-4">
        <div className="flex items-center justify-center gap-8 py-4">
          {sections.map((section) => (
            <button
              key={section.id}
              onClick={() => scrollToSection(section.id)}
              className={`relative font-semibold transition-all duration-200 ${
                activeSection === section.id
                  ? 'text-blue-600'
                  : 'text-gray-600 hover:text-gray-900'
              }`}
            >
              {section.title}
              {activeSection === section.id && (
                <span className="absolute -bottom-4 left-0 right-0 h-0.5 bg-blue-600 rounded-full" />
              )}
            </button>
          ))}
        </div>
      </div>
    </div>
  );
}
