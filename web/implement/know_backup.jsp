<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@page import="com.genesis.utils.StringTool"%>
<%
String page_code = "know";
TableRecord cp = app_sm.select(tblcp,"cp_code=? and cp_lang =?",new Object[]{"implement_content",lang});
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
<%-- SEO --%>
<%if(!"".equals(cp.getString("cp_id"))){ %>
<meta name="Robots" content="<%=cp.getString("cp_robots") %>" />
<meta name="revisit-after" content="<%=cp.getString("cp_revisit_after") %> days" />
<meta name="keywords" content="<%=cp.getString("cp_keywords") %>" />
<meta name="copyright" content="<%=cp.getString("cp_copyright") %>" />
<meta name="description" content="<%=cp.getString("cp_description") %>" />
<%-- 追蹤碼 --%><%=cp.getString("cp_seo_track") %>
<%} %>

<script>
$(document).ready(
		function() {
			if(window.location.href.indexOf("#") === -1){ <%--如果網址沒帶錨點--%>
				var url = window.location.href+"#implementId"; <%--補錨點--%>
		        location.href=url;                          <%--跳轉--%>
		    }
			
		}
		
)
</script>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
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
                    <h2>實作環境參訪</h2>
                </div>

                <ul class="top_bar">
                    <li class="active">
                        <a href="../implement/know.jsp#implementId">
                            認識實作環境
                        </a>
                    </li>
                    <li >
                        <a href="../implement/implement.jsp?unit=3">
                            北部
                        </a>
                    </li>
                    <li >
                        <a href="../implement/implement.jsp?unit=2">
                            中部
                        </a>
                    </li>
                    <li>
                        <a href="../implement/implement.jsp?unit=1">
                            南部
                        </a>
                    </li>
                    <li>
                        <a href="../implement/latest_news.jsp#implementId">
                            最新消息
                        </a>
                    </li>
                </ul>


                <!-- 左右側 -->
                <div class="container">

                    <!--左側-->
                    <div class="left">

                        <!--左側表單名稱-->
                        <div class="leftList_tit">
                            實作環境參訪
                        </div>

                        <!--左側選單列表-->
                        <div class="leftListArea">
                            <div class="leftList active">
                                <div class="leftList_top">
                                    <a href="../implement/know.jsp#implementId">
                                        認識實作環境
                                    </a>
                                </div>
                            </div>
                            <div class="leftList">
                                <!-- 當前模式 class加上active -->
                                <div class="leftList_top">
                                    <a href="../implement/implement.jsp?unit=1">
                                        南部
                                    </a>
                                </div>
                            </div>

                            <div class="leftList">
                                <div class="leftList_top">
                                    <a href="../implement/implement.jsp?unit=2">
                                        中部
                                    </a>
                                </div>
                            </div>

                            <div class="leftList">
                                <div class="leftList_top">
                                    <a href="../implement/implement.jsp?unit=3">
                                        北部
                                    </a>
                                </div>
                            </div>
                            <div class="leftList">
                                <div class="leftList_top">
                                    <a href="../implement/latest_news.jsp#implementId">
                                        最新消息
                                    </a>
                                </div>
                            </div>
                            

                        </div>

                    </div>

                    <!--右側-->
                    <div class="right">
                        <!-- 右側_無左選單noleft -->

                        <!--內頁標題樣式2-->
                        <!-- <div class="titStyle2">
                        <h2>ALL</h2>
                        </div> -->

                        <div class="containerIn">

                            <!-- <div id="implementBottomtextId"></div> -->
                            <!-- 實作環境參訪下方文字區 -->
                            <div class="implementBottomtext">

                                <!--內頁標題樣式2-->
                                <!-- <div class="titStyle3">
                                    <h3>報名參訪體驗資訊</h3>
                                </div> -->

                                <!-- 網編區 -->
                                <section class="textArea">
                                    <%=cp.getString("cp_content") %>
                                </section>
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
	<%@include file="../include/copyright.jsp" %>
</body>
<!-- InstanceEnd --></html>
