'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "a5120a3532f0253f4edc9ddfb83c24a3",
"assets/AssetManifest.bin.json": "5815db86ee37686d00b7dc5a21495ddf",
"assets/AssetManifest.json": "82d7e3b313884e662fd8178c24c506e5",
"assets/assets/images/connpass.webp": "7dafef0923b98fce27b107509c0efee4",
"assets/assets/images/dart.webp": "da20a4003c59e986d2c1f2e1a7e79c32",
"assets/assets/images/enjin_circle_wakamono.png": "0f30f7de7c8281fe56ea1a95b41aa77a",
"assets/assets/images/FlutterKaigi2025.webp": "78b88ea06f2af2908dd334c8efdbc1f7",
"assets/assets/images/flutter_contest.webp": "a3f9757c29c993d660ed0fbe89a5c172",
"assets/assets/images/icebreak.jpg": "a11113e4ddbd6989f8a0e13bc888ebdb",
"assets/assets/images/i_love_money.webp": "ff983104906ed080848ae2a86febeb3f",
"assets/assets/images/logo_512x512.png": "f5b3bc21c4073109fb314e2d5b6399ec",
"assets/assets/images/logo_word_512x512.webp": "87f503f0d08cf9071e4521ce82cc0999",
"assets/assets/images/me_400x400.jpg": "a2b89b48270f1b306f78dafba6f72611",
"assets/assets/images/oso.webp": "f40b42b6b6c62422df11b853d4923df8",
"assets/assets/images/player-walk-left.gif": "ebeac2bb5b839b272fbbe73cbfbff677",
"assets/assets/images/player-walk-right.gif": "aff56ba4aadff48ddefbb8a610c34298",
"assets/assets/images/psc.webp": "5f182afc65c3e9ae88135ae724fbb0dd",
"assets/assets/images/qiita1.png": "c52e6b0d4ff049bf45edb4c2fe6d05ef",
"assets/assets/images/qiita2.png": "7b2a443f13397b27da5d218fb6645b60",
"assets/assets/images/qiita3.png": "ce328e83af512d5e625820e5a30e9734",
"assets/assets/images/qiita4.png": "06f6b1ce339ee7b0774b807584b8df43",
"assets/assets/images/qiita5.png": "d7c8a4a93c7571957dc547bf45ba7895",
"assets/assets/images/qiita6.png": "3872411337edabc7bb6f608da29fdea4",
"assets/assets/images/QR_discord.png": "ef55763ac2e73873c08b31257ed18030",
"assets/assets/images/QR_yakuran.png": "b27a7bf39337d202eace1041dc0f2e49",
"assets/assets/images/riverpod.png": "e94d8f30ac506ac7099d387456184e47",
"assets/assets/images/yakuran.jpg": "73ccde3cd49c9cdbffa1443185d05952",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "8ba96fe7af15d8a5249d481a186a0f15",
"assets/NOTICES": "c6abfbaecefaf1e51f16555ef454eea0",
"assets/packages/flutter_deck/assets/header.png": "7b35f3749eb44d6d99f8621da7ba71a5",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "d13179d6d4de9cdb1adb27536bdc74f9",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "58afe44b1c93c71cf52f378b2c7e8274",
"/": "58afe44b1c93c71cf52f378b2c7e8274",
"main.dart.js": "5ad34197cc87850cc255a632b37dd3bf",
"manifest.json": "de3989856e7a84b8c64afd8153b93b79",
"version.json": "8e9102213361d7ad356306be2aa0f0aa"};
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
