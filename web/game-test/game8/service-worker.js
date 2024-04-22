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

var precacheConfig = [["asset-manifest.json","895097aa3e41e6110c22a7f9add13f61"],["css/font-awesome.min.css","008e0bb5ebfa7bc298a042f95944df25"],["css/fonts.css","25e045296b6c476368f9295d615b4aee"],["favicon.ico","1232f18e6bcceeb635acedf3578d284a"],["icons/icon-192x192.png","30f86362794108e24381c48feff684cc"],["icons/icon-256x256.png","2e63088634cfe08df4d8392118968fa0"],["icons/icon-384x384.png","eab027a668fdc8ade8dc539f4b6f6bc7"],["icons/icon-512x512.png","e90cbbc7b164b870199d027d1803dd4c"],["index.html","7a6be7c53a1c164566eb8bdb4f695635"],["logo192.png","33dbdd0177549353eeeb785d02c294af"],["logo512.png","917515db74ea8d1aee6a246cfbcc0b45"],["manifest.json","5e69ce7cefed65677e3bfa3ac4b33405"],["robots.txt","fa1ded1ed7c11438a9b0385b1e112850"],["sounds/arrow_btn.mp3","626bfb5bc26cbd7979e625fa929e8bc2"],["sounds/bird_attack.mp3","8d7165b9acc9ebad62156684325a41fd"],["sounds/bullet.mp3","a42e8da6198d81042ff0ef154f5275f5"],["sounds/button_sound.mp3","2f655f57e9caed1f3f9b18a73eedd39b"],["sounds/collision.mp3","8b7299cbf0f2f7db04d90843d3e8ae47"],["sounds/drop_water.mp3","70df6906773cda36cf80770fbe35a0f1"],["sounds/wind.mp3","12a464a56352e7829e2291b2bc8f00a5"],["static/css/main.ae1c66f5.chunk.css","9756deca3b6ab08945457c9e45488432"],["static/js/2.6e5a972e.chunk.js","41e3a7182c86a15fa6cc61370f9fce97"],["static/js/2.6e5a972e.chunk.js.LICENSE.txt","d1698f4e7c0834b3633e70d6a92c7a1e"],["static/js/main.b2e77946.chunk.js","9440ab46248c43fd459691dfb4826ecb"],["static/js/runtime-main.8f964ad8.js","67f3b785a313e6b8222041472bcf6943"],["static/media/bg-ground.b96f8303.png","fd3e4579f5b9654468679e89fe5b498d"],["static/media/bg-sky.1a7d66b0.jpg","0948cf3c8b8a41bc0277486d7102a153"],["static/media/bg-stage1.e86026f5.jpg","c19ac3692cf2cab0e283b00877b1bac9"],["static/media/bg-stage2.2c0a4ddf.png","870108e2986e6278dfa8456fd9778ea8"],["static/media/bg.3c2e9a7f.png","0dfe22518b5a6394791503d1c76546e4"],["static/media/bg.3c7b91a4.jpg","f411030a7ab56beb59fc9fa8c30ff0bf"],["static/media/bg.72ae93a8.jpg","7084787f62fdce141cbc4dd06c7ea189"],["static/media/bg.89e95681.jpg","4384211e8fbb50f0dc9eb4de841c27ef"],["static/media/bg.97c992af.png","c4a812498be21b7103a84e7298f5d88f"],["static/media/bg.db11e1d7.png","e5ff64c8a18acf6af1e0a3d1ef0952f1"],["static/media/bg.f0721720.png","b243388ceb377e86aeef78374ad2464a"],["static/media/bg.f391da98.jpg","cb206ae180a3ab668080d71ad6cd91b7"],["static/media/blue-btn.4cf4873c.png","38a2f9ff9e3bc5cdf727f54471b30186"],["static/media/blue-select.99922017.png","f9d2b7e931bee6cffd717cce6a16af5f"],["static/media/btn-bullet.a9b9c5b4.png","4f5ade81eb291e98c7b514aa71b770b9"],["static/media/btn-stage1-pressed.f8c0d425.png","c0e1a7bd2fb84499282c17a1c7e18f2a"],["static/media/btn-stage1.8fd2cc23.png","b3e96c23b5766c372c1a8622aa40a58f"],["static/media/btn-stage2-pressed.0d4d9605.png","d7da93e869a10c61e6460fb78304a9f0"],["static/media/btn-stage2.8cdfdfac.png","3f784dbeff4704cff6b4ba714481cb8a"],["static/media/confirm.fe7894ea.png","08429b30ce42a1edd5acfe766375e7d2"],["static/media/continue.ff67371d.png","54d96332fc2c6969ac689f5e3cece604"],["static/media/controller.c741d442.png","c0721d63f6f5c0d73c556dd066ab7c8b"],["static/media/drone-blue.6a1a2b3a.png","747ea45160bee8f310b536daab4a9014"],["static/media/drone-broken.d1c0f4b3.png","18a9077a76005aa9c6791295bbeb6e9e"],["static/media/drone-red.31a438ae.png","d3e371722fb1261d232d32765dbe7258"],["static/media/drone-timeout.1ddb4b87.png","6e2a519d5c46eb396d0417f11e54a028"],["static/media/drone-yellow.77c75eb2.png","e207ada96816aaa0841d8439c099630b"],["static/media/eagle-attack.a9584282.gif","57eb80aee74a096288a0afff251042fb"],["static/media/eagle.dcb93cf7.gif","c2698afea38164c6e24492d23334c530"],["static/media/interference-elimination.3cb2b6e6.png","a115ba1e3c0a3e93b525c15fc66f5653"],["static/media/intro-btn.c0205751.png","fd3de5d51232a1d50a4bfe7be621bd40"],["static/media/learning_space.816bf6ff.png","100e3dfd5c6f020a190ac5db98d721c5"],["static/media/login.6ce8c7f3.png","9c8562d7618b9f0388e04d9aae00d7be"],["static/media/login_panel.bf9deb9b.png","5fe638129be6f3f0bbb2c47a23756adb"],["static/media/mountain-2.514757fd.png","c96234d2421d9141f68b7353176101e2"],["static/media/pass.678a3c78.png","81b238bb50f864edba861f8ef23c66a9"],["static/media/play_again.c0775252.png","106fd0a87374761dfb3cc109112b7a14"],["static/media/red-btn.068ab645.png","1aafa5e592888f6d745c3be627dc782e"],["static/media/red-select.617c6ffc.png","7ac856af0cd7981c7f42d44ec852076a"],["static/media/start.cbc13abd.png","0848a2c560897d7615e2bf68141f86c1"],["static/media/top-bar.186b1fb2.png","502c3a580e8a19a489d2d5aa59936290"],["static/media/wind.89b554e8.gif","c863bf7a8c3bc38eb1619faa29bd677d"],["static/media/yellow-btn.8c22052a.png","9568bdadc87d6ad5dd32a0a553912556"],["static/media/yellow-select.14016527.png","09e9f221d8ddbcb7cf79978e6dd65690"],["worker.js","d9ab0ebb8074b448b522680ef65acbc6"]];
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







