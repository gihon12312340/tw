<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%Cookie cookie = null;
Cookie[] cookies = null;
cookies = request.getCookies();	   	// 取得 cookies 的資料(陣列)

/*-- 會員登入檢查及cookies設定-Start --*/
TableRecord check_member = (TableRecord) session.getAttribute("member");
//清除紀錄page_code的session
session.removeAttribute("page_code");
//登入狀態確認
boolean isLogin = false;

if (check_member == null) {
isLogin = false;
} else {
//session重設，避免發文狀態判定異常
check_member = app_sm.select(tblmp,check_member.getString("mp_id"));
session.setAttribute("member",check_member);
isLogin = true;
}

//檢查會員發文狀態
boolean publish_status = false;
if(isLogin) {
	String mp_publish_status = check_member.getString("mp_publish_status");
	if("Y".equals(mp_publish_status)) {
		publish_status = true;
	}
}

//遊戲API所需之cookies設定
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
/*-- google登入-Start --*/
String servername = "";
if( request.getServerPort()== 80) {
	servername = request.getScheme()+"://"+request.getServerName();
} 
String localname = request.getScheme()+"://"+request.getServerName()+":"+request.getLocalPort();
String googleurl = localname + request.getContextPath() + "/web/member/googlelogin/google_login_action.jsp";
String loginStr = "https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com%2Fauth%2Fuserinfo.email+https://www.googleapis.com%2Fauth%2Fuserinfo.profile&redirect_uri="+googleurl+"&response_type=code&client_id="+SiteSetup.getText("cp.google_appid.tw");
/*-- google登入-End --*/ 
//FB連結
String fbURL = SiteSetup.getSetup("cp.facebook" + "." + lang).getString("ss_text");

//用於登入後回到原頁
String backURL = request.getRequestURL().toString();
String qString = request.getQueryString();
if(qString != null) {
	//如果有QueryString就補上
	backURL = backURL + "?" + qString;
}
session.setAttribute("backURL",backURL);


%>
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
                    data-img="../../web/images/logo.svg"                    
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
                   <a href="../../home.jsp">
                        <img src="../../web/images/logo.svg" />
                    </a>
                </h1>            
                
                
                <!---版頭右-->
                <div class="headerRight">

                    <!--主按鍵-->
                    <div class="navbar">
    
                        <!--站內搜尋mobile-->
                        <div class="siteSearch" >                            
                            <div class="siteSearchBg">
                                <form name="form_search" method="post" action="../search/search.jsp#searchId" onsubmit="javscript: return checkSearch(this);">
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
                                        <a href="../../web/learn/learn.jsp#learnId">
                                            認識技職教育
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="../../web/learn/highschool.jsp#learnId">
                                            升學技高 (15群科)
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="../../web/learn/five_yearcollege.jsp#learnId">
                                            升學五專
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="../../web/learn/university.jsp#learnId">
                                            升學四技、二專(統一入學測驗20群類)
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="../../web/learn/article.jsp#learnId">
                                            技職好「文」
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="../../web/learn/video.jsp#learnId">
                                            技職有「影」
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="navOpen mobile">
                                <div class="navOpenBg">

                                    <div class="navOpenList">
                                        <a href="../../web/learn/learn.jsp#learnId">
                                            認識技職教育
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="../../web/learn/highschool.jsp#learnId">
                                            升學技高 (15群科)
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="../../web/learn/five_yearcollege.jsp#learnId">
                                            升學五專
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="../../web/learn/university.jsp#learnId">
                                            升學四技、二專(統一入學測驗20群類)
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="../../web/learn/article.jsp#learnId">
                                            技職好「文」
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="../../web/learn/video.jsp#learnId">
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
                                        <a href="../../web/implement/know.jsp#implementId">
                                            技職實作環境
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="../../web/implement/implement2_1.jsp#implementId">
                                            報名參訪體驗資訊
                                        </a>
                                    </div>

                                </div>
                            </div>

                            <div class="navOpen mobile">
                                <div class="navOpenBg">

                                    <div class="navOpenList">
                                        <a href="../../web/implement/know.jsp#implementId">
                                            技職實作環境
                                        </a>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="../../web/implement/implement2_1.jsp#implementId">
                                            報名參訪體驗資訊
                                        </a>
                                    </div>

                                </div>
                            </div>     
                        </div> 
  
                        <!--技職教育好夥伴-->
                        <div class="nav">
                            <a href="../../web/technical/technical.jsp#technicalId">
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
                                        <a href="../../web/member/member_1.jsp?code=logout">
                                        登出
                                        </a>
                                        <%} %>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="../../web/member/order_list.jsp#memberId">
                                            會員遊戲記錄
                                        </a>
                                    </div>
                                    <%if(!publish_status){ %>
                                    <div class="navOpenList">
                                        <a href="../../web/member/apply.jsp#memberId">
                                            申請發文帳號
                                        </a>
                                    </div>
                                    <%} %>
                                    <%if(publish_status) {%>
                                    <div class="navOpenList">
                                        <a href="../member/post_course.jsp#memberId">
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
                                        <a href="../../web/member/member_1.jsp?code=logout">
                                        登出
                                        </a>
                                        <%} %>
                                    </div>
                                    <div class="navOpenList">
                                        <a href="../../web/member/order_list.jsp#memberId">
                                            會員遊戲記錄
                                        </a>
                                    </div>
                                    <%if(!publish_status) {%>
                                    <div class="navOpenList">
                                        <a href="../../web/member/apply.jsp#memberId">
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
                            <a href="../../home.jsp#indexSitetop">
                                <img src="../../web/images/site_icon.svg" alt="">
                            </a>
                        </li>
                        <li>
                            <a target="_blank" href="<%=fbURL%>">
                                <img src="../../web/images/fb_icon.svg" alt="">
                            </a>
                        </li>
                    </ul>

                    <!--版頭商品搜尋-->
                    <div class="header_search_area">
                       <form name="frm1" id="frm1" method="post" action="../../web/search/search.jsp#searchId" onsubmit="javascript: return checkSearch(this);">
                        <div class="header_search">
                            <input type="text" placeholder="搜尋" name="search" id="search" />

                            <label>
                                <img src="../../web/images/search_icon.svg" alt="">
                                <!-- <i class="material-icons"></i> -->
                                <input type="submit" value="" />
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