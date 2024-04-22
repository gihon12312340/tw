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
頁面準備完成後 此時的url已經在./post_course.jsp了
跳轉至./post_course.jsp#memberId時 頁面只會滑動到錨點 並不會真的重整

benson 2022/04/20
 --%>
<%
String page_code = "post_course";
TableRecord mp = (TableRecord)session.getAttribute("member");
//檢查是否有登入會員
if(mp == null){
	out.println("<script>alert('請先登入會員!');history.back()</script>");
	return;
} else {
	//重設會員session，避免判別異常
	mp = app_sm.select(tblmp,mp.getString("mp_id")); //重新取一次資料,避免後臺更新狀態前台沒吃到
	session.setAttribute("member",mp);
	
	//檢查是否有發文權限
	if(! "Y".equals(mp.getString("mp_publish_status"))) {
		//System.out.println(mp.getString("mp_publish_status"));
		out.println("<script>alert('您沒有發文權限!');location.href='../../home.jsp';</script>");
		return;
	}
}
String mp_id = mp.getString("mp_id");
Vector<TableRecord> cps = app_sm.selectAll(tblcp,"cp_code=? and cp_lang=? and cp_member=?",
		                                   new Object[]{page_code,lang,mp.getString("mp_account")},"cp_createdate DESC");


int page_items = 10;    												// 預設列表分頁筆數設定

// 設定資料分頁每頁筆數
String pageSet = SiteSetup.getSetup("ss."+page_code+".pageno").getString("ss_value");
if(!"0".equals(pageSet)) {
	page_items = (!"".equals(pageSet))?Integer.valueOf(pageSet):page_items;
	app_dp = new DataPager(cps, page_items);
	cps = app_dp.getPageContent(pageno);
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
/*
function checkForm(F) {
	var num_chk = /^[0-9\s]*$/;
	var isEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;  // 使用 isEmail.test(欄位名稱) 檢查 E-Mail 是否格式正確 , 正確為 true
	//$("#btnok").prop("disabled",true);
    if (F.mp_account.value == ""){
        alert("請輸入申請單位!!");
        F.mp_account.focus();
    } else if (F.mp_name.value == ""){
        alert("請輸入您的姓名 !!");
        F.mp_name.focus();
	}else if(F.mp_job.value == ""){
		alert("請輸入您的職稱");
		F.mp_job.focus();
	} else if(F.mp_email.value == "" || !isEmail.test(F.mp_email.value)){
        alert("請輸入正確的 E-Mail !!");
        F.mp_email.focus();
    } else if(F.mp_phone.value == ""){
        alert("請輸入您的聯絡電話 !!");
        F.mp_phone.focus();
    } else if(!num_chk.test(F.mp_phone.value)){
    	alert("請輸入正確的電話號碼 !!");
        F.mp_phone.focus();
    }else {
    	//$("#btnok").prop("disabled",false);
        return true;
    }
    //$("#btnok").prop("disabled",false);
    return false;
}
*/
</script>
<%if(!"0".equals(pageSet)) { %>
	<%@include file="/WEB-INF/jspf/mis/pagerscript.jspf"%>
	<%} %>



<script>
function noStatus() {
	alert("此篇文章尚未通過審核 !");
}
</script>
<script>
$(document).ready(function(){
		
		if(window.location.href.indexOf("#") === -1){ <%--如果網址沒帶錨點--%>
		    var url = window.location.href+"#memberId"; <%--就補錨點--%>
            location.href=url;                          <%--再跳到錨點--%>
        }
		
})
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
                        <a href="../member/order_list.jsp#memberId">
                            遊戲紀錄
                        </a>
                    </li>
                    <%if(!publish_status) {%>
                    <li>
                        <a href="../member/apply.jsp#memberId">
                            申請發文帳號
                        </a>
                    </li>
                    <%} %>
                    <%if(publish_status) {%>
                    <li class="active">
                        <a href="../member/post_course.jsp#memberId">
                            發佈課程資訊
                        </a>
                    </li>
                    <%} %>
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
                                    <a href="../member/order_list.jsp#memberId">
                                        遊戲紀錄
                                    </a>
                                </div>
                            </div>
                            <%if(!publish_status) {%>
                            <div class="leftList">
                                <div class="leftList_top">
                                    <a href="../member/apply.jsp#memberId">
                                        申請發文帳號
                                    </a>
                                </div>
                            </div>
                            <%} %>
                            <%if(publish_status) {%>
                            <div class="leftList active"><!-- 當前模式 class加上active -->
                                <div class="leftList_top">
                                    <a href="../member/post_course.jsp#memberId">
                                        發佈課程資訊
                                    </a>
                                </div>
                            </div>
                            <%} %>
                        </div>

                    </div>

                    <!--右側-->
                    <div class="right">
                        <!-- 右側_無左選單noleft -->

                        <!--內頁標題樣式5-->
                        <!-- <div class="titStyle5">
                            <h2>限技專校院、技術型高中、政府機關</h2>
                        </div> -->

                        <div class="containerIn">

                            <!-- 發佈課程新增btn -->
                            <div class="postCourseAdd">
                                <a href="../member/post_course_in.jsp#memberId">
                                    新增
                                </a>
                            </div>

                            <!-- 發佈課程 -->
                            <div class="postCourseBg">
                                <%for(TableRecord cp:cps) {%>
                                <!-- 發佈課程資訊列表 -->
                                <div class="postCourseList">                                    
                                    <h3>
                                        <%if("Y".equals(cp.getString("cp_status"))) {%>
                                        <a href="../learn/article_in.jsp?cp_id=<%=cp.getString("cp_id")%>">
                                            <%=cp.getString("cp_title") %>
                                        </a>
                                        <%} else{%>
                                        <a onclick="noStatus();">
                                            <%=cp.getString("cp_title") %>
                                        </a>	
                                        <%}%>
                                    </h3>
                                    <!-- 發佈課程修改btn -->
                                    <div class="modify">
                                        <a href="../member/post_course_in.jsp?cp_id=<%=cp.getString("cp_id") %>#memberId">
                                            修改
                                        </a>
                                    </div>
                                </div>
                                <%} %>
                            </div>

                            <!--頁數列區塊-->
		                    <div class="number_pageArea">
			                <%if(!"0".equals(pageSet)) { %>
			                <%@include file="/WEB-INF/jspf/web/rwd_pager.jspf"%>
			                    <form name="pageform" id="pageform" method="post" action="<%=request.getRequestURI()%>">
				                   <input type="hidden" name="npage" id="npage" value="<%=pageno%>" />
			                    </form>
			                <%} %>
		                    </div>

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
