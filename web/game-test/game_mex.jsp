<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@page import="com.genesis.utils.StringTool"%>
<%
//識別碼
String page_code = "makers";
//類群資料
Vector<TableRecord> cps = app_sm.selectAll(tblcp,"cp_lang=? and cp_code=?",
		                                  new Object[]{lang,page_code},
		                                  "cp_showseq ASC,cp_createdate DESC");
//內文資料
String cp_id = request.getParameter("cp_id");
TableRecord cp = app_sm.select(tblcp,cp_id);
if(cp.getString("cp_id").isEmpty() && cps.size() > 0){//預設類群
	cp = cps.firstElement();
	cp_id = cp.getString("cp_id");
    
}
//輪播資料
Vector<TableRecord> image_aps = app_sm.selectAll(tblap,"ap_code=? and ap_category=? and ap_lang=?",
		                                        new Object[]{page_code+"_banner",cp_id,lang},
		                                        "ap_showseq ASC,ap_createdate DESC");

//人流統計用
String setHistory  = IDTool.getUID("makers", DateTimeTool.dateString(""), 6);

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
				var url = window.location.href+"#gameInId"; <%--補錨點--%>
		        location.href=url;                          <%--跳轉--%>
		    }
			
		}
		
)
</script>

<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
<script>
function goaction(FORM,JSP){
	FORM.target = "_blank";
    FORM.action = JSP;
    FORM.submit();
    
    
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

            <div id="gameInId"></div>

            <div class="wrap">

                <!--內頁標題樣式1--><!--無左側標題 -->
                <div class="titStyle1 style1_noleft">
                    <h2>梅克獅養成遊戲</h2>
                </div>

                <!-- 左右側 -->
                <div class="container">

                    <!--右側-->
                    <div class="right noleft"><!-- 右側_無左選單noleft -->

                        <!--內頁標題樣式2-->
                        <!-- <div class="titStyle2">
                            <h2>誰是航運王</h2>
                        </div> -->

                        <!-- 技職二十群類別 -->
                        <div class="school_barArea">

                            <!--內頁標題樣式4-->
                            <div class="titStyle4">
                                <h4>養成攻略</h4>
                            </div>

                            <!-- 技職二十群類別列表 -->
                            <ul class="school_bar">
                                <%for(TableRecord cp_list:cps) {%>
                                <li>
                                    <a href="../game/game_mex.jsp?cp_id=<%=cp_list.getString("cp_id") %>">
                                        <div class="school_barIn">
                                            <%=cp_list.getString("cp_title") %>
                                        </div>
                                    </a>
                                </li>
                                <%} %>
                            </ul>
                                
                        </div>


                        <div class="containerIn">

                            <div class="learnItem">

                                <!--內頁標題樣式2-->
                                <!-- <div class="titStyle3">
                                    <h3>遊戲攻略1</h3>
                                </div> -->

                                <!-- 學習專區下方文字區 -->
                                <div class="learnBottomtext">

                                    <div class="learnBottomtextIn">
                                    
                                        <!--內頁標題樣式2-->
                                        <div class="titStyle3">
                                            <h3><%=cp.getString("cp_title") %></h3>
                                        </div>
                                        <%if(image_aps.size() > 0) {%>
                                        <!--學習專區輪播-->
                                        <div class="learnbanner">

                                            <div class="swiper-button-next"></div>
                                            <div class="swiper-button-prev"></div>
                                            
                                            <!-- Swiper -->
                                            <div class="swiper mySwiper swiper-container_learn">
                                                <div class="swiper-wrapper">
                                                    <%for(TableRecord ap:image_aps) {
                                                      String ap_target = ap.getString("ap_target");
                                                      String ap_title = ap.getString("ap_title");
                                                      String ap_alt = ap.getString("ap_alt");
                                                      String href = "none".equals(ap_target)?"javascript:void(0);":ap.getString("ap_url");
                                                      String imgPath = app_fetchpath+"/"+page_code+"_banner/"+lang+"/"+ap.getString("ap_image");
                                                    %>
                                                    <div class="swiper-slide">
                                                        <a href="<%=href%>" target="<%="none".equals(ap_target)?"":ap_target%>" style="<%="none".equals(ap_target)?"cursor:default":"" %>">
                                                            <img src="<%=imgPath %>" title=<%=ap_title %> alt=<%=ap_alt %>/>
                                                        </a>
                                                    </div>
                                                    <%} %>
                                                </div>
                                                
                                                <!-- <div class="swiper-pagination"></div> -->
                                            </div>

                                            <!-- Swiper 8.0.6 JS -->
                                            <script src="../js/swiper-master/js/swiper-bundle.min.js"></script>

                                            <!-- Initialize Swiper -->
                                            <script>
                                                var swiper = new Swiper(".swiper-container_learn", {
                                                    
                                                    //輪播一次顯示幾張
                                                    slidesPerView: 1,
                                                    
                                                    //輪播位置啟始值為置中
                                                    centeredSlides: true,

                                                    //手動滑動
                                                    allowTouchMove: true,  
                                                    
                                                    //自動輪播
                                                    autoplay: {
                                                        // delay: 8000,
                                                        delay: 10000,
                                                        disableOnInteraction: false,
                                                    },
                                                    
                                                    //無限循環
                                                    loop: true,
                                                    
                                                    autoHeight: true,
                                                    // spaceBetween: 20,
                                                    navigation: {
                                                        nextEl: ".swiper-button-next",
                                                        prevEl: ".swiper-button-prev",
                                                    },
                                                    pagination: {
                                                        el: ".swiper-pagination",
                                                        clickable: true,
                                                    },
                                                });
                                            </script>

                                        </div>
                                        <%} %>
                                        
                                        <!-- 網編區 -->
                                        <section class="textArea">
                                            <%=cp.getString("cp_content") %>                                        
                                        </section>

                                    </div>

                                </div>

                            </div>

                            <!--按鍵區-->
                            <div class="btn_area one"><!--如果只有一個按鍵時class內加one-->
                                <form name="frm" id="frm" method="get">
                                <input type="hidden" name="game_id" value="maker_lion">
                                </form>
                                <input type="button" value="開始養成"  onclick="goaction(frm,'./game_in.jsp')"/>
                               

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
