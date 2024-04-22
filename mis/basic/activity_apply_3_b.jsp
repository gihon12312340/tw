<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%

	// 基本參數
	String code = "activity_apply_3"; 			// 模組識別碼
	String show_title = "科教館-活動報名紀錄維護";		// 模組標題
	
	// 功能參數
	boolean list_switch = true;		// 是否開啟列表功能
	int add_num = 0;				// 設定可新增的資料筆數 , -1 為無限筆
/*------------------------------------------------------------------------------------------*/
	Vector cus = app_sm.selectAll(tblaa, "aa_code=? and aa_lang=?", new Object[] { "activity_information_3", lang },  "aa_createdate DESC");
	// 當資料筆數小於設定可新增的筆數時 , 顯示新增按鍵
	boolean add_switch = num_check(add_num,cus);
	
	// 搜尋欄位
	String qemitdate = StringTool.validString(request.getParameter("_qemitdate"), DateTimeTool.getYear() - 1 + DateTimeTool.dateString().substring(4));
	String qrestdate = StringTool.validString(request.getParameter("_qrestdate"), DateTimeTool.getYear() + 1 + DateTimeTool.dateString().substring(4));
	String qname = StringTool.validString(request.getParameter("_qname"));
	//String qreply = StringTool.validString(request.getParameter("_qreply"));
	String qemail = StringTool.validString(request.getParameter("_qemail"));
	String qphone = StringTool.validString(request.getParameter("_qphone"));
	
	// 跳頁參數
	String[] names = new String[] { "npage", "_qname" , "_qemail" , "_qphone" ,"_qemitdate", "_qrestdate"};
	String[] values = new String[] { String.valueOf(pageno), qname , qemail ,qphone , qemitdate, qrestdate};
	// 回列表頁
	out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
	
	// 修改資料id
	String aa_id = StringTool.validString(request.getParameter("aa_id"));
	TableRecord aa = app_sm.select(tblaa, aa_id);
	String ai_title = app_sm.select(tblai,aa.getString("ai_id")).getString("ai_title");
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
	
    return true;
    
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
								<input type="button" value="報名紀錄列表" onclick="javascript:location.href='<%=code%>.jsp'" />&nbsp;
								<%} %>
								
								<input type="button" value="設定<%=show_title %>收件者" onclick="javascript:location.href='<%=code%>_pop.jsp'" />&nbsp;
								</td>
							</tr>							
							<tr align="center" class="web_bk-2">
								<td colspan="4" align="center">檢視資訊</td>
							</tr>
							<tr class="web_table-2-1">
			                  	<td width="15%" align="right">報名活動 ： </td>
			                 	<td colspan="3" width="35%" align="left">&nbsp;&nbsp;<%=ai_title %></td>
			                  	
							</tr>
							<tr class="web_table-2-1">
			                  	<td width="15%" align="right">姓名 ： </td>
			                 	<td width="35%" align="left">&nbsp;&nbsp;<%=aa.getString("aa_name") %></td>
			                  	<td width="15%" align="right">EMAIL ：  </td>
			                  	<td width="35%" align="left" >&nbsp;&nbsp;<%=aa.getString("aa_email") %>&nbsp;&nbsp;</td>
							</tr>							
							
							<tr class="web_table-2-1">
			                  	<td align="right">手機號碼 ：  </td>
			                  	<td align="left" >&nbsp;&nbsp;<%=aa.getString("aa_phone") %></td>
			                  	<%
			                  	String gender = "";
			                  	if("M".equals(aa.getString("aa_gender"))) {
			                  		gender = "男";
			                  	}else if("F".equals(aa.getString("aa_gender"))) {
			                  		gender = "女";
			                  	}
			                  	%>
			                  	<td align="right">性別 ： </td>
			                 	<td align="left">&nbsp;&nbsp;<%=gender %></td>
							</tr>
							
						    <tr class="web_table-2-1">
								<td align="right">地址： </td>
			                 	<td align="left">&nbsp;&nbsp;<%=aa.getString("aa_zipcode")+aa.getString("aa_county")+aa.getString("aa_city")+aa.getString("aa_address")%></td>			         
		                 		<td align="right">報名日期 ： </td>
		                 		<td align="left">&nbsp;&nbsp;<%=aa.getString("aa_createdate").substring(0,10) %></td>
						    </tr>
										  
							
						</table>
						</td>
					</tr> 		
		        </table>
				</td>
			</tr>
			
		
							
			<tr>
				<td align="center" colspan="2">
				<table width="95%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="system_bk-2bk">
						<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">       

	
							<tr class="web_table-2-1">
								<td width="15%" align="right">最後修改人員</td>
								<td width="35%" align="left"><%=aa.getString("aa_modifyuser") %></td>
								<td width="15%" align="right">最後修改日期</td>
								<td width="35%" align="left"><%=aa.getString("aa_modifydate") %></td>
							</tr>

						</table>
						</td>
					</tr>
					<tr align="center">
						<td colspan="4" align="center"><br />
						<input type="button" value="回上一頁" onClick="listpage.submit();">
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
		</td>
		</div>
	</tr>
</table>
</div>
</body>
</html>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>