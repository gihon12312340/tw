<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%
	// 基本參數
	String code = "count3"; 			// 模組識別碼
	String upload_code = "count3"; 	// 上傳資料夾識別碼
	String show_title = "瀏覽人次維護"; 			// 模組標題

	//TableRecord na = app_sm.select(tblna,"na_code=?",new Object[]{code});
	
	// 功能參數
	boolean single = true;	   		// 單網編/單一修改畫面模組 true=關閉列表+ 排序+ 新增功能
	boolean list_switch = true;		// 是否開啟列表功能
	boolean sort_switch = true;		// 是否開啟排序功能
	boolean keyword_switch = false;	// 是否開啟關鍵字設定
	boolean deadline_switch = false;// 是否開啟上下架日期	
	int add_num = -1;				// 設定可新增的資料筆數 , -1 為無限筆
/*--------------------------------------------------------------------------------------*/		
	Vector nas = app_sm.selectAll(tblna, "na_code=? and na_lang=?", new Object[] { code, lang }, "na_showseq ASC , na_createdate DESC");	
	// 當資料筆數小於設定可新增的筆數時 , 顯示新增按鍵
	boolean add_switch = num_check(add_num, nas);

	// 修改資料ID
	String na_id = StringTool.validString(request.getParameter("na_id"));
	TableRecord na = app_sm.select(tblna, na_id);

	if(single){
		list_switch = false;
		sort_switch = false;
		add_switch = false;
		add_num = 1;
		
		// 單網編 直接抓功能代號
		na = app_sm.select(tblna, "na_code=? and na_lang=?",new Object[]{code,lang});
		// 設定預設值(單網編模組 直接顯示修改畫面)
		if (na.getString("na_id").equals("")) {
			na = new TableRecord(tblna);
			/*
			na.setValue("na_title", show_title);
			na.setValue("na_robots", SiteSetup.getSetup("seo.robots"+"."+lang).getInt("ss_text"));
			na.setValue("na_revisit_after", SiteSetup.getSetup("seo.revisit_after"+"."+lang).getInt("ss_text"));
			na.setValue("na_keywords", SiteSetup.getSetup("seo.keywords"+"."+lang).getInt("ss_text"));
			na.setValue("na_copyright", SiteSetup.getSetup("seo.copyright"+"."+lang).getInt("ss_text"));
			na.setValue("na_description", SiteSetup.getSetup("seo.description"+"."+lang).getInt("ss_text"));
			na.setValue("na_seo_track", SiteSetup.getSetup("seo.track"+"."+lang).getInt("ss_text"));		   
			*/
			na.setValue("na_code", code);	// 識別碼
			na.setValue("na_lang", lang);	// 語系
			na.setInsert(app_account); 
			app_sm.insert(na);
		}
		na_id = na.getString("na_id");
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="include/head.jsp"%>
<%@include file="/WEB-INF/jspf/mis/htmleditor.jspf"%>
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
							<td>
								<IFRAME HEIGHT="800" width="155" MARGINWIDTH="0" MARGINHEIGHT="0" HSPACE="0" VSPACE="0" FRAMEBORDER="0" SCROLLING="no" id="show" name="show" SRC="../leftmenu.jsp"> </IFRAME>
							</td>
						</tr>
					</table>
				</td>
				<td width="1125" align="center" valign="top" class="system_bk-2p">
					<form name="frm" id="frm" method="post" enctype="multipart/form-data" action="<%=code%>_update.jsp?action=M&na_id=<%=na_id%>">
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
								<td align="left" valign="middle" class="web_bigword"><%=show_title%>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<hr size="1" noshade>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">
									<table width="95%" border="0" cellspacing="1" cellpadding="0">
										<tr>
											<td class="system_bk-2bk">
												<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
													<tr>
														<td align="center" colspan="12" class="web_title-1"><%=show_title%>&nbsp;&nbsp;
															<%
																if (add_switch) {
															%>
															<input type="button" value="新增資料" onclick="javascript:location.href='<%=code%>_a.jsp'" />
															&nbsp;
															<%
																}
															%>
															<%
																if (list_switch) {
															%>
															<input type="button" value="回到列表" onclick="javascript:location.href='<%=code%>.jsp'" />
															&nbsp;
															<%
																}
															%>
															<%
																if (sort_switch) {
															%>
															<input type="button" value="資料排序" onclick="javascript:location.href='<%=code%>_sort.jsp'" />
															<%
																}
															%>
														</td>
													</tr>
													<tr align="center" class="web_bk-2">
														<td colspan="12" align="center">修改資訊</td>
													</tr>
															<%--
													<tr class="web_table-2-1">
														<td width="15%" align="right">標題</td>
														<td colspan="12" width="85%" align="left">
															<%=na.getString("na_title")%>
															<input type="text" name="na_title" id="na_title" size="137" maxlength="120" value="<%=na.getString("na_title")%>"/>
														</td>
													</tr>
															 --%>
													<tr class="web_table-2-1">
														
														<td width="10%" align="right">技職實作環境<br>瀏覽人次</td>
														<td colspan="4" width="30%" align="left">
															<input type="number" name="na_imp3" id="na_imp3" size="137" maxlength="120" value="<%=na.getInt("na_imp3")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="15%" align="right">報名參訪體驗資訊<br>瀏覽人次</td>
														<td colspan="4" width="45%" align="left">
															<input type="number" name="na_imp2_3" id="na_imp2_3" size="137" maxlength="120" value="<%=na.getInt("na_imp2_3")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													<tr class="web_table-2-1">
														<td align="right" colspan="2">最後修改人員</td>
														<td align="left" colspan="3"><%=na.getString("na_modifyuser")%></td>
														<td align="right" colspan="2">最後修改日期</td>
														<td align="left" colspan="3"><%=na.getString("na_modifydate")%></td>
													</tr>

												</table>
											</td>
										</tr>
										<tr align="center">
											<td colspan="4" align="center">
												<br />
												<input type="submit" value="確定送出" />
												&nbsp;
												<input type="reset" value="重新設定" />
												&nbsp;
												<input type="button" value="回上一頁" onClick="javascript:history.back();">
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr>
								<td colspan="3" class="web_bk-2b">&nbsp;</td>
							</tr>
						</table>
					</form>
				</td>
				</div>
			</tr>
		</table>
	</div>
</body>
</html>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>