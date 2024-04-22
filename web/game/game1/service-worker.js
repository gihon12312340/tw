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

var precacheConfig = [["asset-manifest.json","3f0002da1988575b3b7888d00af1c62a"],["css/font-awesome.min.css","008e0bb5ebfa7bc298a042f95944df25"],["css/fonts.css","25e045296b6c476368f9295d615b4aee"],["favicon.ico","1895f7d343f7169e272b95c4e396a7ae"],["icons/icon-192x192.png","7334ab615862b8836b28e970381d3fa2"],["icons/icon-256x256.png","b1c89b7c75e6c9d944429326adb10239"],["icons/icon-384x384.png","e3a02e20bb94f11a3722cfacef8b4f8f"],["icons/icon-512x512.png","de1c94c8fe09f21083b4e9b0e8c5b1aa"],["index.html","3241dc90990d451389250ce5c96292ae"],["logo192.png","33dbdd0177549353eeeb785d02c294af"],["logo512.png","917515db74ea8d1aee6a246cfbcc0b45"],["manifest.json","5e69ce7cefed65677e3bfa3ac4b33405"],["robots.txt","fa1ded1ed7c11438a9b0385b1e112850"],["sounds/button_sound.mp3","1ec1ccebed58594dcf343fab83f612e3"],["sounds/decrease-score.mp3","c9eb1aafda197511387fe1fd5bba822f"],["sounds/increase-score.mp3","870f5fb2c193a7da1365b529ba2e1112"],["sounds/score.mp3","1003d686f7e574ae229816c35b0e5010"],["sounds/stage1-fail.mp3","c6a2769f8821d02cb538cbac3719bd0d"],["sounds/stage1-success.mp3","92427463aa7f946c9e5ac3ac9ec3e66a"],["static/css/main.ad1283ca.chunk.css","efd68d50bb6e9939f91f66171b5205a9"],["static/js/2.fc002d1c.chunk.js","eef9db403402e78a83560e16b178fabb"],["static/js/2.fc002d1c.chunk.js.LICENSE.txt","04cde3012e009330f613bc177709d0b8"],["static/js/main.2b66e3b1.chunk.js","3ed709808e7055878124b63056fb6c8c"],["static/js/runtime-main.b724b8f1.js","c2dfa73ce601b83513a98b2872307e92"],["static/media/bg-loop.d6d001bb.jpg","934b4f9c4c750e11f5ed3a26b43bac5a"],["static/media/bg.19b8fe92.png","7aa2f2d7636dffff6e8d9f300a2c138c"],["static/media/bg.38c0860c.png","0386699b40fe71606392b38b406c6e03"],["static/media/bg.45f142db.png","5c3387afd86ee43700b74c83c9a7396d"],["static/media/bg.8d131b33.png","d36290d6da221a82a7b232404040ca72"],["static/media/bg.a1d4194a.png","98d7e5ae3959116ed7dab72d88b93c4d"],["static/media/bg.a2328208.png","768243750a7dd8a53e16cdeb205c4d80"],["static/media/bg.bce1ac83.png","5ae972d6981db8011f3ae74f75686f84"],["static/media/bg.c2c3e726.png","7a5036bc568eb00d2332ef8b08296886"],["static/media/bg.c8db053b.png","17cfecd2b7fa8f7a0d701fa537e3d95c"],["static/media/bg1.aaefa46c.png","a4d55d95ab5dc26e5609ceaaf16fb961"],["static/media/bg2.254971b0.png","2a23b8d50fc62bf7e22b6c7b07a77a47"],["static/media/block-can.5db60b68.png","179006dc704c912527235b69ca6a7a7c"],["static/media/confirm.6660754c.png","527accba1f455054ff68df53ce848bb2"],["static/media/continue.70806b49.png","cc320c669d29a0e64bf4fb6c86e9a7b9"],["static/media/download.d8dc909e.png","418a9b23ca0fff4baa632fcbe630af1d"],["static/media/drone-broken.d1c0f4b3.png","18a9077a76005aa9c6791295bbeb6e9e"],["static/media/end.d29b6e4d.png","3a2a9c02f64dadf1fb705b32c05f0d18"],["static/media/learn.ffe68508.png","aa38e41270325b45d5815474ce1212c4"],["static/media/login.6ce8c7f3.png","9c8562d7618b9f0388e04d9aae00d7be"],["static/media/login_panel.bf9deb9b.png","5fe638129be6f3f0bbb2c47a23756adb"],["static/media/more.fdace22e.png","57706a5b9ea333c7bfc1d543d2d275bd"],["static/media/pass.678a3c78.png","81b238bb50f864edba861f8ef23c66a9"],["static/media/re-select.5d3721bf.png","56b648ded5249115ebd058e9a3bd55a2"],["static/media/ship-1.b846fba3.png","94ef0fa579781d5b086b0404a1d91a9c"],["static/media/ship-2.643f052b.png","f933be8d8e251eef58af3b42d9ab1a91"],["static/media/ship-3.958f45ef.png","1379df25251fae5e6aa581c38e99fd5d"],["static/media/ship1-desc.56db85dc.png","77c0142623cb1cadbc6bf2690874a747"],["static/media/ship1.1f19d1f6.png","52b08e734a32d81642fa57d75484de8e"],["static/media/ship2-desc.7c499f1e.png","b5d1bea2ce9dcb3816ff6d1fe4589b3f"],["static/media/ship2.1161cdf1.png","960b16fa5d4634d70849e11fed9eb32a"],["static/media/ship3-desc.2383aef6.png","1917012b3f8ea14e8cce2311ad57acbd"],["static/media/ship3.e0350046.png","2bcbd294a0479e9b7e0623d5ec481306"],["static/media/start.baeee7d8.png","76ed8dd49f4c9179496d61407ac9b804"],["static/media/start.c438c572.png","c13cf2678cbb96cc77511f387d84409a"],["static/media/static.2c293672.png","dcbe4e3b2c8f08332cf97b05647d3bcd"],["static/media/success.ba20b75f.png","1b03f4a96e975ea344ba0cab596c1f25"],["static/media/terminal.62752767.png","30409809f6000bdaf69ae0a1e53b5d74"],["static/media/topbar.c0ecbf01.png","db3eb689346fdc36884d1b7441e993e8"],["worker.js","d9ab0ebb8074b448b522680ef65acbc6"]];
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







