<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%
	// 基本參數
	String code = "activity_apply_3"; 			// 模組識別碼
	String show_title = "科教館-活動報名紀錄維護";		// 模組標題	
	
	// 功能參數
	boolean list_switch = true;		// 是否開啟列表功能
	boolean sort_switch = false;	// 是否開啟排序功能
	boolean modify_switch = false;	// 是否開啟修改功能
	boolean search_switch = true;	// 是否開啟搜尋功能
	int page_items = 15; 			// 列表分頁筆數設定
	int add_num = 0;				// 設定可新增的資料筆數 , -1 為無限筆
	int del_num = -1;				// 設定少於幾筆不可刪除 , -1 為無限制
/*------------------------------------------------------------------------------------------*/
	Vector aas = app_sm.selectAll(tblaa, "aa_code=? and aa_lang=?", new Object[] { "activity_information_3", lang }, "aa_createdate DESC");
	// 當資料筆數小於設定可新增的筆數時 , 顯示新增按鍵
	boolean add_switch = num_check(add_num,aas);
	// 當資料筆數小於設定可刪除的筆數時 , 隱藏刪除按鍵
	boolean delete_switch = num_check(del_num,aas);	
	
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
	
	if (search_switch) {
		StringBuffer sb = new StringBuffer();
		Vector keys = new Vector();
		sb.append("aa_lang=? and aa_code=?");
		keys.add(lang);
		keys.add("activity_information_3");
		sb.append("  and aa_name like ? and aa_email like ? and "+"aa_phone like ?");
		//keys.add("%"+qreply+"%");
		keys.add("%"+qname+"%");
		keys.add("%"+qemail+"%");
		keys.add("%"+qphone+"%");
		sb.append(" and aa_createdate>=? and aa_createdate<=?");
		keys.add(qemitdate);
		keys.add(qrestdate+"24:00:00");	
		aas = app_sm.selectAll(tblaa, sb.toString(), keys.toArray(), "aa_createdate DESC");
	}
	
	// 分頁
	out.write(HtmlCoder.getForm("pageform", request.getRequestURI(), names, values));
	// 分頁設定
	app_dp = new DataPager(aas, page_items);
	aas = app_dp.getPageContent(pageno);
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="include/head.jsp"%>
<%@include file="/WEB-INF/jspf/mis/pagerscript.jspf"%>
<script>
function checkform(F) {
    if (F._qemitdate.value > F._qrestdate.value) {
        alert("開始日期不得大於結束日期!!");
        return false;
    } else {
        return true;
    }
}
function clearData(){
	$("#_qname").val("");
	$("#_qphone").val("");
	$("#_qreply").val("");
	$("#_qemail").val("");
	//$("#_qtitle").val("");
	//$("#_qcategory").val("");
	$("#_qemitdate").val("<%=DateTimeTool.getYear() - 1 + DateTimeTool.dateString().substring(4)%>");
	$("#_qrestdate").val("<%=DateTimeTool.getYear() + 1 + DateTimeTool.dateString().substring(4)%>");
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
				<td width="60" align="left" valign="middle"><img
					src="../images/web_icon_1.gif" width="55" height="48"></td>
				<td align="left" valign="middle" class="web_bigword"><%=show_title%></td>
			</tr>
			<tr>
				<td colspan="2">
				<hr size="1" noshade>
				</td>
			</tr>
			
			
			<%if(search_switch){ %>
			<tr>
				<td align="center" colspan="2">
				<table width="95%" border="0" cellspacing="1" cellpadding="0">
					<td class="system_bk-2bk">
					<table width="100%" border="0" align="center" cellpadding="3"
						cellspacing="1">
						<tr>
							<td align="center" colspan="6" class="web_title-1"><%=show_title%>&nbsp;&nbsp;
								<%if (add_switch) { %>
								<input type="button" value="新增資料" onclick="javascript:location.href='<%=code%>_a.jsp'" />&nbsp;
								<%} %>
								<%if (list_switch) { %>
								<input type="button" value="報名紀錄列表" onclick="javascript:location.href='<%=code%>.jsp'" />&nbsp;
								<%} %>
								<%if (sort_switch) { %>
								<input type="button" value="信件資訊排序" onclick="javascript:location.href='<%=code%>_sort.jsp'" />
								<%} %>
								<input type="button" value="設定<%=show_title %>收件者" onclick="javascript:location.href='<%=code%>_pop.jsp'" />&nbsp;
							</td>
						</tr>

						<tr align="center" class="web_bk-2">
							<td colspan="6" align="center">資料搜尋</td>
						</tr>
						<tr class="web_table-2-1">
							<td width="25%" align="center" class="tablebg">姓名</td>
		                 	<td width="15%" align="center" class="tablebg">e-Mail</td>
		                 	<td width="15%" align="center" class="tablebg">電話</td>
		                 	<td width="20%" align="center" class="tablebg">日期區間</td>
							<td width="15%" align="center">功能</td>
						</tr>
						
						<form name="list_sea" id="list_sea" method="post" action="<%=code %>.jsp" onsubmit="return checkform(this);">
						<tr class="web_table-2-1">
							<td align="center" class="tablebg">
	                     		<input name="_qname" id="_qname" type="text" value="<%=qname %>" size="30" />
	                     	</td>
		                    <td align="center" class="tablebg">
		                     	<input name="_qemail" id="_qemail" type="text" value="<%=qemail %>" size="18" />
		                    </td>	              	
		                    <td align="center" class="tablebg">
		                     	<input name="_qphone" id="_qphone" type="text" value="<%=qphone %>" size="16" />
		                    </td>
		                    <td align="center" class="tablebg">
		                     	<input name="_qemitdate" id="_qemitdate" value="<%=qemitdate %>" readonly type="text" size="9" />
		                     		~
		                       	<input name="_qrestdate" id="_qrestdate" value="<%=qrestdate %>" readonly type="text" size="9" />
		                    </td>
							<%--
							<td align="center">
								<select name="_qreply" id="_qreply">
									<option value="" <%="".equals(qreply)?"selected='selected'":"" %>>全 &nbsp;部</option>
									<option value="N" <%="N".equals(qreply)?"selected='selected'":"" %>>未處理</option>
									<option value="Y" <%="Y".equals(qreply)?"selected='selected'":"" %>>已處理</option>
								</select>
							</td>		
		                    --%>
		                    <td align="center">
		                        <input name="query" type="submit" value="查詢">&nbsp;
		            			<input type="button" value="清除" onclick="clearData();" />
		                    </td>
						</tr>
						</form>

					</table>
					</td>
				</table>
				</td>
			</tr>
			<%} %>
			
		
			
			<tr>
				<td align="center" colspan="2">
				<table width="95%" border="0" cellspacing="1" cellpadding="0">
					<td class="system_bk-2bk">
					<table width="100%" border="0" align="center" cellpadding="3"
						cellspacing="1">
						<%if(!search_switch){ %>
						<tr>
							<td align="center" colspan="7" class="web_title-1"><%=show_title%>&nbsp;&nbsp;
								<%if (add_switch) { %>
								<input type="button" value="新增資料" onclick="javascript:location.href='<%=code%>_a.jsp'" />&nbsp;
								<%} %>
								<%if (list_switch) { %>
								<input type="button" value="報名紀錄列表" onclick="javascript:location.href='<%=code%>.jsp'" />&nbsp;
								<%} %>
								<%if (sort_switch) { %>
								<input type="button" value="信件資訊排序" onclick="javascript:location.href='<%=code%>_sort.jsp'" />
								<%} %>
								<input type="button" value="設定<%=show_title %>收件者" onclick="javascript:location.href='<%=code%>_pop.jsp'" />&nbsp;
							</td>
						</tr>
						<%}else{ %>
						<tr>
							<td align="center" colspan="8" class="web_title-1"><%=show_title%>查詢列表&nbsp;&nbsp;
						</tr>
						<%} %>
						<tr align="center" class="web_bk-2">
							<td colspan="8" align="center">資料列表</td>
						</tr>
						<tr class="web_table-2-1">
						 	<td width="5%" align="center">項目</td>
						    <td width="10%" align="center">姓名</td>
						    <td width="12%" align="center">報名活動</td>
						    <td width="10%" align="center">e-Mail</td>
						    <td width="10%" align="center">電話</td>
						    <td width="18%" align="center">報名日期</td>
						    <td width="15%" align="center">審核狀態</td>
						    <td width="15%" align="center">功能</td>
						</tr>
						<%
							for (int i = 0; i < aas.size(); i++) {
								TableRecord aa = (TableRecord) aas.get(i);
								String ai_title = app_sm.select(tblai,aa.getString("ai_id")).getString("ai_title");
						%>
						<form name="list<%=i + 1%>" id="list<%=i + 1%>" method="post">
						<tr class="web_table-2-1">
							<td align="center"><%=((pageno - 1) * page_items) + i + 1%></td>						
							<td align="left">&nbsp;&nbsp;<%=aa.getString("aa_name") %></td>
				   			<td align="left">&nbsp;&nbsp;<%=ai_title %></td>
				   			<td align="left">&nbsp;&nbsp;<%=aa.getString("aa_email") %></td>
				    		<td align="left">&nbsp;&nbsp;<%=aa.getString("aa_phone") %></td>
				    		<td align="center"><%=aa.getString("aa_createdate") %></td>
				    		<td align="left" >
                            <div align="center">
                              <select name="aa_status" onchange="goaction(this.form, '<%=code %>_update.jsp?action=P');">
                                <option value="R" <%="R".equals(aa.getString("aa_status"))?"selected":"" %>>未審核</option>
                                <option value="Y" <%="Y".equals(aa.getString("aa_status"))?"selected":"" %>>通過</option>
                                <option value="X" <%="X".equals(aa.getString("aa_status"))?"selected":"" %>>不通過</option>
                              </select>
                           </div>
                           </td>
				    		<%--
				    		<td align="center">
				    			<input type="checkbox" value="Y" name="aa_reply" <%="Y".equals(aa.getString("aa_reply"))?"checked":"" %> onclick="goaction(this.form, '<%=code %>_update.jsp?action=REPLY');"/>
				    		</td>
							--%>
							<td align="center">
								<%=HtmlCoder.hiddenInputs(names, values)%>
								<input type="hidden" name="aa_id" id="aa_id" value="<%=aa.getString("aa_id")%>" />
								<%if (modify_switch) { %> 
								<input type="button" value="修改" onclick="goaction(this.form, '<%=code%>_c.jsp');" />&nbsp;
								<%} %>
								<input type="button" value="檢視" onclick="goaction(this.form, '<%=code%>_b.jsp');" />&nbsp;
								<%if (delete_switch) { %>
								<input type="button" value="刪除" onclick="godelete(this.form, '<%=code%>_update.jsp?action=D');" />
								<%} %>
							</td>
						</tr>
						</form>
						<%} %>

						<td class="web_bk-2" colspan="8" align="center" height="26px">
							<%@include file="/WEB-INF/jspf/mis/pager.jspf"%>
						</td>

					</table>
					</td>
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
	</tr>
</table>
</div>
</body>
</html>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>