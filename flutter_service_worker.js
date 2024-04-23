'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"splash/img/light-2x.png": "69e0ccd645b90c3827c9cef1b0109cb3",
"splash/img/light-4x.png": "32f95ae0bde5137705c74be23529a03d",
"splash/img/light-3x.png": "b544a67e295f35c6e9b5beeb15e11506",
"splash/img/dark-2x.png": "69e0ccd645b90c3827c9cef1b0109cb3",
"splash/img/dark-3x.png": "b544a67e295f35c6e9b5beeb15e11506",
"splash/img/dark-4x.png": "32f95ae0bde5137705c74be23529a03d",
"splash/img/dark-1x.png": "ce3b420e2fc1a9e5da8cd7f00df33184",
"splash/img/light-1x.png": "ce3b420e2fc1a9e5da8cd7f00df33184",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"manifest.json": "ec370b809f7a76f4ac4e9af2281bbee3",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"index.html": "867c183962410f132959d07e23d6d5cf",
"/": "867c183962410f132959d07e23d6d5cf",
"assets/FontManifest.json": "b03e58e36b16ba19504c51eeac8b2c3d",
"assets/AssetManifest.bin": "b15b73e046bcba5c167125a0ade8585e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/assets/fonts/NotoSerif-VariableFont_wdth,wght.ttf": "0f33d278e18fdda6984d68f42fc0becb",
"assets/assets/fonts/NotoSerif-Italic-VariableFont_wdth,wght.ttf": "d0cece97a0225fd5b8c6a8f629c69ad8",
"assets/assets/fonts/Belleza-Regular.ttf": "012818f01d4e46c928a1c64d8a467493",
"assets/assets/fonts/now/Now-Black.otf": "9f23a858d1883a8271adfc8be49d7fa7",
"assets/assets/fonts/now/Now-Bold.otf": "33c1c2f2ada08cab52a7f42177ea44ca",
"assets/assets/fonts/now/Now-Regular.otf": "43bf8f54b4f539bed0c9048b90c428b2",
"assets/assets/fonts/now/Now-Medium.otf": "a52f54559b2cb2642ebf886d28c79a01",
"assets/assets/fonts/now/Now-Thin.otf": "894eaf68e2d41c0581ed66377f7137c1",
"assets/assets/fonts/now/NowAlt-Bold.otf": "9d4917156326a0712eac77a35703b905",
"assets/assets/fonts/now/NowAlt-Regular.otf": "2100211245b87ccce7423a835090ea60",
"assets/assets/fonts/now/Now-Light.otf": "9507a037d06eb23fcb282cf7e0954c63",
"assets/assets/fonts/now/NowAlt-Thin.otf": "3b3927ea7662456482173dbac61e1ac3",
"assets/assets/fonts/now/NowAlt-Light.otf": "6f9ee13d3c10aa29a8024ccd99082884",
"assets/assets/fonts/now/NowAlt-Black.otf": "19283d8f553849b46e73416c307429d2",
"assets/assets/fonts/now/NowAlt-Medium.otf": "b534eb01c5dd79be92ea7f95591c37f6",
"assets/assets/images/slider2.jpg": "9f1a1f46d4db5a38b4354482e50a2790",
"assets/assets/images/Mapa_marquesa.png": "005777795a3ba6ea6b3afcbb5d0716ea",
"assets/assets/images/slider1.jpg": "d40574283b3f492e6962a32580a37deb",
"assets/assets/images/slider3.jpg": "a5e807d9e5085c317dd5e09335026d70",
"assets/assets/images/logo/logo_light.png": "66fc78f751441b5d92b7f92f91310740",
"assets/assets/images/intro_image.jpg": "cecea59e90373fdec92b1c9ddb5252e5",
"assets/assets/images/intro_big.jpg": "6bc55deb227e1a30bb7c1b38d3da7c2a",
"assets/assets/images/hoteles/ARCHYVAL.png": "c9267fcd4dc90c4992f0ba578e1bb61b",
"assets/assets/images/hoteles/HYLTOR.jpg": "cdae795d6ce01749aff8b9dc3f9ab4d8",
"assets/AssetManifest.bin.json": "94462353fad1a30087381f7fecdbcafc",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "a79357d7cb343e2b2ec8a1ceeb300712",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/AssetManifest.json": "7eb9daa0839b84cd77177520b56f1367",
"main.dart.js": "9bf5481b25ba1ef24232e982c7e5aaca",
"favicon.png": "7fb460c03597dd2326b5bc91fd2f6eb7",
"CNAME": "22f520c276460f01ccb6290e247b7d2c",
"version.json": "bba7bce1f38a85688be91f0f05af4a19",
"icons/Icon-maskable-192.png": "0dffcaa27fbeafe3f677244c1f395cf0",
"icons/Icon-192.png": "6e0a9e8d7938b73fc10fd35a53fc3cd6",
"icons/Icon-512.png": "14e3368f102a0b37486402a872784f20",
"icons/Icon-maskable-512.png": "aecb0715228c0c183fe8a3a82dfcb980"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
