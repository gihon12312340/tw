<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@page import="com.genesis.utils.StringTool"%>
<%
String page_code = "post_course";

TableRecord mp = (TableRecord)session.getAttribute("member");
//檢查是否有登入會員
if(mp == null){
	out.println("<script>alert('請先登入會員!');history.back()</script>");
	return;
} else {
	//重設session，避免發文狀態判定出錯
	mp = app_sm.select(tblmp,mp.getString("mp_id"));//重新取一次資料
	session.setAttribute("member",mp);
	//檢查是否有發文權限
	if(! "Y".equals(mp.getString("mp_publish_status"))) {
		out.println("<script>alert('您沒有發文權限!');location.href='../../home.jsp'</script>");
		return;
	}
}
String mp_id = mp.getString("mp_id");

String cp_id = StringTool.validString(request.getParameter("cp_id"));
TableRecord cp=app_sm.select(tblcp,cp_id);
String action2 = "";
if(cp.getString("cp_id").isEmpty()) {
	action2 = "A";
}else {
	action2 = "M";
}


//檢查有沒有勾發布位置
boolean isImplement = false;
boolean isNews = false;
if(!cp_id.isEmpty()) {
	TableRecord cp_implement_news = app_sm.select(tblcp,"cp_category=?",new Object[]{cp_id});
	if(!cp_implement_news.getString("cp_id").isEmpty()) {
		isImplement = true;
	}
	
	TableRecord np_post_course = app_sm.select(tblnp,"np_upcategory=?",new Object[]{cp_id});
	if(!np_post_course.getString("np_id").isEmpty()) {
		isNews = true;
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
<script>
function test(input) {
	var fileName = document.getElementById("file1").value;
	fileName =  fileName.replace(/.*[\/\\]/, '');
	$("#showFileValue1").val(fileName);
	
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

            <div id="memberId"></div>

            <div class="wrap">

                <!--內頁標題樣式1-->
                <div class="titStyle1">
                    <h2>會員專區</h2>
                </div>

                <ul class="top_bar">

                    <li>
                        <a href="../member/order_list.jsp#memberId">
                            遊戲紀錄
                        </a>
                    </li>
                    <%if(!publish_status) {%>
                    <li>
                        <a href="../member/apply.jsp#memberId">
                            申請發文帳號
                        </a>
                    </li>
                    <%} %>
                    <%if(publish_status) {%>
                    <li class="active">
                        <a href="../member/post_course.jsp#memberId">
                            發佈課程資訊
                        </a>
                    </li>
                    <%} %>
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

                            <div class="leftList">
                                <div class="leftList_top">
                                    <a href="../member/order_list.jsp#memberId">
                                        遊戲紀錄
                                    </a>
                                </div>
                            </div>
                            <%if(!publish_status) {%>
                            <div class="leftList">
                                <div class="leftList_top">
                                    <a href="../member/apply.jsp#memberId">
                                        申請發文帳號
                                    </a>
                                </div>
                            </div>
                            <%} %>
                            <%if(publish_status) {%>
                            <div class="leftList active"><!-- 當前模式 class加上active -->
                                <div class="leftList_top">
                                    <a href="../member/post_course.jsp#memberId">
                                        發佈課程資訊
                                    </a>
                                </div>
                            </div>
                            <%} %>
                        </div>

                    </div>

                     <!--右側-->
                <div class="right">
                    <!-- 右側_無左選單noleft -->

                    <!--內頁標題樣式5-->
                    <!-- <div class="titStyle5">
                        <h2>限技專校院、技術型高中、政府機關</h2>
                    </div> -->

                    <div class="containerIn">

                        <!-- 帳號資料 -->
                        <div class="applyArea">

                            <!--內頁標題樣式4-->
                            <!-- <div class="right_title4">
                                <span>Step 1</span>
                                <h2>帳號資料</h2>
                            </div> -->
                     <form name="frm1" method="post" enctype="multipart/form-data" action="../member/post_course_update.jsp?action=<%=action2%>&cp_id=<%=cp_id%>"
                     onsubmit="return checkform(this)">
                            <input type="hidden" name="cp_member" value="<%=mp.getString("mp_account")%>">
                            <input type="hidden" name="cp_status" value="N">
                            <input type="hidden" name="destination" id="destination">
                            <!--表單區-->
                            <div class="form_area contact_area">
                                 <!-- 發布位置 -->
                                 <div class="form_list">
                                    <div class="fL_info item_RadioCheckArea">
                                        <input class="item_checkbox" type="checkbox" name="destination_temp" id="a1" value="news" <%=isNews?"checked":"" %>>
                                        <label for="a1">新訊報報</label>
                                        
                                        <input class="item_checkbox" type="checkbox" name="destination_temp" id="a2" value="implement" <%=isImplement?"checked":"" %>>
                                        <label for="a2">實作環境參訪</label>

                                        <!-- <label>
                                            <input type="radio" name="sex">
                                            男
                                        </label>
                                        &nbsp;&nbsp;
                                        <label>
                                            <input type="radio" name="sex">
                                            女
                                        </label> -->
                                    </div>
                                 </div>

                                 <!--標題-->
                                 <div class="form_list">
                                    <div class="fL_tit">
                                        標題
                                        <!--必填icon-->
                                        <div class="requirde_icon">
                                            *
                                        </div> 
                                    </div>
                                    <div class="fL_info">
                                        <input type="text" name="cp_title" id="" placeholder="" value="<%=cp.getString("cp_title")%>"/>
                                    </div>
                                </div>  
                                <div class="form_list"><!--一列兩個時class內加fLType2-->
                                    <div class="fL_tit">
                                        上傳圖片
                                        <!--必填icon-->
                                        <!-- <div class="requirde_icon">
                                            *
                                        </div> -->
                                    </div>
                                     <!-- <span class="BusinessCarImg">
                                        如地籍圖、位置圖、衛星空照圖、現況圖、規劃示意或完工模擬圖，請提供2.5mb或2500*1500像素以上jpg檔
                                        /
                                        Such as cadastral maps, location maps, satellite aerial photos, current status maps, planning schematics or completed simulation maps, please provide a jpg file of 2.5mb or more than 2500*1500 pixels
                                       <a target="view_blank" href="#">
                                            pic.ai
                                        </a>
                                    </span> -->
                                    <div class="fL_info" style="margin: 0;"><!--上傳檔案欄位 class 加 inputFile-->
                                    
                                        <div class="inputFile">
                                            <input type="text" id="showFileValue1"  name="file_name" disabled="disabled" value="<%=cp.getString("cp_image")%>"/>
                                            <label for="file1">
                                                <div>
                                                    選擇檔案
                                                </div>
                                            </label>
                                            <input id="file1" type="file" name="cp_image" onchange="test(this);" accept="image/*"/>
                                        </div>
                                    </div>

                                </div> 
                                <!--內文-->
                                <div class="form_list">
                                    <div class="fL_tit">
                                        內文
                                        <!--必填icon-->
                                        <div class="requirde_icon">
                                            *
                                        </div> 
                                    </div>
                                    <div class="fL_info">

                                        <!-- 前台網編器 -->
                                        <div class="editorArea" >                                            
                                            <div class="textArea" name="editor" id="editor"><%=cp.getString("cp_content") %></div>
                                        </div>
                                        
                                    </div>
                                </div>                                  

                            </div>

                        </div>
                        
                        <!--按鍵區-->
                        <input type="hidden" name="cp_content" id="cp_content" value="">
                        <div class="btn_area one"><!--如果只有一個按鍵時class內加one-->
                            <input type="submit" value="確認修改" id="submit" />
                        </div>
                    </form>
                    </div>

                </div>

                    
                </div>

            </div>

        </div>
  

   <!-- 前台網編器套件 modify by Judy 20220414 start -->

<!-- Include Quill stylesheet -->
<link href="https://cdn.quilljs.com/1.0.0/quill.snow.css" rel="stylesheet" />
<!-- Include the Quill library -->
<script src="https://cdn.quilljs.com/1.0.0/quill.js"></script>

<script>
    var quill = new Quill( "#editor", {
        theme: "snow", // 模板
        modules: {
            toolbar: [
                // 工具列列表[註1]
                ['bold', 'italic', 'underline', 'strike'], // 粗體、斜體、底線和刪節線
                ['blockquote', 'code-block'], // 區塊、程式區塊
                [{ 'header': 1 }, { 'header': 2 }], // 標題1、標題2
                [{ 'list': 'ordered'}, { 'list': 'bullet' }], // 清單
                //[{ 'script': 'sub'}, { 'script': 'super' }], // 上標、下標
                //[{ 'indent': '-1'}, { 'indent': '+1' }], // 縮排
                [{ 'direction': 'rtl' }], // 文字方向
                [{ 'size': ['small', false, 'large', 'huge'] }], // 文字大小
                [{ 'header': [1, 2, 3, 4, 5, 6, false] }],// 標題
                [{ 'color': [] }, { 'background': [] }], // 顏色
                //[{ 'font': [] }], // 字體
                //[{ 'align': [] }], // 文字方向
                //['image'], // 圖片
                [ 'clean' ] // 清除文字格式
            ]
        }
    });
</script>

<script>
function getText(){
    var text = $(".ql-editor").html();
    var input = text.toString();
    $("#cp_content").val(input);
	
    
}

$("#submit").click(function(){
	getText();
	
	var destination = "";
	var checkboxs = document.querySelectorAll('.applyArea input[type="checkbox"]');
	checkboxs.forEach(function(box) {
		if(box.checked == true) {
			destination += box.value+";";
		}
	})
	
	if(destination == "") {
		alert("請至少選擇一個上傳位置");
		return false;
	}else {
		$("#destination").val(destination);
	}
})

function checkform(F){
	<%--處理前台網編套件--%>
	getText();
	<%----%>
	
	<%--處理上傳位置checkbox--%>
	var destination = "";
	var checkboxs = document.querySelectorAll('.applyArea input[type="checkbox"]');
	checkboxs.forEach(function(box) {
		if(box.checked == true) {
			destination += box.value+";";
		}
	})
	
	if(destination == "") {
		alert("請至少選擇一個上傳位置");
		return false;
	}else {
		$("#destination").val(destination);
	}
	<%--處理上傳位置checkbox--%>
	
	<%--檢核--%>
	if (F.cp_title.value.trim() == ""){
        alert("請輸入標題!!");
        F.cp_title.focus();
    } else if(F.file_name.value.trim() == "") {
    	alert("請上傳圖片!!");
        F.file_name.focus();
    } else if(F.cp_content.value.trim() == "") {
    	alert("請輸入內文");
    	F.editor.focus();
    } else {
    	return true;
    }
	
	return false;
}
</script>

<!-- InstanceEndEditable -->   
     
<!-- ================================= -->

	</div>
    
    
    
    <!--footer-->
	<%@include file="../../web/include/copyright.jsp" %>
</body>
<!-- InstanceEnd --></html>
