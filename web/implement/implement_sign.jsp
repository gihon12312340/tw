<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@page import="com.genesis.utils.StringTool"%>
<%
String page_code = "implement_sign";
String ai_id = StringTool.validString(request.getParameter("ai_id"));

//人流統計用
String ai_code = app_sm.select(tblai,ai_id).getString("ai_code");
String record_str = "";
if("activity_information_1".equals(ai_code)) {
	record_str = "imp_sign_1";
}else if("activity_information_2".equals(ai_code)) {
	record_str = "imp_sign_2";
}else if("activity_information_3".equals(ai_code)) {
	record_str = "imp_sign_3";
}
String setHistory  = IDTool.getUID(record_str, DateTimeTool.dateString(""), 6);
%>
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/in.dwt" codeOutsideHTMLIsLocked="false" -->
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge"/><!--讓ie在切換瀏覽器模式時 文件模式會使用最新的版本-->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />



<!--RWD用-->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--RWD用-->

<!--android 手機板主題顏色用 更改網址列顏色-->
<meta name="theme-color" content="#0088d2">
<!--android 手機板主題顏色用-->

<meta name="format-detection" content="telephone=no"><!--取消行動版 safari 自動偵測數字成電話號碼-->

<title><%=app_webtitle %></title>

<link rel="shortcut icon" href="../images/favicon.png" /><!--電腦版icon-->
<link rel="apple-touch-icon" href="../images/icon.png" /><!--手機版icon  57x57px-->
<link rel="apple-touch-icon" sizes="72x72" href="../images/icon-72.png" /><!--手機版icon  72x72px-->
<link rel="apple-touch-icon" sizes="114x114" href="../images/icon%402.png" /><!--手機版icon  114x114px-->

<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/style_header.css"/>
<link rel="stylesheet" type="text/css" href="../css/style_footer.css"/>




<!--google material icon-->
<link rel="stylesheet" href="../icon_fonts/material_icons/material-icons.css">

<!-- 新增 版本更新jQuery modify by Judy 20230113 start -->
<!-- jQuery版本3.6.3 -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" type="text/javascript"></script>
<!-- <script src="../js/jquery/jquery-3.6.3.min.js" type="text/javascript"></script> -->  <!-- 為了弱掃留原始檔案 -->

<!-- jQuery 遷移插件_簡化從舊版本jQuery的轉換3.4.0-->
<script src="https://code.jquery.com/jquery-migrate-3.4.0.min.js" type="text/javascript"></script>
<!-- <script src="../js/jquery/jquery-migrate-3.4.0.min.js" type="text/javascript"></script> -->  <!-- 為了弱掃留原始檔案 -->
<!-- 新增 版本更新jQuery modify by Judy 20230113 end -->

<script src="../js/common.js" type="text/javascript"></script><!--JavaScript共用區-->

<!--漣漪效果 第一塊 start-->
<!-- <link href="web/js/ripples/ripples.css" rel="stylesheet" type="text/css" />
<script src="web/js/ripples/material.js" type="text/javascript"></script>
<script src="web/js/ripples/ripples.min.js" type="text/javascript"></script> -->
<!--漣漪效果 第一塊 end-->
	
    
<!--新增修改banner套件 modify by pekey 20190625 start-->    
<!--輪播特效 第一塊 開始-->
<!-- <link rel="stylesheet" type="text/css" href="web/js/swiper-master/css/swiper.css"/> -->
<!--輪播特效 第一塊 結束-->
<!--新增修改banner套件 modify by pekey 20190625 end-->

<!-- Link Swiper's CSS_Swiper 8.0.6 -->
<link rel="stylesheet" href="../js/swiper-master/css/swiper-bundle.min.css" />


<!--當卷軸到一定高度時，物件才會出現-->    	
<script type="text/javascript" src="../js/wow/wow.min.js"></script>
<link rel="stylesheet" type="text/css" href="../js/animate/animate.css"/>
<script type="text/javascript" src="../js/wow/wow_example.js"></script>

    

<!-- Noto Sans Traditional Chinese字型 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">


<!--每滑到該區域重複執行-->   
<link rel="stylesheet" type="text/css" href="../js/aos/aos.css"/>   

<!-- bootstrap-icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">

<!--loading畫面-->
<script>
	$(window).load(function(){
			$('#loading').hide();
	});
</script>  

<script>
function goaction(FORM,JSP){
    FORM.action = JSP;
    FORM.submit();
}
</script>

