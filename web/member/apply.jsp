<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@page import="com.genesis.utils.StringTool"%>
<%--
head裡有一段document.ready()的東西
是用來載入後自動跳錨點的

因為有很多連結或是登入後的跳轉流程會導向這一頁
每個連結都要加錨點太麻煩
而且容易碰到帶請求參數的問題
所以才會這樣處理

邏輯如下:
頁面準備完成後 此時的url已經在./apply.jsp了
跳轉至./apply.jsp#memberId時 頁面只會滑動到錨點 並不會真的重整

benson 2022/04/20
 --%>
<%
String page_code = "apply";

TableRecord mp = (TableRecord)session.getAttribute("member");

session.setAttribute("page_code",page_code);


//檢查是否有登入會員，沒登入就自動登入
if(mp == null){
	String localname_auto = request.getScheme()+"://"+request.getServerName()+":"+request.getLocalPort();
	String googleurl_auto = localname_auto + request.getContextPath() + "/web/member/googlelogin/google_login_action.jsp";
	String loginStr2_auto = "https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com%2Fauth%2Fuserinfo.email+https://www.googleapis.com%2Fauth%2Fuserinfo.profile&redirect_uri="+googleurl_auto+"&response_type=code&client_id="+SiteSetup.getText("cp.google_appid.tw");
	out.println("<script>location.href='"+loginStr2_auto+"';</script>");
	return;
} else {
	//重設session，避免發文狀態判定異常
	mp = app_sm.select(tblmp,mp.getString("mp_id")); //重新抓一次資料
	session.setAttribute("member",mp);               //重設session            
	//若已登入，檢查是否申請過發文帳號
    TableRecord mp_apply = app_sm.select(tblmp,"mp_code=? and mp_account=?",
    		                             new Object[]{page_code,mp.getString("mp_account")});
	//有申請過
	if(!mp_apply.getString("mp_id").isEmpty()) {
		if("Y".equals(mp_apply.getString("mp_publish_status"))) {
			out.println("<script>alert('您已有發文權限');location.href='../member/post_course.jsp'</script>");
		} else if("R".equals(mp_apply.getString("mp_publish_status"))) {
			out.println("<script>alert('您的發文權限正在審核中!');history.back()</script>");
		} else if("X".equals(mp_apply.getString("mp_publish_status"))) {
			out.println("<script>alert('您的發文權限申請已被拒絕!');history.back()</script>");
		} 
	}
}

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



<!-- Link Swiper's CSS -->
<link
    rel="stylesheet"
    href="https://unpkg.com/swiper/swiper-bundle.min.css"
/>

<!-- load Progress 進度條 -->
<link rel="stylesheet" type="text/css" href="../js/loading_bar/loading-bar.css"/>
<script type="text/javascript" src="../js/loading_bar/loading-bar.js"></script>
<%-- SEO 讀取關鍵字設定值 (讀取首頁共用值) --%>
<meta name="Robots" content="<%=SiteSetup.getText("seo.robots."+lang) %>" />
<meta name="revisit-after" content="<%=SiteSetup.getText("seo.revisit_after."+lang) %> days" />
<meta name="keywords" content="<%=SiteSetup.getText("seo.keywords."+lang) %>" />
<meta name="copyright" content="<%=SiteSetup.getText("seo.copyright."+lang) %>" />
<meta name="description" content="<%=SiteSetup.getText("seo.description."+lang) %>" />
<%-- 追蹤碼 --%><%=SiteSetup.getText("seo.track."+lang) %>


<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
<script>
function checkForm(F) {
	var num_chk = /^[0-9\s]*$/;
	var isEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;  // 使用 isEmail.test(欄位名稱) 檢查 E-Mail 是否格式正確 , 正確為 true
	//$("#btnok").prop("disabled",true);
    if (F.mp_unit.value.trim() == ""){
        alert("請輸入申請單位!!");
        F.mp_account.focus();
    } else if (F.mp_name.value.trim() == ""){
        alert("請輸入您的姓名 !!");
        F.mp_name.focus();
	}else if(F.mp_job.value.trim() == ""){
		alert("請輸入您的職稱");
		F.mp_job.focus();
	} else if(F.mp_email.value.trim() == "" || !isEmail.test(F.mp_email.value)){
        alert("請輸入正確的 E-Mail !!");
        F.mp_email.focus();
    } else if(F.mp_phone.value.trim() == ""){
        alert("請輸入您的聯絡電話 !!");
        F.mp_phone.focus();
    } else if(!num_chk.test(F.mp_phone.value.trim())){
    	alert("請輸入正確的電話號碼 !!");
        F.mp_phone.focus();
    }else {
    	//$("#btnok").prop("disabled",false);
        return true;
    }
    //$("#btnok").prop("disabled",false);
    return false;
}

