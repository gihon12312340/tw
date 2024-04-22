<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
	String code	= "websetup_c";				// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用

	// Left side type.
	String lefttype = "system";

	//針對各語系設定欄位
	// Tiltes.
	String[] titles = new String[] { 
		"網站前台名稱", "索引", 
		"來訪週期", "關鍵字", "版權說明", "內容簡介", "追踪碼", 
		"3D實境館連結","Facebook社群連結",
		"指導單位", "承辦單位", "協辦單位", "協辦館所",
		"館場名稱1","館場名稱2","館場名稱3","館場名稱4","館場名稱5",
		"館場人數1","館場人數2","館場人數3","館場人數4","館場人數5"
	};
	
	// Keywords.
	String[] keywords = new String[] { 
		"web_title", "seo.robots",
		"seo.revisit_after", "seo.keywords", "seo.copyright", "seo.description", "seo.track",
		"cp.3Durl","cp.facebook",
		"cp.unit1", "cp.unit2", "cp.unit3", "cp.co-organizer" ,
		"cp.place0","cp.place1","cp.place2","cp.place3","cp.place4",
		"cp.headcount0","cp.headcount1","cp.headcount2","cp.headcount3","cp.headcount4",
	};
	
	// Get records.
	Vector misimages = new Vector();
	for (int i = 0; i < titles.length; i++) {
		TableRecord ss = SiteSetup.getSetup(keywords[i] + "." + lang);
		if (ss.getString("ss_id").equals("")) {
			ss = new TableRecord(tblss);
			ss.setInsert(app_account);
			ss.setValue("ss_title", titles[i]);
			ss.setValue("ss_keyword", keywords[i] + "." + lang);
			app_sm.insert(ss);
		}
		misimages.add(ss);
	}
	
	
	//針對不分語系共通設定欄位
	// Tiltes.
	String[] titles_1 = new String[] { 
			"載入頁", "技職體驗-分頁設定", "六大類群主題資源區-資訊分享設定"
	};
	
	// Keywords.
	String[] keywords_1 = new String[] { 
			"ss.loading", "ss.experience.pageno", "ss.sixinfo.showno"
	};
	
	// Get records.
	Vector misimages_1 = new Vector();
	for (int i = 0; i < titles_1.length; i++) {
		TableRecord ss = SiteSetup.getSetup(keywords_1[i]);
		if (ss.getString("ss_id").equals("")) {
			ss = new TableRecord(tblss);
			ss.setInsert(app_account);
			ss.setValue("ss_title", titles_1[i]);
			ss.setValue("ss_keyword", keywords_1[i]);
			app_sm.insert(ss);
		}
		misimages.add(ss);
	}	

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- InstanceBegin template="/Templates/system.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@include file="/WEB-INF/jspf/norobots.jspf"%>
<!-- InstanceBeginEditable name="doctitle" -->
<title><%=app_mistitle%></title>
<!-- InstanceEndEditable -->
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
//-->
</script>
<link href="../css/adm_css.css" rel="stylesheet" type="text/css">
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>

