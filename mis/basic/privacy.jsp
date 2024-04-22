<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%
	// 基本參數
	String code = "privacy"; // 模組識別碼
	String upload_code = "privacy"; // 上傳資料夾識別碼
	String show_title = "隱私權政策"; // 模組標題

	// 功能參數
	boolean single = true;	   		// 單網編/單一修改畫面模組 true=關閉列表+ 排序+ 新增功能
	boolean list_switch = true;		// 是否開啟列表功能
	boolean sort_switch = true;		// 是否開啟排序功能
	boolean keyword_switch = true;	// 是否開啟關鍵字設定
	boolean deadline_switch = false;// 是否開啟上下架日期	
	int add_num = -1;				// 設定可新增的資料筆數 , -1 為無限筆
/*--------------------------------------------------------------------------------------*/		
	Vector cps = app_sm.selectAll(tblcp, "cp_code=? and cp_lang=?", new Object[] { code, lang }, "cp_showseq ASC , cp_createdate DESC");	
	// 當資料筆數小於設定可新增的筆數時 , 顯示新增按鍵
	boolean add_switch = num_check(add_num, cps);

	// 修改資料ID
	String cp_id = StringTool.validString(request.getParameter("cp_id"));
	TableRecord cp = app_sm.select(tblcp, cp_id);

	if(single){
		list_switch = false;
		sort_switch = false;
		add_switch = false;
		add_num = 1;
		
		// 單網編 直接抓功能代號
		cp = app_sm.select(tblcp, "cp_code=? and cp_lang=?",new Object[]{code,lang});
		// 設定預設值(單網編模組 直接顯示修改畫面)
		if (cp.getString("cp_id").equals("")) {
			cp = new TableRecord(tblcp);
			cp.setValue("cp_title", show_title);
			cp.setValue("cp_robots", SiteSetup.getSetup("seo.robots"+"."+lang).getString("ss_text"));
			cp.setValue("cp_revisit_after", SiteSetup.getSetup("seo.revisit_after"+"."+lang).getString("ss_text"));
			cp.setValue("cp_keywords", SiteSetup.getSetup("seo.keywords"+"."+lang).getString("ss_text"));
			cp.setValue("cp_copyright", SiteSetup.getSetup("seo.copyright"+"."+lang).getString("ss_text"));
			cp.setValue("cp_description", SiteSetup.getSetup("seo.description"+"."+lang).getString("ss_text"));
			cp.setValue("cp_seo_track", SiteSetup.getSetup("seo.track"+"."+lang).getString("ss_text"));		   
			cp.setValue("cp_code", code);	// 識別碼
			cp.setValue("cp_lang", lang);	// 語系
			cp.setInsert(app_account); 
			app_sm.insert(cp);
		}
		cp_id = cp.getString("cp_id");
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
								<IFRAME HEIGHT="500" width="155" MARGINWIDTH="0" MARGINHEIGHT="0" HSPACE="0" VSPACE="0" FRAMEBORDER="0" SCROLLING="no" id="show" name="show" SRC="../leftmenu.jsp"> </IFRAME>
							</td>
						</tr>
					</table>
				</td>
				<td width="1125" align="center" valign="top" class="system_bk-2p">
					<form name="frm" id="frm" method="post" enctype="multipart/form-data" action="<%=code%>_update.jsp?action=M&cp_id=<%=cp_id%>">
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
								<td align="left" valign="middle" class="web_bigword"><%=show_title%>維護
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
														<td align="center" colspan="4" class="web_title-1"><%=show_title%>維護&nbsp;&nbsp;
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
														<td colspan="4" align="center">修改資訊</td>
													</tr>
													
													<tr class="web_table-2-1">
														<td width="15%" align="right">標題</td>
														<td colspan="3" width="85%" align="left">
															<%=cp.getString("cp_title")%>
															<%--
															<input type="text" name="cp_title" id="cp_title" size="137" maxlength="120" value="<%=cp.getString("cp_title")%>"/>
															 --%>
														</td>
													</tr>
													
													<tr class="web_table-2-1">
														<td align="right">內文</td>
														<td colspan="3" align="left">
															<textarea name="cp_content" id="cp_content" cols="118" rows="8" class="mceEditor"><%=cp.getString("cp_content")%></textarea>
														</td>
													</tr>
													
													<% if (keyword_switch) { %>
													<tr align="center" class="web_table-2-1">
														<td colspan="4" align="center">關鍵字設定</td>
													</tr>
													<tr class="web_table-2-1">
														<td width="15%" align="right">設定索引[Robots]</td>
														<td width="35%" align="left">
															<select name="cp_robots" id="cp_robots">
																<option value="all" <%="all".equals(cp.getString("cp_robots")) ? "selected" : ""%>>全部-ALL</option>
																<option value="none" <%="none".equals(cp.getString("cp_robots")) ? "selected" : ""%>>無索引-None</option>
																<option value="index" <%="index".equals(cp.getString("cp_robots")) ? "selected" : ""%>>索引該網頁-Index</option>
																<option value="noindex" <%="noindex".equals(cp.getString("cp_robots")) ? "selected" : ""%>>不索引該網頁-NoIndex</option>
																<option value="follow" <%="follow".equals(cp.getString("cp_robots")) ? "selected" : ""%>>關注特定連結-Follow</option>
																<option value="nofollow" <%="nofollow".equals(cp.getString("cp_robots")) ? "selected" : ""%>>不關注特定連結-NoFollow</option>
															</select>
														</td>
														<td width="20%" align="right">設定來訪週期</td>
														<td width="30%" align="left">
															<input type="text" name="cp_revisit_after" id="cp_revisit_after" value="<%=cp.getString("cp_revisit_after")%>" size="4" maxlength="4" />
															天
														</td>
													</tr>
													<tr class="web_table-2-1">
														<td align="right">設定主要關鍵字</td>
														<td align="left">
															<input type="text" name="cp_keywords" id="cp_keywords" size="40" maxlength="255" value="<%=cp.getString("cp_keywords")%>" />
														</td>
														<td align="right">設定網頁版權說明</td>
														<td align="left">
															<input type="text" name="cp_copyright" id="cp_copyright" size="30" value="<%=cp.getString("cp_copyright")%>" />
														</td>
													</tr>
													<tr class="web_table-2-1">
														<td align="right">
															網頁內容簡介
															<br />
															[建議80-100字]
														</td>
														<td colspan="3" align="left">
															<textarea name="cp_description" id="cp_description" cols="118" rows="3" maxlength="255"><%=cp.getString("cp_description")%></textarea>
														</td>
													</tr>
													<tr class="web_table-2-1">
														<td align="right">設定追蹤碼</td>
														<td colspan="3" align="left">
															<textarea name="cp_seo_track" id="cp_seo_track" cols="118" rows="3"><%=cp.getString("cp_seo_track")%></textarea>
														</td>
													</tr>
													<% } %>
													
													<% if(deadline_switch){ %>
													<tr align="center" class="web_bk-2">
														<td colspan="4" align="center">上下架時間</td>
													</tr>
													<tr class="web_table-2-1">
														<td align="right" class="web_table-2-1">上架日期</td>
														<td align="left" class="tablebg">
															<input name="cp_emitdate" id="_qemitdate" type="text" value="<%=cp.getString("cp_emitdate") %>" size="15" readonly>
														</td>
														<td align="right" class="tablebg">下架日期</td>
														<td align="left" class="tablebg">
															<input name="cp_restdate" id="_qrestdate" type="text" value="<%=cp.getString("cp_restdate") %>" size="15" readonly>
														</td>
													</tr>
													<% } %>
													<tr class="web_table-2-1">
														<td align="right">最後修改人員</td>
														<td align="left"><%=cp.getString("cp_modifyuser")%></td>
														<td align="right">最後修改日期</td>
														<td align="left"><%=cp.getString("cp_modifydate")%></td>
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