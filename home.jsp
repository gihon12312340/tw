<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%
String page_code = "index";

//清除紀錄page_code的session
if(session.getAttribute("page_code") != null) {
	session.removeAttribute("page_code");
}

//用於登入後回到原頁
String backURL = request.getRequestURL().toString();
String qString = request.getQueryString();
if(qString != null) {
	//如果有QueryString就補上
	backURL = backURL + "?" + qString;
}
session.setAttribute("backURL",backURL);

Cookie cookie = null;
	Cookie[] cookies = null;
	cookies = request.getCookies();	   	// 取得 cookies 的資料(陣列)

/*-- 會員登入檢查及cookies設定-Start --*/
TableRecord check_member = (TableRecord) session.getAttribute("member");

// 登入狀態確認
boolean isLogin = false;

if (check_member == null) {
	isLogin = false;
} else {
	//session重設，避免發文狀態判定異常
	check_member = app_sm.select(tblmp,check_member.getString("mp_id"));//重新抓一次資料，避免後台更改狀態，前台沒吃到
	session.setAttribute("member",check_member);
	isLogin = true;
}

// 遊戲API所需之cookies設定
String action = StringTool.validString(request.getParameter("action"), "");		// 登入識別碼
	boolean accExist = false;			// 確認儲存帳號的cookies是否存在
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
if(!isLogin) {
	// 未登入時將cookies值設為空
		Cookie uidCookie = new Cookie("uid", "");
		uidCookie.setPath("/");    		// 路徑設定
		uidCookie.setMaxAge(60 * 10);	// 時限:10分鐘
		response.addCookie(uidCookie);
} else {
	// 有登入時將cookies值設為會員帳號
		Cookie uidCookie = new Cookie("uid", check_member.getString("mp_account"));
		uidCookie.setPath("/");    		// 路徑設定
		uidCookie.setMaxAge(60 * 10);	// 時限:10分鐘
		response.addCookie(uidCookie);
} 
/*-- 會員登入檢查及cookies設定-End --*/
/*-- 人流統計(暫時)-Start --*/
	String setHomeHistory  = IDTool.getUID("home", DateTimeTool.dateString(""), 6);
   	/*int pageVisits = Integer.valueOf(SiteSetup.getSetup("ss.home.visits").getString("ss_value")) + 1;
   	
   	// 更新瀏覽人數
    TableRecord ssPage = SiteSetup.getSetup("ss.home.visits");
    ssPage.setUpdate("Web_User");
    ssPage.setValue("ss_value", pageVisits);
    app_sm.update(ssPage);*/
    /*-- 人流統計(暫時)-End --*/

	/*-- 網站訪客人數統計-Start --*/
 	boolean cookieExist = false;		// cookies不存在時才將此訪客進行統計
	if(cookies != null) {
	 	for(int c = 0; c < cookies.length; c++) {
	 		cookie = cookies[c];
	 		if(cookie.getName().equals("webVisits")) {
	 			cookieExist = true;	   	// cookies已存在 -> 該訪客已被統計
	 			break;
	 		}
	 	}
 	}

	int visits = 0;
 	if(!cookieExist) {
 		/*-- 更新訪客統計數量 --*/
 		try {
 			visits = Integer.valueOf(SiteSetup.getSetup("ss.visits").getString("ss_value")) + 1;	
 		} catch(Exception e) {
 			// Error
 		}

 		// 更新瀏覽人數
 	    TableRecord ss = SiteSetup.getSetup("ss.visits");
 	    ss.setUpdate("Web_User");
 	    ss.setValue("ss_value", visits);
 	    app_sm.update(ss);
 		
 		/*-- 設定cookies --*/
 		Cookie visitsCookie = new Cookie("webVisits", "checked");
 		visitsCookie.setMaxAge(60*60*1);	// cookies存在時間:1小時
 		response.addCookie(visitsCookie);	// cookies設定完成
 	} else {
 		// 該訪客已被統計 -> 取出目前統計人數
 		visits = Integer.valueOf(SiteSetup.getSetup("ss.visits").getString("ss_value"));
 	}
 	/*-- 網站訪客人數統計-End --*/
/*-- google登入-Start --*/
	String servername = "";
	if( request.getServerPort()== 80) {
		servername = request.getScheme()+"://"+request.getServerName();
	} 
	String localname = request.getScheme()+"://"+request.getServerName()+":"+request.getLocalPort();
	String googleurl = localname + request.getContextPath() + "/web/member/googlelogin/google_login_action.jsp";
	String loginStr = "https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com%2Fauth%2Fuserinfo.email+https://www.googleapis.com%2Fauth%2Fuserinfo.profile&redirect_uri="+googleurl+"&response_type=code&client_id="+SiteSetup.getText("cp.google_appid.tw");
	
	/*-- google登入-End --*/
	
	//判斷是否有發文帳號
	boolean publish_status = false; //true:可發文 false:不可發文
	if(isLogin) {
		String mp_publish_status = check_member.getString("mp_publish_status");
		if("Y".equals(mp_publish_status)) {
			publish_status = true;
		}
	}
//新訊報報類別
Vector<TableRecord> news_dms = app_sm.selectAll(tbldm,"dm_code=? and dm_lang=?",
		                                        new Object[] {"news_category",lang},"dm_showseq ASC,dm_createdate DESC");
//職業試探常設展類別
Vector<TableRecord> exploration_dms = app_sm.selectAll(tbldm,"dm_code=? and dm_lang=?",
		                                              new Object[]{"career_exploration",lang},
		                                              "dm_showseq ASC,dm_createdate DESC");
//展場活動類別
Vector<TableRecord> activity_dms = app_sm.selectAll(tbldm,"dm_code=? and dm_lang=?",
                                                    new Object[]{"activity_category",lang},
                                                    "dm_showseq ASC,dm_createdate DESC");
//新訊報報資訊
Vector<TableRecord> newsAll_nps = app_sm.selectAll(tblnp,"(np_code=? OR np_code=?) and np_lang=? and np_status=? and np_emitdate<=? and np_restdate>=?",
		                                           new Object[]{"news","post_course",lang,"Y",app_today,app_today},
		                                           "np_emitdate DESC,np_createdate DESC LIMIT 6");
//新訊報報圖片路徑前半段(寫在tag裡面很醜所以拉出來寫在這)
String newsImg = app_fetchpath+"/news/"+lang+"/";
//展場活動資訊
Vector<TableRecord> activityAll_cps = app_sm.selectAll(tblcp,"cp_code=? and cp_lang=?",
		                                               new Object[]{"activity",lang},
		                                               "cp_showseq ASC,cp_showseq DESC LIMIT 6");
//banner圖檔&連結
TableRecord cp_index_banner = app_sm.select(tblcp,"cp_code=? and cp_lang=?"
		                                    ,new Object[]{"index_banner",lang});
