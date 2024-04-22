<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.genesis.utils.StringTool"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%
//識別碼
String page_code = "career_exploration";
//選單資料
Vector<TableRecord> dms = app_sm.selectAll(tbldm,"dm_code=? and dm_lang=?",
		                                   new Object[]{page_code,lang},"dm_showseq ASC,dm_createdate DESC");
//網邊區資料
String dm_id = StringTool.validString(request.getParameter("dm_id"));
TableRecord dm = app_sm.select(tbldm,dm_id);
//預設id
if(dm.getString("dm_id").isEmpty() && dms.size()>0) {
	dm = dms.firstElement();
	dm_id = dm.getString("dm_id");
}
TableRecord cp = app_sm.select(tblcp,"cp_code=? and cp_lang=? and cp_category=?",
		                       new Object[]{page_code+"_content",lang,dm_id});
String imgPath = app_fetchpath+"/"+page_code+"_content/"+lang+"/"+cp.getString("cp_image");

//輪播區塊資料
Vector<TableRecord> aps = app_sm.selectAll(tblap,"ap_code=? and ap_lang=? and ap_category=?",
		                                  new Object[]{page_code+"_banner",lang,dm_id});

//人流統計用
String setHistory  = IDTool.getUID("career_exploration", DateTimeTool.dateString(""), 6);
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
            <div id="careerId"></div>
            <div class="wrap">

                <!--內頁標題樣式1-->
                <div class="titStyle1">
                    <h2>職業試探常設展</h2>
                </div>
