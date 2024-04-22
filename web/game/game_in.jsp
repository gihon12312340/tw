<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@page import="com.genesis.utils.StringTool"%>
<%
String page_code = "game_in";
String game_id = StringTool.validString(request.getParameter("game_id"),"g1");
Map<String,String[]> gameMap = new HashMap<>(); //<game_id,[title,src]>
gameMap.put("g1",new String[]{"誰是航運王","./game1/index.html"});
gameMap.put("g2",new String[]{"超級飛修員","./game2/index.html"});
gameMap.put("g3",new String[]{"智慧製造洗手乳","./game3/index.html"});
gameMap.put("g4",new String[]{"無人商店採購","./game4/index.html"});
gameMap.put("g5",new String[]{"彩繪技職樂園","./game5/index.html"});
gameMap.put("g6",new String[]{"智能雞舍","./game6/index.html"});
gameMap.put("g7",new String[]{"撒網抓魚感測","./game7/index.html"});
gameMap.put("g8",new String[]{"農業小幫手","./game8/index.html"});
gameMap.put("g9",new String[]{"小建築大工程","./game9/index.html"});
gameMap.put("g10",new String[]{"花草實驗室","./game10/index.html"});
gameMap.put("g11",new String[]{"積木樂園","./game11/index.html"});
gameMap.put("g12",new String[]{"神秘森林救援","./game12/index.html"});
gameMap.put("g13",new String[]{"經營大亨","./game13/index.html"});
gameMap.put("g14",new String[]{"魔法寶石大冒險","./game14/index.html"});
gameMap.put("g15",new String[]{"快門冒險","./game15/index.html"});

gameMap.put("maker_lion",new String[]{"梅克獅","./maker_lion/index.html"});

//避免game_id錯誤
try{
	String test = gameMap.get(game_id)[0];
}catch(Exception e){
	System.out.println("URL= "+request.getRequestURL().toString());
	System.out.println("QueryString= "+request.getQueryString());
	e.printStackTrace();
	
	game_id = "g1";
	
}

//檢查登入狀態
if("maker_lion".equals(game_id)) {
	TableRecord mp = (TableRecord)session.getAttribute("member");
	if(mp == null) {
		String localname_auto = request.getScheme()+"://"+request.getServerName()+":"+request.getLocalPort();
		String googleurl_auto = localname_auto + request.getContextPath() + "/web/member/googlelogin/google_login_action.jsp";
		String loginStr2_auto = "https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com%2Fauth%2Fuserinfo.email+https://www.googleapis.com%2Fauth%2Fuserinfo.profile&redirect_uri="+googleurl_auto+"&response_type=code&client_id="+SiteSetup.getText("cp.google_appid.tw");
		session.setAttribute("page_code",page_code);
		out.println("<script>location.href='"+loginStr2_auto+"'</script>");
		return;
	} else {
		//TableRecord check_member = (TableRecord)session.getAttribute("member");
		//設定cookie 跳至梅克獅頁面
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;
		boolean accExist = false;
		if(cookies != null) {
		 	for(int c = 0; c < cookies.length; c++) {
		 		cookie = cookies[c];
		 		if(cookie.getName().equals("uid")) {
		 			accExist = true;	   	// cookies已存在
		 			
		 			// 時限重置
		 			cookie.setMaxAge(60 * 10);
		 			cookie.setPath("/");    // 路徑設定(每次更動都要重新設定，避免ID重複)
		 	 		response.addCookie(cookie);
		 			
		 			break;
		 		}
		 	}
			}
		Cookie uidCookie = new Cookie("uid", mp.getString("mp_account"));
		uidCookie.setPath("/");    		// 路徑設定
		uidCookie.setMaxAge(60 * 10);	// 時限:10分鐘
		response.addCookie(uidCookie);
		
		out.println("<script>location.href='./maker_lion/index.html';</script>");
		//out.println("<script>var a=document.createElement('a');a.href='./maker_lion/index.html';a.target='_blank';a.click();</script>");
		//out.println("<script>location.href='../../home.jsp';</script>");
		return;
		
	}
}