<!-- Link Swiper's CSS -->
<link
    rel="stylesheet"
    href="https://unpkg.com/swiper/swiper-bundle.min.css"
/>

<!-- load Progress 進度條 -->
<link rel="stylesheet" type="text/css" href="../js/loading_bar/loading-bar.css"/>
<script type="text/javascript" src="../js/loading_bar/loading-bar.js"></script>
<%-- SEO 
<%if(!"".equals(cp.getString("cp_id"))){ %>
<meta name="Robots" content="<%=cp.getString("cp_robots") %>" />
<meta name="revisit-after" content="<%=cp.getString("cp_revisit_after") %> days" />
<meta name="keywords" content="<%=cp.getString("cp_keywords") %>" />
<meta name="copyright" content="<%=cp.getString("cp_copyright") %>" />
<meta name="description" content="<%=cp.getString("cp_description") %>" />
<%-- 追蹤碼 -%><%=cp.getString("cp_seo_track") %>
<%} %>
--%>

<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
<script src="<%=request.getContextPath() %>/js/zip.js"></script>  <!-- 地址用  -->
<script>
function checkForm(F) {
	var num_chk = /^[0-9\s]*$/;
	var isEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;  // 使用 isEmail.test(欄位名稱) 檢查 E-Mail 是否格式正確 , 正確為 true
	//$("#btnok").prop("disabled",true);
    if (F.aa_name.value.trim() == ""){
        alert("請輸入您的姓名!!");
        F.aa_name.focus();
    } else if (F.aa_email.value.trim() == "" || ! isEmail.test(F.aa_email.value)){
        alert("請輸入正確的Email !!");
        F.aa_email.focus();
	}else if(F.aa_phone.value.trim() == "" || !num_chk.test(F.aa_phone.value) ){
		alert("請輸入您的手機號碼");
		F.aa_phone.focus();
	} else if(F.aa_gender.value.trim() == ""){
        alert("請選擇性別");
        F.aa_gender[0].focus();
    } else if(F.aa_county.value.trim() == ""){
        alert("請選擇縣市 !!");
        F.aa_county.focus();
    } else if(F.aa_city.value.trim() == ""){
    	alert("請選擇鄉鎮市區 !!");
        F.aa_city.focus();
    }else if(F.aa_address.value.trim() == "") {
    	alert("請輸入地址 !!");
        F.aa_address.focus();
    }else  {
    	//$("#btnok").prop("disabled",false);
        return true;
    }
    //$("#btnok").prop("disabled",false);
    return false;
}
</script>
<script>
function loadimage(){ 
  document.getElementById("randImage").src = "../../comm/image.jsp?"+Math.random(); 
  //$("#randImage").attr("src","../../comm/image.jsp?"+Math.random()); 
} 
</script>
</head>

<body>
  <%@include file="../../web/include/top_menu.jsp" %>
    


    
    <!--main-->
    <div class="main inmain">

        <!-- 首頁banner區 -->
        <%@include file="../../web/include/top_banner.jsp" %>

