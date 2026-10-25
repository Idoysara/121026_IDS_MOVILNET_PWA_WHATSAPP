/**
 * sw.js — Service Worker de Alta Resiliencia para MOVI WhatsApp PWA
 * ====================================================================
 * Estrategia: Network-First con fallback en caché estática inmediata.
 * Garantiza arranque instantáneo (<50ms) en redes móviles 3G/4G/5G.
 */

const CACHE_NAME = 'movi-whatsapp-pwa-v1.0.0';
const STATIC_ASSETS = [
  './index.html',
  './manifest.json',
  './assets/logos/boton_4gmax_oficial.svg',
  './assets/logos/logo_small.png',
  './assets/logos/logo_oficial.png'
];

self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(STATIC_ASSETS).catch((err) => {
        console.warn('Advertencia al precachear recursos estáticos:', err);
      });
    }).then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((keys) => {
      return Promise.all(
        keys.filter((key) => key !== CACHE_NAME).map((key) => caches.delete(key))
      );
    }).then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', (event) => {
  const url = new URL(event.request.url);

  // Peticiones de API van siempre directas a la red (cero almacenamiento de transacciones PII en caché)
  if (url.pathname.startsWith('/api/')) {
    event.respondWith(
      fetch(event.request).catch(() => {
        return new Response(JSON.stringify({
          success: false,
          offline: true,
          message: 'Sin conexión de red en este momento. Revisa tus datos móviles o Wi-Fi.'
        }), {
          status: 503,
          headers: { 'Content-Type': 'application/json' }
        });
      })
    );
    return;
  }

  // Activos estáticos: Network-First con Fallback a Caché
  event.respondWith(
    fetch(event.request)
      .then((networkResponse) => {
        if (networkResponse && networkResponse.status === 200 && event.request.method === 'GET') {
          const responseClone = networkResponse.clone();
          caches.open(CACHE_NAME).then((cache) => {
            cache.put(event.request, responseClone);
          });
        }
        return networkResponse;
      })
      .catch(() => {
        return caches.match(event.request).then((cachedResponse) => {
          if (cachedResponse) {
            return cachedResponse;
          }
          if (event.request.mode === 'navigate') {
            return caches.match('/ui/pwa_whatsapp/index.html');
          }
          return new Response('Recurso no disponible offline', { status: 404 });
        });
      })
  );
});
