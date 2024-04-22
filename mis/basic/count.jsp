<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%
	// 基本參數
	String code = "count"; 			// 模組識別碼
	String upload_code = "count"; 	// 上傳資料夾識別碼
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
														<td width="15%" align="center" colspan="12">會員數量</td>
														
													</tr>
													<tr class="web_table-2-1">
														<td width="5%" align="right">會員數量</td>
														<td colspan="4" width="23%" align="left">
															<input type="number" name="na_member" id="na_member" size="137" maxlength="120" value="<%=na.getInt("na_member")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="5%" align="right">申請發文帳號數量</td>
														<td colspan="6" width="45%" align="left">
															<input type="number" name="na_apply" id="na_apply" size="137" maxlength="120" value="<%=na.getInt("na_apply")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														
													</tr>
													<tr class="web_table-2-1">
														<td width="15%" align="center" colspan="12">學習專區</td>
														
													</tr>
													<tr class="web_table-2-1">
														<td width="10%" align="right">認識技職教育</td>
														<td colspan="3" width="23%" align="left">
															<input type="number" name="na_learn" id="na_learn" size="137" maxlength="120" value="<%=na.getInt("na_learn")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="10%" align="right">升學技高</td>
														<td colspan="3" width="23%" align="left">
															<input type="number" name="na_highschool" id="na_highschool" size="137" maxlength="120" value="<%=na.getInt("na_highschool")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="10%" align="right">升學五專</td>
														<td colspan="3" width="23%" align="left">
															<input type="number" name="na_fiveyear" id="na_fiveyear" size="137" maxlength="120" value="<%=na.getInt("na_fiveyear")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													<tr class="web_table-2-1">
														<td width="10%" align="right">四技二專</td>
														<td colspan="3" width="23%" align="left">
															<input type="number" name="na_university" id="na_university" size="137" maxlength="120" value="<%=na.getInt("na_university")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="10%" align="right">技職好文</td>
														<td colspan="3" width="23%" align="left">
															<input type="number" name="na_article" id="na_article" size="137" maxlength="120" value="<%=na.getInt("na_article")%>" 
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="10%" align="right">技職有影</td>
														<td colspan="3" width="23%" align="left">
															<input type="number" name="na_video" id="na_video" size="137" maxlength="120" value="<%=na.getInt("na_video")%>" 
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													<tr class="web_table-2-1">
														<td width="15%" align="center" colspan="12">遊玩人次</td>
														
													</tr>
													
													<tr class="web_table-2-1">
														<td width="5%" align="right">神秘森林救援<br>記名遊玩人次</td>
														<td colspan="4" width="45%" align="left">
															<input type="number" name="na_forest_login" id="na_forest_login" size="137" maxlength="120" value="<%=na.getInt("na_forest_login")%>" 
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="5%" align="right">神秘森林救援<br>匿名遊玩人次</td>
														<td colspan="6" width="45%" align="left">
															<input type="number" name="na_forest_anom" id="na_forest_anom" size="137" maxlength="120" value="<%=na.getInt("na_forest_anom")%>" 
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													
													<tr class="web_table-2-1">
														<td width="5%" align="right">積木樂園<br>記名遊玩人次</td>
														<td colspan="4" width="45%" align="left">
															<input type="number" name="na_brick_login" id="na_brick_login" size="137" maxlength="120" value="<%=na.getInt("na_brick_login")%>" 
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="5%" align="right">積木樂園<br>匿名遊玩人次</td>
														<td colspan="6" width="45%" align="left">
															<input type="number" name="na_brick_anom" id="na_brick_anom" size="137" maxlength="120" value="<%=na.getInt("na_brick_anom")%>" 
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													
													<tr class="web_table-2-1">
														<td width="5%" align="right">花草實驗室<br>記名遊玩人次</td>
														<td colspan="4" width="45%" align="left">
															<input type="number" name="na_flower_login" id="na_flower_login" size="137" maxlength="120" value="<%=na.getInt("na_flower_login")%>" 
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="5%" align="right">花草實驗室<br>匿名遊玩人次</td>
														<td colspan="6" width="45%" align="left">
															<input type="number" name="na_flower_anom" id="na_flower_anom" size="137" maxlength="120" value="<%=na.getInt("na_flower_anom")%>" 
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													
													<tr class="web_table-2-1">
														<td width="5%" align="right">小建築大工程<br>記名遊玩人次</td>
														<td colspan="4" width="45%" align="left">
															<input type="number" name="na_build_login" id="na_shipping_login" size="137" maxlength="120" value="<%=na.getInt("na_build_login")%>" 
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="5%" align="right">小建築大工程<br>匿名遊玩人次</td>
														<td colspan="6" width="45%" align="left">
															<input type="number" name="na_build_anom" id="na_shipping_anom" size="137" maxlength="120" value="<%=na.getInt("na_build_anom")%>" 
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													<tr class="web_table-2-1">
														
														<td width="5%" align="right">誰是航運王<br>記名遊玩人次</td>
														<td colspan="4" width="45%" align="left">
															<input type="number" name="na_shipping_login" id="na_shipping_login" size="137" maxlength="120" value="<%=na.getInt("na_shipping_login")%>" 
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="5%" align="right">誰是航運王<br>匿名遊玩人次</td>
														<td colspan="6" width="45%" align="left">
															<input type="number" name="na_shipping_anom" id="na_shipping_anom" size="137" maxlength="120" value="<%=na.getInt("na_shipping_anom")%>" 
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													
													<tr class="web_table-2-1">
														
														<td width="10%" align="right">超級飛修員<br>記名遊玩人次</td>
														<td colspan="4" width="40%" align="left">
															<input type="number" name="na_aircraft_login" id="na_aircraft_login" size="137" maxlength="120" value="<%=na.getInt("na_aircraft_login")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="10%" align="right">超級飛修員<br>匿名遊玩人次</td>
														<td colspan="6" width="40%" align="left">
															<input type="number" name="na_aircraft_anom" id="na_aircraft_anom" size="137" maxlength="120" value="<%=na.getInt("na_aircraft_anom")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													
													<tr class="web_table-2-1">
														
														<td width="10%" align="right">智慧製造洗手乳<br>記名遊玩人次</td>
														<td colspan="4" width="40%" align="left">
															<input type="number" name="na_wisdom_login" id="na_wisdom_login" size="137" maxlength="120" value="<%=na.getInt("na_wisdom_login")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="10%" align="right">智慧製造洗手乳<br>匿名遊玩人次</td>
														<td colspan="6" width="40%" align="left">
															<input type="number" name="na_wisdom_anom" id="na_wisdom_anom" size="137" maxlength="120" value="<%=na.getInt("na_wisdom_anom")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													
													<tr class="web_table-2-1">
														
														<td width="10%" align="right">無人商店採購<br>記名遊玩人次</td>
														<td colspan="4" width="40%" align="left">
															<input type="number" name="na_dream_login" id="na_dream_login" size="137" maxlength="120" value="<%=na.getInt("na_dream_login")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="10%" align="right">無人商店採購<br>匿名遊玩人次</td>
														<td colspan="6" width="40%" align="left">
															<input type="number" name="na_dream_anom" id="na_dream_anom" size="137" maxlength="120" value="<%=na.getInt("na_dream_anom")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													
													<tr class="web_table-2-1">
														<td width="10%" align="right">彩繪技職樂園<br>記名遊玩人次</td>
														<td colspan="4" width="40%" align="left">
															<input type="number" name="na_paradise_login" id="na_paradise_login" size="137" maxlength="120" value="<%=na.getInt("na_paradise_login")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="10%" align="right">彩繪技職樂園<br>匿名遊玩人次</td>
														<td colspan="6" width="40%" align="left">
															<input type="number" name="na_paradise_anom" id="na_paradise_anom" size="137" maxlength="120" value="<%=na.getInt("na_paradise_anom")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													
													<tr class="web_table-2-1">
														<td width="10%" align="right">智能雞舍<br>記名遊玩人次</td>
														<td colspan="4" width="40%" align="left">
															<input type="number" name="na_farming_login" id="na_farming_login" size="137" maxlength="120" value="<%=na.getInt("na_farming_login")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="10%" align="right">智能雞舍<br>匿名遊玩人次</td>
														<td colspan="6" width="40%" align="left">
															<input type="number" name="na_farming_anom" id="na_farming_anom" size="137" maxlength="120" value="<%=na.getInt("na_farming_anom")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													
													<tr class="web_table-2-1">
														<td width="8%" align="right">漏網抓魚感測<br>記名遊玩人次</td>
														<td colspan="4" width="42%" align="left">
															<input type="number" name="na_fishing_login" id="na_fishing_login" size="137" maxlength="120" value="<%=na.getInt("na_fishing_login")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="8%" align="right">漏網抓魚感測<br>匿名遊玩人次</td>
														<td colspan="6" width="42%" align="left">
															<input type="number" name="na_fishing_anom" id="na_fishing_anom" size="137" maxlength="120" value="<%=na.getInt("na_fishing_anom")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													
													<tr class="web_table-2-1">
														<td width="8%" align="right">農業小幫手<br>記名遊玩人次</td>
														<td colspan="4" width="42%" align="left">
															<input type="number" name="na_drone_login" id="na_drone_login" size="137" maxlength="120" value="<%=na.getInt("na_drone_login")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="8%" align="right">農業小幫手<br>匿名遊玩人次</td>
														<td colspan="6" width="42%" align="left">
															<input type="number" name="na_drone_anom" id="na_drone_anom" size="137" maxlength="120" value="<%=na.getInt("na_drone_anom")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													
													<tr class="web_table-2-1">
														<td width="15%" align="center" colspan="12">其他區域</td>
														
													</tr>
													
													<tr class="web_table-2-1">
														<td width="10%" align="right">新訊報報 </td>
														<td colspan="3" width="23%" align="left">
															<input type="number" name="na_news" id="na_news" size="137" maxlength="120" value="<%=na.getInt("na_news")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="10%" align="right">職業試探常設展</td>
														<td colspan="3" width="23%" align="left">
															<input type="number" name="na_career" id="na_career" size="137" maxlength="120" value="<%=na.getInt("na_career")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="10%" align="right">展場活動</td>
														<td colspan="3" width="23%" align="left">
															<input type="number" name="na_activity" id="na_activity" size="137" maxlength="120" value="<%=na.getInt("na_activity")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													<tr class="web_table-2-1">
														<td width="8%" align="right">技職教育好夥伴</td>
														<td colspan="4" width="42%" align="left">
															<input type="number" name="na_technical" id="na_technical" size="137" maxlength="120" value="<%=na.getInt("na_technical")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
														<td width="8%" align="right">聯絡我們</td>
														<td colspan="6" width="42%" align="left">
															<input type="number" name="na_contact" id="na_contact" size="137" maxlength="120" value="<%=na.getInt("na_contact")%>"
															min="0" oninput="value=value.replace(/[^\d]/g,'')"/>
														</td>
													</tr>
													<%-- 
													<tr class="web_table-2-1">
														<td align="right">內文</td>
														<td colspan="3" align="left">
															<textarea name="cp_content" id="cp_content" cols="118" rows="8" class="mceEditor"><%=cp.getInt("cp_content")%></textarea>
														</td>
													</tr>
													--%>
													<%-- 
													<% if (keyword_switch) { %>
													<tr align="center" class="web_table-2-1">
														<td colspan="4" align="center">關鍵字設定</td>
													</tr>
													<tr class="web_table-2-1">
														<td width="15%" align="right">設定索引[Robots]</td>
														<td width="35%" align="left">
															<select name="cp_robots" id="cp_robots">
																<option value="all" <%="all".equals(cp.getInt("cp_robots")) ? "selected" : ""%>>全部-ALL</option>
																<option value="none" <%="none".equals(cp.getInt("cp_robots")) ? "selected" : ""%>>無索引-None</option>
																<option value="index" <%="index".equals(cp.getInt("cp_robots")) ? "selected" : ""%>>索引該網頁-Index</option>
																<option value="noindex" <%="noindex".equals(cp.getInt("cp_robots")) ? "selected" : ""%>>不索引該網頁-NoIndex</option>
																<option value="follow" <%="follow".equals(cp.getInt("cp_robots")) ? "selected" : ""%>>關注特定連結-Follow</option>
																<option value="nofollow" <%="nofollow".equals(cp.getInt("cp_robots")) ? "selected" : ""%>>不關注特定連結-NoFollow</option>
															</select>
														</td>
														<td width="20%" align="right">設定來訪週期</td>
														<td width="30%" align="left">
															<input type="text" name="cp_revisit_after" id="cp_revisit_after" value="<%=cp.getInt("cp_revisit_after")%>" size="4" maxlength="4" />
															天
														</td>
													</tr>
													<tr class="web_table-2-1">
														<td align="right">設定主要關鍵字</td>
														<td align="left">
															<input type="text" name="cp_keywords" id="cp_keywords" size="40" maxlength="255" value="<%=cp.getInt("cp_keywords")%>" />
														</td>
														<td align="right">設定網頁版權說明</td>
														<td align="left">
															<input type="text" name="cp_copyright" id="cp_copyright" size="30" value="<%=cp.getInt("cp_copyright")%>" />
														</td>
													</tr>
													<tr class="web_table-2-1">
														<td align="right">
															網頁內容簡介
															<br />
															[建議80-100字]
														</td>
														<td colspan="3" align="left">
															<textarea name="cp_description" id="cp_description" cols="118" rows="3" maxlength="255"><%=cp.getInt("cp_description")%></textarea>
														</td>
													</tr>
													<tr class="web_table-2-1">
														<td align="right">設定追蹤碼</td>
														<td colspan="3" align="left">
															<textarea name="cp_seo_track" id="cp_seo_track" cols="118" rows="3"><%=cp.getInt("cp_seo_track")%></textarea>
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
															<input name="cp_emitdate" id="_qemitdate" type="text" value="<%=cp.getInt("cp_emitdate") %>" size="15" readonly>
														</td>
														<td align="right" class="tablebg">下架日期</td>
														<td align="left" class="tablebg">
															<input name="cp_restdate" id="_qrestdate" type="text" value="<%=cp.getInt("cp_restdate") %>" size="15" readonly>
														</td>
													</tr>
													<% } %>
													--%>
													<tr class="web_table-2-1">
														<td align="right" colspan="3">最後修改人員</td>
														<td align="left" colspan="3"><%=na.getString("na_modifyuser")%></td>
														<td align="right" colspan="3">最後修改日期</td>
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