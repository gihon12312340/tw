﻿<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%
	//基本參數
	String code = "statistic"; 					// 模組識別碼
	String show_title = "展覽人流維護";				// 模組標題

	// 圖片建議尺寸
	String image_info = "(建議尺寸1280px * 580px)";
	// 圖片建議尺寸
	//String mobile_info = "(建議尺寸830px * 1300px)";
	
	// 功能參數
	boolean list_switch = true;		// 是否開啟列表功能
	boolean sort_switch = true;		// 是否開啟排序功能
	boolean keyword_switch = true;	// 是否開啟關鍵字設定
	boolean deadline_switch = false;// 是否開啟上下架日期
	int add_num = -1;				// 設定可新增的資料筆數 , -1 為無限筆
/*------------------------------------------------------------------------------------*/	
	Vector cps = app_sm.selectAll(tblvr, "vr_code=? and vr_lang=?", new Object[] { code, lang }, "vr_showseq ASC , vr_createdate DESC");
	// 當資料筆數小於設定可新增的筆數時 , 顯示新增按鍵
	boolean add_switch = num_check(add_num,cps);
	
	// 搜尋欄位
	String qtitle = StringTool.validString(request.getParameter("_qtitle"));
	String qcategory = StringTool.validString(request.getParameter("_qcategory"));
	
	// 跳頁參數
	String[] names = new String[] { "npage", "_qtitle", "_qcategory" };
	String[] values = new String[] { String.valueOf(pageno), qtitle, qcategory };
	// 回列表頁
	out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
	
	//所屬類別
	Vector<TableRecord> dms = app_sm.selectAll(tbldm, "dm_lang=? and dm_code=? and dm_category=?", new Object[]{ lang, code+"_category", "" } , "dm_showseq ASC , dm_createdate DESC");
	
	// 修改資料id
	String vr_id = StringTool.validString(request.getParameter("vr_id"));	
	TableRecord vr = app_sm.select(tblvr, vr_id);
	
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
	
	if(F.vr_category.value == "") {
        alert("請選擇類別!!");
        F.vr_category.focus();
	} else if(F.cp_title.value == "") {
        alert("請輸入標題名稱!!");
        F.vr_title.focus();
    } else {
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
				<td><IFRAME HEIGHT="800" width="155" MARGINWIDTH="0"
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
				<td align="left" valign="middle" class="web_bigword"><%=show_title%></td>
			</tr>
			<tr>
				<td colspan="2">
				<hr size="1" noshade>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
				<form name="frm" id="frm" method="post" enctype="multipart/form-data" action="<%=code%>_update.jsp?action=M&vr_id=<%=vr_id %>&_qtitle=<%=qtitle %>&npage=<%=pageno %>&_qcategory=<%=qcategory %>" onsubmit="javascript:return checkform(this);">
				<table width="95%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="system_bk-2bk">
						<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
							<tr>
								<td align="center" colspan="4" class="web_title-1"><%=show_title%>&nbsp;&nbsp;
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
								<td colspan="4" align="center">修改資訊</td>
							</tr>
							
							<tr class="web_table-2-1">
								<td width="15%" align="right">所屬類別</td>
								<td colspan="3" width="85%" align="left">
								   <select name="vr_category" id="vr_category">
									   <option value="">請選擇類別</option>
			                  		   <%  
			                  				for(int i=0; i<dms.size(); i++){
			                  					TableRecord dm = (TableRecord) dms.get(i);
			                  			%>
			                  			<option value="<%=dm.getString("dm_id") %>" <%=dm.getString("dm_id").equals(vr.getString("vr_category"))?"selected":"" %>><%=dm.getString("dm_title") %></option>
										<% } %>
									</select>
								</td>
							</tr>
							<tr class="web_table-2-1">
								<td width="15%" align="right">標題</td>
								<td colspan="3" width="85%" align="left">
									<input type="text" name="vr_title" id="vr_title" size="137" maxlength="120" value="<%=vr.getString("vr_title")%>"/>
								</td>
							</tr>							
							
							<tr class="web_table-2-1">
								<td width="15%" align="right">年度</td>
								<td colspan="1" width="35%" align="left">
                                    <select name="vr_year">
                                    <%for(int i = DateTimeTool.getYear();i > DateTimeTool.getYear()-3;i--){ %>
                                        <option <%=vr.getString("vr_year").equals(String.valueOf(i))?"selected":"" %>><%=i %></option>
                                    <%} %>
                                    </select>
								</td>
							    
							    <td width="15%" align="right">月份</td>
								<td colspan="1" width="35%" align="left">
                                    <select name="vr_month">
                                    <%for(int i = 1;i < 13;i++) {%>
                                        <option <%=vr.getString("vr_month").equals(String.valueOf(i))?"selected":"" %>><%=i %></option>
                                    <%} %>
                                    </select>
								</td>
							</tr>
							
							<tr class="web_table-2-1">
								<td width="15%" align="right">年齡</td>
								<td colspan="3" width="85%" align="left">
									<input type="text" name="vr_age" id="vr_age" size="137" maxlength="120" value="<%=vr.getString("vr_age") %>"/>
								</td>
							</tr>
							<tr class="web_table-2-1">
								<td width="15%" align="right">性別</td>
								<td colspan="3" width="85%" align="left">
									<input type="text" name="vr_gender" id="vr_gender" size="137" maxlength="120" value="<%=vr.getString("vr_age")%>"/>
								</td>
							</tr>
							
							<tr class="web_table-2-1">
								<td width="15%" align="right">團體參訪</td>
								<td colspan="3" width="85%" align="left">
									<input type="text" name="vr_group" id="vr_group" size="137" maxlength="120" value="<%=vr.getString("vr_group")%>"/>
								</td>
							</tr>
							<tr class="web_table-2-1">
								<td width="15%" align="right">原/偏鄉</td>
								<td colspan="3" width="85%" align="left">
									<input type="text" name="vr_town" id="vr_town" size="137" maxlength="120" value="<%=vr.getString("vr_town")%>"/>
								</td>
							</tr>
							<tr class="web_table-2-1">
								<td width="15%" align="right">活動辦理紀錄</td>
								<td colspan="3" width="85%" align="left">
									<input type="text" name="vr_record" id="vr_record" size="137" maxlength="120" value="<%=vr.getString("vr_record")%>"/>
								</td>
							</tr>
							<tr class="web_table-2-1">
								<td width="15%" align="right">課程資訊及數據</td>
								<td colspan="3" width="85%" align="left">
									<input type="text" name="vr_info" id="vr_info" size="137" maxlength="120" value="<%=vr.getString("vr_info")%>"/>
								</td>
							</tr>
							<tr class="web_table-2-1">
								<td width="15%" align="right">參與人數</td>
								<td colspan="3" width="85%" align="left">
									<input type="text" name="vr_people" id="vr_people" size="137" maxlength="120" value="<%=vr.getInt("vr_people")%>"/>
								</td>
							</tr>
							<%--
							<tr class="web_table-2-1">
								<td align="right">內文</td>
								<td colspan="3" align="left">
									<textarea name="cp_content" id="cp_content" cols="118" rows="8" class="mceEditor"><%=cp.getString("cp_content")%></textarea>
								</td>
							</tr>
                            --%>

							<%if(keyword_switch){ %>
							<tr align="center" class="web_table-2-1">
								<td colspan="4" align="center">關鍵字設定</td>
							</tr>
							<tr class="web_table-2-1">
								<td width="15%" align="right">設定索引[Robots]</td>
								<td width="35%" align="left">
									<select name="vr_robots" id="vr_robots">
										<option value="all" <%="all".equals(vr.getString("vr_robots"))?"selected":"" %>>全部-ALL</option>
										<option value="none" <%="none".equals(vr.getString("vr_robots"))?"selected":"" %>>無索引-None</option>
										<option value="index" <%="index".equals(vr.getString("vr_robots"))?"selected":"" %>>索引該網頁-Index</option>
										<option value="noindex" <%="noindex".equals(vr.getString("vr_robots"))?"selected":"" %>>不索引該網頁-NoIndex</option>
										<option value="follow" <%="follow".equals(vr.getString("vr_robots"))?"selected":"" %>>關注特定連結-Follow</option>
										<option value="nofollow" <%="nofollow".equals(vr.getString("vr_robots"))?"selected":"" %>>不關注特定連結-NoFollow</option>
									</select>
								</td>
								<td width="20%" align="right">設定來訪週期</td>
								<td width="30%" align="left">
									<input type="number" name="vr_revisit_after" id="vr_revisit_after" value="<%=vr.getString("vr_revisit_after") %>" size="4" maxlength="4" />天
								</td>
							</tr>
							<tr class="web_table-2-1">
								<td align="right">設定主要關鍵字</td>
								<td align="left">
									<input type="text" name="vr_keywords" id="cp_keywords" size="40" maxlength="255" value="<%=vr.getString("vr_keywords") %>"/>
								</td>
								<td align="right">設定網頁版權說明</td>
								<td align="left">
									<input type="text" name="vr_copyright" id="vr_copyright" size="30" value="<%=vr.getString("vr_copyright") %>"/>
								</td>
							</tr>
							<tr class="web_table-2-1">
								<td align="right">
									網頁內容簡介<br />[建議80-100字]
								</td>
								<td colspan="3" align="left">
									<textarea name="vr_description" id="vr_description" cols="118" rows="3" maxlength="255"><%=vr.getString("vr_description") %></textarea>
								</td>
							</tr>
							<tr class="web_table-2-1">
								<td align="right">設定追蹤碼</td>
								<td colspan="3" align="left">
									<textarea name="vr_seo_track" id="vr_seo_track" cols="118" rows="3"><%=vr.getString("vr_seo_track") %></textarea>
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
									<input name="vr_emitdate" id="_qemitdate" type="text" value="<%=vr.getString("vr_emitdate") %>" size="15" readonly>
								</td>
								<td align="right" class="tablebg">下架日期</td>
								<td align="left" class="tablebg">
									<input name="vr_restdate" id="_qrestdate" type="text" value="<%=vr.getString("vr_restdate") %>" size="15" readonly>
								</td>
							</tr>
							<%} %>
							<tr class="web_table-2-1">
								<td align="right">最後修改人員</td>
								<td align="left"><%=vr.getString("vr_modifyuser") %></td>
								<td align="right">最後修改日期</td>
								<td align="left"><%=vr.getString("vr_modifydate") %></td>
							</tr>

						</table>
						</td>
					</tr>
					<tr align="center">
						<td colspan="4" align="center"><br />
						<input type="hidden" name="_qtitle" value="<%=qtitle %>" />
						<input type="submit" value="確定送出" />&nbsp;
						<input type="reset" value="重新設定" />&nbsp;
						<input type="button" value="回上一頁" onClick="listpage.submit();">
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