String index_banner_img_pc = app_fetchpath+"/index_banner/tw/"+cp_index_banner.getString("cp_image");
String index_banner_img_mobile = app_fetchpath+"/index_banner/tw/"+cp_index_banner.getString("cp_mobile");
String index_banner_url = cp_index_banner.getString("cp_url");
//FB連結
String fbURL = SiteSetup.getSetup("cp.facebook" + "." + lang).getString("ss_text");
//3D實境館連結
String threeDurl = SiteSetup.getSetup("cp.3Durl" + "." + lang).getString("ss_text");
/*-- 頁尾資訊 --*/
String unit1Str = SiteSetup.getSetup("cp.unit1" + "." + lang).getString("ss_text"),			// 指導單位
       unit2Str = SiteSetup.getSetup("cp.unit2" + "." + lang).getString("ss_text"),			// 承辦單位
       unit3Str = SiteSetup.getSetup("cp.unit3" + "." + lang).getString("ss_text"),			// 協辦單位
       coorStr = SiteSetup.getSetup("cp.co-organizer" + "." + lang).getString("ss_text"),	// 協辦館所
       place0 = SiteSetup.getSetup("cp.place0" + "." + lang).getString("ss_text"),
       place1 = SiteSetup.getSetup("cp.place1" + "." + lang).getString("ss_text"),
       place2 = SiteSetup.getSetup("cp.place2" + "." + lang).getString("ss_text"),
       place3 = SiteSetup.getSetup("cp.place3" + "." + lang).getString("ss_text"),
       place4 = SiteSetup.getSetup("cp.place4" + "." + lang).getString("ss_text"),
       headcount0 = SiteSetup.getSetup("cp.headcount0" + "." + lang).getString("ss_text"),
       headcount1 = SiteSetup.getSetup("cp.headcount1" + "." + lang).getString("ss_text"),
       headcount2 = SiteSetup.getSetup("cp.headcount2" + "." + lang).getString("ss_text"),
       headcount3 = SiteSetup.getSetup("cp.headcount3" + "." + lang).getString("ss_text"),
       headcount4 = SiteSetup.getSetup("cp.headcount4" + "." + lang).getString("ss_text");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
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
<link rel="shortcut icon" href="web/images/favicon.png" /><!--電腦版icon-->
<link rel="apple-touch-icon" href="web/images/icon.png" /><!--手機版icon  57x57px-->
<link rel="apple-touch-icon" sizes="72x72" href="web/images/icon-72.png" /><!--手機版icon  72x72px-->
<link rel="apple-touch-icon" sizes="114x114" href="web/images/icon@2.png" /><!--手機版icon  114x114px-->

<link href="web/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="web/css/style_header.css"/>
<link rel="stylesheet" type="text/css" href="web/css/style_footer.css"/>




<!--google material icon-->
<link rel="stylesheet" href="web/icon_fonts/material_icons/material-icons.css">

<!-- 新增 版本更新jQuery modify by Judy 20230113 start -->
<!-- jQuery版本3.6.3 -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" type="text/javascript"></script>
<!-- <script src="web/js/jquery/jquery-3.6.3.min.js" type="text/javascript"></script> -->  <!-- 為了弱掃留原始檔案 -->

<!-- jQuery 遷移插件_簡化從舊版本jQuery的轉換3.4.0-->
<script src="https://code.jquery.com/jquery-migrate-3.4.0.min.js" type="text/javascript"></script>
<!-- <script src="web/js/jquery/jquery-migrate-3.4.0.min.js" type="text/javascript"></script> -->  <!-- 為了弱掃留原始檔案 -->
<!-- 新增 版本更新jQuery modify by Judy 20230113 end -->

<script src="web/js/common.js" type="text/javascript"></script><!--JavaScript共用區-->

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
<link rel="stylesheet" href="web/js/swiper-master/css/swiper-bundle.min.css" />


<!--當卷軸到一定高度時，物件才會出現-->    	
<script type="text/javascript" src="web/js/wow/wow.min.js"></script>
<link rel="stylesheet" type="text/css" href="web/js/animate/animate.css"/>
<script type="text/javascript" src="web/js/wow/wow_example.js"></script>

    

<!-- Noto Sans Traditional Chinese字型 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">


<!--每滑到該區域重複執行-->   
<link rel="stylesheet" type="text/css" href="web/js/aos/aos.css"/>   

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
<link rel="stylesheet" type="text/css" href="web/js/loading_bar/loading-bar.css"/>
<script type="text/javascript" src="web/js/loading_bar/loading-bar.js"></script>

<%-- SEO 讀取關鍵字設定值 (讀取首頁共用值) --%>
<meta name="Robots" content="<%=SiteSetup.getText("seo.robots."+lang) %>" />
<meta name="revisit-after" content="<%=SiteSetup.getText("seo.revisit_after."+lang) %> days" />
<meta name="keywords" content="<%=SiteSetup.getText("seo.keywords."+lang) %>" />
<meta name="copyright" content="<%=SiteSetup.getText("seo.copyright."+lang) %>" />
<meta name="description" content="<%=SiteSetup.getText("seo.description."+lang) %>" />
<%-- 追蹤碼 --%><%=SiteSetup.getText("seo.track."+lang) %>
</head>

