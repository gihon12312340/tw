<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>

<%
String code = "chart3";
String show_title = "網站人流統計";
TableRecord na = app_sm.select(tblna,"na_code=? and na_lang=?",new Object[]{"count",lang});
TableRecord na1 = app_sm.select(tblna,"na_code=? and na_lang=?",new Object[]{"count1",lang});
TableRecord na2 = app_sm.select(tblna,"na_code=? and na_lang=?",new Object[]{"count2",lang});
TableRecord na3 = app_sm.select(tblna,"na_code=? and na_lang=?",new Object[]{"count3",lang});

int maxSearchDay = 90; 					// 搜尋天數上限設定(可查詢上限天數預設為90天 超過則強制設定截止日為起始日之90天後)
String startDay = StringTool.validString(request.getParameter("startDate"), "");	// 日期搜尋:起始日
String endDay = StringTool.validString(request.getParameter("endDate"), "");		// 日期搜尋:截止日

/*-- 搜尋日期區間設定 --*/
// 查詢區間修正(以起始日為基準，最多可查詢起始日(含)後90天之統計資料)
if(!"".equals(startDay) && !"".equals(endDay)) {
	// 取得截止日之上限日期
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
	String maxDay = startDay;
	Date dt = sdf.parse(maxDay);
	Calendar rightNow = Calendar.getInstance();
	rightNow.setTime(dt);
	rightNow.add(Calendar.DAY_OF_YEAR, maxSearchDay);			// 90天後之日期
	Date dt1 = rightNow.getTime();
	maxDay = sdf.format(dt1);
	// 日期比較
	Date max_Day = sdf.parse(maxDay);  							// 上限日期
	Date end_Day = sdf.parse(endDay);  							// 截止日期
	if(end_Day.before(max_Day) || end_Day.equals(max_Day)) {
		// 於可查詢之日期區間內
	} else {
		endDay = maxDay;
		out.println("<script>alert('可查詢日期區間最多為起始日期(含)的後"+maxSearchDay+"天，已調整查詢日期區間!!');</script>");
	}
}
// 預設日期
if("".equals(startDay)) {
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
	String dateStr = DateTimeTool.dateString();
	Date dt = sdf.parse(dateStr);
	Calendar rightNow = Calendar.getInstance();
	rightNow.setTime(dt);
	rightNow.add(Calendar.DAY_OF_YEAR, ((maxSearchDay - 60) * -1));	// 起始日設為1個月前
	Date dt1 = rightNow.getTime();
	dateStr = sdf.format(dt1);
	startDay = dateStr;
}
if("".equals(endDay)) {
	endDay = DateTimeTool.dateString();
}




/*實作環境參訪統計start*/
//科工館
int imp3_view = 0;
Vector<TableRecord> imp_3Data = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
        new Object[]{"imp_3",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:imp_3Data) {
	imp3_view += data.getInt("nk_sequence");
}
imp3_view += na3.getInt("na_imp3");
//total_site += imp1_view;



/*報名參訪統計start*/
//科工館
int imp2_3view = 0;
Vector<TableRecord> imp2_3Data = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
      new Object[]{"imp2_3",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:imp2_3Data) {
	imp2_3view += data.getInt("nk_sequence");
}
imp2_3view += na3.getInt("na_imp2_3");
//total_site += imp2_1view;


%>
<!DOCTYPE html>
<html>
<head>

<%@include file="include/head.jsp"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
function checkSearch(F) {
	if (F.startDate.value > F.endDate.value) {
	     alert("查詢起始日不得大於查詢截止日!!");
	     F.startDate.focus();
	} else {
	     return true;
	}
	return false;
}

</script>
<script>
<%-- 啟動檔案匯出功能 --%>
function export_file() {
	$(".block").show();
	var theForm = document.frm1;
		theForm.action="export/chart1_export.jsp";
		theForm.target="_exportFrame";
		theForm.submit();
}