//各遊戲最高分塞進Cookie
// 遊戲:模擬無人機 - 搜尋最高分並存入Cookies
TableRecord scoreList = app_sm.select(tblgs, "gs_code=? and gs_lang=?"
			                       , new Object[]{ "drone", lang }, "gs_drone_score DESC");
int topScore = ((scoreList != null)?scoreList.getInt("gs_drone_score"):0);
Cookie scoreCookie = new Cookie("drone_top_score", String.valueOf(topScore));
scoreCookie.setPath("/"+request.getRequestURI().split("/")[1]);    	// 路徑設定
scoreCookie.setMaxAge(60 * 60 * 3);									// 時限:3小時(避免原頁停留導致cookies過期)
response.addCookie(scoreCookie);

//遊戲:洗手乳 - 搜尋最高分並存入Cookies
TableRecord scoreList2 = app_sm.select(tblgs, "gs_code=? and gs_lang=?"
			, new Object[]{ "handwash", lang }, "gs_handwash_score DESC");
int topScore2 = ((scoreList2 != null)?scoreList2.getInt("gs_handwash_score"):0);
Cookie scoreCookie2 = new Cookie("handwash_top_score", String.valueOf(topScore2));
scoreCookie.setPath("/"+request.getRequestURI().split("/")[1]);    	// 路徑設定
scoreCookie.setMaxAge(60 * 60 * 3);									// 時限:3小時(避免原頁停留導致cookies過期)
response.addCookie(scoreCookie2);

//遊戲:智能雞舍 - 搜尋最高分並存入Cookies
TableRecord scoreList3= app_sm.select(tblgs, "gs_code=? and gs_lang=?"
			, new Object[]{ "chicken", lang }, "gs_chicken_score DESC");
int topScore3 = ((scoreList3 != null)?scoreList3.getInt("gs_chicken_score"):0);
Cookie scoreCookie3 = new Cookie("chicken_top_score", String.valueOf(topScore3));
scoreCookie.setPath("/"+request.getRequestURI().split("/")[1]);    	// 路徑設定
scoreCookie.setMaxAge(60 * 60 * 3);									// 時限:3小時(避免原頁停留導致cookies過期)
response.addCookie(scoreCookie3);

//遊戲:抓魚 - 搜尋最高分並存入Cookies
TableRecord scoreList4= app_sm.select(tblgs, "gs_code=? and gs_lang=?"
			, new Object[]{ "fish", lang }, "gs_fish_score DESC");
int topScore4 = ((scoreList4 != null)?scoreList4.getInt("gs_fish_score"):0);
Cookie scoreCookie4 = new Cookie("fish_top_score", String.valueOf(topScore4));
scoreCookie.setPath("/"+request.getRequestURI().split("/")[1]);    	// 路徑設定
scoreCookie.setMaxAge(60 * 60 * 3);									// 時限:3小時(避免原頁停留導致cookies過期)
response.addCookie(scoreCookie4);
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

<meta name="Robots" content="<%=SiteSetup.getText("seo.robots."+lang) %>" />
<meta name="revisit-after" content="<%=SiteSetup.getText("seo.revisit_after."+lang) %> days" />
<meta name="keywords" content="<%=SiteSetup.getText("seo.keywords."+lang) %>" />
<meta name="copyright" content="<%=SiteSetup.getText("seo.copyright."+lang) %>" />
<meta name="description" content="<%=SiteSetup.getText("seo.description."+lang) %>" />
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
                    <h2>互動體驗遊戲</h2>
                </div>

                <!-- 左右側 -->
                <div class="container">

                    <!--右側-->
                    <div class="right noleft"><!-- 右側_無左選單noleft -->

                        <!--內頁標題樣式2-->
                        <div class="titStyle2">
                            <h2><%=gameMap.get(game_id)[0] %></h2>
                        </div>

                        <div class="containerIn">

                            <!-- 遊戲內容 -->
                            <div class="gameBg">

                                <!-- 遊戲內容放置 -->
                                <iframe src="<%=gameMap.get(game_id)[1] %>" width="100%" height="900px" scrolling="no"></iframe>
                            </div>
                            <%if("g4".equals(game_id) || "g6".equals(game_id)) {%>
                            <section class="textArea game_textArea">

                                兌換活動已結束

                            </section>
                            <%} %>
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