<!-- ================================= -->
<!-- InstanceBeginEditable name="pageContent" -->

        <div class="pageContent">

            <div class="pageContent_icon">

                <!-- 內頁太空人icon -->
                <div class="inmainAstronaut_icon">
                    <img src="../images/astronaut_icon.svg" alt="">
                </div>

                <!-- 內頁星球icon -->
                <div class="inmainRocket_icon">
                    <img src="../images/planet_icon3.png" alt="">
                </div>

            </div>
            <div id="implementId"></div>
                      <div class="wrap">

                <!--內頁標題樣式1-->
                <div class="titStyle1">
                    <h2>線上報名</h2>
                </div>

                <!-- 左右側 -->
                <div class="container">

                    <!--右側-->
                    <div class="right noleft"><!-- 右側_無左選單noleft -->

                        <!--內頁標題樣式2-->
                        <!-- <div class="titStyle2">
                        <h2>ALL</h2>
                        </div> -->

                        <div class="containerIn">

                            <!-- 帳號資料 -->
                            <div class="applyArea">

                                <!--內頁標題樣式4-->
                                <!-- <div class="right_title4">
                                    <span>Step 1</span>
                                    <h2>帳號資料</h2>
                                </div> -->

                                <!--表單區-->
                                <form name="form0" method="post" action="../implement/implement_sign_update.jsp" onsubmit="return checkForm(this);">
                                <div class="form_area contact_area">

                                    <!--姓名-->
                                    <div class="form_list fLType2">
                                        <div class="fL_tit">
                                            姓名(請填寫真實姓名)
                                            <!--必填icon-->
                                            <div class="requirde_icon">
                                                *
                                            </div> 
                                        </div>
                                        <div class="fL_info">
                                            <input type="text" name="aa_name" id="aa_name" placeholder=""/>
                                        </div>
                                    </div>  

                                    <!--EMAIL -->                                
                                    <div class="form_list fLType2">
                                        <div class="fL_tit">
                                            EMAIL 
                                            <!--必填icon-->
                                            <div class="requirde_icon">
                                                *
                                            </div>
                                        </div>
                                        <div class="fL_info">
                                        <input type="email" name="aa_email" id="aa_email"/>
                                        </div>
                                    </div> 

                                    <!--手機號碼-->                                   
                                    <div class="form_list fLType2">
                                        <div class="fL_tit">
                                            手機號碼
                                            <!--必填icon-->
                                            <div class="requirde_icon">
                                                *
                                            </div>
                                        </div>
                                        <div class="fL_info">
                                            <input type="tel" name="aa_phone" id="aa_phone" oninput="value=value.replace(/[^\d]/g,'')" placeholder=""/>
                                        </div>
                                    </div> 

                                    <!-- 性別 -->
                                    <div class="form_list fLType2">
                                        <div class="fL_tit">
                                            性別
                                            <div class="requirde_icon">
                                                *
                                            </div>
                                        </div>
                                        <div class="fL_info item_RadioCheckArea">

                                            <input class="item_radio" type="radio" name="aa_gender" value="M" id="men" >
                                            <label for="men">男</label>

                                            <input class="item_radio" type="radio" name="aa_gender" value="F" id="women" >
                                            <label for="women">女</label>

                                            <!-- <label>
                                                <input type="radio" name="sex">
                                                男
                                            </label>
                                            &nbsp;&nbsp;
                                            <label>
                                                <input type="radio" name="sex">
                                                女
                                            </label> -->
                                        </div>
                                    </div>

                                    <!--現居地址-->
                                    <div class="form_list">
                                        <div class="fL_tit">
                                            現居地址
                                            <!--必填icon-->
                                            <div class="requirde_icon">
                                                *
                                            </div> 
                                        </div>
                                        <div class="fL_info fLR_address">
                                            <input type="hidden" name="county" value="" />
                                            <input type="hidden" name="city" value="" /> 
                                            <select title="縣市" name="aa_county" id="aa_county" onchange="changeZone(form0.aa_county, form0.aa_city, form0.aa_zipcode, form0.county, form0.city)"></select>
                                            <select title="鄉鎮市區" name="aa_city" id="aa_city" onchange="showZipCode(form0.aa_county, form0.aa_city, form0.aa_zipcode, form0.county, form0.city)"></select>
                                            
                                            <input type="text" name="aa_zipcode" id="aa_zipcode" class="fLRA_postalCode" readonly>
                                            <input type="text" name="aa_address" id="aa_address" class="address fLRA_address" placeholder="" value="">
                                        </div>
                                    </div>

                                    <!--驗證碼-->
                                    <div class="form_list">
                                        <div class="fL_tit">
                                            驗證碼
                                            <!--必填icon-->
                                            <div class="requirde_icon">
                                                *
                                            </div>
                                        </div>
                                        <div class="fL_info captcha no_border">
                                            <input type="text" name="ind" id="ind"/>
                                            <img src="../../comm/image.jsp"  name="randImage" id="randImage" width="72" height="27" />
                                            
                                            <a href="javascript:loadimage();">
                                                重取驗證碼
                                            </a>
                                            <span>
                                                (請注意英文字母大小寫！)
                                            </span>
                                        </div>
                                    </div>
                               
                                </div>

                            </div>
                            
                            <!--按鍵區-->
                            <input type="hidden" name="ai_id" value=<%=ai_id %>>
                            <div class="btn_area one"><!--如果只有一個按鍵時class內加one-->
                                <input type="submit" value="送出" />
                            </div>
                        </form>
                        </div>

                    </div>

                </div>

            </div>

            
        </div>
     
<!-- InstanceEndEditable -->   
     
<!-- ================================= -->

	</div>
    
    
    
    <!--footer-->
	<%@include file="../include/copyright.jsp" %>
</body>
<!-- InstanceEnd --></html>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
<script> ResetAll(form0.aa_county, form0.aa_city, form0.aa_zipcode, form0.county, form0.city); </script>