<script>
function goaction(FORM,JSP){
    FORM.action = JSP;
    FORM.submit();
}
</script>
                <ul class="top_bar">
                    <%
                    int counter = 0;
                    for(TableRecord dm_record:dms) {%>
                    <li <%=dm_id.equals(dm_record.getString("dm_id"))?"class='active'":"" %>>
                       <form method="post" name="frm_b<%=counter%>">
                          <input type="hidden" name="dm_id" value="<%=dm_record.getString("dm_id")%>">
                       </form>
                        <a href="javascript: goaction(document.forms['frm_b<%=counter%>'],'./career_exploration.jsp#careerId')">
                            <%=dm_record.getString("dm_title") %>
                        </a>
                    </li>
                    <%counter++;} %>
                    
                </ul>


                <!-- 左右側 -->
                <div class="container">

                    <!--左側-->
                    <div class="left">

                        <!--左側表單名稱-->
                        <div class="leftList_tit">
                            職業試探常設展
                        </div>

                        <!--左側選單列表-->
                        <div class="leftListArea">
                            <% int counter2 = 0;
                            for(TableRecord dm_record:dms) {%>
                            <div class="leftList <%=dm_id.equals(dm_record.getString("dm_id"))?"active":"" %>">
                                <!-- 當前模式 class加上active -->
                                <form method="post" name="frm_a<%=counter2%>">
                                   <input type="hidden" name="dm_id" value="<%=dm_record.getString("dm_id")%>">
                                </form>
                                <div class="leftList_top">
                                    <a href="javascript: goaction(document.forms['frm_a<%=counter2%>'],'./career_exploration.jsp#careerId')">
                                        <%=dm_record.getString("dm_title") %>
                                    </a>
                                </div>
                            </div>  
                            <%counter2++;} %>
                            

                            

                            

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

                            <!-- 技職試探常設展頁籤區 -->
                            <div class="career_tabArea">

                                <!--頁籤區 開始-->
                                <!--頁籤變下拉選單特效 開始 不用的話刪除-->
                                <!-- <script type="text/javascript">
                                    $(document).ready(function(e) {
                                        $(".career_tabArea .tabs_btn_now").click(function(e) {
                                            $(".career_tabArea .img-scroll").slideToggle();
                                        });
                                        
                                        $(".career_tabArea .tabs li span").click(function(e) {
                                            var tabsText = $(this).text();
                                            var bodywidth=document.documentElement.clientWidth;//取得螢幕可見寬度
                                            
                                            $(".career_tabArea .tabs_btn_now span").replaceWith('<span>'+tabsText+'</span>');
                                            if ( bodywidth <= 980 ) {
                                                $(".career_tabArea .img-scroll").slideToggle();
                                            }
                                        });
                                        
                                        $(window).resize(function(e) {
                                            $(".career_tabArea .img-scroll").removeAttr("style");
                                        });
                                    });
                                </script> -->
                                <!--頁籤變下拉選單特效 結束-->
                                
                                <script type="text/javascript" src="../js/tags_switching.js"></script>

                                <div class="tab_area">
                                
                                    <div class="tabs_btn_now"><!--變下拉選單時用 不用時可以刪除-->
                                        <span>展覽介紹</span>
                                        <div class="tabs_btn_now_arrow">
                                        </div>
                                    </div>
                                    <!-- <div class="tab_area"> -->
                                    <div class="img-scroll img-scroll2">
                                        <div class="img-list">
                                            <ul class="tabs">
                                                <li class="active">
                                                    <span href="#tab1">
                                                        展覽介紹
                                                    </span>
                                                </li>
                                                <li>
                                                    <span href="#tab2">
                                                        展覽最新消息
                                                    </span>
                                                </li>
                                                <li>
                                                    <span href="#tab3">
                                                        展演活動
                                                    </span>
                                                </li>
                                                <li>
                                                    <span href="#tab5">
                                                        <div class="silhouette" onclick="javascript:location.href='#silhouetteId'">
                                                            活動剪影
                                                        </div>
                                                    </span>
                                                </li>
                                                <li>
                                                    <span href="#tab4">
                                                        聯絡資訊
                                                    </span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- </div> -->
                                    <!--頁籤區 結束-->
                            
                                </div>
                        
                                <!--產品內頁頁籤的網編區-->
                                <div class="p_tab_text_area">
                                
                                    <div id="tab1">
                                    
                                        <div class="career_tab">

                                            <!-- 技職試探常設展圖片區 -->
                                            <div class="careerTopImg">
                                                <img src="<%=imgPath %>" /> 
                                            </div>

                                            <div class="careerBottomtext">
                                                <!--內頁標題樣式3-->
                                                <div class="titStyle3">
                                                    <h3>展覽介紹</h3>
                                                </div>

                                                <!-- 網編區 -->
                                                <section class="textArea">
                                                  <%=cp.getString("cp_content") %>
                                                </section>

                                            </div>

                                        </div>

                                    </div>
                                    
                                    <div id="tab2">
                                    
                                        <div class="career_tab">

                                            <!-- 技職試探常設展圖片區 -->
                                            <div class="careerTopImg">
                                                <img src="<%=imgPath %>" /> 
                                            </div>

                                            <div class="careerBottomtext">
                                                <!--內頁標題樣式3-->
                                                <div class="titStyle3">
                                                    <h3>展覽最新消息</h3>
                                                </div>

                                                <!-- 網編區 -->
                                                <section class="textArea">
                                                  <%=cp.getString("cp_content2") %>
                                                </section>

                                            </div>

                                        </div>

                                    </div>
                                    
                                    <div id="tab3">
                                    
                                        <div class="career_tab">

                                            <!-- 技職試探常設展圖片區 -->
                                            <div class="careerTopImg">
                                                <img src="<%=imgPath %>" /> 
                                            </div>

                                            <div class="careerBottomtext">
                                                <!--內頁標題樣式3-->
                                                <div class="titStyle3">
                                                    <h3>展演活動</h3>
                                                </div>

                                                <!-- 網編區 -->
                                                <section class="textArea">
                                                  <%=cp.getString("cp_content3") %>      
                                                </section>

                                            </div>

                                        </div>

                                    </div>

                                    <div id="tab4">
                                    
                                        <div class="career_tab">

                                            <!-- 技職試探常設展圖片區 -->
                                            <div class="careerTopImg">
                                                <img src="<%=imgPath %>" /> 
                                            </div>

                                            <div class="careerBottomtext">
                                                <!--內頁標題樣式3-->
                                                <div class="titStyle3">
                                                    <h3>聯絡資訊</h3>
                                                </div>

                                                <!-- 網編區 -->
                                                <section class="textArea">
                                                  <%=cp.getString("cp_content4") %>
                                                </section>

                                            </div>

                                        </div>
                                        
                                    </div>
                                    
                                </div> 

                            </div>
                            <div id="silhouetteId" name="silhouetteId"></div>
                            <div class="careerBg">

                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>

                                <!-- Swiper -->
                                <div class="swiper mySwiper careerSwiper">

                                    <div class="swiper-wrapper">
                                        <%
                                          if(aps.size()>0){
                                              for(TableRecord ap:aps) {
                                              String bannerPath = app_fetchpath+"/"+page_code+"_banner/"+lang+"/"+ap.getString("ap_image");
                                        %>
                                            <div class="swiper-slide">
                                                <!-- 首頁最新消息列表 -->
                                                <div class="careerList">
                                                    <a href="javascript:void(0);">
                                                        <img src="<%=bannerPath %>" />
                                                    </a>
                                                </div>
                                            </div>
                                            <%}
                                        }else {%>
                                        	<div class="swiper-slide">
                                                <!-- 首頁最新消息列表 -->
                                                <div class="careerList">
                                                    <a href="javascript:void(0);">
                                                        <img src="<%=imgPath %>" />
                                                    </a>
                                                </div>
                                            </div>
                                        <% }%>
                                    </div>

                                    <!-- <div class="swiper-pagination"></div> -->

                                </div>


                                <!-- Swiper 8.0.6 JS -->
                                <script src="../js/swiper-master/js/swiper-bundle.min.js"></script>

                                <!-- Initialize Swiper -->
                                <script>
                                    var swiper = new Swiper(".mySwiper.careerSwiper", {
                                        watchSlidesProgress: true,
                                        loop: true,
                                        effect: "coverflow",
                                        grabCursor: true, //設置為true時，鼠標覆蓋Swiper時指針會變成手掌形狀，拖動時指針會變成抓手形狀。
                                        centeredSlides: true,
                                        //slidesPerView: 1.77,
                                        // slidesPerView: "auto",
                                        // coverflowEffect: {
                                        //     rotate: 0,           //slide做3d旋轉時Y軸的旋轉角度
                                        //     stretch: 200,          //每個slide之間的拉伸值，越大slide靠得越緊。5.3.6 後可使用%百分比
                                        //     depth: 500,         //slide的位置深度。值越大z軸距離越遠，看起來越小。
                                        //     modifier: 1,         //depth和rotate和stretch的倍率，相當於depth*modifier、rotate*modifier、stretch*modifier，值越大這三個參數的效果越明顯。
                                        //     slideShadows: true,  //是否開啟slide陰影
                                        // },


                                        pagination: {
                                            el: ".careerBg .swiper-pagination",
                                            clickable: true,
                                        },
                                        navigation: {
                                            nextEl: ".careerBg .swiper-button-next",
                                            prevEl: ".careerBg .swiper-button-prev",
                                        },
                                        breakpoints: {
                                            //當寬度大於等於375
                                            375: {
                                                //lidesPerView: 2,
                                                coverflowEffect: {
                                                    //rotate: 0,           //slide做3d旋轉時Y軸的旋轉角度
                                                    stretch: 0, //每個slide之間的拉伸值，越大slide靠得越緊。5.3.6 後可使用%百分比
                                                    depth: 0, //slide的位置深度。值越大z軸距離越遠，看起來越小。
                                                    //modifier: 1,         //depth和rotate和stretch的倍率，相當於depth*modifier、rotate*modifier、stretch*modifier，值越大這三個參數的效果越明顯。
                                                    //slideShadows: true,  //是否開啟slide陰影
                                                },
                                            },
                                            //當寬度大於等於990
                                            991: {
                                                slidesPerView: "auto",
                                                coverflowEffect: {
                                                    rotate: 0, //slide做3d旋轉時Y軸的旋轉角度
                                                    stretch: 200, //每個slide之間的拉伸值，越大slide靠得越緊。5.3.6 後可使用%百分比
                                                    depth: 500, //slide的位置深度。值越大z軸距離越遠，看起來越小。
                                                    modifier: 1, //depth和rotate和stretch的倍率，相當於depth*modifier、rotate*modifier、stretch*modifier，值越大這三個參數的效果越明顯。
                                                    slideShadows: true, //是否開啟slide陰影
                                                },
                                            },
                                        },
                                    });
                                </script>

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