function exportProgress(){   <%-- 檢查檔案是否已經匯出完成 --%>
$.ajax({
	async:false,
	type:"GET",
    url: "export/exportcheck.jsp",
    data: {reportType:"chart_export"},
    success: function(res){
    	res = $.trim(res);
    	// console.log(res);
    	if(res == "start"){
    		$(".block").show();
		}else if((res.indexOf("end")>-1) || (res == "no")){
			$(".block").hide();
			clearProgress();
			if(res.indexOf("end")>-1) {
				location.href = "<%=app_fetchpath+"/root/report/" + app_account + "_chart_export.xls" %>";
			}
			//else history.back();
		}
    	window.setTimeout("exportProgress()",1500);
    }
}); 		
}
var timer = window.setTimeout("exportProgress()",1500);
function clearProgress(){  <%-- 清除檔案匯出完成後之 Session 值 --%>
$.ajax({
	async:false,
	type:"GET",
    url: "export/exportcheck.jsp",
    data: {reportType:"clear_chart_export"},
    success: function(res){
    }
}); 		
}
</script>
<%--
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	
	<%-- 日期區間搜尋 
	function checkSearch(F) {
		if (F.startDate.value > F.endDate.value) {
		     alert("查詢起始日不得大於查詢截止日!!");
		     F.startDate.focus();
		} else {
		     return true;
		}
		return false;
	}
	
	--%>
</head>
<body>
    <%-- 黑色遮蔽 --%>
    <div class="block" style="width:100%; height:100%; position:fixed; color:#fff; display:none;">
	    <img src="export/images/block_bg.png" width="100%" height="100%" style="position:fixed; z-index:99998;"/>
	    <div style="margin: 0 auto;width: 400px;height: 50px;position: relative;top: 50%; z-index:99999; text-align:center;">
    	    資料匯出準備中，請稍待片刻 ......
	    </div>
    </div>
<%-- 黑色遮蔽 --%>
	<div align="center">
		<table width="1280" border="0" cellpadding="0" cellspacing="0">
			<%-- Top --%>
			<tr>
				<td colspan="2">
					<table width="1280" border="0" cellspacing="0" cellpadding="0">
						<%@include file="/WEB-INF/jspf/mis/top.jspf"%>
					</table>
				</td>
			</tr>
			<tr>
				<%-- Left --%>
				<td width="3" align="center" valign="top" class="web_bk-2">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<IFRAME HEIGHT="800" width="155" MARGINWIDTH="0"
								MARGINHEIGHT="0" HSPACE="0" VSPACE="0" FRAMEBORDER="0"
								SCROLLING="no" id="show" name="show" SRC="../leftmenu.jsp"></IFRAME>
							</td>
						</tr>
					</table>
				</td>
				
				<%-- Right --%>
				




<td width="1125" align="center" valign="top" class="system_bk-2p">
<%--實作環境狀況分析 --%>
<table width="95%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						

						<tr>
							<td width="25%" align="left" valign="middle">
								<font style="line-height:40px; font-size:24px; color:#4fb0ff;">
									<b>實作環境參訪狀況分析</b>
								</font>
							</td>
							<%-- 日期區間查詢 --%>
							<%-- %>
							<td width="25%" align="center">
								<form name="searchForm" method="post" action="statistics.jsp" onsubmit="javascript:return checkSearch(this);">
									<input name="startDate" id="_qemitdate" type="text" value="<%=DateTimeTool.dateString()%>" size="6" readonly />
									~
									<input name="endDate" id="_qrestdate" type="text" value="2099/12/31" size="6" readonly />
									
									<input name="searchBtn" type="submit" />
								</form>
							</td>
							<%-- --%>
						</tr>
						<tr>
							<td width="25%" align="center">
								<form name="searchForm" method="post" action="chart.jsp" onsubmit="javascript:return checkSearch(this);">
									<input name="startDate" id="_qemitdate" type="text" value="<%=startDay %>" size="6" readonly />
									~
									<input name="endDate" id="_qrestdate" type="text" value="<%=endDay %>" size="6" readonly />
									
									<input name="searchBtn" type="submit" />
								</form>
							</td >
							<td align="center">
							    <input type="button" name="export" id="export" onclick="export_file()" value="匯出"/>
							</td>
						</tr>
						<tr>
							<td colspan="8">
							<hr size="1" noshade>
							</td>
						</tr>
						
						<tr>
						    <td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>技職實作環境</b></font>
									</div>
									
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>科教館 瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(imp3_view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							
						
						</tr>
						<tr>
						    <td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>報名參訪體驗資訊</b></font>
									</div>
									
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>科教館 瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(imp2_3view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							
							
							
						</tr>
						<tr>
							<td colspan="8">
							<hr size="1" noshade>
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
					</table>








	</div>
</body>
</html>
<%
String[] names= {
          "imp3_view","imp2_3view","code"
          };
String[] values = {
         String.valueOf(imp3_view),
         String.valueOf(imp2_3view),
         code
};                     
%>
<iframe name="_exportFrame" width="0" height="0" style="display:none"></iframe>

<%=HtmlCoder.getForm("frm1", request.getRequestURI(), names, values)%>

<%@include file="/WEB-INF/jspf/connclose.jspf"%>