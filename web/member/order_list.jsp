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
頁面準備完成後 此時的url已經在./order_list.jsp了
跳轉至./order_list.jsp#memberId時 頁面只會滑動到錨點 並不會真的重整

benson 2022/04/20
 --%>
<%
String page_code = "order_list";
//會員資訊
String game_id = StringTool.validString(request.getParameter("game_id"),"g12");
TableRecord mp = (TableRecord)session.getAttribute("member");
session.setAttribute("page_code",page_code);


String localname2 = request.getScheme()+"://"+request.getServerName()+":"+request.getLocalPort();
String googleurl2 = localname2 + request.getContextPath() + "/web/member/googlelogin/google_login_action.jsp";
String loginStr2 = "https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com%2Fauth%2Fuserinfo.email+https://www.googleapis.com%2Fauth%2Fuserinfo.profile&redirect_uri="+googleurl2+"&response_type=code&client_id="+SiteSetup.getText("cp.google_appid.tw");



if(mp == null){
	out.println("<script>location.href='"+loginStr2+"';</script>");
	return;
}
String account = mp.getString("mp_account");
//遊戲id-gs_code mapping
Map<String,String> gameMap = new HashMap<>();
gameMap.put("g1","shipping");
gameMap.put("g2","aircraft");
gameMap.put("g3","handwash");
gameMap.put("g4","recipe");
gameMap.put("g5","paint");
gameMap.put("g6","chicken");
gameMap.put("g7","fish");
gameMap.put("g8","drone");
gameMap.put("g9","build");
gameMap.put("g10","flower");
gameMap.put("g11","brick");
gameMap.put("g12","forest");

