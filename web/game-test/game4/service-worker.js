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

var precacheConfig = [["asset-manifest.json","f9aa6a4a13988b49b45b823d27dafc95"],["css/font-awesome.min.css","008e0bb5ebfa7bc298a042f95944df25"],["css/fonts.css","25e045296b6c476368f9295d615b4aee"],["favicon.ico","1232f18e6bcceeb635acedf3578d284a"],["icons/icon-192x192.png","30f86362794108e24381c48feff684cc"],["icons/icon-256x256.png","2e63088634cfe08df4d8392118968fa0"],["icons/icon-384x384.png","eab027a668fdc8ade8dc539f4b6f6bc7"],["icons/icon-512x512.png","e90cbbc7b164b870199d027d1803dd4c"],["index.html","7d5edec6548f65edd6249d1d003af118"],["logo192.png","33dbdd0177549353eeeb785d02c294af"],["logo512.png","917515db74ea8d1aee6a246cfbcc0b45"],["manifest.json","2a7197b7010643e11ffd0bce0395e247"],["robots.txt","fa1ded1ed7c11438a9b0385b1e112850"],["sounds/background_music.mp3","cb237b60b19aced300adf596df45fcac"],["sounds/button_sound.mp3","ffd2b4773d4b39a40b91027dab26781a"],["sounds/checkout_sound.mp3","774945c44e1ae71818ade5f9a6476d93"],["sounds/countdown_sound.mp3","d57999c1879063c8b003f1ef3c8d95a8"],["sounds/end_sound.mp3","9798c951a9c042283c278f568944880a"],["sounds/purchase_error_sound.mp3","cffc56caef0d2561bc3cda9bb913757a"],["sounds/scan_code_sound.mp3","6df3b676fa425a46e203e845f89f51e3"],["static/css/main.49c19c7b.chunk.css","8b640c4e4e79a94f00a53a7db5acc083"],["static/js/2.03cf9dda.chunk.js","b84d440556c987715ee338fbd71b2bda"],["static/js/2.03cf9dda.chunk.js.LICENSE.txt","d1698f4e7c0834b3633e70d6a92c7a1e"],["static/js/main.e5f8880c.chunk.js","7144da4f66bd20488cbe689b9aaade07"],["static/js/runtime-main.701ae2d1.js","4480f81e50e29d2c0691524d616a89d9"],["static/media/1.0101709c.png","be3a804cd35d3fd80bc7c0bcfd0789a8"],["static/media/1.3578604c.png","038e6830ec8cde10be3d9ade4eb8b276"],["static/media/1.37da8147.png","dc27f884e607deb1a9f5c2e5572fc8a0"],["static/media/1.710ceac7.png","09ced889efe3ee698f06ac8883eaf47f"],["static/media/1.7d204820.png","d8ced016f918fe214ef3184f86b84de9"],["static/media/1.a5c77719.png","8e98b577fb68c7377532ce5aa98f25a7"],["static/media/1.aabd7b9b.png","6e5c087a8d875337c6d77c051d94c1f1"],["static/media/1.ba2ebdef.png","086a62ff0f3428861b8b7208da82105b"],["static/media/1.d4cad54f.png","16d87b364f596d36ef01d4848edf64b4"],["static/media/1.f8a8219b.png","f8c92c8b58877484abaed09970eff884"],["static/media/apple_2.44d94fa2.png","36fc861355d091874424f8d0136b83dc"],["static/media/bmi_bg.d3882f52.jpg","3d53033d74a66013a6fce710d3090f15"],["static/media/broccoli_2.7bcc1572.png","5afdf85192cbe0a74935c6afacac3367"],["static/media/cabbage_2.e6bf4c78.png","a9d395d382bb0d6da6069b69a56e34d2"],["static/media/carrot_2.b764cd28.png","8786c07459b674e5673b7f1f8299eb1e"],["static/media/chicken_2.6ccffe3b.png","bc8b588e2ad33ca84acd4206a3499fc9"],["static/media/completed_bg.b412e3f0.png","e0e580e0edd93b2ef5172c0a66f93db1"],["static/media/completed_purchase_completed.b81a685b.png","0dc9ec6901abe9b78ddd5e8051f196ea"],["static/media/completed_recipe_apple_ginger_tea.e3534d2e.png","7379053ff26696bbf82d903423fdcf0f"],["static/media/completed_recipe_cabbage_rolls.3c483a42.png","61e3cc8dd69baf360f04afe145017c63"],["static/media/completed_recipe_chicken_stew_milk.9cb21982.png","c355e702797b6841086b475a3f7a856e"],["static/media/completed_recipe_milk_fish_soup.79231dc0.png","54513a5f5de44b3baf08865b3b11af4e"],["static/media/completed_recipe_milk_onion_soup.6e29afa4.png","04521b15fef78f16bb8ceb00d0eb4b75"],["static/media/completed_recipe_nutty_chicken_salad.2df4a62f.png","dfecc4579a493ab5a09264cd57deb69e"],["static/media/completed_recipe_potato_egg_salad.5c586f84.png","e0fd22525c9b8534027390ad7424d95e"],["static/media/completed_recipe_potato_stew.80979606.png","4b864520016c7085fd44f6eb78fc834d"],["static/media/completed_recipe_tomato_fillet.b8d87475.png","cbe7085ca340f66a1b81d95c25119755"],["static/media/completed_recipe_tomato_veg_egg_soup.61f69684.png","9e27c047419d410acd7662e79394f0ae"],["static/media/continue.ff67371d.png","54d96332fc2c6969ac689f5e3cece604"],["static/media/cucumber_2.485f17ed.png","9b35049a13210b2e7710345cc4e8641a"],["static/media/download.3ce15aef.png","8a0f0c2961126ebbee3f36bdc78919ac"],["static/media/egg_2.d74fc3e6.png","3b425128ff5cca57feb82aca4e024a0e"],["static/media/failed_bg.f2a7c7b0.jpg","a11f6a6a92c9c2c41319ff253df2531b"],["static/media/fish_2.bbf57828.png","e93c5b171b38d4c202b315d462909735"],["static/media/ginger_2.6acbc0f9.png","14a672dd899d0e7c643940dbaa11f238"],["static/media/home_bg.500ea3ff.png","4550bb4d16465fb90f72872fb57726a6"],["static/media/intro_bg.4ecdfdec.jpg","6577389b287ce528d63d3cc31b3e68b2"],["static/media/intro_title.f4e0dc1e.png","617c329824954ebbbb2de6c7fb8c5644"],["static/media/learning_space.816bf6ff.png","100e3dfd5c6f020a190ac5db98d721c5"],["static/media/loading_bg-0000.30b9d3f6.jpg","5e4efa834c4e99f553d94d2a575458b3"],["static/media/loading_desc.9c5e5aae.png","629c9105212866fd2cc202230bc712b8"],["static/media/login.6ce8c7f3.png","9c8562d7618b9f0388e04d9aae00d7be"],["static/media/login_panel.bf9deb9b.png","5fe638129be6f3f0bbb2c47a23756adb"],["static/media/milk_2.f835abf9.png","af6a3a028080f3d99213c46505167a2d"],["static/media/nut_2.0c16b32e.png","723847a7500ecfb62a1a2f7483ca241b"],["static/media/onion_2.0ad2676f.png","99ebac561140071ce2e4c5d8102b7275"],["static/media/pass.678a3c78.png","81b238bb50f864edba861f8ef23c66a9"],["static/media/play_again.c0775252.png","106fd0a87374761dfb3cc109112b7a14"],["static/media/pork_2.b7da6d5f.png","65640ed4d3b9fe96f1103398fc8708dc"],["static/media/potato_2.af665034.png","68617d85ab6b42741ec0bb35dfe355d5"],["static/media/purchase_bg.97e6b4af.png","bf4b3ef92680ceda2e3c0913baf90edb"],["static/media/reward_bg.552d02e3.jpg","bd30803e23982674ad857ea488a093f8"],["static/media/shopping_bg.4c0e0a70.png","976fb8342d60c5af0c6e61b474d20b53"],["static/media/shopping_error.273cecf0.png","28bed7912a0bf38d5b1f0c050e4470e8"],["static/media/sugar_2.54776c6f.png","8827dea27d8d0333a137340d5fc99897"],["static/media/tea_2.de8cf62f.png","797c232f641af6ec30a0487ed0d2dc1a"],["static/media/tomato_2.499fb4e9.png","f9e7093e6b1771c63eddc3bb88ec5f5f"],["worker.js","da03656b726d5b799287ed06ca558406"]];
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







