import { useState } from 'react';
import { RefreshCw, CheckCircle, AlertCircle } from 'lucide-react';
import { syncVenuesFromGoogle, type SyncVenuesParams } from '../lib/google-sync';

interface GoogleSyncButtonProps {
  districtSlug: string;
  categorySlug: string;
  onSyncComplete?: () => void;
}

export function GoogleSyncButton({ districtSlug, categorySlug, onSyncComplete }: GoogleSyncButtonProps) {
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState<'success' | 'error' | null>(null);
  const [message, setMessage] = useState('');

  async function handleSync() {
    setLoading(true);
    setResult(null);
    setMessage('');

    try {
      const params: SyncVenuesParams = {
        districtSlug,
        categorySlug,
      };

      const response = await syncVenuesFromGoogle(params);

      setResult('success');
      setMessage(
        `${response.totalQualified} mekan güncellendi (${response.totalFetched} adet tarandı)`
      );

      if (onSyncComplete) {
        setTimeout(onSyncComplete, 1000);
      }
    } catch (error) {
      setResult('error');
      setMessage(error instanceof Error ? error.message : 'Bir hata oluştu');
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="inline-flex flex-col gap-2">
      <button
        onClick={handleSync}
        disabled={loading}
        className={`
          inline-flex items-center gap-2 px-4 py-2 rounded-lg font-semibold text-sm
          transition-all duration-200
          ${loading
            ? 'bg-gray-400 cursor-not-allowed'
            : 'bg-blue-600 hover:bg-blue-700 active:scale-95'
          }
          text-white shadow-md hover:shadow-lg
        `}
      >
        <RefreshCw size={16} className={loading ? 'animate-spin' : ''} />
        {loading ? 'Google\'dan çekiliyor...' : 'Google\'dan Güncelle'}
      </button>

      {result === 'success' && (
        <div className="flex items-center gap-2 text-sm text-green-700 bg-green-50 px-3 py-2 rounded-lg">
          <CheckCircle size={16} />
          <span>{message}</span>
        </div>
      )}

      {result === 'error' && (
        <div className="flex items-center gap-2 text-sm text-red-700 bg-red-50 px-3 py-2 rounded-lg">
          <AlertCircle size={16} />
          <span>{message}</span>
        </div>
      )}
    </div>
  );
}