</script>
<script>
<%--最上面有說明 benson 20220420--%>
$(document).ready(
		function() {
			if(window.location.href.indexOf("#") === -1){ <%--如果網址沒帶錨點--%>
				var url = window.location.href+"#memberId"; <%--補錨點--%>
		        location.href=url;                          <%--跳轉--%>
		    }
			
		}
		
)
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
        <div id="memberId"></div>
        <div class="wrap">

            <!--內頁標題樣式1-->
            <div class="titStyle1">
                <h2>會員專區</h2>
            </div>

            <ul class="top_bar">

                <li>
                    <a href="../member/order_list.jsp?game_id=g1">
                        遊戲紀錄
                    </a>
                </li>
                <li class="active">
                    <a href="../member/apply.jsp">
                        申請發文帳號
                    </a>
                </li>
                <%-- 
                <li>
                    <a href="../member/post_course.jsp#memberId">
                        發佈課程資訊
                    </a>
                </li>
                --%>
            </ul>


            <!-- 左右側 -->
            <div class="container">

                <!--左側-->
                <div class="left">

                    <!--左側表單名稱-->
                    <div class="leftList_tit">
                        會員專區
                    </div>

                    <!--左側選單列表-->
                    <div class="leftListArea">

                        <div class="leftList">
                            <div class="leftList_top">
                                <a href="../member/order_list.jsp?game_id=g1">
                                    遊戲紀錄
                                </a>
                            </div>
                        </div>

                        <div class="leftList active"><!-- 當前模式 class加上active -->
                            <div class="leftList_top">
                                <a href="../member/apply.jsp">
                                    申請發文帳號
                                </a>
                            </div>
                        </div>

                    </div>

                </div>

                <!--右側-->
                <div class="right">
                    <!-- 右側_無左選單noleft -->

                    <!--內頁標題樣式5-->
                    <div class="titStyle5">
                        <h2>限技專校院、技術型高中、政府機關</h2>
                    </div>

                    <div class="containerIn">
<form name="frm1" method="post" action="../../web/member/apply_update.jsp" onsubmit="return checkForm(this)">
                        <!-- 帳號資料 -->
                        <div class="applyArea">

                            <!--內頁標題樣式4-->
                            <!-- <div class="right_title4">
                                <span>Step 1</span>
                                <h2>帳號資料</h2>
                            </div> -->

                            <!--表單區-->
                            <div class="form_area contact_area">
                                 <input type="hidden" name="mp_account" value="<%=mp.getString("mp_account")%>">
                                 <input type="hidden" name="mp_publish_status" value="R">
                                 <!--申請單位-->
                                 <div class="form_list fLType2">
                                    <div class="fL_tit">
                                        申請單位
                                        <!--必填icon-->
                                        <div class="requirde_icon">
                                            *
                                        </div> 
                                    </div>
                                    <div class="fL_info">
                                        <input type="text" name="mp_unit" id="mp_unit" placeholder="如學校、系所或行政單位"/>
                                    </div>
                                </div>  
                                
                                <!--申請人姓名-->
                                <div class="form_list fLType2">
                                    <div class="fL_tit">
                                        申請人姓名
                                        <!--必填icon-->
                                        <div class="requirde_icon">
                                            *
                                        </div> 
                                    </div>
                                    <div class="fL_info">
                                        <input type="text" name="mp_name" id="mp_name" placeholder=""/>
                                    </div>
                                </div>  
                                
                                <!--申請人職稱-->
                                <div class="form_list fLType2">
                                    <div class="fL_tit">
                                        申請人職稱
                                        <!--必填icon-->
                                        <div class="requirde_icon">
                                            *
                                        </div> 
                                    </div>
                                    <div class="fL_info">
                                        <input type="text" name="mp_job" id="mp_job" placeholder=""/>
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
                                    <input type="email" name="mp_email" id="mp_email"/>
                                    </div>
                                </div> 
                           
                                <!--聯絡電話-->                                   
                                <div class="form_list fLType2">
                                    <div class="fL_tit">
                                        聯絡電話
                                        <!--必填icon-->
                                        <div class="requirde_icon">
                                            *
                                        </div>
                                    </div>
                                    <div class="fL_info">
                                        <input type="tel" name="mp_phone" id="mp_phone" oninput="value=value.replace(/[^\d]/g,'')" placeholder=""/>
                                    </div>
                                </div> 
                           
                                <!--分機-->                                   
                                <div class="form_list fLType2">
                                    <div class="fL_tit">
                                        分機
                                        <!--必填icon-->
                                        <!-- <div class="requirde_icon">
                                            *
                                        </div> -->
                                    </div>
                                    <div class="fL_info">
                                        <input type="tel" name="mp_phone2" id="mp_phone2" placeholder=""/>
                                    </div>
                                </div>                                 

                            </div>

                        </div>
                        
                        <!--按鍵區-->
                        <div class="btn_area one"><!--如果只有一個按鍵時class內加one-->
                            <input type="submit" id="btnok" value="送出" />
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
	<%@include file="../../web/include/copyright.jsp" %>
</body>
<!-- InstanceEnd --></html>
