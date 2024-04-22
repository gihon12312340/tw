/**
 * Copyright 2016 Google Inc. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

// DO NOT EDIT THIS GENERATED OUTPUT DIRECTLY!
// This file should be overwritten as part of your build process.
// If you need to extend the behavior of the generated service worker, the best approach is to write
// additional code and include it using the importScripts option:
//   https://github.com/GoogleChrome/sw-precache#importscripts-arraystring
//
// Alternatively, it's possible to make changes to the underlying template file and then use that as the
// new base for generating output, via the templateFilePath option:
//   https://github.com/GoogleChrome/sw-precache#templatefilepath-string
//
// If you go that route, make sure that whenever you update your sw-precache dependency, you reconcile any
// changes made to this original template file with your modified copy.

// This generated service worker JavaScript will precache your site's resources.
// The code needs to be saved in a .js file at the top-level of your site, and registered
// from your pages in order to be used. See
// https://github.com/googlechrome/sw-precache/blob/master/demo/app/js/service-worker-registration.js
// for an example of how you can register this script and handle various service worker events.

/* eslint-env worker, serviceworker */
/* eslint-disable indent, no-unused-vars, no-multiple-empty-lines, max-nested-callbacks, space-before-function-paren, quotes, comma-spacing */
'use strict';

var precacheConfig = [["asset-manifest.json","2e8f3f7920e5f7ad2cd774a4ddd75088"],["css/font-awesome.min.css","008e0bb5ebfa7bc298a042f95944df25"],["css/fonts.css","25e045296b6c476368f9295d615b4aee"],["favicon.ico","1895f7d343f7169e272b95c4e396a7ae"],["icons/icon-192x192.png","7334ab615862b8836b28e970381d3fa2"],["icons/icon-256x256.png","b1c89b7c75e6c9d944429326adb10239"],["icons/icon-384x384.png","e3a02e20bb94f11a3722cfacef8b4f8f"],["icons/icon-512x512.png","de1c94c8fe09f21083b4e9b0e8c5b1aa"],["index.html","7bdc6ee3f42aa0638bc86699f05d94ec"],["logo192.png","33dbdd0177549353eeeb785d02c294af"],["logo512.png","917515db74ea8d1aee6a246cfbcc0b45"],["manifest.json","5e69ce7cefed65677e3bfa3ac4b33405"],["robots.txt","fa1ded1ed7c11438a9b0385b1e112850"],["sounds/arrow_btn.mp3","626bfb5bc26cbd7979e625fa929e8bc2"],["sounds/back-menu.mp3","c60bd621aff7e108063ca481a49de6e4"],["sounds/btn1.mp3","804bd238fe7568698ffc7ced0d28e8fe"],["sounds/btn2.mp3","5eca42f29113483be2c0504b86fde733"],["sounds/button_sound.mp3","2f655f57e9caed1f3f9b18a73eedd39b"],["sounds/check.mp3","e92553d25c761f7166f99d4f0cd69ad1"],["sounds/correct.mp3","713bcf211ada3b50ccbe9e6a0b649b5a"],["sounds/menu.mp3","0f0948da91f248fda65badf54a51a2c3"],["sounds/part.mp3","07fa8b3c4f0b9320584a0cb397931bb7"],["sounds/repair.mp3","9592963a6cfd1678e7e6ebe063397328"],["sounds/win.mp3","963cd743fceb4689d8a5af8ad803db6b"],["sounds/wrong_sound.mp3","cb072867fe85bc4013befc4410b3ff9a"],["static/css/main.056aabee.chunk.css","32828bbdbf957e201ec9f5030d34d975"],["static/js/2.259a9254.chunk.js","e2523e7c63e65629e92feeede98f969d"],["static/js/2.259a9254.chunk.js.LICENSE.txt","04cde3012e009330f613bc177709d0b8"],["static/js/main.d954ddcd.chunk.js","5d6340ad78a7181cd009070e82b92de7"],["static/js/runtime-main.99ea66e2.js","c92d236d71e79a905f452a126e61ab86"],["static/media/aircraft-body-desc.e0015443.png","a8af6787d2c6adb6ba8ed91f7efe2868"],["static/media/aircraft-engine-desc.c71428a2.png","014ea7d5422f545c0db480779ce5305e"],["static/media/aircraft-landing-gear-desc.edb335aa.png","a2f33df85c8e6ed1a80e8514162f5b0e"],["static/media/aircraft-tail-desc.ff381018.png","879462e08f21519c96b192d44d03bb35"],["static/media/aircraft-wing-desc.14971737.png","f0e07c80f01129c4e22b686d387bbe36"],["static/media/bg.06967413.png","bf4598d9c81bacab7e96c02349e7d343"],["static/media/bg.24cb5400.png","f3d6bb587f5130dcbacfbc81d74d1692"],["static/media/bg.3050a8ad.png","f2724026ee79cbfc55ccf0bc802bd813"],["static/media/bg.54b88e0a.png","b74f14d75973bd8933c607d5e8524836"],["static/media/bg.832eb890.png","060299f721c641361e9a0b68df12bb25"],["static/media/bg.9face89b.png","0ca973cae7f8b5ae387dcc9893ba630e"],["static/media/bg.b73a61f6.png","cc3c19f5d5de445c8a0901cef832fd47"],["static/media/bg.bb5356f4.png","77e8ad936dd723fc52f09a18dae63e8c"],["static/media/bg.bd6ad415.png","733e598379696caf4012d03b3bd4c13c"],["static/media/bg.c170efbb.png","ff5bf9090f38eb64fa262038699ef13d"],["static/media/bg.d240c329.png","4e59baaf73cc34718cef485ae81b4047"],["static/media/blue-aircraft.9202f1e9.png","4a233b28d4c623b08ce248d59b82bd52"],["static/media/btn-tire-selected.5a79713a.png","b42444a189011476e6587f548b8d085a"],["static/media/btn-tire.61f445f4.png","208d476071cb778ce2dab1b90b2e0a28"],["static/media/desc.e9694697.png","e6e8bbd5d521e2b892b04b9b40ae46a6"],["static/media/end.d29b6e4d.png","3a2a9c02f64dadf1fb705b32c05f0d18"],["static/media/fg-1.3dfa3d19.png","6489e3bcb49a8d5cb5d5429981131765"],["static/media/fg.72aae023.png","f5678c16ec4448439fca28e9544b64b5"],["static/media/fix-a.a232defd.png","9264ce4dd8f860c3ea53b32d71c69949"],["static/media/fix-b.9189d268.png","868a78e79ee931858c29485eaa6d89b6"],["static/media/fix-c.c00972be.png","09717afb790a5fabc22eb5382024fda3"],["static/media/fix-d.f8aecbb5.png","3a393f622ebd49660201a2fca24a0c8d"],["static/media/game-btn.aa8033da.png","42b5cb2e99cbeba1a23a752ebd5fbebe"],["static/media/game-timeout.3ca9d88a.png","2a0f157609f6b38310d7331a5b3c0f18"],["static/media/green-aircraft.74792f7d.png","8afdb24008d829d31800de1e4316950d"],["static/media/know-aircraft-btn.17447366.png","95cbc02e7feb1fc5c62f8aa577473843"],["static/media/know-job-btn.144f602f.png","12387567f10e4057c3d0fcf147c72dbc"],["static/media/learn-area-btn.ffe68508.png","aa38e41270325b45d5815474ce1212c4"],["static/media/manual-bg.7e617c44.png","af94bcf3aa2b5eaa4b4ce41cf61af904"],["static/media/manual-btn.7a436e30.png","63f69190401d01207fcebf733149c311"],["static/media/menu-bg.9ad40d28.png","2665380681df16c9ca7fa7406f936cbe"],["static/media/menu-btn.f77ab618.png","086d9bba754b4c7e6172458fb249aefb"],["static/media/menu.1c9c6a62.png","621ee0795dfbf23b0497c3af91d389b9"],["static/media/more.fdace22e.png","57706a5b9ea333c7bfc1d543d2d275bd"],["static/media/red-aircraft.c904818f.png","25c81558230d6f341a79ab3605810408"],["static/media/result.d8dc909e.png","418a9b23ca0fff4baa632fcbe630af1d"],["static/media/start.8326b2e2.png","ffcba54fc3a5fc122d10a3322ca49920"],["static/media/start.e20aae25.png","ca1ea4883495d74c9f499168abe5efd0"],["static/media/yellow-aircraft.b1ba0970.png","8acca200b2683aa1361e4deeeab9efda"],["worker.js","d9ab0ebb8074b448b522680ef65acbc6"]];
var cacheName = 'sw-precache-v3-sw-precache-' + (self.registration ? self.registration.scope : '');


