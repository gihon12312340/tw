import{d as h,G as b,u as f,m as g,q as d,c as x,b as e,v as u,A as w,I as _,o as y,p as k,j as C,_ as S}from"./index-7298cf66.js";import{a as V}from"./axios-4a70c6fc.js";const s=r=>(k("data-v-8466142d"),r=r(),C(),r),I={class:"create-wrapper"},L={class:"content-wrapper"},B=s(()=>e("div",{class:"header"},[e("p",{class:"title"},"新增梅克獅")],-1)),M={class:"content"},U={class:"name-wrapper"},A=s(()=>e("label",{for:"lion-name"},"名稱",-1)),N={class:"sex-wrapper"},j=s(()=>e("label",{class:"label",for:"lion-sex"},"性別",-1)),q=s(()=>e("option",{value:"",disabled:""},"請選擇性別",-1)),D=["value"],E=["value"],G={class:"occupation-wrapper"},O=s(()=>e("label",{class:"label",for:"lion-occupation"},"職業",-1)),R=s(()=>e("option",{value:"",disabled:""},"請選擇職業",-1)),T=["value"],z=["value"],F=["value"],H=["value"],J=["value"],K=h({__name:"CreateView",setup(r){const p=b(),a=f();g(()=>{a.handleLoading("off",1e3)});const n=d(""),l=d(""),i=d(""),v=async()=>{if(n.value===""||l.value===""||i.value===""){a.message("warning","請確實填寫每個欄位！");return}let t=0;switch(i.value){case"farmer":t=1;break;case"engineer":t=2;break;case"fisher":t=3;break;case"actuary":t=4;break;case"designer":t=5;break}try{await V.post("/lions",{name:n.value,gender:l.value==="male"?"boy":"girl",occupation_id:t},a.axiosConfig),a.message("success","角色建立成功！"),a.isLoading=!0,p.replace("/")}catch(o){console.error(o),a.message("error","角色建立失敗，請再次嘗試！")}},m=()=>{n.value="",l.value="",i.value="",a.isLoading=!0,p.replace("/")};return(t,o)=>(y(),x("section",I,[e("div",L,[B,e("div",M,[e("div",U,[A,u(e("input",{type:"text",name:"lion-name",id:"lion-name",maxlength:"8",placeholder:"請輸入名稱","onUpdate:modelValue":o[0]||(o[0]=c=>n.value=c)},null,512),[[w,n.value]])]),e("div",N,[j,u(e("select",{name:"lion-sex",id:"lion-sex","onUpdate:modelValue":o[1]||(o[1]=c=>l.value=c)},[q,e("option",{value:"male"},"公獅",8,D),e("option",{value:"female"},"母獅",8,E)],512),[[_,l.value]])]),e("div",G,[O,u(e("select",{name:"lion-occupation",id:"lion-occupation","onUpdate:modelValue":o[2]||(o[2]=c=>i.value=c)},[R,e("option",{value:"farmer"},"小農獅",8,T),e("option",{value:"fisher"},"小漁獅",8,z),e("option",{value:"engineer"},"工程獅",8,F),e("option",{value:"actuary"},"精算獅",8,H),e("option",{value:"designer"},"設計獅",8,J)],512),[[_,i.value]])])]),e("div",{class:"footer"},[e("button",{type:"button",class:"btn btn-create",onClick:v},"新增"),e("button",{type:"button",class:"btn btn-reset",onClick:m},"取消")])])]))}});const W=S(K,[["__scopeId","data-v-8466142d"]]);export{W as default};
