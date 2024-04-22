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

var precacheConfig = [["asset-manifest.json","fb45f2d6f03fcd5f0fd5125100cb2032"],["css/font-awesome.min.css","008e0bb5ebfa7bc298a042f95944df25"],["css/fonts.css","25e045296b6c476368f9295d615b4aee"],["favicon.ico","1895f7d343f7169e272b95c4e396a7ae"],["icons/icon-192x192.png","7334ab615862b8836b28e970381d3fa2"],["icons/icon-256x256.png","b1c89b7c75e6c9d944429326adb10239"],["icons/icon-384x384.png","e3a02e20bb94f11a3722cfacef8b4f8f"],["icons/icon-512x512.png","de1c94c8fe09f21083b4e9b0e8c5b1aa"],["index.html","cee5839c98fe31abbd1a8e76f7390698"],["logo192.png","33dbdd0177549353eeeb785d02c294af"],["logo512.png","917515db74ea8d1aee6a246cfbcc0b45"],["manifest.json","eaf1706e793290aff8d18704d28b2754"],["robots.txt","fa1ded1ed7c11438a9b0385b1e112850"],["sounds/add_score_sound.mp3","a93d00e17b6da7f8820f1bb5a412dc14"],["sounds/button_sound.mp3","512a4ec63de6363da5c2506717fa045b"],["sounds/cooking_sound.mp3","9aaa193afd4f1b86e465d667759a1bc6"],["sounds/end_sound.mp3","8b41aee4e827b0469342936d5e2e9538"],["sounds/error_sound.mp3","f201db0ed30db03cc0c4772082b467a0"],["sounds/hint_sound.mp3","17f00bed9603e0e09ce5f4be7b8f25a9"],["sounds/stage_change_sound.mp3","a7bf3a4b8f8b654967147993e6fe1fe0"],["static/css/main.8dab81c9.chunk.css","cba8187cdf6442237c18ded536868ee8"],["static/js/2.5068d97a.chunk.js","3532e925acf1f41036897389640f35b4"],["static/js/2.5068d97a.chunk.js.LICENSE.txt","04cde3012e009330f613bc177709d0b8"],["static/js/main.a9b1a66e.chunk.js","81c8d90aae34669e33e2d15c8e29f3e4"],["static/js/runtime-main.50271481.js","bea2ac7066daec4a44515b2eb2f18c16"],["static/media/18-1.98fbd016.png","661e1c7e27a980d7f396eaa7ab14fa68"],["static/media/18-2.174e334a.png","56bc96cd747a013bab447b552da3cc9a"],["static/media/18-3.d872f717.png","7df5621d2658e0acf639d7ed52035c99"],["static/media/18-4.78db17b3.png","36ae2939447e6e1c3c5939b9cb8e34df"],["static/media/bg.145b2c6e.jpg","0cdc1370bd4a7818d41747cbb80c738c"],["static/media/bg.16cf39a9.jpg","7088d155b5c39c83e599558923c51039"],["static/media/bg.284a999c.jpg","b55160593e79a4447f296c6013381d72"],["static/media/bg.47283da1.jpg","d905fd4e762c7cf3f17ccedb4e524f39"],["static/media/bg.51c5dcd3.jpg","6d53e7b7ae8fc5d520d91f5969a648b9"],["static/media/bg.5a58b3d9.jpg","8e7aebbb6dcc96bfe8eabeb9b13ccc34"],["static/media/bg.61de90c2.jpg","dcde68967116263fc3bd0c8313dcc3a5"],["static/media/bg.9c6aef78.jpg","247ac4ec779fc9da292eb09c8038fb35"],["static/media/bg.aea8da0c.jpg","d4c505106922e75d20bb9387afaba44f"],["static/media/bg.bbf69197.jpg","b681fdf8ed66d265173e0448bf81cbc2"],["static/media/bg.c2082217.jpg","fb76aec8ca9dbd4fa52342cc16ffb852"],["static/media/bg.dbeb4f30.jpg","d5f085b3094947c26568f6a64cbb881f"],["static/media/bg.eacb80fa.jpg","919753149666bbea934fcd9ca15d59f5"],["static/media/bg.ee94b09f.jpg","0c02858c2f4180c109933d6ea16ace94"],["static/media/bg.f5755e3f.jpg","b3d7467e570d0c1cc7cd452e477eb90b"],["static/media/choose1.0114fa72.png","0598364b97a824c3daf1ba09897222b1"],["static/media/choose2.43d5b13c.png","a3051d14a0813bccc4eb6fcdf82e110d"],["static/media/choose3.bd704c37.png","a8a7de78d183ad5aa7da2069ee8eaa47"],["static/media/error.bff78f97.png","0b25d257fe0ec57315bebad3622b7f99"],["static/media/formula1.a4a3f4d8.png","f4a612aafaa3340de9792625b57fc5ac"],["static/media/formula2.77477a81.png","ffe5dca436e2a4943699ca9a1e009b42"],["static/media/formula3.c30814a3.png","c9ede9eaa9c66486ccf1a4ac6269a42a"],["static/media/hint.7fbd10f9.png","fbafa9f964ffdccafc830a7fb9329227"],["static/media/hint1.0459ead5.png","504651e426c2752ce9549f2e97491d32"],["static/media/hint2.d8e17ae5.png","814c1345517fa31b36b2be0cb1a86242"],["static/media/hint3.d15a442c.png","6c704a0113971784abe3ede3c66608f7"],["static/media/login_btn.6ce8c7f3.png","9c8562d7618b9f0388e04d9aae00d7be"],["static/media/login_panel.bf9deb9b.png","5fe638129be6f3f0bbb2c47a23756adb"],["static/media/make1.2976b216.png","f59ed1592efd2cb6df59262c5c20ff8e"],["static/media/make2.1d1f28a2.png","bcbf7f8366664cd508484fcf779371c0"],["static/media/make3.229c9950.png","0b403bf4ef1c82e79d5ee280230da827"],["static/media/material-flower.de9531c7.png","a9fa191a533cf2b1900f53b998abb1de"],["static/media/material-gelatin.71b30c17.png","1e691675a45341c4be6f0c6c3c0146d7"],["static/media/material-roselle.6faadde2.png","d423882d9e1be135c59a195b5160717d"],["static/media/order_brother.b42952dd.png","0d0099926e0b2864affa11d22632eec2"],["static/media/order_father.cb48ca58.png","2d51a391653948bff2b4fd7dc2fa4ea2"],["static/media/order_grandma.2b5636ab.png","d7d92bc8734832a6cb0e93ddf78b3689"],["static/media/order_grandpa.5ba37ee1.png","f1160ac910bc79c8d974444457e31c22"],["static/media/order_mother.6fcba8ae.png","cbdb30ca98c446543a1327b25383a892"],["static/media/order_sister.fdcd72c3.png","9d75c193eb0efddbbf47a7e463dad750"],["static/media/pass_btn.678a3c78.png","81b238bb50f864edba861f8ef23c66a9"],["static/media/recipe-1.72776021.jpg","2aa9ab5819a945caed3cab0bc28215bb"],["static/media/recipe-2.5bdb0eaf.jpg","97fd665a739ab08b8a00748d9d20b5d2"],["static/media/recipe-3.13e7dc5b.jpg","37ca56e839793b99b4622caf19df7546"],["static/media/result-1.5b233332.jpg","82f1a51f00772e94bd0ee25151e2a06c"],["static/media/result-2.919e5f10.jpg","5ef60e8edfc6de0bffc935b6da5ac16d"],["static/media/result-3.0d331a93.jpg","89a78e1b32e1113d78a5278db1322d2a"],["static/media/start.f8212c28.png","85ce09b4190914c73b760787494cd87b"],["static/media/study_btn.d35a1560.png","7cf35696c5ca7802feb1ba9bb429f9ae"],["worker.js","c7931c96f84e72b1b47b50f5e6975bf3"]];
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







