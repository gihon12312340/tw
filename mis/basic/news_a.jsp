<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%
	// 基本參數
	String code = "news"; 					// 模組識別碼
	String show_title = "新訊報報";				// 模組標題

	// 圖片建議尺寸
	String image_info = "(建議尺寸198px * 140px)";
	// 圖片建議尺寸
	//String mobile_info = "(建議尺寸830px * 1300px)";
	
	// 功能參數設定
	boolean list_switch = true;		// 是否開啟列表功能
	boolean sort_switch = false;	// 是否開啟排序功能
	boolean keyword_switch = true;	// 是否開啟關鍵字設定
	boolean deadline_switch = true; // 是否開啟上下架日期
	int add_num = -1;				// 設定可新增的資料筆數 , -1 為無限筆
/*--------------------------------------------------------------------------------*/		
	Vector nps = app_sm.selectAll(tblnp, "np_code=? and np_lang=?", new Object[] { code,lang }, "np_showseq ASC , np_createdate DESC");
	// 當資料筆數小於設定可新增的筆數時 , 顯示新增按鍵
	boolean add_switch = num_check(add_num,nps);

	//所屬類別
	Vector<TableRecord> dms = app_sm.selectAll(tbldm, "dm_lang=? and dm_code=? and dm_category=?", new Object[]{ lang, code+"_category", "" } , "dm_showseq ASC , dm_createdate DESC");