var ignoreUrlParametersMatching = [/^utm_/];



var addDirectoryIndex = function(originalUrl, index) {
    var url = new URL(originalUrl);
    if (url.pathname.slice(-1) === '/') {
      url.pathname += index;
    }
    return url.toString();
  };

var cleanResponse = function(originalResponse) {
    // If this is not a redirected response, then we don't have to do anything.
    if (!originalResponse.redirected) {
      return Promise.resolve(originalResponse);
    }

    // Firefox 50 and below doesn't support the Response.body stream, so we may
    // need to read the entire body to memory as a Blob.
    var bodyPromise = 'body' in originalResponse ?
      Promise.resolve(originalResponse.body) :
      originalResponse.blob();

    return bodyPromise.then(function(body) {
      // new Response() is happy when passed either a stream or a Blob.
      return new Response(body, {
        headers: originalResponse.headers,
        status: originalResponse.status,
        statusText: originalResponse.statusText
      });
    });
  };

var createCacheKey = function(originalUrl, paramName, paramValue,
                           dontCacheBustUrlsMatching) {
    // Create a new URL object to avoid modifying originalUrl.
    var url = new URL(originalUrl);

    // If dontCacheBustUrlsMatching is not set, or if we don't have a match,
    // then add in the extra cache-busting URL parameter.
    if (!dontCacheBustUrlsMatching ||
        !(url.pathname.match(dontCacheBustUrlsMatching))) {
      url.search += (url.search ? '&' : '') +
        encodeURIComponent(paramName) + '=' + encodeURIComponent(paramValue);
    }

    return url.toString();
  };

