import{d as oe,h as ie,u as ae,o as ue,r as W,l as se,x as le,c as ce,g as x,q as fe,i as D,y as he,z as N,a as G,b as de,f as me,p as pe,j as ge,_ as ve}from"./index-7ab15164.js";const ye=""+new URL("picture-011c72d1.png",import.meta.url).href;function we(b){return b&&b.__esModule&&Object.prototype.hasOwnProperty.call(b,"default")?b.default:b}var J={exports:{}};(function(b){(function(q){var i=ee(),I=te(),c=ne(),L=re(),O={imagePlaceholder:void 0,cacheBust:!1},E={toSvg:M,toPng:p,toJpeg:g,toBlob:V,toPixelData:j,impl:{fontFaces:c,images:L,util:i,inliner:I,options:{}}};b.exports=E;function M(n,t){return t=t||{},K(t),Promise.resolve(n).then(function(a){return z(a,t.filter,!0)}).then(Q).then(Y).then(r).then(function(a){return Z(a,t.width||i.width(n),t.height||i.height(n))});function r(a){return t.bgcolor&&(a.style.backgroundColor=t.bgcolor),t.width&&(a.style.width=t.width+"px"),t.height&&(a.style.height=t.height+"px"),t.style&&Object.keys(t.style).forEach(function(f){a.style[f]=t.style[f]}),a}}function j(n,t){return F(n,t||{}).then(function(r){return r.getContext("2d").getImageData(0,0,i.width(n),i.height(n)).data})}function p(n,t){return F(n,t||{}).then(function(r){return r.toDataURL()})}function g(n,t){return t=t||{},F(n,t).then(function(r){return r.toDataURL("image/jpeg",t.quality||1)})}function V(n,t){return F(n,t||{}).then(i.canvasToBlob)}function K(n){typeof n.imagePlaceholder>"u"?E.impl.options.imagePlaceholder=O.imagePlaceholder:E.impl.options.imagePlaceholder=n.imagePlaceholder,typeof n.cacheBust>"u"?E.impl.options.cacheBust=O.cacheBust:E.impl.options.cacheBust=n.cacheBust}function F(n,t){return M(n,t).then(i.makeImage).then(i.delay(100)).then(function(a){var f=r(n);return f.getContext("2d").drawImage(a,0,0),f});function r(a){var f=document.createElement("canvas");if(f.width=t.width||i.width(a),f.height=t.height||i.height(a),t.bgcolor){var l=f.getContext("2d");l.fillStyle=t.bgcolor,l.fillRect(0,0,f.width,f.height)}return f}}function z(n,t,r){if(!r&&t&&!t(n))return Promise.resolve();return Promise.resolve(n).then(a).then(function(o){return f(n,o,t)}).then(function(o){return l(n,o)});function a(o){return o instanceof HTMLCanvasElement?i.makeImage(o.toDataURL()):o.cloneNode(!1)}function f(o,u,w){var T=o.childNodes;if(T.length===0)return Promise.resolve(u);return m(u,i.asArray(T),w).then(function(){return u});function m(R,P,v){var A=Promise.resolve();return P.forEach(function(B){A=A.then(function(){return z(B,v)}).then(function(S){S&&R.appendChild(S)})}),A}}function l(o,u){if(!(u instanceof Element))return u;return Promise.resolve().then(w).then(T).then(m).then(R).then(function(){return u});function w(){P(window.getComputedStyle(o),u.style);function P(v,A){v.cssText?A.cssText=v.cssText:B(v,A);function B(S,U){i.asArray(S).forEach(function(e){U.setProperty(e,S.getPropertyValue(e),S.getPropertyPriority(e))})}}}function T(){[":before",":after"].forEach(function(v){P(v)});function P(v){var A=window.getComputedStyle(o,v),B=A.getPropertyValue("content");if(B===""||B==="none")return;var S=i.uid();u.className=u.className+" "+S;var U=document.createElement("style");U.appendChild(e(S,v,A)),u.appendChild(U);function e(s,d,h){var y="."+s+":"+d,C=h.cssText?H(h):X(h);return document.createTextNode(y+"{"+C+"}");function H(k){var _=k.getPropertyValue("content");return k.cssText+" content: "+_+";"}function X(k){return i.asArray(k).map(_).join("; ")+";";function _($){return $+": "+k.getPropertyValue($)+(k.getPropertyPriority($)?" !important":"")}}}}}function m(){o instanceof HTMLTextAreaElement&&(u.innerHTML=o.value),o instanceof HTMLInputElement&&u.setAttribute("value",o.value)}function R(){u instanceof SVGElement&&(u.setAttribute("xmlns","http://www.w3.org/2000/svg"),u instanceof SVGRectElement&&["width","height"].forEach(function(P){var v=u.getAttribute(P);v&&u.style.setProperty(P,v)}))}}}function Q(n){return c.resolveAll().then(function(t){var r=document.createElement("style");return n.appendChild(r),r.appendChild(document.createTextNode(t)),n})}function Y(n){return L.inlineAll(n).then(function(){return n})}function Z(n,t,r){return Promise.resolve(n).then(function(a){return a.setAttribute("xmlns","http://www.w3.org/1999/xhtml"),new XMLSerializer().serializeToString(a)}).then(i.escapeXhtml).then(function(a){return'<foreignObject x="0" y="0" width="100%" height="100%">'+a+"</foreignObject>"}).then(function(a){return'<svg xmlns="http://www.w3.org/2000/svg" width="'+t+'" height="'+r+'">'+a+"</svg>"}).then(function(a){return"data:image/svg+xml;charset=utf-8,"+a})}function ee(){return{escape:R,parseExtension:t,mimeType:r,dataAsUrl:m,isDataUrl:a,canvasToBlob:l,resolveUrl:o,getAndEncode:T,uid:u(),delay:P,asArray:v,escapeXhtml:A,makeImage:w,width:B,height:S};function n(){var e="application/font-woff",s="image/jpeg";return{woff:e,woff2:e,ttf:"application/font-truetype",eot:"application/vnd.ms-fontobject",png:"image/png",jpg:s,jpeg:s,gif:"image/gif",tiff:"image/tiff",svg:"image/svg+xml"}}function t(e){var s=/\.([^\.\/]*?)$/g.exec(e);return s?s[1]:""}function r(e){var s=t(e).toLowerCase();return n()[s]||""}function a(e){return e.search(/^(data:)/)!==-1}function f(e){return new Promise(function(s){for(var d=window.atob(e.toDataURL().split(",")[1]),h=d.length,y=new Uint8Array(h),C=0;C<h;C++)y[C]=d.charCodeAt(C);s(new Blob([y],{type:"image/png"}))})}function l(e){return e.toBlob?new Promise(function(s){e.toBlob(s)}):f(e)}function o(e,s){var d=document.implementation.createHTMLDocument(),h=d.createElement("base");d.head.appendChild(h);var y=d.createElement("a");return d.body.appendChild(y),h.href=s,y.href=e,y.href}function u(){var e=0;return function(){return"u"+s()+e++;function s(){return("0000"+(Math.random()*Math.pow(36,4)<<0).toString(36)).slice(-4)}}}function w(e){return new Promise(function(s,d){var h=new Image;h.onload=function(){s(h)},h.onerror=d,h.src=e})}function T(e){var s=3e4;return E.impl.options.cacheBust&&(e+=(/\?/.test(e)?"&":"?")+new Date().getTime()),new Promise(function(d){var h=new XMLHttpRequest;h.onreadystatechange=H,h.ontimeout=X,h.responseType="blob",h.timeout=s,h.open("GET",e,!0),h.send();var y;if(E.impl.options.imagePlaceholder){var C=E.impl.options.imagePlaceholder.split(/,/);C&&C[1]&&(y=C[1])}function H(){if(h.readyState===4){if(h.status!==200){y?d(y):k("cannot fetch resource: "+e+", status: "+h.status);return}var _=new FileReader;_.onloadend=function(){var $=_.result.split(/,/)[1];d($)},_.readAsDataURL(h.response)}}function X(){y?d(y):k("timeout of "+s+"ms occured while fetching resource: "+e)}function k(_){console.error(_),d("")}})}function m(e,s){return"data:"+s+";base64,"+e}function R(e){return e.replace(/([.*+?^${}()|\[\]\/\\])/g,"\\$1")}function P(e){return function(s){return new Promise(function(d){setTimeout(function(){d(s)},e)})}}function v(e){for(var s=[],d=e.length,h=0;h<d;h++)s.push(e[h]);return s}function A(e){return e.replace(/#/g,"%23").replace(/\n/g,"%0A")}function B(e){var s=U(e,"border-left-width"),d=U(e,"border-right-width");return e.scrollWidth+s+d}function S(e){var s=U(e,"border-top-width"),d=U(e,"border-bottom-width");return e.scrollHeight+s+d}function U(e,s){var d=window.getComputedStyle(e).getPropertyValue(s);return parseFloat(d.replace("px",""))}}function te(){var n=/url\(['"]?([^'"]+?)['"]?\)/g;return{inlineAll:f,shouldProcess:t,impl:{readUrls:r,inline:a}};function t(l){return l.search(n)!==-1}function r(l){for(var o=[],u;(u=n.exec(l))!==null;)o.push(u[1]);return o.filter(function(w){return!i.isDataUrl(w)})}function a(l,o,u,w){return Promise.resolve(o).then(function(m){return u?i.resolveUrl(m,u):m}).then(w||i.getAndEncode).then(function(m){return i.dataAsUrl(m,i.mimeType(o))}).then(function(m){return l.replace(T(o),"$1"+m+"$3")});function T(m){return new RegExp(`(url\\(['"]?)(`+i.escape(m)+`)(['"]?\\))`,"g")}}function f(l,o,u){if(w())return Promise.resolve(l);return Promise.resolve(l).then(r).then(function(T){var m=Promise.resolve(l);return T.forEach(function(R){m=m.then(function(P){return a(P,R,o,u)})}),m});function w(){return!t(l)}}}function ne(){return{resolveAll:n,impl:{readAll:t}};function n(){return t().then(function(r){return Promise.all(r.map(function(a){return a.resolve()}))}).then(function(r){return r.join(`
`)})}function t(){return Promise.resolve(i.asArray(document.styleSheets)).then(a).then(r).then(function(l){return l.map(f)});function r(l){return l.filter(function(o){return o.type===CSSRule.FONT_FACE_RULE}).filter(function(o){return I.shouldProcess(o.style.getPropertyValue("src"))})}function a(l){var o=[];return l.forEach(function(u){try{i.asArray(u.cssRules||[]).forEach(o.push.bind(o))}catch(w){console.log("Error while reading CSS rules from "+u.href,w.toString())}}),o}function f(l){return{resolve:function(){var u=(l.parentStyleSheet||{}).href;return I.inlineAll(l.cssText,u)},src:function(){return l.style.getPropertyValue("src")}}}}}function re(){return{inlineAll:t,impl:{newImage:n}};function n(r){return{inline:a};function a(f){return i.isDataUrl(r.src)?Promise.resolve():Promise.resolve(r.src).then(f||i.getAndEncode).then(function(l){return i.dataAsUrl(l,i.mimeType(r.src))}).then(function(l){return new Promise(function(o,u){r.onload=o,r.onerror=u,r.src=l})})}}function t(r){if(!(r instanceof Element))return Promise.resolve(r);return a(r).then(function(){return r instanceof HTMLImageElement?n(r).inline():Promise.all(i.asArray(r.childNodes).map(function(f){return t(f)}))});function a(f){var l=f.style.getPropertyValue("background");return l?I.inlineAll(l).then(function(o){f.style.setProperty("background",o,f.style.getPropertyPriority("background"))}).then(function(){return f}):Promise.resolve(f)}}}})()})(J);var be=J.exports;const Pe=we(be),xe=b=>(pe("data-v-56b31c2b"),b=b(),ge(),b),Ee={key:0,class:"game-wrapper stage-3"},Ae={class:"panel"},Se=xe(()=>x("label",{for:"invert",class:"invert"},[x("span",{class:"switch",turnOn:"On",turnOff:"Off"})],-1)),Te=oe({__name:"Stage3View",setup(b){const q=ie(),i=ae();ue(()=>{i.currentPage="stage3",i.description.title="第三關",setTimeout(()=>{i.showTransition=!1},2500),setTimeout(()=>{I.value=!0,i.description.show=!0},3e3)});const I=W(!1),c=se({invert:!1,brightness:100,contrast:100,hue:0,saturation:100}),L=le(()=>c.invert?`filter: invert(100%) brightness(${c.brightness}%) contrast(${c.contrast}%) hue-rotate(${c.hue}deg) saturate(${c.saturation}%);`:`filter: invert(0%) brightness(${c.brightness}%) contrast(${c.contrast}%) hue-rotate(${c.hue}deg) saturate(${c.saturation}%)`),O=()=>{i.playClickSound(),c.invert=!1,c.brightness=100,c.contrast=100,c.hue=0,c.saturation=100},E=W(null),M=()=>{i.playClickSound();const j=E.value,p={width:823,height:966,style:{filter:`invert(${c.invert?100:0}%) brightness(${c.brightness}%) contrast(${c.contrast}%) hue-rotate(${c.hue}deg) saturate(${c.saturation}%`}};Pe.toPng(j,p).then(function(g){const V=document.createElement("a");V.download="森林拍攝(修圖版).jpeg",V.href=g,V.click()}).catch(function(g){console.error("oops, something went wrong!",g)})};return(j,p)=>I.value?(me(),ce("div",Ee,[x("img",{src:ye,alt:"【圖示】風景照",class:"picture",style:fe(L.value),draggable:"false",ref_key:"captureRef",ref:E},null,4),x("i",{class:"icon reset",onClick:O}),x("div",Ae,[D(x("input",{type:"checkbox",name:"invert",id:"invert","onUpdate:modelValue":p[0]||(p[0]=g=>c.invert=g)},null,512),[[he,c.invert]]),Se,D(x("input",{type:"range",name:"brightness",id:"brightness",min:"0",max:"200",step:"1","onUpdate:modelValue":p[1]||(p[1]=g=>c.brightness=g)},null,512),[[N,c.brightness,void 0,{number:!0}]]),D(x("input",{type:"range",name:"contrast",id:"contrast",min:"0",max:"200",step:"1","onUpdate:modelValue":p[2]||(p[2]=g=>c.contrast=g)},null,512),[[N,c.contrast,void 0,{number:!0}]]),D(x("input",{type:"range",name:"hue",id:"hue",min:"0",max:"360",step:"1","onUpdate:modelValue":p[3]||(p[3]=g=>c.hue=g)},null,512),[[N,c.hue,void 0,{number:!0}]]),D(x("input",{type:"range",name:"saturation",id:"saturation",min:"0",max:"300",step:"1","onUpdate:modelValue":p[4]||(p[4]=g=>c.saturation=g)},null,512),[[N,c.saturation,void 0,{number:!0}]])]),x("i",{class:"btn save",onClick:M}),x("i",{class:"btn result",onClick:p[5]||(p[5]=()=>{G(i).playClickSound(),G(i).showTransition=!0,G(q).replace("/result")})})])):de("",!0)}});const Ue=ve(Te,[["__scopeId","data-v-56b31c2b"]]);export{Ue as default};
