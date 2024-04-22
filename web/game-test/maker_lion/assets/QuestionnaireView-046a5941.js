import{d as L,u as N,G as R,q as x,g as S,r as V,c as d,b as e,B as D,F as C,s as Q,f as k,t as p,v as y,A as T,I as F,n as z,o as v,C as m,J as O,p as G,j as J,_ as Y}from"./index-c9306c75.js";import{a as H}from"./axios-4a70c6fc.js";const u=h=>(G("data-v-6a2c79f7"),h=h(),J(),h),K={class:"questionnaire-wrapper"},P={key:0,class:"start"},W=u(()=>e("div",{class:"header"},[e("p",{class:"title"},"登入成功")],-1)),X={class:"content"},Z=u(()=>e("p",null,[m("你尚未養成任何梅克獅，"),e("br"),m("快來養一隻屬於你的小獅子吧！")],-1)),q={key:0,class:"q-outer"},ee={class:"q-inner"},te=u(()=>e("p",{class:"foreword"},"在養成梅克獅之前，飼育員有幾個問題想問你：",-1)),ae={class:"question"},se=["for"],oe=["name","id","value","onUpdate:modelValue"],ne=["for"],ie=["name","id","value","onUpdate:modelValue"],re={key:2,class:"create"},ce=u(()=>e("p",null,"最適合你的梅克獅是...",-1)),le={class:"occupation"},ue={class:"name-wrapper"},de=u(()=>e("label",{for:"lion-name"},"名稱",-1)),pe={class:"sex-wrapper"},ve=u(()=>e("label",{class:"label",for:"lion-sex"},"性別",-1)),fe=u(()=>e("option",{value:"",disabled:""},"請選擇性別",-1)),_e=["value"],me=["value"],he=L({__name:"QuestionnaireView",setup(h){const c=N(),$=R(),a=x(0),I=S(()=>{if(a.value>=1&&a.value<=9)return"下一題";if(a.value===10)return"提交表單"}),g=x(),M=S(()=>{switch(g.value){case"farmer":return"小農獅";case"fisher":return"小漁獅";case"engineer":return"工程獅";case"actuary":return"精算獅";case"designer":return"設計獅";default:return""}}),w=[{id:1,title:"你擅長解決複雜的問題嗎?",options:[{text:"同意",value:!0,occupations:["engineer","actuary"]},{text:"不同意",value:!1,occupations:["farmer","fisher","designer"]}]},{id:2,title:"你可以比別人更快速算出數學問題嗎?",options:[{text:"同意",value:!0,occupations:["engineer","actuary"]},{text:"不同意",value:!1,occupations:["farmer","fisher","designer"]}]},{id:3,title:"你總是有許多不一樣的解決方案嗎?",options:[{text:"同意",value:!0,occupations:["engineer","actuary","designer"]},{text:"不同意",value:!1,occupations:["farmer","fisher"]}]},{id:4,title:"你喜歡自然生態勝過於人文景觀嗎?",options:[{text:"同意",value:!0,occupations:["farmer","fisher"]},{text:"不同意",value:!1,occupations:["engineer","actuary","designer"]}]},{id:5,title:"你喜歡打破規則且勇於改變嗎?",options:[{text:"同意",value:!0,occupations:["farmer","fisher","designer"]},{text:"不同意",value:!1,occupations:["engineer","actuary"]}]},{id:6,title:"你喜歡大家一起完成工作的感覺嗎?",options:[{text:"同意",value:!0,occupations:["fisher","engineer"]},{text:"不同意",value:!1,occupations:["farmer","actuary","designer"]}]},{id:7,title:"你會想嘗試野外求生嗎?",options:[{text:"同意",value:!0,occupations:["farmer","fisher"]},{text:"不同意",value:!1,occupations:["engineer","actuary","designer"]}]},{id:8,title:"你會安排長時間的讀書計畫嗎?",options:[{text:"同意",value:!0,occupations:["engineer","actuary"]},{text:"不同意",value:!1,occupations:["farmer","fisher","designer"]}]},{id:9,title:"你會盡力達成他人的要求嗎?",options:[{text:"同意",value:!0,occupations:["engineer","designer"]},{text:"不同意",value:!1,occupations:["farmer","fisher","actuary"]}]},{id:10,title:"你喜歡動手DIY嗎?",options:[{text:"同意",value:!0,occupations:["farmer","fisher","designer"]},{text:"不同意",value:!1,occupations:["engineer","actuary"]}]}],r=V({farmer:0,fisher:0,engineer:0,actuary:0,designer:0}),n=V([[],[],[],[],[],[],[],[],[],[]]),U=s=>{if(s>=1&&s<=9)if(n[s-1].length===0){c.message("warning","請作答！");return}else a.value+=1;else if(s===10){if(!n.every(i=>i.length>0)){c.message("warning","請完整做答！");return}for(const i of Object.keys(r))r[i]=0;for(let i=0;i<w.length;i++){const E=n[i];for(const b of Object.keys(r))r[b]+=1;for(const b of E)r[b]+=2}const t=Math.max(...Object.values(r)),l=Object.keys(r).filter(i=>r[i]===t),B=l[Math.floor(Math.random()*l.length)];g.value=B,a.value+=1}else return},f=x(""),_=x(""),j=()=>{a.value=0,g.value="",n.forEach((s,o)=>n[o]=[]),f.value="",_.value=""},A=async()=>{if(f.value===""||_.value===""){c.message("warning","請確實填寫每個欄位！");return}let s=0;switch(g.value){case"farmer":s=1;break;case"engineer":s=2;break;case"fisher":s=3;break;case"actuary":s=4;break;case"designer":s=5;break}try{await H.post("/lions",{name:f.value,gender:_.value==="male"?"boy":"girl",occupation_id:s},c.axiosConfig),c.message("success","角色建立成功！"),c.isLoading=!0,$.replace("/")}catch(o){console.error(o),c.message("error","角色建立失敗，請再次嘗試！")}};return(s,o)=>(v(),d("section",K,[e("div",{class:z(["content-wrapper",{"light-border":a.value===0}])},[a.value===0?(v(),d("div",P,[W,e("div",X,[Z,e("button",{type:"button",class:"btn btn-start",onClick:o[0]||(o[0]=D(t=>a.value+=1,["prevent"]))}," 開始測驗 ")])])):a.value>=1&&a.value<=10?(v(),d(C,{key:1},Q(w,t=>(v(),d(C,{key:t.id},[t.id===a.value?(v(),d("div",q,[e("div",ee,[te,e("p",ae,[m(p(t.title),1),e("span",null,"("+p(t.id)+"/10)",1)]),e("label",{for:`true_${t.id}`},[y(e("input",{type:"radio",name:`question_${t.id}`,id:`true_${t.id}`,class:"option",value:t.options[0].occupations,"onUpdate:modelValue":l=>n[t.id-1]=l},null,8,oe),[[O,n[t.id-1]]]),m(" "+p(t.options[0].text),1)],8,se),e("label",{for:`false_${t.id}`},[y(e("input",{type:"radio",name:`question_${t.id}`,id:`false_${t.id}`,class:"option",value:t.options[1].occupations,"onUpdate:modelValue":l=>n[t.id-1]=l},null,8,ie),[[O,n[t.id-1]]]),m(" "+p(t.options[1].text),1)],8,ne),e("button",{type:"button",class:"btn btn-next",onClick:o[1]||(o[1]=l=>U(a.value))},p(I.value),1)])])):k("",!0)],64))),64)):k("",!0),a.value===11?(v(),d("div",re,[ce,e("p",le,p(M.value),1),e("div",ue,[de,y(e("input",{type:"text",name:"lion-name",id:"lion-name",maxlength:"8",placeholder:"請輸入名稱","onUpdate:modelValue":o[2]||(o[2]=t=>f.value=t)},null,512),[[T,f.value]])]),e("div",pe,[ve,y(e("select",{name:"lion-sex",id:"lion-sex","onUpdate:modelValue":o[3]||(o[3]=t=>_.value=t)},[fe,e("option",{value:"male"},"公獅",8,_e),e("option",{value:"female"},"母獅",8,me)],512),[[F,_.value]])]),e("div",{class:"footer"},[e("button",{type:"button",class:"btn btn-reset",onClick:j},"重新測驗"),e("button",{type:"button",class:"btn btn-create",onClick:A},"創建角色")])])):k("",!0)],2)]))}});const ye=Y(he,[["__scopeId","data-v-6a2c79f7"]]);export{ye as default};