<body style="background-color: rgb(255, 255, 255);">
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
		<td width="3" align="center" valign="top" class="system_bk-2">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td><IFRAME HEIGHT=500 width=155 MARGINWIDTH=0 MARGINHEIGHT=0
					HSPACE=0 VSPACE=0 FRAMEBORDER=0 SCROLLING=no id="show" name="show"
					SRC="../leftmenu.jsp"></IFRAME></td>
			</tr>
		</table>
		</td>
		<td width="1125" align="center" valign="top" class="system_bk-2p"><!-- InstanceBeginEditable name="system-page" -->
		<table width="95%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" class="system_bk-2b">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td width="60" align="left" valign="middle"><img
					src="../images/system_icon_1.gif" width="55" height="48"></td>
				<td align="left" valign="middle" class="system_bigword">系統環境設定</td>
			</tr>
			<tr>
				<td colspan="2">
				<hr size="1" noshade>
				</td>
			</tr>
			<form name="form0" method="post" action="websetup_c_update.jsp"
				onsubmit="return checkform(this);">
			<tr align="center">
				<td colspan="2">
				<table width="95%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="system_bk-2bk">
						<table width="100%" border="0" align="center" cellpadding="3"
							cellspacing="1">
							<tr align="center">
								<td colspan="4" class="system_title-1">系統環境設定</td>
							</tr>
							<tr>
								<td colspan="4" align="center" class="admini_bk-2">網頁標題（Title）設定</td>
							</tr>
							<tr class="system_table-2-1">
								<td width="15%" align="right" class="admini_bk-2">名稱</td>
								<td width="85%" colspan="3" align="left"
									class="system_table-2-1"><input name="web_title"
									type="text" size="36"
									value="<%=SiteSetup.getSetup("web_title" + "." + lang).getString(
							"ss_text")%>" /></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr align="center">
				<td colspan="2">
				<table width="95%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="system_bk-2bk">
						<table width="100%" border="0" align="center" cellpadding="3"
							cellspacing="1">
							<tr align="center">
								<td colspan="4" class="admini_bk-2">版頭 Head 資訊設定</td>
							</tr>
							
							<tr class="system_table-2-1">
								<td width="15%" align="right" class="admini_bk-2">Facebook連結設定</td>
								<td width="85%" colspan="3" align="left" class="system_table-2-1">
									<input name="cp.facebook" type="text" value="<%=SiteSetup.getSetup("cp.facebook" + "." + lang).getString("ss_text")%>" size="136" />
								</td>					
							</tr>

						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>

			<tr align="center">
				<td colspan="2">
				<table width="95%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="system_bk-2bk">
						<table width="100%" border="0" align="center" cellpadding="3"
							cellspacing="1">
							<tr align="center">
								<td colspan="4" class="admini_bk-2">頁尾 CopyRight 資訊設定</td>
							</tr>
							
							<tr class="system_table-2-1">
								<td width="18%" align="right" class="admini_bk-2">指導單位</td>
								<td width="82%" colspan="3" align="left" class="system_table-2-1">
									<input name="cp.unit1" type="text" value="<%=SiteSetup.getSetup("cp.unit1" + "." + lang).getString("ss_text")%>" size="42" />
								</td>					
							</tr>
							
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">承辦單位</td>
								<td colspan="3" align="left" class="system_table-2-1">
									<input name="cp.unit2" type="text" value="<%=SiteSetup.getSetup("cp.unit2" + "." + lang).getString("ss_text")%>" size="100" />
								</td>								
							</tr>
							
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">協辦單位</td>
								<td colspan="3" align="left" class="system_table-2-1">
									<input name="cp.unit3" type="text" value="<%=SiteSetup.getSetup("cp.unit3" + "." + lang).getString("ss_text")%>" size="100" />
								</td>								
							</tr>
							
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">協辦館所</td>
								<td colspan="3" align="left" class="system_table-2-1">
									<input name="cp.co-organizer" type="text" value="<%=SiteSetup.getSetup("cp.co-organizer" + "." + lang).getString("ss_text")%>" size="100" />
								</td>								
							    
							</tr>
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">館場名稱1</td>
								<td   align="left" class="system_table-2-1">
									<input name="cp.place0" type="text" value="<%=SiteSetup.getSetup("cp.place0" + "." + lang).getString("ss_text")%>" size="42" />
								</td>
								<td align="right" class="admini_bk-2">館場人數1</td>
								<td align="left" class="system_table-2-1">
									<input name="cp.headcount0" type="text" value="<%=SiteSetup.getSetup("cp.headcount0" + "." + lang).getString("ss_text")%>" size="42" />
								</td>							
							</tr>
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">館場名稱2</td>
								<td   align="left" class="system_table-2-1">
									<input name="cp.place1" type="text" value="<%=SiteSetup.getSetup("cp.place1" + "." + lang).getString("ss_text")%>" size="42" />
								</td>
								<td align="right" class="admini_bk-2">館場人數2</td>
								<td align="left" class="system_table-2-1">
									<input name="cp.headcount1" type="text" value="<%=SiteSetup.getSetup("cp.headcount1" + "." + lang).getString("ss_text")%>" size="42" />
								</td>							
							</tr>
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">館場名稱3</td>
								<td   align="left" class="system_table-2-1">
									<input name="cp.place2" type="text" value="<%=SiteSetup.getSetup("cp.place2" + "." + lang).getString("ss_text")%>" size="42" />
								</td>
								<td align="right" class="admini_bk-2">館場人數3</td>
								<td align="left" class="system_table-2-1">
									<input name="cp.headcount2" type="text" value="<%=SiteSetup.getSetup("cp.headcount2" + "." + lang).getString("ss_text")%>" size="42" />
								</td>							
							</tr>
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">館場名稱4</td>
								<td   align="left" class="system_table-2-1">
									<input name="cp.place3" type="text" value="<%=SiteSetup.getSetup("cp.place3" + "." + lang).getString("ss_text")%>" size="42" />
								</td>
								<td align="right" class="admini_bk-2">館場人數4</td>
								<td align="left" class="system_table-2-1">
									<input name="cp.headcount3" type="text" value="<%=SiteSetup.getSetup("cp.headcount3" + "." + lang).getString("ss_text")%>" size="42" />
								</td>							
							</tr>
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">館場名稱5</td>
								<td   align="left" class="system_table-2-1">
									<input name="cp.place4" type="text" value="<%=SiteSetup.getSetup("cp.place4" + "." + lang).getString("ss_text")%>" size="42" />
								</td>
								<td align="right" class="admini_bk-2">館場人數5</td>
								<td align="left" class="system_table-2-1">
									<input name="cp.headcount4" type="text" value="<%=SiteSetup.getSetup("cp.headcount4" + "." + lang).getString("ss_text")%>" size="42" />
								</td>							
							</tr>
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">3D實境館連結</td>
								<td  colspan="3" align="left" class="system_table-2-1">
									<input name="cp.3Durl" type="text" value="<%=SiteSetup.getSetup("cp.3Durl" + "." + lang).getString("ss_text")%>" size="100" />
								</td>							
							</tr>
							
							
																			
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr align="center">
				<td colspan="2">
				<table width="95%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="system_bk-2bk">
						<table width="100%" border="0" align="center" cellpadding="3"
							cellspacing="1">
							<tr align="center">
								<td colspan="4" class="admini_bk-2">系統環境相關參數設定</td>
							</tr>
							
	                        <tr class="system_table-2-1">
	                          	<%--
	                          	<td width="15%" align="right" class="admini_bk-2">載入頁 開關設定</td>
	                          	<td width="35%" align="left" class="system_table-2-1">
	                          		<input name="ss.loading" type="radio" value="Y" <%="Y".equals(SiteSetup.getSetup("ss.loading").getString("ss_value").trim())?"checked":"" %> />
	                            	開啟
	                            	<input name="ss.loading" type="radio" value="N" <%=!"Y".equals(SiteSetup.getSetup("ss.loading").getString("ss_value").trim())?"checked":"" %>/>
	                          	          關閉
	                          	</td>
							  	<td width="15%" align="right" class="admini_bk-2">
							  		六大類群主題資源區
							  		<br />
							  		資訊分享顯示設定
							  	</td>
							  	<td colspan="3" width="85%" align="left" class="system_table-2-1">
									<input name="ss.sixinfo.showno" type="number" min="0" max="1000" value="<%=SiteSetup.getSetup("ss.sixinfo.showno").getString("ss_value")%>" size="6" required/>
							  	</td>
	                          	--%>
							  	<td width="15%" align="right" class="admini_bk-2">技職體驗列表分頁數</td>
							  	<td colspan="3" width="85%" align="left" class="system_table-2-1">
									<input name="ss.experience.pageno" type="number" min="0" max="1000" value="<%=SiteSetup.getSetup("ss.experience.pageno").getString("ss_value")%>" size="6" required/>
							  	</td>
	                        </tr>
	                        
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>

			<tr align="center">
				<td colspan="2">
				<table width="95%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="system_bk-2bk">
						<table width="100%" border="0" align="center" cellpadding="3"
							cellspacing="1">
							<tr>
								<td colspan="4" align="center" class="admini_bk-2">首頁暨各列表頁面關鍵字設定</td>
							</tr>
							<tr class="system_table-2-1">
								<td width="15%" align="right" class="admini_bk-2">設定索引[Robots]</td>
								<td width="35%" align="left" class="system_table-2-1"><select
									name="seo.robots">
									<option value="all"<%="all".equals(SiteSetup.getSetup("seo.robots" + "." + lang).getString("ss_text")) ? "selected" : ""%>>全部-ALL</option>
									<option value="none"<%="none".equals(SiteSetup.getSetup("seo.robots" + "." + lang).getString("ss_text"))? "selected": ""%>>無索引-None</option>
									<option value="index"<%="index".equals(SiteSetup.getSetup("seo.robots" + "." + lang).getString("ss_text"))? "selected": ""%>>索引該網頁-Index</option>
									<option value="noindex"<%="noindex".equals(SiteSetup.getSetup("seo.robots" + "." + lang).getString("ss_text"))? "selected": ""%>>不索引該網頁-NoIndex</option>
									<option value="follow"<%="follow".equals(SiteSetup.getSetup("seo.robots" + "." + lang).getString("ss_text"))? "selected": ""%>>關注特定連結-Follow</option>
									<option value="nofollow"<%="nofollow".equals(SiteSetup.getSetup("seo.robots" + "." + lang).getString("ss_text"))? "selected": ""%>>不關注特定連結-NoFollow</option>
								</select></td>
								<td width="15%" align="right" class="admini_bk-2">設定來訪週期</td>
								<td width="35%" align="left" class="system_table-2-1"><input name="seo.revisit_after" type="text" size="5" value="<%=SiteSetup.getSetup("seo.revisit_after" + "." + lang).getString("ss_text")%>" />[請輸入數字]
								</td>
							</tr>
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">設定主要關鍵字</td>
								<td align="left" class="system_table-2-1"><input name="seo.keywords" type="text" size="52" value="<%=SiteSetup.getSetup("seo.keywords" + "." + lang).getString("ss_text")%>" /></td>
								<td align="right" class="admini_bk-2">設定網頁版權說明</td>
								<td align="left" class="system_table-2-1"><input name="seo.copyright" type="text" size="52" value="<%=SiteSetup.getSetup("seo.copyright" + "." + lang).getString("ss_text")%>" /></td>
							</tr>
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">網頁內容簡介<br />[建議80~100字]</td>
								<td colspan="3" align="left" class="system_table-2-1"><textarea name="seo.description" cols="113" rows="4"><%=SiteSetup.getSetup("seo.description" + "." + lang).getString("ss_text")%></textarea></td>
							</tr>
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">設定追蹤碼</td>
								<td colspan="3" align="left" class="system_table-2-1"><textarea name="seo.track" cols="113" rows="8"><%=SiteSetup.getSetup("seo.track" + "." + lang).getString("ss_text")%></textarea></td>
							</tr>
							<tr class="system_table-2-1">
								<td align="right" class="admini_bk-2">最後修改人員</td>
								<td align="left" class="system_table-2-1"><%=SiteSetup.getSetup("seo.track" + "." + lang).getString("ss_modifyuser")%></td>
								<td align="right" class="admini_bk-2">最後修改日期</td>
								<td align="left" class="system_table-2-1"><%=SiteSetup.getSetup("seo.track" + "." + lang).getString("ss_modifydate")%></td>
							</tr>

						</table>
						</td>
					</tr>
				</table>
				<br>
				<input type="submit" name="update" value="確定送出">&nbsp; <input
					type="reset" name="cancel" value="放棄修改"></td>
			</tr>
			</form>
			<tr>
				<td colspan="2">
				<div align="center"><br>
				</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="system_bk-2b">&nbsp;</td>
			</tr>
		</table>
		<!-- InstanceEndEditable --></td>
	</tr>
</table>
</div>
</body>
<!-- InstanceEnd -->
</html>
<script>
<!--
function checkform(F) {
        return true;
}
//-->
</script>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>