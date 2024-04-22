<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@page import="com.genesis.utils.StringTool"%>
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

            <div class="wrap">
            
                <!-- 2023/09/05 新增小遊戲組織圖 -->
                <img src="images/organizational_chart.svg" style="display: block;width: clamp(300px, 75%,75%);margin: auto;padding-bottom: 3rem">
                

                <!--內頁標題樣式1--><!--無左側標題 -->
                <div class="titStyle1 style1_noleft">
                    <h2>互動體驗遊戲</h2>
                </div>

                <!-- 左右側 -->
                <div class="container">

                    <!--右側-->
                    <div class="right noleft"><!-- 右側_無左選單noleft -->

                        <!--內頁標題樣式1-->
                        <!-- <div class="titStyle1 learntitStyle1">
                            <h2>互動體驗遊戲</h2>
                        </div> -->

                        <div class="containerIn">

                            <!-- 互動體驗遊戲區 -->
                            <ul class="gameArea">

                                <div id="talentId"></div>
                                <li class="first">
                                    <div class="gameList">
                                        <a href="./game_mex.jsp" target="_blank">

                                            <!-- 互動體驗遊戲圖 -->
                                            <div class="gameImg">
                                                <img src="images/game_01_1.png" alt="" class="before">
                                                <img src="images/game_01_2.png" alt="" class="after">
                                            </div>

                                            <!-- 互動體驗遊戲標題 -->
                                            <h3>梅克獅養成遊戲</h3>

                                        </a>
                                    </div>
                                </li>
                                
                                <li class="new">
                                    <div id="gameId"></div>
                                    <div class="gameList">
                                        <a href="game_in.jsp?game_id=g15#gameInId">
                                            <span>NEW</span>
                                            <!-- 互動體驗遊戲圖 -->
                                            <div class="gameImg">
                                                <img src="images/game_16_1.png" alt="" class="before">
                                                <img src="images/game_16_2.png" alt="" class="after">
                                            </div>

                                            <!-- 互動體驗遊戲標題 -->
                                            <h3>快門冒險</h3>
                                        </a>
                                    </div>
                                </li>
                                
                                <li class="new">
                                    <div id="gameId"></div>
                                    <div class="gameList">
                                        <a href="game_in.jsp?game_id=g14#gameInId">
                                            <span>NEW</span>
                                            <!-- 互動體驗遊戲圖 -->
                                            <div class="gameImg">
                                                <img src="images/game_15_1.png" alt="" class="before">
                                                <img src="images/game_15_2.png" alt="" class="after">
                                            </div>

                                            <!-- 互動體驗遊戲標題 -->
                                            <h3>魔法寶石大冒險</h3>
                                        </a>
                                    </div>
                                </li>
                                
                                <li class="new">
                                    <div id="gameId"></div>
                                    <div class="gameList">
                                        <a href="game_in.jsp?game_id=g13#gameInId">
                                            <span>NEW</span>
                                            <!-- 互動體驗遊戲圖 -->
                                            <div class="gameImg">
                                                <img src="images/game_14_1.png" alt="" class="before">
                                                <img src="images/game_14_2.png" alt="" class="after">
                                            </div>

                                            <!-- 互動體驗遊戲標題 -->
                                            <h3>經營大亨</h3>
                                        </a>
                                    </div>
                                </li>

                                <li>
                                    <div id="gameId"></div>
                                    <div class="gameList">
                                        <a href="game_in.jsp?game_id=g12#gameInId">
                                            <!-- 互動體驗遊戲圖 -->
                                            <div class="gameImg">
                                                <img src="images/game_13_1.png" alt="" class="before">
                                                <img src="images/game_13_2.png" alt="" class="after">
                                            </div>

                                            <!-- 互動體驗遊戲標題 -->
                                            <h3>神秘森林救援任務</h3>
                                        </a>
                                    </div>
                                </li>
                                
                                <!-- 互動體驗遊戲列表：積木樂園 -->
                                <li>
                                    <div id="gameId"></div>
                                    <div class="gameList">
                                        <a href="game_in.jsp?game_id=g11#gameInId">
                                            <!-- 互動體驗遊戲圖 -->
                                            <div class="gameImg">
                                                <img src="images/game_12_1.png" alt="" class="before">
                                                <img src="images/game_12_2.png" alt="" class="after">
                                            </div>

                                            <!-- 互動體驗遊戲標題 -->
                                            <h3>積木樂園</h3>

                                        </a>
                                    </div>
                                </li>
                                
                                
                                <li>
                                    <div id="gameId"></div>
                                    <div class="gameList">
                                        <a href="game_in.jsp?game_id=g10#gameInId">
                                            <!-- 互動體驗遊戲圖 -->
                                            <div class="gameImg">
                                                <img src="images/game_11_1.png" alt="" class="before">
                                                <img src="images/game_11_2.png" alt="" class="after">
                                            </div>

                                            <!-- 互動體驗遊戲標題 -->
                                            <h3>花草實驗室</h3>

                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div id="gameId"></div>
                                    <div class="gameList">
                                        <a href="game_in.jsp?game_id=g9#gameInId">
                                            <!-- 互動體驗遊戲圖 -->
                                            <div class="gameImg">
                                                <img src="images/game_10_1.png" alt="" class="before">
                                                <img src="images/game_10_2.png" alt="" class="after">
                                            </div>

                                            <!-- 互動體驗遊戲標題 -->
                                            <h3>小建築大工程</h3>

                                        </a>
                                    </div>
                                </li>
                                <!-- 互動體驗遊戲列表：誰是航運王 -->
                                <li>
								
                                    <div class="gameList">
                                        <a href="game_in.jsp?game_id=g1#gameInId">
                                            <!-- 互動體驗遊戲圖 -->
                                            <div class="gameImg">
                                                <img src="images/game_08_1.png" alt="" class="before">
                                                <img src="images/game_08_2.png" alt="" class="after">
                                            </div>

                                            <!-- 互動體驗遊戲標題 -->
                                            <h3>誰是航運王</h3>

                                        </a>
                                    </div>
                                </li>
                                <!-- 互動體驗遊戲列表：超級飛修員 -->
                                <li>
                                    <div class="gameList">
                                        <a href="game_in.jsp?game_id=g2#gameInId">
                                            <!-- 互動體驗遊戲圖 -->
                                            <div class="gameImg">
                                                <img src="images/game_09_1.png" alt="" class="before">
                                                <img src="images/game_09_2.png" alt="" class="after">
                                            </div>

                                            <!-- 互動體驗遊戲標題 -->
                                            <h3>超級飛修員</h3>

                                        </a>
                                    </div>
                                </li>   
                                <!-- 互動體驗遊戲列表：無人商店採購體驗 -->
                                <li>
                                
                                    <div class="gameList">
                                        <a href="game_in.jsp?game_id=g4#gameInId">

                                            <!-- 互動體驗遊戲圖 -->
                                            <div class="gameImg">
                                                <img src="images/game_02_1.png" alt="" class="before">
                                                <img src="images/game_02_2.png" alt="" class="after">
                                            </div>

                                            <!-- 互動體驗遊戲標題 -->
                                            <h3>無人商店採購</h3>

                                        </a>
                                    </div>
                                </li>

                                <!-- 互動體驗遊戲列表：智慧製造洗手乳 -->
                                <li>
                                    <div class="gameList">
                                        <a href="game_in.jsp?game_id=g3#gameInId">

                                            <!-- 互動體驗遊戲圖 -->
                                            <div class="gameImg">
                                                <img src="images/game_03_1.png" alt="" class="before">
                                                <img src="images/game_03_2.png" alt="" class="after">
                                            </div>

                                            <!-- 互動體驗遊戲標題 -->
                                            <h3>智慧製造洗手乳</h3>

                                        </a>
                                    </div>
                                </li>

                                <!-- 互動體驗遊戲列表：彩繪技職樂園 -->
                                <li>
                                    <div class="gameList">
                                        <a href="game_in.jsp?game_id=g5#gameInId">

                                            <!-- 互動體驗遊戲圖 -->
                                            <div class="gameImg">
                                                <img src="images/game_04_1.png" alt="" class="before">
                                                <img src="images/game_04_2.png" alt="" class="after">
                                            </div>

                                            <!-- 互動體驗遊戲標題 -->
                                            <h3>彩繪技職樂園</h3>

                                        </a>
                                    </div>
                                </li>

                                <!-- 互動體驗遊戲列表：智能雞舍 -->
                                <li>
                                    <div class="gameList">
                                        <a href="game_in.jsp?game_id=g6#gameInId">

                                            <!-- 互動體驗遊戲圖 -->
                                            <div class="gameImg">
                                                <img src="images/game_05_1.png" alt="" class="before">
                                                <img src="images/game_05_2.png" alt="" class="after">
                                            </div>

                                            <!-- 互動體驗遊戲標題 -->
                                            <h3>智能雞舍</h3>

                                        </a>
                                    </div>
                                </li>


                                <!-- 互動體驗遊戲列表：灑網抓魚感測體驗 -->
                                <li>
                                    <div class="gameList">
                                        <a href="game_in.jsp?game_id=g7#gameInId">

                                            <!-- 互動體驗遊戲圖 -->
                                            <div class="gameImg">
                                                <img src="images/game_06_1.png" alt="" class="before">
                                                <img src="images/game_06_2.png" alt="" class="after">
                                            </div>

                                            <!-- 互動體驗遊戲標題 -->
                                            <h3>撒網抓魚感測</h3>

                                        </a>
                                    </div>
                                </li>

                                <!-- 互動體驗遊戲列表：農業小幫手 -->
                                <li>
                                    <div class="gameList">
                                        <a href="game_in.jsp?game_id=g8#gameInId">

                                            <!-- 互動體驗遊戲圖 -->
                                            <div class="gameImg">
                                                <img src="images/game_07_1.png" alt="" class="before">
                                                <img src="images/game_07_2.png" alt="" class="after">
                                            </div>

                                            <!-- 互動體驗遊戲標題 -->
                                            <h3>農業小幫手</h3>

                                        </a>
                                    </div>
                                </li>

                                

                                                             

                            </ul>

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
