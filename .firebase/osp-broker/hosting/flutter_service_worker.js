'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "f11415a9aba859fec224efd8f663b317",
"version.json": "272607cac067619dbee48b90107b62cb",
"index.html": "de821e04b3241d187ea0a3a6f77374c0",
"/": "de821e04b3241d187ea0a3a6f77374c0",
"main.dart.js": "dacb9188cdeadfc5a0dfcb9c5600be9e",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "858a35ce79294a6eaaba38a6aa4ec327",
"assets/AssetManifest.json": "a1a5dba56a6576a5f741207a16cc62f5",
"assets/NOTICES": "c350b40425b39cea9edd5a6ccc105c3e",
"assets/FontManifest.json": "47a09097ab3c3ba0eef4ea68dcea2280",
"assets/AssetManifest.bin.json": "4e194d4538282a3e535a621b7d8099e8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "d0d662985007f2c779ca2587732e33e9",
"assets/fonts/MaterialIcons-Regular.otf": "9baa7922636dcbc6e1f2c00257f72c7f",
"assets/assets/images/osp-logo.png": "3f2e52158c45f601f4a24e648edb9cdc",
"assets/assets/images/0_Hero.png": "18b59947ac22ebcfe0718b3680161729",
"assets/assets/images/rfp-banner-image.png": "e4da644b0e5a30a1c0c2d2610c4fa640",
"assets/assets/images/explore-img3.png": "2d6f59fcfd4709c95df4da2c0494bb90",
"assets/assets/images/explore-img2.png": "e98a21ef8704b289df2135ff7bc304c3",
"assets/assets/images/explore-img1.png": "ab42fa283138aae9074bf31dcc78b7ee",
"assets/assets/images/featured-img3.png": "6d07be9ceee33fcc3e3a32aae8cff624",
"assets/assets/images/featured-img2.png": "eead1b5704748f08762a54da7af4b5f7",
"assets/assets/images/testimonial-bg.png": "024ad020ace906005ac4a2618eb4a830",
"assets/assets/images/featured-img1.png": "5ac2ef10a212b9f6cb2fefd1d7879c12",
"assets/assets/images/membership-sec-bg.png": "6d5e2b58572beb759b7633dc26906d28",
"assets/assets/images/landing-banner3.png": "3cac056ea6962ea52ec4af1dd28195d6",
"assets/assets/images/landing-bg3.png": "0f0ed6b3ba0ccd85c8975aa556d7bcd5",
"assets/assets/images/rfp-banner-background.png": "ce9be8106f21cd8d942402fdf47ea43d",
"assets/assets/images/osp-logo-footer.png": "d30186f9bd26624c05ae43be98f49ff1",
"assets/assets/images/profile.png": "71236188c5e31371b7f5a389af9ed4fe",
"assets/assets/images/explore-bg.png": "024ad020ace906005ac4a2618eb4a830",
"assets/assets/images/testimonial-right-bg.png": "5f87443fe27141912c8d52ec542fef82",
"assets/assets/images/testimonial-img.png": "bad74523d0f986010bc4de2d418bebad",
"assets/assets/images/auction-sample.png": "846be243c02855c6b28ad2c2f338f96f",
"assets/assets/icons/arrow-circle-left.png": "c82efc40612b80ecfa68f4faeff0461c",
"assets/assets/icons/forum.png": "42c5f780f931d633037921a05fd00140",
"assets/assets/icons/rfp.png": "313eee0eb625b174c7eb6da50725c997",
"assets/assets/icons/instagram.png": "1ecba7706608b09da243edbcf3ae135a",
"assets/assets/icons/x.png": "bc3a89c3d71a45b1ae9e18ee5a0e1dc9",
"assets/assets/icons/membership.png": "db6107c9d59ae3234ad89e8f7ddaa5f9",
"assets/assets/icons/facebook.png": "30c358d509a436dd0e8c848c60e43977",
"assets/assets/icons/auction.png": "9ea2dcb41e00ddafb70a479aed349424",
"assets/assets/icons/membership/bronze.png": "1f4653cba418f4c23ad9d8edd7070dc6",
"assets/assets/icons/membership/silver.png": "9707b112f2901668c999f8021eff629e",
"assets/assets/icons/membership/diamond.png": "9ee5b7603dbf01d7d5672e70a3d38683",
"assets/assets/icons/membership/free.png": "5de8a61522d98ae2b7570ba07cf056a2",
"assets/assets/icons/membership/gold.png": "b92824e0c5ea147abf857f6392b838a3",
"assets/assets/icons/membership/platinum.png": "25c569b902f64c04e9b5ed7016b7c9ab",
"assets/assets/landing-banner.mp4": "e5c33c46ff5df36eb8eddb102f96cb75",
"assets/assets/fonts/BasementGrotesque-Black_v1.202.otf": "069afac8a426962d5167130a8a8d4cf4",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