var isPathWhitelisted = function(whitelist, absoluteUrlString) {
    // If the whitelist is empty, then consider all URLs to be whitelisted.
    if (whitelist.length === 0) {
      return true;
    }

    // Otherwise compare each path regex to the path of the URL passed in.
    var path = (new URL(absoluteUrlString)).pathname;
    return whitelist.some(function(whitelistedPathRegex) {
      return path.match(whitelistedPathRegex);
    });
  };

var stripIgnoredUrlParameters = function(originalUrl,
    ignoreUrlParametersMatching) {
    var url = new URL(originalUrl);
    // Remove the hash; see https://github.com/GoogleChrome/sw-precache/issues/290
    url.hash = '';

    url.search = url.search.slice(1) // Exclude initial '?'
      .split('&') // Split into an array of 'key=value' strings
      .map(function(kv) {
        return kv.split('='); // Split each 'key=value' string into a [key, value] array
      })
      .filter(function(kv) {
        return ignoreUrlParametersMatching.every(function(ignoredRegex) {
          return !ignoredRegex.test(kv[0]); // Return true iff the key doesn't match any of the regexes.
        });
      })
      .map(function(kv) {
        return kv.join('='); // Join each [key, value] array into a 'key=value' string
      })
      .join('&'); // Join the array of 'key=value' strings into a string with '&' in between each

    return url.toString();
  };


