<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
	String code	= "rootsetup_c";				// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用

	// Left side type.
	String lefttype = "system";

	// Tiltes.
	String[] titles = new String[]{"網站後台名稱", "about 模組名稱", "project 模組名稱", "product 模組名稱", "product 類別層數", "job 模組名稱", "contact 模組名稱", "contact 備註說明"};
	// Keywords.
	String[] keywords = new String[]{"mis_title", "about_title", "project_title", "product_title", "product_category", "job_title", "contact_title", "contact_remark"};
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
		<td width="1125" align="center" valign="top" class="system_bk-2p">
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
				<td align="left" valign="middle" class="system_bigword">模組功能設定</td>
			</tr>
			<tr>
				<td colspan="2">
				<hr size="1" noshade>
				</td>
			</tr>
			<form name="form0" method="post" action="rootsetup_c_update.jsp" enctype="multipart/form-data">
			<%if(app_account.equals("root")){ %>
			<tr align="center">
				<td colspan="2">
				<table width="95%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="system_bk-2bk">
						<table width="100%" border="0" align="center" cellpadding="3"
							cellspacing="1">
							<tr align="center">
								<td colspan="4" class="system_title-1">模組功能設定</td>
							</tr>
							<tr>
								<td colspan="4" align="center" class="admini_bk-2">網頁標題（Title）設定</td>
							</tr>
							<tr class="system_table-2-1">
								<td width="21%" align="right" class="admini_bk-2">名稱</td>
								<td width="79%" colspan="3" align="left" class="system_table-2-1">
									<input name="mis_title" type="text" size="36" value="<%=SiteSetup.getSetup("mis_title" + "." + lang).getString("ss_text")%>" />
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
								<td colspan="4" class="admini_bk-2"><%=SiteSetup.getSetup("about_title" + "." + lang).getString("ss_text")%> (about) 資訊設定</td>
							</tr>

							<tr class="system_table-2-1">
								<td width="21%" align="right" class="admini_bk-2">名稱</td>
								<td width="79%" colspan="3" align="left" class="system_table-2-1">
									<input name="about_title" type="text" size="36" value="<%=SiteSetup.getSetup("about_title" + "." + lang).getString("ss_text")%>" />
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
								<td colspan="4" class="admini_bk-2"><%=SiteSetup.getSetup("project_title" + "." + lang).getString("ss_text")%> (project) 資訊設定</td>
							</tr>

							<tr class="system_table-2-1">
								<td width="21%" align="right" class="admini_bk-2">名稱</td>
								<td width="79%" colspan="3" align="left" class="system_table-2-1">
									<input name="project_title" type="text" size="36" value="<%=SiteSetup.getSetup("project_title" + "." + lang).getString("ss_text")%>" />
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
								<td colspan="4" class="admini_bk-2"><%=SiteSetup.getSetup("product_title" + "." + lang).getString("ss_text")%> (product) 資訊設定</td>
							</tr>

							<tr class="system_table-2-1">
								<td width="21%" align="right" class="admini_bk-2">名稱</td>
								<td width="79%" colspan="3" align="left" class="system_table-2-1">
									<input name="product_title" type="text" size="36" value="<%=SiteSetup.getSetup("product_title" + "." + lang).getString("ss_text")%>" />
								</td>
							</tr>
							<tr class="system_table-2-1">
								<td width="21%" align="right" class="admini_bk-2">類別層數</td>
								<td width="79%" colspan="3" align="left" class="system_table-2-1">
									一層<input name="product_category" type="radio" value="1" <%=SiteSetup.getSetup("product_category" + "." + lang).getString("ss_text").equals("1")?"checked":""%>/>
									二層<input name="product_category" type="radio" value="2" <%=SiteSetup.getSetup("product_category" + "." + lang).getString("ss_text").equals("2")?"checked":""%>/>
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
								<td colspan="4" class="admini_bk-2"><%=SiteSetup.getSetup("job_title" + "." + lang).getString("ss_text")%> (job) 資訊設定</td>
							</tr>

							<tr class="system_table-2-1">
								<td width="21%" align="right" class="admini_bk-2">名稱</td>
								<td width="79%" colspan="3" align="left" class="system_table-2-1">
									<input name="job_title" type="text" size="36" value="<%=SiteSetup.getSetup("job_title" + "." + lang).getString("ss_text")%>" />
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
								<td colspan="4" class="admini_bk-2"><%=SiteSetup.getSetup("contact_title" + "." + lang).getString("ss_text")%> (contact) 資訊設定</td>
							</tr>

							<tr class="system_table-2-1">
								<td width="21%" align="right" class="admini_bk-2">名稱</td>
								<td width="79%" colspan="3" align="left" class="system_table-2-1">
									<input name="contact_title" type="text" size="36" value="<%=SiteSetup.getSetup("contact_title" + "." + lang).getString("ss_text")%>" />
								</td>
							</tr>

							<tr class="system_table-2-1">
								<td width="21%" align="right" class="admini_bk-2">備註說明</td>
								<td width="79%" colspan="3" align="left" class="system_table-2-1">
									<input name="contact_remark" type="text" size="120" value="<%=SiteSetup.getSetup("contact_remark" + "." + lang).getString("ss_text")%>" />
								</td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<%} %>
			<tr align="center">
				<td colspan="2">
				<table width="95%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="system_bk-2bk">
						<table width="100%" border="0" align="center" cellpadding="3"
							cellspacing="1">
							<tr align="center">
								<td colspan="4" class="admini_bk-2">檔案下載</td>
							</tr>
							<tr class="system_table-2-1">
								<td width="21%" align="right" class="admini_bk-2">檔案下載</td>
								<td width="79%" colspan="3" align="left" class="system_table-2-1">
									<input type="button" value="檔案下載" onclick="javascript:window.open('file_download.jsp');">
								</td>
							</tr>
							<tr align="center">
								<td colspan="4" class="admini_bk-2">檔案上傳</td>
							</tr>

							<tr class="system_table-2-1">
								<td width="21%" align="right" class="admini_bk-2">CSS</td>
								<td width="79%" colspan="3" align="left" class="system_table-2-1">
									<input name="css" type="file">
								</td>
							</tr>
							<tr class="system_table-2-1">
								<td width="21%" align="right" class="admini_bk-2">前台用圖</td>
								<td width="79%" colspan="3" align="left" class="system_table-2-1">
									<input name="web_logo" type="file" multiple="multiple">
								</td>
							</tr>
							<tr class="system_table-2-1">
								<td width="21%" align="right" class="admini_bk-2">後台用圖</td>
								<td width="79%" colspan="3" align="left" class="system_table-2-1">
									<input name="mis_logo" type="file" multiple="multiple">
								</td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				<br>
				<input type="submit" name="update" value="確定送出">&nbsp;
				<input type="reset" name="cancel" value="放棄修改">
				</td>
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
		</td>
	</tr>
</table>
</div>
</body>
</html>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>