String[] recipeName = new String[]{"牛奶洋蔥湯","奶燉雞肉","虱目魚湯","馬鈴薯沙拉","馬鈴薯燉肉","高麗菜卷","堅果雞肉沙拉","番茄魚片","番茄蔬菜蛋花湯","蘋果薑茶"};
//遊戲分數資料
String gs_code = gameMap.get(game_id);
if(gs_code == null) {
	gs_code="forest"; //抓不到就預設為shipping
}
Vector<TableRecord> gss = app_sm.selectAll(tblgs,"gs_account=? and gs_code=?",new Object[]{account,gs_code},"gs_createdate DESC");
//抓取最高分遊戲分數
String score1="",score2="",score3="",scoreTotal="",id="",img="",img2="";
TableRecord gsTemp = new TableRecord(tblgs);
if("g1".equals(game_id)) {
	 gsTemp = app_sm.select(tblgs,"gs_code=?",new Object[]{"shipping"},"gs_shipping_score1+gs_shipping_score2 DESC");
	 score1 = String.valueOf(gsTemp.getInt("gs_shipping_score1"));
	 score2 = String.valueOf(gsTemp.getInt("gs_shipping_score2"));
	 scoreTotal = String.valueOf(gsTemp.getInt("gs_shipping_score1")+gsTemp.getInt("gs_shipping_score2"));

     score1 = score1.equals("-1")?"未完成":score1;
     score2 = score2.equals("-1")?"未完成":score2;
     if(score1.equals("-1") || score2.equals("-1")) {
    	 scoreTotal = "未完成";
     }
}else if("g2".equals(game_id)) {
	gsTemp = app_sm.select(tblgs,"gs_code=?",new Object[]{"aircraft"},"gs_aircraft_score DESC"); 
	score1 = String.valueOf(gsTemp.getInt("gs_aircraft_score"));
	score1 = "-1".equals(score1)?"未完成":score1;
}else if("g3".equals(game_id)) {
	if(gss.size()>0){
		gsTemp = gss.firstElement();	
	}
	id =  gsTemp.getString("gs_handwash_id");
	score1 = String.valueOf(gsTemp.getInt("gs_handwash_score"));
	score1 = "-1".equals(score1)?"未完成":score1;
	
	TableRecord handwash = app_sm.select(tblgs,"gs_code=?",new Object[]{"handwash"},"gs_handwash_score DESC");
	
	score2 = String.valueOf(gsTemp.getInt("gs_handwash_score"));
	score2 = "-1".equals(score2)?"無":score2;
}else if("g4".equals(game_id)) {
	
}else if("g5".equals(game_id)) {
	
}else if("g6".equals(game_id)) {
	if(gss.size()>0){
		gsTemp = gss.firstElement();	
	}
	score1 = String.valueOf(gsTemp.getInt("gs_chicken_score"));
	score1 = "-1".equals(score1)?"未完成":score1;
	
	TableRecord chicken = app_sm.select(tblgs,"gs_code=?",new Object[]{"chicken"},"gs_chicken_score DESC");
	
	score2 = String.valueOf(chicken.getInt("gs_chicken_score"));
	score2 = "-1".equals(score2)?"無":score2;
}else if("g7".equals(game_id)) {
	if(gss.size()>0){
		gsTemp = gss.firstElement();	
	}
	
	id = String.valueOf(gsTemp.getInt("gs_fish_count"));
    id = "-1".equals(id)?"無":id;
	score1 = String.valueOf(gsTemp.getInt("gs_fish_score")); 
    score1 = "-1".equals(score1)|| "0".equals(score1)? "無":score1;
    
    TableRecord  fish= app_sm.select(tblgs,"gs_code=?",new Object[]{"fish"},"gs_fish_score DESC");
	
    score2 = String.valueOf(fish.getInt("gs_fish_score"));
	score2 = "-1".equals(score2) || "0".equals(score2)?"無":score2;
}else if("g8".equals(game_id)) {
	if(gss.size()>0){
		gsTemp = gss.firstElement();	
	}
	score1 = String.valueOf(gsTemp.getInt("gs_drone_score"));
	score1 = "-1".equals(score1)?"未完成":score1;
    TableRecord drone = app_sm.select(tblgs,"gs_code=?",new Object[]{"drone"},"gs_drone_score DESC");
    score2 = String.valueOf(drone.getInt("gs_drone_score"));
    score2 = "-1".equals(score2)?"無":score2;
} else if("g9".equals(game_id)) {
	if(gss.size()>0){
		gsTemp = gss.firstElement();	
	}
	score1 = String.valueOf(gsTemp.getInt("gs_build_score1"));
	score2 = String.valueOf(gsTemp.getInt("gs_build_score2"));
	score1 = "-1".equals(score1)?"未完成":score1;
	score2 = "-1".equals(score2)?"未完成":score2;
	
	TableRecord build_highest = app_sm.select(tblgs,"gs_code=?",new Object[]{"build"},"gs_build_score1+gs_build_score2 DESC");
	//int build_highest_score = build_highest.getInt("gs_build_score1")+build_highest.getInt("gs_build_score2");
	int build_highest_score1 = build_highest.getInt("gs_build_score1");
	int build_highest_score2 = build_highest.getInt("gs_build_score2");
	
	
	if(build_highest_score1 == -1) {
		score1 = "未完成";
	}else {
		score1 = String.valueOf(build_highest_score1);
	}
	
	if(build_highest_score2 == -1) {
		score2 = "未完成";
	}else {
		score2 = String.valueOf(build_highest_score2);
	}
	
	if(build_highest_score1 == -1 || build_highest_score2 == -1) {
		scoreTotal = "未完成";
	}else {
		scoreTotal = String.valueOf(build_highest_score1+build_highest_score2);
	}
}else if("g10".equals(game_id)){
	if(gss.size()>0){
		gsTemp = gss.firstElement();	
	}
	
	TableRecord flower_highest = app_sm.select(tblgs,"gs_code=?",new Object[]{"flower"},"gs_flower_score1+gs_flower_score2+gs_flower_score3 DESC");
	int flower_highest_score1 = flower_highest.getInt("gs_flower_score1");
	int flower_highest_score2 = flower_highest.getInt("gs_flower_score2");
	int flower_highest_score3 = flower_highest.getInt("gs_flower_score3");
	String flower_highest_id = flower_highest.getString("gs_flower_id");
	
	boolean complete = true;
	
	if(flower_highest_score1 == -1) {
		score1 = "未完成";
		complete = false;
	}else {
		score1 = String.valueOf(flower_highest_score1);
	}
	
	if(flower_highest_score2 == -1) {
		score2 = "未完成";
		complete = false;
	}else {
		score2 = String.valueOf(flower_highest_score2);
	}
	
	if(flower_highest_score3 == -1) {
		score3 = "未完成";
		complete = false;
	}else {
		score3 = String.valueOf(flower_highest_score3);
	}
	
	if(complete) {
		scoreTotal = String.valueOf(flower_highest_score1+flower_highest_score2+flower_highest_score3);
	}else {
		scoreTotal = "未完成";
	}
	
	if("0".equals(flower_highest_id)) {
		img = "./images/g9_2.png";
	}else if("1".equals(flower_highest_id)) {
		img = "./images/g9.png";
	}else if("2".equals(flower_highest_id)) {
		img = "./images/g9_3.jpg";
	}else {
		img = "./images/g9_3.jpg";
	}
	//無最高分紀錄
	if(flower_highest.getString("gs_id").isEmpty()) {
		score1 = "0";
		score2 = "0";
		score3 = "0";
		scoreTotal = "0";
	}
}else if("g11".equals(game_id)){
	if(gss.size()>0){
		gsTemp = gss.firstElement();	
	}
	
	TableRecord brick_score_highest = app_sm.select(tblgs,"gs_code=?",new Object[]{"brick"},"gs_brick_score DESC");
	int brick_highest_score = brick_score_highest.getInt("gs_brick_score");
	if(brick_highest_score == -1) {
		score1 = "未完成";
	}else {
		score1 = String.valueOf(brick_highest_score);
	}
	
	img = brick_score_highest.getString("gs_car_image");
	img2 = brick_score_highest.getString("gs_user_image");
	
	img = img.equals("-1")?"":img;
	img2 = img2.equals("-1")?"":img2;
}else if("g12".equals(game_id)){
	if(gss.size()>0){
		gsTemp = gss.firstElement();	
	}
	
	boolean complete = true;
	
	TableRecord forest_highest_gs = app_sm.select(tblgs,"gs_code=?",new Object[]{"forest"},"gs_forest_score1+gs_forest_score2 DESC");
	int forest_highest_score1 = forest_highest_gs.getInt("gs_forest_score1");
	int forest_highest_score2 = forest_highest_gs.getInt("gs_forest_score2");
	
	if(forest_highest_score1 == -1) {
		score1 = "未完成";
		complete = false;
	}else {
		score1 = String.valueOf(forest_highest_score1);
	}
	
	if(forest_highest_score2 == -1) {
		score2 = "未完成";
		complete = false;
	}else {
		score2 = String.valueOf(forest_highest_score2);
	}
	
	if(complete) {
		scoreTotal = String.valueOf(forest_highest_score1+forest_highest_score2);
	}else {
		scoreTotal = "未完成";
	}
	
}