<body>
       <script>
			<%-- 關鍵字檢查 --%>
			function checkSearch(F) {
				if (F.search.value.trim() == "") {
			        alert("請輸入關鍵字!!");
			        F.search.focus();
			    } else {
			        return true;
			    }
			    return false;
			}
		</script>
    <%--
    <!--loading畫面-->
    <div id="loading">
        <div class="loading_barBg">
            <!-- <div id="myItem2" class="label-center" data-preset="circle" data-value="35" >                
            </div> data-preset="line"-->

            <!-- data-fill-background 顏色必須和背景一致 -->
            <!-- 背景色 #55728b -->
            <div class="loading_barBgArea">
                <div id="myItem2" class="ldBar label-center" 
                    data-value="0"
                    data-type="fill"
                    data-fill-dir="ltr"
                    data-fill-background="#fff"
                    data-img="web/images/logo.svg"                    
                    data-min="10" 
                    data-max="50"
                    >
                </div>
            </div>
        </div>
    </div>

    <!--loading設定-->
    <script>

        /* construct manually */
        var bar1 = new ldBar("#myItem2");
        /* ldBar stored in the element */
        var bar2 = document.getElementById('myItem2').ldBar;
        bar1.set(100);

        //loading畫面
        $(window).load(function(){
            setTimeout(function(){$('#loading').hide();}, 4000);
            // 延遲隱藏的時間，增加loading顯示的時間
        });

    </script>
  --%>

    <!--電腦版搜尋框效果-->
    <script>
        $(document).ready(function(){
            $("#search_btnPC").click(function () {
                $("#searchArea_inPC").slideToggle(200);
                $(".pc_cart_listArea").removeClass("show");
            });
            
            $("#search_closePC").click(function () {
                $("#searchArea_inPC").slideUp(200);
            });

            $(window).resize(function(e) {
                var win_W = $(window).width(); //螢幕寬度
                if ( win_W > 860 ) {
                    $(".searchArea_inPC").hide();
                }
            });
        });
    </script>   


    <script>
        //PC版_搜尋框伸縮效果
        // $(function(){
        //     $("#search_btnPC").click(function(e) {
        //         $(".search_inAreaPC").toggleClass("active");
        //         e.stopPropagation();
        //     });
            
        //     $(".search_inAreaPC").click(function(e) {
        //         e.stopPropagation();
        //     });
            
        //     $(window).click(function(e) {
        //         $(".search_inAreaPC").removeClass("active");
        //     });
        // });
    </script>    
    
	<!--loading畫面-->
	<!-- <div id="loading" class="loading">
        <div id="circularG">
            <div id="circularG_1" class="circularG"></div>
            <div id="circularG_2" class="circularG"></div>
            <div id="circularG_3" class="circularG"></div>
            <div id="circularG_4" class="circularG"></div>
            <div id="circularG_5" class="circularG"></div>
            <div id="circularG_6" class="circularG"></div>
            <div id="circularG_7" class="circularG"></div>
            <div id="circularG_8" class="circularG"></div>
        </div>
        <div class="loading_tit">
            讀取中
        </div>    
	</div> -->

    
    <div class="headertop" id="top"></div>
    
    <div class="headerArea">

        <!--版頭-->
        <div class="header">
    
            <div class="wrap">

                <!--手機menu按鍵-->
                <div class="menu_btn">
                    <span>
                    </span>
                    <span>
                    </span>
                    <span>
                    </span>
                </div>
                
                
                <!--logo-->
                <h1 class="logo">
                   <a href="home.jsp">
                        <img src="web/images/logo.svg" />
                    </a>
                </h1>            
                
                
                <!---版頭右-->
                <div class="headerRight">

                    <!--主按鍵-->
                    <div class="navbar">
    
                        <!--站內搜尋mobile-->
                        <div class="siteSearch" >                            
                            <div class="siteSearchBg">
                                <form name="form_search" method="post" action="./web/search/search.jsp#searchId" onsubmit="javascript:return checkSearch(this);">
                                <!--<form name="form_search" method="post" action="web/search/search.html" onsubmit="return search_checkform(this)">-->
                                    <input type="text" placeholder="Search" name="search" id="search" value=""/>
                                    <label>
                                        <i class="material-icons">&#xE8B6;</i>
                                        <input type="submit" />
                                    </label>
                                </form>
                            </div>
                        </div>
    
                        <!--學習專區-->
                        <div class="nav">
                            <a href="javascript:void(0);">
                                學習專區
                            </a> 
                            <!--主按鍵展開-->
                            <div class="navOpen pc">
                                <div class="navOpenBg">

                                    <div class="navOpenList">
                                        <a href="web/learn/learn.jsp#learnId">
                                            認識技職教育
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="web/learn/highschool.jsp#learnId">
                                            升學技高 (15群科)
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="web/learn/five_yearcollege.jsp#learnId">
                                            升學五專
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="web/learn/university.jsp#learnId">
                                            升學四技、二專(統一入學測驗20群類)
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="web/learn/article.jsp#learnId">
                                            技職好「文」
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="web/learn/video.jsp#learnId">
                                            技職有「影」
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="navOpen mobile">
                                <div class="navOpenBg">

                                    <div class="navOpenList">
                                        <a href="web/learn/learn.jsp#learnId">
                                            認識技職教育
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="web/learn/highschool.jsp#learnId">
                                            升學技高 (十五群科)
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="web/learn/five_yearcollege.jsp#learnId">
                                            升學五專
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="web/learn/university.jsp#learnId">
                                            升學四技、二專(統一入學測驗20群類)
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="web/learn/article.jsp#learnId">
                                            技職好「文」
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="web/learn/video.jsp#learnId">
                                            技職有「影」
                                        </a>
                                    </div>
                                </div>
                            </div>     
                        </div>    
  
                        <!--實作環境參訪-->
                        <div class="nav">
                            <a href="javascript:void(0);">
                                實作環境參訪
                            </a> 
                            <!--主按鍵展開-->
                            <div class="navOpen pc">
                                <div class="navOpenBg">

                                    <div class="navOpenList">
                                        <a href="web/implement/know.jsp#implementId">
                                            技職實作環境
                                        </a>
                                    </div>
 
                                    <div class="navOpenList">
                                        <a href="web/implement/implement2_1.jsp#implementId">
                                            報名參訪體驗資訊
                                        </a>
                                    </div>

                                </div>
                            </div>

                            <div class="navOpen mobile">
                                <div class="navOpenBg">

                                    <div class="navOpenList">
                                        <a href="web/implement/know.jsp#implementId">
                                            技職實作環境
                                        </a>
                                    </div>
  
                                    <div class="navOpenList">
                                        <a href="web/implement/implement2_1.jsp#implementId">
                                            報名參訪體驗資訊
                                        </a>
                                    </div>
 
                                </div>
                            </div>     
                        </div> 
  
                        <!--技職教育好夥伴-->
                        <div class="nav">
                            <a href="web/technical/technical.jsp#technicalId">
                                技職教育好夥伴
                            </a>     
                        </div> 

                        <!--加入/登入會員-->
                        <div class="nav">
                            <a href="javascript:void(0);">
                                <%if(!isLogin) { %>
                                加入/登入會員
                                <%} else {%>
                                會員專區
                                <% }%>
                            </a> 
                            <!--主按鍵展開-->
                            <div class="navOpen pc">
                                <div class="navOpenBg">

                                    <div class="navOpenList">
                                        <%if(!isLogin) {%>
                                        <a href="<%=loginStr%>">
                                        登入 / 加入會員
                                        </a>
                                        <%}else {%>
                                        <a href="web/member/member_1.jsp?code=logout">
                                        登出
                                        </a>
                                        <%} %>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="web/member/order_list.jsp#memberId">
                                            會員遊戲記錄
                                        </a>
                                    </div>
                                    <%if(!publish_status) {%>
                                    <div class="navOpenList">
                                        <a href="web/member/apply.jsp#memberId">
                                            申請發文帳號
                                        </a>
                                    </div>
                                    <%} %>
                                    <%if(publish_status) {%>
                                    <div class="navOpenList">
                                        <a href="web/member/post_course.jsp#memberId">
                                            發布課程資訊
                                        </a>
                                    </div>
                                    <%} %>
                                </div>
                            </div>

                            <div class="navOpen mobile">
                                <div class="navOpenBg">

                                    <div class="navOpenList">
                                        <%if(!isLogin) {%>
                                        <a href="<%=loginStr%>">
                                        登入 / 加入會員
                                        </a>
                                        <%}else {%>
                                        <a href="web/member/member_1.jsp?code=logout">
                                        登出
                                        </a>
                                        <%} %>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="web/member/order_list.jsp#memberId">
                                            會員遊戲記錄
                                        </a>
                                    </div>
                                    <%if(!publish_status) {%>
                                    <div class="navOpenList">
                                        <a href="web/member/apply.jsp#memberId">
                                            申請發文帳號
                                        </a>
                                    </div>
                                    <%} %>
                                    <%if(publish_status) {%>
                                    <div class="navOpenList">
                                        <a href="web/member/post_course.jsp#memberId">
                                            發布課程資訊
                                        </a>
                                    </div>
                                    <%} %>
                                </div>
                            </div>  
                        </div> 
                        
                    </div>
                    
                    <!-- 版頭連結 -->
                    <ul class="headerRightLink">
                        <li>
                            <a href="#indexSitetop">
                                <img src="web/images/site_icon.svg" alt="">
                            </a>
                        </li>
                        <li>
                            <a target="_blank" href="<%=fbURL%>">
                                <img src="web/images/fb_icon.svg" alt="">
                            </a>
                        </li>
                    </ul>

                    <!--版頭商品搜尋-->
                    <div class="header_search_area">
                       <form name="frm1" id="frm1" method="post" action="./web/search/search.jsp#searchId" onsubmit="javascript:return checkSearch(this);">
                        <div class="header_search">
                            <input type="text" placeholder="搜尋" name="search" id="search" />

                            <label>
                                <img src="web/images/search_icon.svg" alt="">
                                <!-- <i class="material-icons"></i> -->
                                <input type="submit" value=""  />
                            </label>
                        </div>
                       </form>
                    </div>

                </div>                
 
                <div class="clearfloat">
                </div>
                
            </div>

        </div>    
    
    </div>
    


    
    <!--main-->
    <div class="main index_main">

        <!-- 首頁banner區 -->
        <div class="bannerArea">

            <!-- 首頁banner區PC -->
            <div class="pcBannerArea">

                <!-- banner圖片按鍵 -->
                <div class="indexbannerImg">
                    <!-- <img src="web/index/images/banner.png" alt="" >   -->
                    <img id="Image-Maps-Com-image-maps-2022-02-14-034647" src="<%=index_banner_img_pc %>" border="0" width="4001" height="2563" orgWidth="4001" orgHeight="2563" usemap="#image-maps-2022-02-14-034647" alt="" />
                    <map name="image-maps-2022-02-14-034647" id="ImageMapsCom-image-maps-2022-02-14-034647">
                        <area shape="rect" coords="3999,2561,4001,2563" alt="Image Map" style="outline:none;" title="Image Map" href="http://www.image-maps.com/index.php?aff=mapped_users_0" />
                        <area  alt="" title="新訊報報"       href="<%=index_banner_url %>"          shape="poly" coords="192,240,150,1205,1337,942,1332,92" style="outline:none;" target="_self"     />
                        <area  alt="" title="梅克獅養成遊戲" href="web/game/game_mex.jsp#gameInId"  shape="poly" coords="1395,190,1525,564,1464,660,1429,715,1393,1183,1519,1353,1767,1413,1888,1411,1983,1341,1992,1264,2044,930,2205,729,2439,390,2367,145,1398,145" style="outline:none;" target="_blank"     />
                        <area  alt="" title="實境館"       href="<%=SiteSetup.getText("cp.3Durl."+lang) %>"               shape="poly" coords="516,1278,301,1464,270,1587,208,1687,196,1855,327,1954,784,2019,1036,2193,1482,2181,1726,2104,1851,1983,1762,1669,1383,1617,1309,1444,975,1249,705,1216" style="outline:none;" target="_blank"     />
                        <area  alt="" title="互動體驗遊戲"   href="web/game/game.jsp#gameId"            shape="poly" coords="2734,253,2518,546,2589,685,2575,835,2863,940,3076,823,3223,730,3660,717,3846,643,3945,553,3948,331,3826,166,3220,156,2986,244" style="outline:none;" target="_self"     />
                        <area  alt="" title="職業試探常設展" href="web/career_exploration/career_exploration.jsp#careerId" shape="poly" coords="3000,1318,2175,1309,2061,1447,2200,1861,2370,1948,2581,2041,3006,1995,3535,2518,3975,1546,3940,1500,3796,1569,3525,877,3025,946" style="outline:none;" target="_self"     />
                    </map>
                </div>

                <!-- banner星星 -->
                <div class="indexbannerStar">
                    <img src="web/index/images/banner_star.svg" alt="" >   
                </div>
           
                <!-- banner火箭 -->
                <div class="indexbannerRocket">
                    <img src="web/index/images/banner_rocketbg.png" alt="" >   
                </div>
           
                <!-- banner底 -->
                <div class="indexbannerBg">
                    <img src="web/index/images/banner_bg.png" alt="" >     
                </div>

            </div>

            <!-- 首頁banner區mobile -->
            <div class="mobileBannerArea">

                <!-- banner圖片按鍵 -->
                <div class="mobilebannerImg">

                    <!-- <img src="web/index/images/banner_mobile.png" alt="" >   -->
                    <img id="Image-Maps-Com-image-maps-2022-02-25-051948" src="<%=index_banner_img_mobile %>" border="0" width="1333" height="3729" orgWidth="1333" orgHeight="3729" usemap="#image-maps-2022-02-25-051948" alt="" />
                    <map name="image-maps-2022-02-25-051948" id="ImageMapsCom-image-maps-2022-02-25-051948">
                    <area  alt="" title="新訊報報" href="<%=index_banner_url %>" shape="rect" coords="89,173,766,730" style="outline:none;" target="_self"     />
                    <area  alt="" title="互動體驗遊戲" href="web/game/game.jsp#gameId" shape="rect" coords="22,819,1208,1436" style="outline:none;" target="_self"     />
                    <area  alt="" title="梅克獅養成遊戲" href="web/game/game_mex.jsp#gameInId" shape="rect" coords="24,1484,1076,2280" style="outline:none;" target="_blank"     />
                    <area  alt="" title="3D實境館" href="<%=threeDurl %>" shape="rect" coords="40,2364,1218,2803" style="outline:none;" target="_blank"     />
                    <area  alt="" title="職業試探常設展" href="web/career_exploration/career_exploration.jsp#careerId" shape="rect" coords="18,2819,1060,3628" style="outline:none;" target="_self"     />
                    <area shape="rect" coords="1331,3727,1333,3729" alt="Image Map" style="outline:none;" title="Image Map" href="http://www.image-maps.com/index.php?aff=mapped_users_0" />
                    </map>
                    
                </div>

                <!-- banner星球 -->
                <div class="mobilebannerPlanet">
                    <img src="web/index/images/banner_planet.svg" alt="" >   
                </div>

                <!-- banner星星 -->
                <div class="mobilebannerStar">
                    <img src="web/index/images/banner_star.svg" alt="" >   
                </div>

                <!-- banner火箭 -->
                <div class="mobilebannerRocket">
                    <img src="web/index/images/banner_mobile_rocketbg.png" alt="" >   
                </div>
                
                <!-- banner底 -->
                <div class="mobilebannerBg">
                    <img src="web/index/images/banner_mobile_bg.png" alt="" >     
                </div>

            </div>
            
        </div>

        <!-- 首頁最新消息區 -->
        <div class="indexNABg">
            
            <div class="wrap">
                
                <div class="index_tit">
                    <h2>新訊報報</h2>
                </div>
 
                <!--頁籤區 開始-->
                <!--頁籤變下拉選單特效 開始 不用的話刪除-->
                <!-- <script type="text/javascript">
                    $(document).ready(function(e) {
                        $(".indexNABg .tabs_btn_now").click(function(e) {
                            $(".indexNABg .img-scroll").slideToggle();
                        });
                        
                        $(".indexNABg .tabs li span").click(function(e) {
                            var tabsText = $(this).text();
                            var bodywidth=document.documentElement.clientWidth;//取得螢幕可見寬度
                            
                            $(".indexNABg .tabs_btn_now span").replaceWith('<span>'+tabsText+'</span>');
                            if ( bodywidth <= 980 ) {
                                $(".indexNABg .img-scroll").slideToggle();
                            }
                        });
                        
                        $(window).resize(function(e) {
                            $(".indexNABg .img-scroll").removeAttr("style");
                        });
                    });
                </script> -->
                <!--頁籤變下拉選單特效 結束-->
                
                <script type="text/javascript" src="web/js/tags_switching2.js"></script>

                <div class="tab_area">
                                
                    <div class="tabs_btn_now"><!--變下拉選單時用 不用時可以刪除-->
                        <span>ALL</span>
                        <div class="tabs_btn_now_arrow">
                        </div>
                    </div>
                    <!-- <div class="tab_area"> -->
                    <div class="img-scroll">
                        <div class="img-list">
                            <ul class="tabs">
                                <li class="active">
                                    <span href="#tab1">
                                        ALL
                                    </span>
                                </li>
                                <%
                                int counter = 2;//tab1保留給ALL，所以從2開始
                                for(TableRecord dm:news_dms) { %>
                                <li>
                                    <span href="#tab<%=counter++%>">
                                        <%=dm.getString("dm_title") %>
                                    </span>
                                </li>
                                <%} %>
                            </ul>
                        </div>
                    </div>
                    <!-- </div> -->
                    <!--頁籤區 結束-->
            
                </div>

                <!--產品內頁頁籤的網編區-->
                <div class="p_tab_text_area">
                
                    <div id="tab1">
                    
                        <div class="indexNA_wrap">

                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>

                            <!-- Swiper -->
                            <div class="swiper mySwiper indexNAone">
                                
                                <div class="swiper-wrapper">
                                    <%for(TableRecord np:newsAll_nps) {
                                    	//System.out.println("img : "+np.getString("np_image"));
                                    	String imgPath = "";
                                    	if("news".equals(np.getString("np_code"))) {
                                          imgPath = app_fetchpath+"/"+"news"+"/"+lang+"/"+np.getString("np_image");
                                        } else if("post_course".equals(np.getString("np_code"))) {
                                        	String np_upcategory = np.getString("np_upcategory");
                                        	TableRecord cp_post_course =app_sm.select(tblcp,np_upcategory);
                                        	imgPath = app_fetchpath+"/"+"post_course"+"/"+lang+"/"+cp_post_course.getString("cp_image");
                                        }
                                    %>
                                    <div class="swiper-slide">
                                        <!-- 首頁最新消息列表 -->
                                        <div class="indexNAList">

                                            <div class="indexNAListIn">

                                                <!-- 首頁最新消息列表圖 -->
                                                <div class="indexNAimg">
                                                    <a href="web/news/news_in.jsp?np_id=<%=np.getString("np_id")%>#newsId">
                                                        <img src="<%=imgPath%>"/>
                                                    </a>
                                                </div> 
                                                
                                                <div class="indexNAbottom">

                                                    <!-- 首頁最新消息列表標題 -->
                                                    <h3>
                                                        <a href="web/news/news_in.jsp?np_id=<%=np.getString("np_id")%>#newsId">
                                                            <%=np.getString("np_title") %>
                                                        </a>
                                                    </h3>
                                                    <div class="date">
                                                        <%=np.getString("np_emitdate") %>
                                                    </div>
                                                    <div class="btn">
                                                        <a href="web/news/news_in.jsp?np_id=<%=np.getString("np_id")%>#newsId">
                                                            more
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        
                                        </div>
                                    </div>
                                    <%} %>
                                </div>

                                <!-- <div class="swiper-pagination"></div> -->

                            </div>

                                
                            <!-- Swiper 8.0.6 JS -->
                            <script src="web/js/swiper-master/js/swiper-bundle.min.js"></script>
                            
                            <!-- Initialize Swiper -->
                            <script>
                           
                            	 var swiper = new Swiper(".mySwiper.indexNAone", {
                                     
                                     //autoHeight: true,
                                     //slidesPerGroup : 6,                            
                                     slidesPerColumnFill : 'column', //多行佈局中以什麼形式填充列（column）和行（row）。類型：string，默認：column。
                                     
                                     slidesPerView: 1,
                                     slidesPerColumn : 1,  //顯示1行
                                     grid: {
                                         rows: 1,
                                     },
                                     spaceBetween: 10,
                                     //slidesOffsetBefore : 100,  //設定slide與左邊框的預設偏移量（單位px）。類型：number，默認：0。
                                     //slidesOffsetAfter : 10,   //設定slide與右邊框的預設偏移量（單位px）。類型：number，默認：0。
                                     pagination: {
                                         el: ".indexNAone .swiper-pagination",
                                         clickable: true,
                                     },
                                     navigation: {
                                         nextEl: "#tab1 .swiper-button-next",
                                         prevEl: "#tab1 .swiper-button-prev",
                                     },
                                     breakpoints: {
                                         //當寬度大於等於375
                                         // 375: {
                                         //     slidesPerView: 1,
                                         //     spaceBetween: 0,
                                         // },
                                         //當寬度大於等於990
                                         990: {
                                             slidesPerView: 3,
                                             slidesPerColumn : 2,  //顯示2行
                                             grid: {
                                                 rows: 2,
                                             },
                                             spaceBetween: 20,
                                         },
                                     },
                                 });
                         
                                
                            </script>

                        </div>
                        
                    </div>
                    <%
                    int counter2 = 2;
                    for(TableRecord dm:news_dms){
                    %>
                    <div id="tab<%=counter2%>">
                    
                        <div class="indexNA_wrap">

                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>

                            <!-- Swiper -->
                            <div class="swiper mySwiper indexNA<%=counter2%>">
                                 <% Vector<TableRecord> nps_check = app_sm.selectAll(tblnp,"(np_code=? OR np_code=?) and np_status=? and np_lang=? and np_category=? and np_emitdate<=? and np_restdate>=?",
                                    		                                     new Object[]{"news","post_course","Y",lang,dm.getString("dm_id"),app_today,app_today},
                                    		                                     "np_emitdate DESC,np_createdate DESC");%>
                                <div class="swiper-wrapper <%=nps_check.size() == 4 || nps_check.size() == 3 ?"act":""%>">
                                    <%Vector<TableRecord> nps = app_sm.selectAll(tblnp,"(np_code=? OR np_code=?) and np_status=? and np_lang=? and np_category=? and np_emitdate<=? and np_restdate>=?",
                                    		                                     new Object[]{"news","post_course","Y",lang,dm.getString("dm_id"),app_today,app_today},
                                    		                                     "np_emitdate DESC,np_createdate DESC");
                                    for (TableRecord np:nps){
                                    	String imgPath = "";
                                    	if("news".equals(np.getString("np_code"))) {
                                          imgPath = app_fetchpath+"/"+"news"+"/"+lang+"/"+np.getString("np_image");
                                        } else if("post_course".equals(np.getString("np_code"))) {
                                        	String np_upcategory = np.getString("np_upcategory");
                                        	TableRecord cp_post_course =app_sm.select(tblcp,np_upcategory);
                                        	imgPath = app_fetchpath+"/"+"post_course"+"/"+lang+"/"+cp_post_course.getString("cp_image");
                                        }
                                    %>
                                    <div class="swiper-slide">
                                        <!-- 首頁最新消息列表 -->
                                        <div class="indexNAList">

                                            <div class="indexNAListIn">

                                                <!-- 首頁最新消息列表圖 -->
                                                <div class="indexNAimg">
                                                    <a href="web/news/news_in.jsp?np_id=<%=np.getString("np_id")%>">
                                                        <img src="<%=imgPath%>"/>
                                                    </a>
                                                </div> 
                                                
                                                <div class="indexNAbottom">

                                                    <!-- 首頁最新消息列表標題 -->
                                                    <h3>
                                                        <a href="web/news/news_in.jsp?np_id=<%=np.getString("np_id")%>">
                                                            <%=np.getString("np_title") %>
                                                        </a>
                                                    </h3>
                                                    <div class="date">
                                                        <%=np.getString("np_emitdate") %>
                                                    </div>
                                                    <div class="btn">
                                                        <a href="web/news/news_in.jsp?np_id=<%=np.getString("np_id")%>">
                                                            more
                                                        </a>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <%} %>                                 
                                    

                                </div>

                                <!-- <div class="swiper-pagination"></div> -->

                            </div>

                                
                            <!-- Swiper JS -->
                            <!-- <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script> -->
                            
                            <!-- Initialize Swiper -->
                            <script>

                                var swiper = new Swiper(".mySwiper.indexNA<%=counter2%>", {
                                    
                                    //autoHeight: true,
                                    //slidesPerGroup : 6,                            
                                    slidesPerColumnFill : 'column', //多行佈局中以什麼形式填充列（column）和行（row）。類型：string，默認：column。
                                    
                                    slidesPerView: 1,
                                    slidesPerColumn : 1,  //顯示1行
                                    grid: {
                                        rows: 1,
                                    },
                                    spaceBetween: 10,
                                    //slidesOffsetBefore : 100,  //設定slide與左邊框的預設偏移量（單位px）。類型：number，默認：0。
                                    //slidesOffsetAfter : 10,   //設定slide與右邊框的預設偏移量（單位px）。類型：number，默認：0。
                                    pagination: {
                                        el: ".indexNA<%=counter2%> .swiper-pagination",
                                        clickable: true,
                                    },
                                    navigation: {
                                        nextEl: "#tab<%=counter2%> .swiper-button-next",
                                        prevEl: "#tab<%=counter2%> .swiper-button-prev",
                                    },
                                    breakpoints: {
                                        //當寬度大於等於375
                                        // 375: {
                                        //     slidesPerView: 1,
                                        //     spaceBetween: 0,
                                        // },
                                        //當寬度大於等於990
                                        991: {
                                            slidesPerView: 3,
                                            slidesPerColumn : 2,  //顯示2行
                                            grid: {
                                                rows: 2,
                                            },
                                            spaceBetween: 20,
                                        },
                                    },
                                });
                            </script>

                        </div>
                        
                    </div>
                    
                    <%counter2++;} %>
                    
                   </div>
              <div class="btnArea">
                    <a href="web/news/news.jsp#nawId">
                        more
                    </a>
               </div>
               <!-- 首頁最新消息星球icon -->
                <div class="indexNAplanet_icon">
                    <img src="web/images/planet_icon.svg" alt="">
                </div>
           </div> 
        </div>       
               <!-- 更多內容 -->
               
                    

        <!-- 首頁展場活動區 -->
        <div class="indexActBg">
            
            <div class="wrap">
                
                <div class="index_tit">
                    <h2>展場活動</h2>
                </div>
 
                <!--頁籤區 開始-->
                <!--頁籤變下拉選單特效 開始 不用的話刪除-->
                <!-- <script type="text/javascript">
                    $(document).ready(function(e) {
                        $(".indexActBg .tabs_btn_now").click(function(e) {
                            $(".indexActBg .img-scroll").slideToggle();
                        });
                        
                        $(".indexActBg .tabs li span").click(function(e) {
                            var tabsText = $(this).text();
                            var bodywidth=document.documentElement.clientWidth;//取得螢幕可見寬度
                            
                            $(".indexActBg .tabs_btn_now span").replaceWith('<span>'+tabsText+'</span>');
                            if ( bodywidth <= 980 ) {
                                $(".indexActBg .img-scroll").slideToggle();
                            }
                        });
                        
                        $(window).resize(function(e) {
                            $(".indexActBg .img-scroll").removeAttr("style");
                        });
                    });
                </script> -->
                <!--頁籤變下拉選單特效 結束-->
                
                <script type="text/javascript" src="web/js/tags_switching3.js"></script>
        
                <div class="tab_area">
                
                    <div class="tabs_btn_now"><!--變下拉選單時用 不用時可以刪除-->
                        <span>ALL</span>
                        <div class="tabs_btn_now_arrow">
                        </div>
                    </div>
                    <!-- <div class="tab_area"> -->
                    <div class="img-scroll">
                        <div class="img-list">
                            <ul class="tabs">
                                <li class="active">
                                    <span href="#tab<%=counter++%>">
                                        ALL
                                    </span>
                                </li>
                                <%for(TableRecord dm:activity_dms) { %>
                                <li>
                                    <span href="#tab<%=counter++%>">
                                        <%=dm.getString("dm_title") %>
                                    </span>
                                </li>
                                <%} %>
                            </ul>
                        </div>
                    </div>
                    <!-- </div> -->
                    <!--頁籤區 結束-->
            
                </div>
        
                <!--產品內頁頁籤的網編區-->
                <div class="p_tab_text_area">
                
                    <div id="tab<%=counter2++%>">
                    
                        <div class="indexAct_wrap">
                            <%for(TableRecord cp:activityAll_cps) { 
                            String dm_title = app_sm.select(tbldm,cp.getString("cp_category")).getString("dm_title");
                            %>
                            <!-- 首頁展場活動列表 -->
                            <div class="indexActList">
                                <div class="tag"><%=dm_title %></div>
                                <h3>
                                    <a href="web/activity/activity_in.jsp?cp_id=<%=cp.getString("cp_id")%>#activityId">
                                       <%=cp.getString("cp_title") %>
                                    </a>
                                </h3>
                            </div>
                            <%} %>
                        </div>
                        
                    </div>
                    <%for(TableRecord dm:activity_dms) {%>
                    <div id="tab<%=counter2++%>">
                    
                        <div class="indexAct_wrap">
                            <%Vector<TableRecord> cps = app_sm.selectAll(tblcp,"cp_code=? and cp_lang=? and cp_category=?",
                            		                                      new Object[]{"activity",lang,dm.getString("dm_id")},
                            		                                      "cp_showseq ASC,cp_createdate DESC LIMIT 6");
                            
                            for(TableRecord cp:cps) {
                            %>
                            <!-- 首頁展場活動列表 -->
                            <div class="indexActList">
                                <div class="tag"><%=dm.getString("dm_title") %></div>
                                <h3>
                                    <a href="web/activity/activity_in.jsp?cp_id=<%=cp.getString("cp_id")%>#activityId">
                                        <%=cp.getString("cp_title") %>
                                    </a>
                                </h3>
                            </div>
                            <%}%>
                        </div>
                        
                    </div>
                    <%} %>
                </div> 

                <!-- 更多內容 -->
                <div class="btnArea">
                    <a href="web/activity/activity.jsp#activityId">
                        more
                    </a>
                </div>

                <!-- 首頁展場活動星球icon -->
                <div class="indexActplanet_icon">
                    <img src="web/images/planet_icon2.svg" alt="">
                </div>

            </div>
                
        </div> 

        <div class="indexSitetop" id="indexSitetop"></div>
        <!-- 首頁網站地圖區 -->
        <div class="indexSiteBg">
            
            <div class="wrap">
                
                <div class="index_tit">
                    <h2>網站地圖</h2>
                </div>
 
                <div class="indexSiteArea">

                    <!-- 網站地圖列表：新訊報報 -->
                    <div class="indexSiteList ">
                        <div class="indexSiteListIn">

                            <!-- 網站地圖列表標題 -->
                            <h3>
                                <a href="javascript:void(0);">新訊報報</a>
                            </h3>

                            <!-- 網站地圖列表內容 -->
                            <ul>
                                <li>
                                    <a href="web/news/news.jsp#nawId">
                                        ALL
                                    </a>
                                </li>
                                <%for(TableRecord dm:news_dms) {%>
                                <li>
                                    <a href="web/news/news.jsp?dm_id=<%=dm.getString("dm_id")%>#nawId">
                                        <%=dm.getString("dm_title") %>
                                    </a>
                                </li>
                                <%} %>
                            </ul>

                        </div>
                    </div>

                    <!-- 網站地圖列表：3D實境館 -->
                    <div class="indexSiteList">
                        <div class="indexSiteListIn">

                            <!-- 網站地圖列表標題 -->
                            <h3>                                 
                                <a href="<%=threeDurl%>" target="_blank">3D實境館</a>
                            </h3>

                        </div>
                    </div>

                    <!-- 網站地圖列表：職業試探常設展 -->
                    <div class="indexSiteList">
                        <div class="indexSiteListIn">

                            <!-- 網站地圖列表標題 -->
                            <h3>
                                <a href="javascript:void(0);">職業試探常設展</a>
                            </h3>

                            <!-- 網站地圖列表內容 -->
                            <ul>
                                <%for(TableRecord dm:exploration_dms) {%>
                                <li>
                                    <a href="web/career_exploration/career_exploration.jsp?dm_id=<%=dm.getString("dm_id")%>#careerId">
                                        <%=dm.getString("dm_title") %>
                                    </a>
                                </li>
                                <%} %>
                            </ul>

                        </div>
                    </div>

                    <!-- 網站地圖列表：展場活動 -->
                    <div class="indexSiteList">
                        <div class="indexSiteListIn">

                            <!-- 網站地圖列表標題 -->
                            <h3>
                                <a href="javascript:void(0);">展場活動</a>
                            </h3>

                            <!-- 網站地圖列表內容 -->
                            <ul>
                                <li>
                                    <a href="web/activity/activity.jsp#activityId">
                                        ALL
                                    </a>
                                </li>
                                <%for(TableRecord dm:activity_dms) {%>
                                <li>
                                    <a href="web/activity/activity.jsp?dm_id=<%=dm.getString("dm_id")%>#activityId">
                                        <%=dm.getString("dm_title") %>
                                    </a>
                                </li>
                                <%} %>
                            </ul>

                        </div>
                    </div>


                    <!-- 網站地圖列表：梅克獅養成遊戲 -->
                    <div class="indexSiteList">
                        <div class="indexSiteListIn">

                            <!-- 網站地圖列表標題 -->
                            <h3>
                                <a href="web/game/game_mex.jsp#gameInId" target="_blank">
                                    梅克獅養成遊戲
                                </a>
                            </h3>

                        </div>
                    </div>

                    <!-- 網站地圖列表：互動體驗遊戲 -->
                    <div class="indexSiteList">
                        <div class="indexSiteListIn">

                            <!-- 網站地圖列表標題 -->
                            <h3>
                                <a href="javascript:void(0);">互動體驗遊戲</a>
                            </h3>

                            <!-- 網站地圖列表內容 -->
                            <ul>
                              <li class="new">
                                <a href="web/game/game_in.jsp?game_id=g15#gameInId">
                                  快門冒險
                                  <span>NEW</span>
                                </a>
                              </li>
                              <li class="new">
                                <a href="web/game/game_in.jsp?game_id=g14#gameInId">
                                  魔法寶石大冒險
                                  <span>NEW</span>
                                </a>
                              </li>
                              <li class="new">
                                <a href="web/game/game_in.jsp?game_id=g13#gameInId">
                                  經營大亨
                                  <span>NEW</span>
                                </a>
                              </li>
                              <li>
                                <a href="web/game/game_in.jsp?game_id=g12#gameInId"> 神秘森林救援任務 </a>
                              </li>
                              <li>
                                <a href="web/game/game_in.jsp?game_id=g11#gameInId"> 積木樂園 </a>
                              </li>

                              <li>
                                <a href="web/game/game_in.jsp?game_id=g10#gameInId"> 花草實驗室 </a>
                              </li>
                              <li>
                                <a href="web/game/game_in.jsp?game_id=g9#gameInId"> 小建築大工程 </a>
                              </li>
                              <li>
                                <a href="web/game/game_in.jsp?game_id=g1#gameInId"> 誰是航運王 </a>
                              </li>
                              <li>
                                <a href="web/game/game_in.jsp?game_id=g2#gameInId"> 超級飛修員 </a>
                              </li>
                              <li>
                                <a href="web/game/game_in.jsp?game_id=g3#gameInId"> 智慧製造洗手乳 </a>
                              </li>
                              <li>
                                <a href="web/game/game_in.jsp?game_id=g4#gameInId"> 無人商店採購 </a>
                              </li>
                              <li>
                                <a href="web/game/game_in.jsp?game_id=g5#gameInId"> 彩繪技職樂園 </a>
                              </li>
                              <li>
                                <a href="web/game/game_in.jsp?game_id=g6#gameInId"> 智能雞舍 </a>
                              </li>
                              <li>
                                <a href="web/game/game_in.jsp?game_id=g7#gameInId"> 撒網抓魚感測 </a>
                              </li>
                              <li>
                                <a href="web/game/game_in.jsp?game_id=g8#gameInId"> 農業小幫手 </a>
                              </li>
                            </ul>

                        </div>
                    </div>

                    <!-- 網站地圖列表：學習專區 -->
                    <div class="indexSiteList">
                        <div class="indexSiteListIn">

                            <!-- 網站地圖列表標題 -->
                            <h3>
                                <a href="javascript:void(0);">學習專區</a>
                            </h3>

                            <!-- 網站地圖列表內容 -->
                            <ul>
                                <li>
                                    <a href="web/learn/learn.jsp#learnId">
                                        認識技職教育
                                    </a>
                                </li>
                                <li>
                                    <a href="web/learn/highschool.jsp#learnId">
                                        升學技高 (15群科)
                                    </a>
                                </li>
                                <li>
                                    <a href="web/learn/five_yearcollege.jsp#learnId">
                                        升學五專
                                    </a>
                                </li>
                                <li>
                                    <a href="web/learn/university.jsp#learnId">
                                        升學四技、二專(統一入學測驗20群類)
                                    </a>
                                </li>
                                <li>
                                    <a href="web/learn/article.jsp#learnId">
                                        技職好「文」
                                    </a>
                                </li>
                                <li>
                                    <a href="web/learn/video.jsp#learnId">
                                        技職有「影」
                                    </a>
                                </li>
                            </ul>

                        </div>
                    </div>


                    <!-- 網站地圖列表：實作環境參訪 -->
                    <div class="indexSiteList">
                        <div class="indexSiteListIn">

                            <!-- 網站地圖列表標題 -->
                            <h3>
                                <a href="javascript:void(0);">實作環境參訪</a>
                            </h3>

                            <!-- 網站地圖列表內容 -->
                            <ul>
                                <li>
                                    <a href="web/implement/know.jsp#implementId">
                                        技職實作環境
                                    </a>
                                </li>
                                <%-- 
                                <li>
                                    <a href="web/implement/implement2_1.jsp#implementId">
                                        報名參訪體驗資訊
                                    </a>
                                </li>
                                --%>
                            </ul>

                        </div>
                    </div>

                    <!-- 網站地圖列表：技職教育好夥伴 -->
                    <div class="indexSiteList">
                        <div class="indexSiteListIn">

                            <!-- 網站地圖列表標題 -->
                            <h3>
                                <a href="web/technical/technical.jsp#technicalId">技職教育好夥伴</a>
                            </h3>

                        </div>
                    </div>

                    <!-- 網站地圖列表：會員專區 -->
                    <div class="indexSiteList">
                        <div class="indexSiteListIn">

                            <!-- 網站地圖列表標題 -->
                            <h3>
                                <a href="javascript:void(0);">會員專區</a>
                            </h3>

                            <!-- 網站地圖列表內容 -->
                            <ul>
                                <li>
                                   <a href="<%=loginStr%>">
                                        登入/加入會員
                                    </a>
                                </li>
                                <li>
                                    <a href="web/member/order_list.jsp#memberId">
                                        會員遊戲記錄
                                    </a>
                                </li>
                                <li>
                                    <a href="web/member/apply.jsp#memberId">
                                        申請發文帳號
                                    </a>
                                </li>
                            </ul>

                        </div>
                    </div>

                    <!-- 網站地圖列表：聯絡我們 -->
                    <div class="indexSiteList">
                        <div class="indexSiteListIn">

                            <!-- 網站地圖列表標題 -->
                            <h3>
                                <a href="web/contact/contact.jsp#contactId">
                                    聯絡我們
                                </a>
                            </h3>

                        </div>
                    </div>

                </div>

                <!-- 首頁網站地圖星星 -->
                <div class="indexSiteStar">
                    <img src="web/index/images/banner_star.svg" alt="" >   
                </div>

                <!-- 首頁網站地圖星星 -->
                <div class="indexSiteStar indexSiteStar2">
                    <img src="web/index/images/banner_star.svg" alt="" >   
                </div>

                <!-- 首頁網站地圖火箭icon -->
                <div class="indexSiteplanet_icon">
                    <img src="web/images/planet_icon3.png" alt="">
                </div>

                <!-- 首頁網站地圖太空人icon -->
                <div class="indexSiteAstronaut_icon">
                    <img src="web/images/astronaut_icon.svg" alt="">
                </div>

                <!-- 首頁網站地圖星球icon -->
                <div class="indexSitePlanet_icon">
                    <img src="web/images/planet_icon.svg" alt="">
                </div>

            </div>
                
        </div> 

    </div>
    
    
    
    <!--footer-->
    
	<div class="footer">
    
    	<!--浮動top鍵--><!--js在common.js內-->
        <div class="topBtn">
            <a href="#top">
                <img src="web/images/top_btn.svg" alt="">
            	<!-- <span>TOP</span> -->
            </a>
        </div>
        
        <div class="wrap">

            <!--footer上方資訊區-->
            <div class="footerTopArea">

                <!--footer資訊-->
                <div class="footer_inArea">
                    
                    <ul>
                        <%if(!"".equals(unit1Str)) { 
                          String[] unit1arr = unit1Str.split(" ");
                        %>
                        <li>
                            <b>指導單位:</b> <%for(String str:unit1arr) {%><span><%=str %></span><%} %>
                        </li>
                        <%} %>
                        <%if(!unit2Str.isEmpty()) {%>
                        <li>
                            <b>承辦單位:</b><span><%=unit2Str %></span>
                        </li>
                        <%} %>
                        
                        <%if(!unit3Str.isEmpty()) {
                          String[] unit3arr = unit3Str.split(" ");
                        %>
                        <li>
                            <b style="display: block;" >協辦單位:</b>
                            <%for(String unit3:unit3arr) {%>
                            <%=unit3 %>
                            <br>
                            <%} %>
                        </li>
                        <%} %>
                    </ul>

                    <ul>
                        <li>
                            <b>展場人數：</b>
                        </li>
                        <li>
                            <%=place0 %>：<span><%=headcount0 %></span>
                        </li>
                        <li>
                            <%=place1 %>：<span><%=headcount1 %></span>
                        </li>
                        <li>
                            <%=place2 %>：<span><%=headcount2%></span>
                        </li>
                        <li>
                            <%=place3 %>：<span><%=headcount3%></span>
                        </li>
                        <li>
                            <%=place4 %>：<span><%=headcount4 %></span>
                        </li>
                        <li>
                            網站訪客人數：<span><%=String.valueOf(visits) %></span>
                        </li> 
                    </ul>

                </div>  

                <!-- 版腳主按鍵 -->
                <ul class="fR_navbar">
                    <li>
                        <a href="web/policy/policy.jsp">
                            網站安全政策
                        </a>
                    </li>
                    <li>
                        <a href="web/policy/privacy.jsp">
                            隱私權政策   
                        </a>
                    </li>
                    <li class="copyright" style="color:#000;">
                            
                           | © 版權宣告(2022教育部版權所有)
                         
                    </li>
                </ul>

            </div>

        </div>

        <!-- footer火箭icon -->
        <div class="footerPlanet_icon">
            <img src="web/images/planet_icon4.png" alt="">
        </div>

        <div class="footerArea">
            
            <!-- footer底色 -->
            <div class="footerBg">
                <img src="web/images/pc_footer.png"     alt="" class="pc_footer" >
                <img src="web/images/tablet_footer.png" alt="" class="tablet_footer" >
                <img src="web/images/mobile_footer.png" alt="" class="mobile_footer" >
            </div>

        </div>

    </div>
    

    <script type="text/javascript" src="web/js/rwdImageMaps/jquery.rwdImageMaps.js"></script>
        
    <script>
        $(document).ready(function(e) {
            $('img[usemap]').rwdImageMaps();
            /*alert(`重要事項公告：
            謹此通知，我們的《隱私權政策》有重要更新，詳細內容請至隱私權政策審閱。
            我們更新這些條款是為了使用者更容易理解條款內容。新的《隱私權政策》將於 2023 年 7 月 17 日生效，在此之前，你可以先預覽內容。於生效日後繼續使用技職大玩 Job 和其他服務，即代表你接受這些新條款。
            謝謝！`);*/
        });
    </script>


    <!--每滑到該區域重複執行-->   
    <script type="text/javascript" src="web/js/aos/aos.js"></script> 
    <script>
      AOS.init();
    </script>     





</body>
</html>