%>
<!DOCTYPE html>
<html>
<head>
<%@include file="include/head.jsp"%>
<%@include file="/WEB-INF/jspf/mis/htmleditor.jspf"%>
<script>
function checkform(F){	
	//驗證副檔名
	var file_chk = /([^\/]+\.(?:jpg|jpeg|gif|png))/;
	//驗證中文
	var chnese_chk = /[\u4e00-\u9fa5]/;
	
	if (F.np_category.value == "") {
        alert("請選擇類別!!");
        F.np_category.focus();
    }else if (F.np_title.value == ""){
	   	alert("請輸入標題名稱!!");
	   	F.np_title.focus();
    } else if (F.np_image.value == "") {
         alert("請上傳圖檔!!");
         F.np_image.focus();
    } else if (!file_chk.test(F.np_image.value.toLowerCase())) {
 		alert("附檔名限為jpg|jpeg|gif|png!!");
 		F.np_image.focus();	
    	<%--
   } else if (F.np_image.value != "" && !file_chk.test(F.np_image.value.toLowerCase())) {
		alert("附檔名限為jpg|jpeg|gif|png!!");
		F.np_image.focus();
		--%>
   }  else if (F.np_emitdate.value > F.np_restdate.value) {
        alert("上架日期不得大於下架日期!!");
        F.np_emitdate.focus();
        return false;
   }else {
        return true;
   }
	return false;
}
</script>
</head>
<body>
<div align="center">
<table width="1280" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="2">
		<table width="1280" border="0" cellspacing="0" cellpadding="0">
			<%@include file="/WEB-INF/jspf/mis/top.jspf"%>
		</table>
		</td>
	</tr>
	<tr>
		<td width="3" align="center" valign="top" class="web_bk-2">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td><IFRAME HEIGHT="500" width="155" MARGINWIDTH="0"
					MARGINHEIGHT="0" HSPACE="0" VSPACE="0" FRAMEBORDER="0"
					SCROLLING="no" id="show" name="show" SRC="../leftmenu.jsp"></IFRAME></td>
			</tr>
		</table>
		</td>
		<td width="1125" align="center" valign="top" class="system_bk-2p">
		<table width="95%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" class="web_bk-2b">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td width="60" align="left" valign="middle">
					<img src="../images/web_icon_1.gif" width="55" height="48">
				</td>
				<td align="left" valign="middle" class="web_bigword"><%=show_title%>維護</td>
			</tr>
			<tr>
				<td colspan="2">
				<hr size="1" noshade>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
				<form name="frm" id="frm" method="post" enctype="multipart/form-data" action="<%=code%>_update.jsp?action=A" onsubmit="javascript:return checkform(this);">
				<table width="95%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="system_bk-2bk">
						<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
							<tr>
								<td align="center" colspan="4" class="web_title-1"><%=show_title%>維護&nbsp;&nbsp;
									<%if (add_switch) { %>
									<input type="button" value="新增資料" onclick="javascript:location.href='<%=code%>_a.jsp'" />&nbsp;
									<%} %>
									<%if (list_switch) { %>
									<input type="button" value="回到列表" onclick="javascript:location.href='<%=code%>.jsp'" />&nbsp;
									<%} %>
									<%if (sort_switch) { %>
									<input type="button" value="資料排序" onclick="javascript:location.href='<%=code%>_sort.jsp'" />
									<%} %>
								</td>
							</tr>							
							<tr align="center" class="web_bk-2">
								<td colspan="4" align="center">新增資訊</td>
							</tr>
						    <tr class="web_table-2-1">
								<td width="15%" align="right">所屬類別</td>
								<td colspan="3" width="85%" align="left">
							   <select name="np_category" id="np_category">
							   <option value="">請選擇類別</option>
	                  			<%  
	                  				for(int i=0; i<dms.size(); i++){
	                  					TableRecord dm = (TableRecord) dms.get(i);
	                  			%>
	                  			<option value="<%=dm.getString("dm_id") %>"><%=dm.getString("dm_title") %></option>
								<% } %>
								</select>
								</td>
							</tr>
							
							<tr class="web_table-2-1">
								<td width="15%" align="right">標題</td>
								<td colspan="3" width="85%" align="left">
									<input type="text" name="np_title" id="np_title" size="137" maxlength="120" />
								</td>
							</tr>
							
							
						
							
							<tr class="web_table-2-1">
								<td align="right">內文</td>
								<td colspan="3" align="left">
									<textarea name="np_content" id="np_content" cols="118" rows="8" class="mceEditor"></textarea>
								</td>
							</tr>
							
							<tr class="web_table-2-1">
								<td align="right" class="web_table-2-1">消息圖片</td>
								<td colspan="3" align="left" class="tablebg">
									<input name="np_image" id="np_image" type="file" class="button" accept="image/*"> <%=image_info%>
								</td>
							</tr>
							
							<%if(keyword_switch){ %>
							<tr align="center" class="web_bk-2">
								<td colspan="4" align="center">關鍵字設定</td>
							</tr>
							<tr class="web_table-2-1">
								<td width="15%" align="right">設定索引[Robots]</td>
								<td width="35%" align="left">
									<select name="np_robots" id="np_robots">
										<option value="all" <%="all".equals(SiteSetup.getSetup("seo.robots"+"."+lang).getString("ss_text"))?"selected":"" %>>全部-ALL</option>
										<option value="none" <%="none".equals(SiteSetup.getSetup("seo.robots"+"."+lang).getString("ss_text"))?"selected":"" %>>無索引-None</option>
										<option value="index" <%="index".equals(SiteSetup.getSetup("seo.robots"+"."+lang).getString("ss_text"))?"selected":"" %>>索引該網頁-Index</option>
										<option value="noindex" <%="noindex".equals(SiteSetup.getSetup("seo.robots"+"."+lang).getString("ss_text"))?"selected":"" %>>不索引該網頁-NoIndex</option>
										<option value="follow" <%="follow".equals(SiteSetup.getSetup("seo.robots"+"."+lang).getString("ss_text"))?"selected":"" %>>關注特定連結-Follow</option>
										<option value="nofollow" <%="nofollow".equals(SiteSetup.getSetup("seo.robots"+"."+lang).getString("ss_text"))?"selected":"" %>>不關注特定連結-NoFollow</option>
									</select>
								</td>
								<td width="20%" align="right">設定來訪週期</td>
								<td width="30%" align="left">
									<input type="number" name="np_revisit_after" id="np_revisit_after" value="<%=SiteSetup.getSetup("seo.revisit_after"+"."+lang).getString("ss_text") %>" size="4" maxlength="4" />天
								</td>
							</tr>
							<tr class="web_table-2-1">
								<td align="right">設定主要關鍵字</td>
								<td align="left">
									<input type="text" name="np_keywords" id="np_keywords" size="40" maxlength="255" value="<%=SiteSetup.getSetup("seo.keywords"+"."+lang).getString("ss_text") %>"/>
								</td>
								<td align="right">設定網頁版權說明</td>
								<td align="left">
									<input type="text" name="np_copyright" id="np_copyright" size="30" value="<%=SiteSetup.getSetup("seo.copyright"+"."+lang).getString("ss_text") %>"/>
								</td>
							</tr>
							<tr class="web_table-2-1">
								<td align="right">
									網頁內容簡介<br />[建議80-100字]
								</td>
								<td colspan="3" align="left">
									<textarea name="np_description" id="np_description" cols="118" rows="3" maxlength="255"><%=SiteSetup.getSetup("seo.description"+"."+lang).getString("ss_text") %></textarea>
								</td>
							</tr>
							<tr class="web_table-2-1">
								<td align="right">設定追蹤碼</td>
								<td colspan="3" align="left">
									<textarea name="np_seo_track" id="np_seo_track" cols="118" rows="3"><%=SiteSetup.getSetup("seo.track"+"."+lang).getString("ss_text") %></textarea>
								</td>
							</tr>
							<%} %>
							<%if(deadline_switch){ %>
							<tr align="center" class="web_bk-2">
								<td colspan="4" align="center">上下架時間</td>
							</tr>
							<tr class="web_table-2-1">
								<td align="right" class="web_table-2-1">上架日期</td>
								<td align="left" class="tablebg">
									<input name="np_emitdate" id="_qemitdate" type="text" value="<%=DateTimeTool.dateString()%>" size="15" readonly>
								</td>
								<td align="right" class="tablebg">下架日期</td>
								<td align="left" class="tablebg">
									<input name="np_restdate" id="_qrestdate" type="text" value="2099/12/31" size="15" readonly>
								</td>
							</tr>
							<%} %>
							<tr class="web_table-2-1">
								<td align="right">資料建立人員</td>
								<td align="left"><%=app_account%></td>
								<td align="right">資料建立日期</td>
								<td align="left"><%=app_today%></td>
							</tr>

						</table>
						</td>
					</tr>
					<tr align="center">
						<td colspan="4" align="center"><br />
						<input type="submit" value="確定送出" />&nbsp;
						<input type="reset" value="重新設定" />&nbsp;
						<input type="button" value="回上一頁" onClick="location='<%=code%>.jsp';">
					</td>
					</tr>
				</table>
				</form>
				</td>
				

			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3" class="web_bk-2b">&nbsp;</td>
			</tr>

		</table>
		</td>
		</div>
	</tr>
</table>
</div>
</body>
</html>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>