//特別處理兩個遊戲
boolean isPaint = false;
boolean isRecipe = false;
boolean hasPaintScore = false;
String imgPath="";
if("g4".equals(game_id)) {
	isRecipe = true;
	for(TableRecord gsTemp3:gss) {
		if(!"".equals(gsTemp3.getString("gs_recipe_id")) && !"-1".equals(gsTemp3.getString("gs_recipe_id"))){
			id =  gsTemp3.getString("gs_recipe_id");
			imgPath = "../../web/member/images/"+"recipe_"+id+".png";
			break;
		} else if(gsTemp3.getString("gs_recipe_id").isEmpty()) {
			id =  "-1";
		}
	}
	if(imgPath.isEmpty()) {
		imgPath = "../member/images/game_default.jpg";
	}
}else if("g5".equals(game_id)){
	
	isPaint = true;
	
	for(TableRecord gsTemp2:gss) {
	    if(!"".equals(gsTemp2.getString("gs_image")) && !"-1".equals(gsTemp2.getString("gs_image"))) {
	    	imgPath = gsTemp2.getString("gs_image");
	    	break;
	    }
	}
	for(TableRecord gsTemp4:gss) {
		String paintScore = String.valueOf(gsTemp4.getInt("gs_paint_score"));
	    if(! "".equals(paintScore) && ! "-1".equals(paintScore)) {
	        isPaint = false;
	        score1 = paintScore;
	    	break;
	    }
	}
	if(imgPath.isEmpty()) {
		imgPath = "../member/images/game_default.jpg";
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
           <div id="memberId"></div>
            <div class="wrap">

                <!--內頁標題樣式1-->
                <div class="titStyle1">
                    <h2>會員專區</h2>
                </div>

                <ul class="top_bar">

                    <li class="active">
                        <a href="../member/order_list.jsp#memberId">
                            遊戲紀錄
                        </a>
                    </li>
                    <%if(!publish_status) {%>
                    <li>
                        <a href="../member/apply.jsp">
                            申請發文帳號
                        </a>
                    </li>
                    <%} %>
                    <%if(publish_status) %>
                    <li>
                        <a href="../member/post_course.jsp">
                            發布課程資訊
                        </a>
                    </li>

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

                            <div class="leftList active"><!-- 當前模式 class加上active -->
                                <div class="leftList_top">
                                    <a href="../member/order_list.jsp#memberId">
                                        遊戲紀錄
                                    </a>
                                </div>
                            </div>
                            <%if(!publish_status) {%>
                            <div class="leftList">
                                <div class="leftList_top">
                                    <a href="../member/apply.jsp">
                                        申請發文帳號
                                    </a>
                                </div>
                            </div>
                            <%} %>
                            <%if(publish_status) {%>
                            <div class="leftList">
                                <div class="leftList_top">
                                    <a href="../member/post_course.jsp">
                                        發布課程資訊
                                    </a>
                                </div>
                            </div>
                            <%} %>
                        </div>

                    </div>

                    <!--右側-->
                    <div class="right">
                        <!-- 右側_無左選單noleft -->

                        <!--內頁標題樣式2-->
                        <!-- <div class="titStyle2">
                        <h2>ALL</h2>
                        </div> -->

                        <!-- 遊戲紀錄類別列表 -->
                        <ul class="ordergame_bar">
                            <li <%="g12".equals(game_id)?"class='active'":"" %>>
                                <a href="../member/order_list.jsp?game_id=g12">
                                    神秘森林救援
                                </a>
                            </li>
                            
                            <li <%="g11".equals(game_id)?"class='active'":"" %>>
                                <a href="../member/order_list.jsp?game_id=g11">
                                    積木樂園
                                </a>
                            </li>
                            <li <%="g10".equals(game_id)?"class='active'":"" %>>
                                <a href="../member/order_list.jsp?game_id=g10">
                                    花草實驗室
                                </a>
                            </li>
							<li <%="g9".equals(game_id)?"class='active'":"" %>>
                                <a href="../member/order_list.jsp?game_id=g9">
                                    小建築大工程
                                </a>
                            </li>
                            <li <%="g1".equals(game_id)?"class='active'":"" %>>
                                <a href="../member/order_list.jsp?game_id=g1">
                                    誰是航運王
                                </a>
                            </li>
                            <li <%="g2".equals(game_id)?"class='active'":"" %>>
                                <a href="../member/order_list.jsp?game_id=g2">
                                    超級飛修員
                                </a>
                            </li>
                            <li <%="g3".equals(game_id)?"class='active'":"" %>>
                                <a href="../member/order_list.jsp?game_id=g3">
                                    智慧製造洗手乳
                                </a>
                            </li>
                            <li <%="g4".equals(game_id)?"class='active'":"" %>>
                                <a href="../member/order_list.jsp?game_id=g4">
                                    無人商店採購體驗
                                </a>
                            </li>
                            <li <%="g5".equals(game_id)?"class='active'":"" %>>
                                <a href="../member/order_list.jsp?game_id=g5">
                                    彩繪技職樂園
                                </a>
                            </li>

                            
                            <li <%="g6".equals(game_id)?"class='active'":"" %>>
                                <a href="../member/order_list.jsp?game_id=g6">
                                    智能雞舍
                                </a>
                            </li>
                            <li <%="g7".equals(game_id)?"class='active'":"" %>>
                                <a href="../member/order_list.jsp?game_id=g7">
                                    灑網抓魚感測體驗
                                </a>
                            </li>
                            <li <%="g8".equals(game_id)?"class='active'":"" %>>
                                <a href="../member/order_list.jsp?game_id=g8">
                                    農業小幫手
                                </a>
                            </li>

                        </ul>
                              
                        <div class="containerIn">

                            <!-- 遊戲紀錄資訊 -->
                            <ul class="recordArea">

                                <!-- 圖片區塊 -->
                                <li class="img_area">

                                    <!-- 標題
                                    <div class="title">
                                        <div class="content">
                                            無人商店採購
                                        </div>
                                    </div> -->

                                    <!-- 圖片 -->
                                    <!-- 圖片：第一個 -->
                                    <%if(isRecipe) {%>
                                    <div class="img one active">
                                    <img src="<%=imgPath%>"></img>
                                    </div>>
                                    <%} %>
                                    
                                    <%if(isPaint) {%>
                                    <div class="img one active">
                                    <img src="<%=imgPath%>"></img>
                                    </div>>
                                    <%} %>
                                    <div class="img one <%="g1".equals(game_id)?"active":""%>"><!-- 附加active顯示 -->

                                        <!-- 分數定位區域 -->
                                        <div class="imgFractionArea">
          
                                            <?xml version="1.0" encoding="utf-8"?>
                                            <!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                                            <svg version="1.1" id="one_area" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve">
                                                <g id="one" x="925.8" y="356.2" class="st0" width="516.1" height="86.5">
                                                    <text transform="matrix(1 0 0 1 1149.8373 420.3281)" class="score"><%=score1 %></text>
                                                </g>
                                                <g id="one_2" x="1003.8" y="475.2" class="st1" width="438" height="86.5">
                                                    <text transform="matrix(1 0 0 1 1149.8376 539.3012)" class="score"><%=score2 %></text>
                                                </g>
                                                <g id="one_3" x="809.8" y="686.5" class="st2" width="359" height="86.5">
                                                    <text transform="matrix(1 0 0 1 900 750.6296)" class="score"><%=scoreTotal %></text>
                                                </g>
                                            </svg>                                           

                                        </div>
                                        <img src="images/g1.png" width="100%" height="auto">
                                    </div>

                                    <!-- 圖片：第二個 -->
                                    <div class="img two <%="g2".equals(game_id)?"active":""%>">
                                        
                                        <!-- 分數定位區域 -->
                                        <div class="imgFractionArea">

                                            <?xml version="1.0" encoding="utf-8"?>
                                            <!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                                            <svg version="1.1" id="two_area" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve">
                                                <g id="two" x="901.6" y="642.1" class="st0" width="348" height="90">
                                                    <text id="XMLID_29_" transform="matrix(1 0 0 1 1015.3461 710.7993)" class="st1"><%=score1 %></text>
                                                </g>
                                            </svg>

                                        </div>
                                        <img src="images/g2.png" width="100%" height="auto">
                                    </div>

                                    <!-- 圖片：第三個 -->
                                    <div class="img three <%="g3".equals(game_id)?"active":""%>">

                                        <!-- 分數定位區域 -->
                                        <div class="imgFractionArea">
                                            <?xml version="1.0" encoding="utf-8"?>
                                            <!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                                            <svg version="1.1" id="three_area" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve">                                                
                                                <g id="three" x="762.3" y="699.7" class="st0" width="291.7" height="90">
                                                    <text transform="matrix(1 0 0 1 840 765.5912)" class="score"><%=score1 %></text>
                                                </g>
                                                <g id="three_2" x="1061.8" y="881.7" class="st1" width="162.7" height="90">
                                                    <text transform="matrix(1 0 0 1 1070 947.5836)" class="score"><%=score2 %></text>
                                                </g>
                                            </svg>


                                            <!-- <ul>
                                                <li class="total_score">100</li>
                                                <li class="total_score">100</li>
                                            </ul> -->
                                        </div>
                                        <img src="images/g3.png" width="100%" height="auto">
                                    </div>

                                    <!-- 圖片：第四個 -->
                                    <div class="img four <%="g5".equals(game_id) && !isPaint ?"active":""%>">
                                        
                                        <!-- 分數定位區域 -->
                                        <div class="imgFractionArea">

                                            <?xml version="1.0" encoding="utf-8"?>
                                            <!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                                            <svg version="1.1" id="four_area" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve">                                                
                                                <g id="four" x="854.7" y="519.1" class="st0" width="317.5" height="65.4">
                                                    <text id="XMLID_29_" transform="matrix(1 0 0 1 930 589)" class="st1"><%=score1 %></text>
                                                </g>
                                            </svg>
                                        </div>
                                        <img src="images/g4.png" width="100%" height="auto">
                                    </div>

                                    <!-- 圖片：第五個 -->
                                    <div class="img fives <%="g6".equals(game_id)?"active":""%>">

                                        <!-- 分數定位區域 -->
                                        <div class="imgFractionArea">

                                            <?xml version="1.0" encoding="utf-8"?>
                                            <!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                                            <svg version="1.1" id="fives_area" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve">
                                                
                                                <g id="fives" x="992.9" y="375.1" class="st0" width="317.5" height="65.4">
                                                    <text transform="matrix(1 0 0 1 1080 428)" class="score"><%=score1 %></text>
                                                </g>
                                                <g id="fives_2" x="992.9" y="569.1" class="st1" width="317.5" height="65.4">
                                                    <text transform="matrix(1 0 0 1 1080 622)" class="score"><%=score2 %></text>
                                                </g>
                                            </svg>
                                        </div>
                                        <img src="images/g5.png" width="100%" height="auto">
                                    </div>

                                    <!-- 圖片：第六個 -->
                                    <div class="img six <%="g7".equals(game_id)?"active":""%>">

                                        <!-- 分數定位區域 -->
                                        <div class="imgFractionArea">
          
                                            <?xml version="1.0" encoding="utf-8"?>
                                            <!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                                            <svg version="1.1" id="six_area" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve">
                                        
                                                <g id="six" x="1028.7" y="437.5" class="st0"  width="87" height="65.4">
                                                    <text transform="matrix(1 0 0 1 1067 493)" class="score"><%=id %></text>
                                                </g>
                                                <g id="six_2" x="1053.3" y="578.5" class="st1" width="160.7" height="65.4">
                                                    <text transform="matrix(1 0 0 1 1078.3434 632.0337)" class="score"><%=score1 %></text>
                                                </g>
                                                <g id="six_3" x="1053.3" y="716.5" class="st2" width="160.7" height="65.4">
                                                    <text transform="matrix(1 0 0 1 1078.3434 770.0337)" class="total_score"><%=score2 %></text>
                                                </g>
                                            </svg>

                                        </div>
                                        <img src="images/g6.png" width="100%" height="auto">
                                    </div>

                                    <!-- 圖片：第七個 -->
                                    <div class="img seven <%="g8".equals(game_id)?"active":""%>">

                                        <!-- 分數定位區域 -->
                                        <div class="imgFractionArea">

                                            <?xml version="1.0" encoding="utf-8"?>
                                            <!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                                            <svg version="1.1" id="seven_area" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve">
                                                
                                                <g id="seven" x="945.3" y="463" class="st0" width="160.7" height="65.4">
                                                    <text transform="matrix(1 0 0 1 970.3488 516.5394)" class="score"><%=score1 %></text>
                                                </g>
                                                <g id="seven_2" x="1025.7" y="582.4" class="st1" width="160.7" height="65.4">
                                                    <text transform="matrix(1 0 0 1 1050.698 636.0139)" class="score"><%=score2 %></text>
                                                </g>
                                            </svg>

                                        </div>
                                        <img src="images/g7.png" width="100%" height="auto">
                                    </div>
                                    
                                    <div class="img eighth <%="g9".equals(game_id)?"active":""%>"><!-- 附加active顯示 -->

                                        <!-- 分數定位區域 -->
                                        <div class="imgFractionArea">

                                            <?xml version="1.0" encoding="utf-8"?>
                                            <!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve">
                                                
                                                <g id="eighth_2" class="st0">
                                                    <text transform="matrix(1 0 0 1 1550 598)" class="score"><%=score1 %></text>
                                                </g>
                                                <g id="eighth" class="st1">
                                                    <text transform="matrix(1 0 0 1 1550 701)" class="score"><%=score2 %></text>
                                                </g>
                                                <g id="eighth_3" class="st2">
                                                    <text transform="matrix(1 0 0 1 1490 825)" class="total_score"><%=scoreTotal %></text>
                                                </g>
                                            </svg>
                                            
                                        </div>
                                        <img src="images/g8.png" width="100%" height="auto">
                                    </div>
                                    
                                    <div class="img ninth <%="g10".equals(game_id)?"active":""%>"><!-- 附加active顯示 -->

                                        <!-- 分數定位區域 -->
                                        <div class="imgFractionArea">
                                            <?xml version="1.0" encoding="utf-8"?>
                                            <!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                 viewBox="0 0 1919.8 1079.9" style="enable-background:new 0 0 1919.8 1079.9;" xml:space="preserve">

                                            <g id="ninth" class="st0">
                                                <text transform="matrix(1 0 0 1 715 715)" class="score"><%=score1 %></text>
                                            </g>
                                            <g id="ninth_2" class="st1">
                                                <text transform="matrix(1 0 0 1 715 804)" class="score"><%=score2 %></text>
                                            </g>
                                            <g id="ninth_3" class="st2">
                                                <text transform="matrix(1 0 0 1 715 889)" class="score"><%=score3 %></text>
                                            </g>
                                            <g id="ninth_4" class="st3">
                                                <text transform="matrix(1 0 0 1 670 990)" class="total_score"><%=scoreTotal %></text>
                                            </g>
                                            </svg>
                                        </div>
                                        <img src="<%=img %>" width="100%" height="auto">
                                    </div>
                                    
                                    <div class="img tenth <%="g11".equals(game_id)?"active":""%>"><!-- 附加active顯示 -->

                                        <!-- 分數定位區域 -->
                                        <div class="imgFractionArea">
                                            <?xml version="1.0" encoding="utf-8"?>
                                            <!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                                            <svg version="1.1" id="tenth" xmlns="http://www.w3.org/2000/svg"
                                                xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;"
                                                xml:space="preserve">

                                                <!-- <rect x="1244" y="505.7" class="st0" width="219" height="90.9" /> -->
                                                <g id="tenth1" class="st0">
                                                    <text transform="matrix(1 0 0 1 1280 580)" class="score"><%=score1 %></text>
                                                    <%-- 
                                                    <%if(!img.isEmpty()) {%>
                                                    <image transform="matrix(1 0 0 1 400 500)" href="<%=img%>" width="500" height="500"></image>
                                                    <%} %>
                                                    
                                                    <%if(!img2.isEmpty()) {%>
                                                    <image transform="matrix(1 0 0 1 -500 200)" href="<%=img2%>" width="70%" height="70%"></image>
                                                    <%} %>
                                                    --%>
                                                </g>
                                            </svg>                                            
                                        </div>
                                        <img src="./images/g10.png" width="100%" height="auto">
                                    </div>
                                    
                                    <div class="img eleventh <%="g12".equals(game_id)?"active":""%>"><!-- 附加active顯示 -->
                                        <!-- 分數定位區域 -->
                                        <div class="imgFractionArea">

                                            <?xml version="1.0" encoding="utf-8"?>
                                            <!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                                            <svg version="1.1" id="eleventh" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                 viewBox="0 0 1920 1080" style="enable-background:new 0 0 1920 1080;" xml:space="preserve">
                                                <text id="eleventh_1" transform="matrix(1 0 0 1 1110 430)" class=""><%=score1 %></text>
                                                <text id="eleventh_2" transform="matrix(1 0 0 1 1110 539)" class=""><%=score2 %></text>
                                                <text id="eleventh_3" transform="matrix(1 0 0 1 1050 662)" class="score"><%=scoreTotal %></text>
                                            </svg>                                           
                                        </div>
                                        <img src="images/g11.png" width="100%" height="auto">
                                    </div>
                                </li>

                                <!-- 表格區塊 -->
                                <li class="table_area">

                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <!-- <caption>遊戲紀錄資訊</caption> -->
                                        <thead>
                                            <tr>
                                                <th>編號</th>
                                                <th>成績</th>
                                                <th>遊玩日期</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <%int counter = 1;
                                              for(TableRecord gs:gss) {
                                            	  String score;
                                              if("shipping".equals(gs_code)){
                                            	  if(gs.getInt("gs_shipping_score1") == -1 || gs.getInt("gs_shipping_score2") == -1){
                                            		  score = "未完成";
                                            	  }else {
                                            		  score = String.valueOf(gs.getInt("gs_shipping_score1"))+ ";" + String.valueOf(gs.getInt("gs_shipping_score2"));
                                            	  }
                                              }else if("recipe".equals(gs_code)){
                                            	  String idStr = gs.getString("gs_recipe_id");
                                            	  if(idStr.isEmpty()) {
                                            		  idStr = "-1";
                                            	  }
                                            	  int recipeID = Integer.valueOf(idStr);
                                            	  if(recipeID == -1){
                                            		  score = "未完成";
                                            	  }else{
                                            		  score = recipeName[recipeID];
                                            	  }
                                              }else if("paint".equals(gs_code)){
                                            	  if(gs.getInt("gs_paint_score") == -1 && "-1".equals("gs_image")){
                                            		  score="未完成";
                                            	  }else if(gs.getInt("gs_paint_score") == -1) {
                                            		  score = "彩繪";
                                            	  }else {
                                            		  score = String.valueOf(gs.getInt("gs_paint_score"));
                                            	  }
                                              }else if("build".equals(gs_code)){
                                            	  if(gs.getInt("gs_build_score1") == -1 || gs.getInt("gs_build_score2") == -1){
                                            		  score = "未完成";
                                            	  }else {
                                            		  score = String.valueOf(gs.getInt("gs_build_score1") + gs.getInt("gs_build_score2"));
                                            	  }
                                              }else if("flower".equals(gs_code)){
                                            	  if(gs.getInt("gs_flower_score1") == -1 || gs.getInt("gs_flower_score2") == -1 || gs.getInt("gs_flower_score3") == -1){
                                            		  score = "未完成";
                                            	  }else {
                                            		  score = String.valueOf(gs.getInt("gs_flower_score1") + gs.getInt("gs_flower_score2")+gs.getInt("gs_flower_score3"));
                                            	  }
                                              }else if("brick".equals(gs_code)){
                                            	  if(gs.getInt("gs_brick_score") == -1){
                                            		  score = "未完成";
                                            	  }else {
                                            		  score = String.valueOf(gs.getInt("gs_brick_score"));
                                            	  }
                                              }else if("forest".equals(gs_code)){
                                            	  if(gs.getInt("gs_forest_score1") == -1 || gs.getInt("gs_forest_score1") == -1){
                                            		  score = "未完成";
                                            	  }else {
                                            		  score = String.valueOf(gs.getInt("gs_forest_score1") + gs.getInt("gs_forest_score2"));
                                            	  }
                                              }else {
                                            	  if(gs.getInt("gs_"+gs_code+"_score") == -1){
                                            		  
                                            		  score = "未完成";
                                            	  }else{
                                            	       score = String.valueOf(gs.getInt("gs_"+gs_code+"_score"));
                                            	  }
                                              }
                                            	  
                                              %>
                                              
                                            <tr>
                                                <td><%=counter++ %></td>
                                                
                                                <td><%=score %></td>
                                                
                                                <td><%=gs.getString("gs_createdate").substring(0,10) %></td>
                                            </tr>
                                            
                                            <%} %>
                                            
                                        </tbody>

                                     </table>

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
