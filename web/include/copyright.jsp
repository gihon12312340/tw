<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
/*-- 頁尾資訊 --*/
String unit1Str = SiteSetup.getSetup("cp.unit1" + "." + lang).getString("ss_text"),			// 指導單位
       unit2Str = SiteSetup.getSetup("cp.unit2" + "." + lang).getString("ss_text"),			// 承辦單位
       unit3Str = SiteSetup.getSetup("cp.unit3" + "." + lang).getString("ss_text"),			// 協辦單位
       coorStr = SiteSetup.getSetup("cp.co-organizer" + "." + lang).getString("ss_text"),
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

/*-- 網站訪客人數統計-Start --*/
Cookie footercookie = null;
Cookie[] footercookies = null;
footercookies = request.getCookies();	   	// 取得 cookies 的資料(陣列)
boolean cookieExist = false;		// cookies不存在時才將此訪客進行統計
if(footercookies != null) {
 	for(int c = 0; c < footercookies.length; c++) {
 		footercookie = footercookies[c];
 		if(footercookie.getName().equals("webVisits")) {
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
%>
<div class="footer">
    
    	<!--浮動top鍵--><!--js在common.js內-->
        <div class="topBtn">
            <a href="#top">
                <img src="../../web/images/top_btn.svg" alt="">
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
                            <b style="display: block;">協辦單位:</b>
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
                            <%=place2%>：<span><%=headcount2%></span>
                        </li>
                        <li>
                            <%=place3%>：<span><%=headcount3%></span>
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
                        <a href="../../web/policy/policy.jsp">
                            網站安全政策
                        </a>
                    </li>
                    <li>
                        <a href="../../web/policy/privacy.jsp">
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
            <img src="../../web/images/planet_icon4.png" alt="">
        </div>

        <div class="footerArea">
            
            <!-- footer底色 -->
            <div class="footerBg">
                <img src="../../web/images/pc_footer.png"     alt="" class="pc_footer" >
                <img src="../../web/images/tablet_footer.png" alt="" class="tablet_footer" >
                <img src="../../web/images/mobile_footer.png" alt="" class="mobile_footer" >
            </div>

        </div>

    </div>
    

    <script type="text/javascript" src="../../web/js/rwdImageMaps/jquery.rwdImageMaps.js"></script>
        
    <script>
        $(document).ready(function(e) {
            $('img[usemap]').rwdImageMaps();
        });
    </script>


    <!--每滑到該區域重複執行-->   
    <script type="text/javascript" src="../../web/js/aos/aos.js"></script> 
    <script>
      AOS.init();
    </script>