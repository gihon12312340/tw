<%@page import="com.genesis.eshop.SiteSetup"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
    //3D實境館連結
    String threeDurl = SiteSetup.getSetup("cp.3Durl" + "." + lang).getString("ss_text");
    //banner圖檔&連結
    TableRecord cp_top_banner = app_sm.select(tblcp,"cp_code=? and cp_lang=?",
    		                                   new Object[]{"index_banner",lang});
    String banner_pc = app_fetchpath+"/index_banner/tw/"+cp_top_banner.getString("cp_image");  
    String banner_mobile = app_fetchpath+"/index_banner/tw/"+cp_top_banner.getString("cp_mobile");
    String banner_url = cp_top_banner.getString("cp_url");
%>
<!-- 首頁banner區 -->
        <div class="bannerArea">

            <!-- 首頁banner區PC -->
            <div class="pcBannerArea">

                <!-- banner圖片按鍵 -->
                <div class="indexbannerImg">
                    <!-- <img src="web/index/images/banner.png" alt="" >   -->
                    <img id="Image-Maps-Com-image-maps-2022-02-14-034647" src="<%=banner_pc%>" border="0" width="4001" height="2563" orgWidth="4001" orgHeight="2563" usemap="#image-maps-2022-02-14-034647" alt="" />
                    <map name="image-maps-2022-02-14-034647" id="ImageMapsCom-image-maps-2022-02-14-034647">
                        <area shape="rect" coords="3999,2561,4001,2563" alt="Image Map" style="outline:none;" title="Image Map" href="http://www.image-maps.com/index.php?aff=mapped_users_0" />
                        <area  alt="" title="新訊報報"       href="<%=banner_url %>"          shape="poly" coords="192,240,150,1205,1337,942,1332,92" style="outline:none;" target="_self"     />
                        <area  alt="" title="梅克獅達人養成" href="../../web/game/game_mex.jsp?#gameInId" shape="poly" coords="1395,190,1525,564,1464,660,1429,715,1393,1183,1519,1353,1767,1413,1888,1411,1983,1341,1992,1264,2044,930,2205,729,2439,390,2367,145,1398,145" style="outline:none;" target="_blank"     />
                        <area  alt="" title="3D實境館"       href="<%=SiteSetup.getText("cp.3Durl."+lang) %>"               shape="poly" coords="516,1278,301,1464,270,1587,208,1687,196,1855,327,1954,784,2019,1036,2193,1482,2181,1726,2104,1851,1983,1762,1669,1383,1617,1309,1444,975,1249,705,1216" style="outline:none;" target="_blank"     />
                        <area  alt="" title="互動體驗遊戲"   href="../../web/game/game.jsp#gameId"            shape="poly" coords="2734,253,2518,546,2589,685,2575,835,2863,940,3076,823,3223,730,3660,717,3846,643,3945,553,3948,331,3826,166,3220,156,2986,244" style="outline:none;" target="_self"     />
                        <area  alt="" title="職業試探常設展" href="../../web/career_exploration/career_exploration.jsp#careerId" shape="poly" coords="3000,1318,2175,1309,2061,1447,2200,1861,2370,1948,2581,2041,3006,1995,3535,2518,3975,1546,3940,1500,3796,1569,3525,877,3025,946" style="outline:none;" target="_self"     />
                    </map>
                </div>

                <!-- banner星星 -->
                <div class="indexbannerStar">
                    <img src="../../web/index/images/banner_star.svg" alt="" >   
                </div>
         
                <!-- banner火箭 -->
                <div class="indexbannerRocket">
                    <img src="../../web/index/images/banner_rocketbg.png" alt="" >   
                </div>
              
                <!-- banner底 -->
                <div class="indexbannerBg">
                    <img src="../../web/index/images/banner_bg.png" alt="" >     
                </div>

            </div>

            <!-- 首頁banner區mobile -->
            <div class="mobileBannerArea">

                <!-- banner圖片按鍵 -->
                <div class="mobilebannerImg">

                    <!-- <img src="web/index/images/banner_mobile.png" alt="" >   -->
                    <img id="Image-Maps-Com-image-maps-2022-02-25-051948" src="<%=banner_mobile %>" border="0" width="1333" height="3729" orgWidth="1333" orgHeight="3729" usemap="#image-maps-2022-02-25-051948" alt="" />
                    <map name="image-maps-2022-02-25-051948" id="ImageMapsCom-image-maps-2022-02-25-051948">
                    <area  alt="" title="新訊報報" href="<%=banner_url %>" shape="rect" coords="89,173,766,730" style="outline:none;" target="_self"     />
                    <area  alt="" title="互動體驗遊戲" href="../../web/game/game.jsp" shape="rect" coords="22,819,1208,1436" style="outline:none;" target="_self"     />
                    <area  alt="" title="梅克獅達人養成" href="../../web/game/game_mex.jsp?#gameInId" shape="rect" coords="24,1484,1076,2280" style="outline:none;" target="_blank"     />
                    <area  alt="" title="3D實境館" href="<%=SiteSetup.getText("cp.3Durl."+lang) %>" shape="rect" coords="40,2364,1218,2803" style="outline:none;" target="_blank"     />
                    <area  alt="" title="職業試探常設展" href="../../web/career_exploration/career_exploration.jsp#careerId" shape="rect" coords="18,2819,1060,3628" style="outline:none;" target="_self"     />
                    <area shape="rect" coords="1331,3727,1333,3729" alt="Image Map" style="outline:none;" title="Image Map" href="http://www.image-maps.com/index.php?aff=mapped_users_0" />
                    </map>
                    
                </div>

                <!-- banner星球 -->
                <div class="mobilebannerPlanet">
                    <img src="../../web/index/images/banner_planet.svg" alt="" >   
                </div>

                <!-- banner星星 -->
                <div class="mobilebannerStar">
                    <img src="../../web/index/images/banner_star.svg" alt="" >   
                </div>

                <!-- banner火箭 -->
                <div class="mobilebannerRocket">
                    <img src="../../web/index/images/banner_mobile_rocketbg.png" alt="" >   
                </div>
                
                <!-- banner底 -->
                <div class="mobilebannerBg">
                    <img src="../../web/index/images/banner_mobile_bg.png" alt="" >     
                </div>

            </div>
            
        </div>