var hashParamName = '_sw-precache';
var urlsToCacheKeys = new Map(
  precacheConfig.map(function(item) {
    var relativeUrl = item[0];
    var hash = item[1];
    var absoluteUrl = new URL(relativeUrl, self.location);
    var cacheKey = createCacheKey(absoluteUrl, hashParamName, hash, false);
    return [absoluteUrl.toString(), cacheKey];
  })
);

function setOfCachedUrls(cache) {
  return cache.keys().then(function(requests) {
    return requests.map(function(request) {
      return request.url;
    });
  }).then(function(urls) {
    return new Set(urls);
  });
}

self.addEventListener('install', function(event) {
  event.waitUntil(
    caches.open(cacheName).then(function(cache) {
      return setOfCachedUrls(cache).then(function(cachedUrls) {
        return Promise.all(
          Array.from(urlsToCacheKeys.values()).map(function(cacheKey) {
            // If we don't have a key matching url in the cache already, add it.
            if (!cachedUrls.has(cacheKey)) {
              var request = new Request(cacheKey, {credentials: 'same-origin'});
              return fetch(request).then(function(response) {
                // Bail out of installation unless we get back a 200 OK for
                // every request.
                if (!response.ok) {
                  throw new Error('Request for ' + cacheKey + ' returned a ' +
                    'response with status ' + response.status);
                }

                return cleanResponse(response).then(function(responseToCache) {
                  return cache.put(cacheKey, responseToCache);
                });
              });
            }
          })
        );
      });
    }).then(function() {
      
      // Force the SW to transition from installing -> active state
      return self.skipWaiting();
      
    })
  );
});

self.addEventListener('activate', function(event) {
  var setOfExpectedUrls = new Set(urlsToCacheKeys.values());

  event.waitUntil(
    caches.open(cacheName).then(function(cache) {
      return cache.keys().then(function(existingRequests) {
        return Promise.all(
          existingRequests.map(function(existingRequest) {
            if (!setOfExpectedUrls.has(existingRequest.url)) {
              return cache.delete(existingRequest);
            }
          })
        );
      });
    }).then(function() {
      
      return self.clients.claim();
      
    })
  );
});


self.addEventListener('fetch', function(event) {
  if (event.request.method === 'GET') {
    // Should we call event.respondWith() inside this fetch event handler?
    // This needs to be determined synchronously, which will give other fetch
    // handlers a chance to handle the request if need be.
    var shouldRespond;

    // First, remove all the ignored parameters and hash fragment, and see if we
    // have that URL in our cache. If so, great! shouldRespond will be true.
    var url = stripIgnoredUrlParameters(event.request.url, ignoreUrlParametersMatching);
    shouldRespond = urlsToCacheKeys.has(url);

    // If shouldRespond is false, check again, this time with 'index.html'
    // (or whatever the directoryIndex option is set to) at the end.
    var directoryIndex = 'index.html';
    if (!shouldRespond && directoryIndex) {
      url = addDirectoryIndex(url, directoryIndex);
      shouldRespond = urlsToCacheKeys.has(url);
    }

    // If shouldRespond is still false, check to see if this is a navigation
    // request, and if so, whether the URL matches navigateFallbackWhitelist.
    var navigateFallback = 'index.html';
    if (!shouldRespond &&
        navigateFallback &&
        (event.request.mode === 'navigate') &&
        isPathWhitelisted([], event.request.url)) {
      url = new URL(navigateFallback, self.location).toString();
      shouldRespond = urlsToCacheKeys.has(url);
    }

    // If shouldRespond was set to true at any point, then call
    // event.respondWith(), using the appropriate cache key.
    if (shouldRespond) {
      event.respondWith(
        caches.open(cacheName).then(function(cache) {
          return cache.match(urlsToCacheKeys.get(url)).then(function(response) {
            if (response) {
              return response;
            }
            throw Error('The cached response that was expected is missing.');
          });
        }).catch(function(e) {
          // Fall back to just fetch()ing the request if some unexpected error
          // prevented the cached response from being valid.
          console.warn('Couldn\'t serve response for "%s" from cache: %O', event.request.url, e);
          return fetch(event.request);
        })
      );
    }
  }
});







