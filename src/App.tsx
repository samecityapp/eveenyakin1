import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { HomePage } from './pages/HomePage';
import { CityDetailPage } from './pages/CityDetailPage';
import { ExplorePage } from './pages/ExplorePage';
import { KadikoyPage } from './pages/KadikoyPage';
import { Header } from './components/Header';
import { SourceCountryProvider } from './contexts/SourceCountryContext';

function App() {
  return (
    <SourceCountryProvider>
      <Router>
        <div className="min-h-screen bg-gradient-to-br from-gray-50 via-blue-50/20 to-indigo-50/10">
          <Header />
          <Routes>
            <Route path="/" element={<HomePage />} />
            <Route path="/city/:slug" element={<CityDetailPage />} />
            <Route path="/explore/:category" element={<ExplorePage />} />
            <Route path="/istanbul/kadikoy" element={<KadikoyPage />} />
          </Routes>
        </div>
      </Router>
    </SourceCountryProvider>
  );
}

export default App;
