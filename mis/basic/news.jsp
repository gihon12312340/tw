<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%
	//基本參數
	String code = "news"; 					// 模組識別碼
	String show_title = "新訊報報";				// 模組標題
	
	// 功能參數
	boolean list_switch = true;		// 是否開啟列表功能
	boolean sort_switch = false;	// 是否開啟排序功能
	boolean modify_switch = true;	// 是否開啟修改功能
	boolean search_switch = true;	// 是否開啟搜尋功能
	int page_items = 15; 			// 列表分頁筆數設定
	int add_num = -1;				// 設定可新增的資料筆數 , -1 為無限筆
	int del_num = -1;				// 設定少於幾筆不可刪除 , -1 為無限制
/*----------------------------------------------------------------------------------*/
	Vector nps = app_sm.selectAll(tblnp, "np_code=? and np_lang=?", new Object[] { code,lang }, "np_showseq ASC , np_createdate DESC");
	// 當資料筆數小於設定可新增的筆數時 , 顯示新增按鍵
	boolean add_switch = num_check(add_num,nps);
	// 當資料筆數小於設定可刪除的筆數時 , 隱藏刪除按鍵
	boolean delete_switch = num_check(del_num,nps);

	// 搜尋欄位
	String qtitle = StringTool.validString(request.getParameter("_qtitle"));
	String qcategory = StringTool.validString(request.getParameter("_qcategory"),"");
	String qstatus = StringTool.validString(request.getParameter("_qstatus"));
	String qemitdate = StringTool.validString(request.getParameter("_qemitdate"), DateTimeTool.getYear() - 10 + DateTimeTool.dateString().substring(4));
	String qrestdate = StringTool.validString(request.getParameter("_qrestdate"), DateTimeTool.getYear() + 1 + DateTimeTool.dateString().substring(4));
		
	// 跳頁參數
	String[] names = new String[] { "npage", "_qtitle", "_qcategory", "_qemitdate", "_qrestdate","_qstatus" };
	String[] values = new String[] { String.valueOf(pageno), qtitle, qcategory, qemitdate, qrestdate,qstatus };

	//所屬類別
	Vector<TableRecord> dms = app_sm.selectAll(tbldm, "dm_lang=? and dm_code=? and dm_category=?", new Object[]{ lang, code+"_category", "" } , "dm_showseq ASC , dm_createdate DESC");
	
	if (search_switch) {
		StringBuffer sb = new StringBuffer();
		Vector keys = new Vector();
		sb.append("np_lang=? and (np_code=? OR np_code=?) and np_category like ?  and np_title like ? and np_status like?");
		keys.add(lang);
		keys.add(code);
		keys.add("post_course");
		keys.add("%" + qcategory + "%");
		keys.add("%" + qtitle + "%");
		keys.add("%" + qstatus + "%");
		sb.append(" and np_emitdate>=? and np_emitdate<=?");
		keys.add(qemitdate);
		keys.add(qrestdate);		
		nps = app_sm.selectAll(tblnp, sb.toString(), keys.toArray(), "np_showseq ASC , np_createdate DESC");
	}
	
	// 分頁
	out.write(HtmlCoder.getForm("pageform", request.getRequestURI(), names, values));
	// 分頁設定
	app_dp = new DataPager(nps, page_items);
	nps = app_dp.getPageContent(pageno);
	
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
	$("#_qtitle").val("");
	$("#_qcategory").val("");
	$("#_qemitdate").val("<%=DateTimeTool.getYear() - 10 + DateTimeTool.dateString().substring(4)%>");
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
				<td width="60" align="left" valign="middle"><img
					src="../images/web_icon_1.gif" width="55" height="48"></td>
				<td align="left" valign="middle" class="web_bigword"><%=show_title%>維護</td>
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
							<td align="center" colspan="5" class="web_title-1"><%=show_title%>維護&nbsp;&nbsp;
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
							<td colspan="5" align="center">條件值搜尋</td>
						</tr>
						<tr class="web_table-2-1">
						 	<td width="20%" align="center" class="tablebg">所屬類別</td>
                 			<td width="30%" align="center" class="tablebg">標題名稱</td>
                 			<td width="10%" align="center" class="tablebg">審核狀態</td>
                 			<td width="20%" align="center" class="tablebg">日期區間</td>
                  			<td width="20%" align="center" class="tablebg">&nbsp;</td>
						</tr>
						
						<form name="list_sea" id="list_sea" method="post" action="<%=code %>.jsp" onsubmit="return checkform(this);">
						<tr class="web_table-2-1">
							
							<td align="center">
							
								<select name="_qcategory" id="_qcategory">
									<option value="%">全部</option>
	                  			<%  
	                  				for(int i=0; i<dms.size(); i++){
	                  					TableRecord dm = (TableRecord) dms.get(i);
	                  			%>
	                  			<option value="<%=dm.getString("dm_id") %>" <%=dm.getString("dm_id").equals(qcategory)?"selected":"" %>><%=dm.getString("dm_title") %></option>
								<% } %>
								</select>
							</td>
							 
							<td align="center"><input name="_qtitle" id="_qtitle" type="text" value="<%=qtitle %>" size="50" /></td>
							<td align="center">
		                     <select name="_qstatus" id="_qstatus">
		                         <option value="%" <%="%".equals(qstatus)?"selected":"" %>>全部</option>
                                 <option value="N" <%="N".equals(qstatus)?"selected":"" %>>未審核</option>
                                 <option value="Y"  <%="Y".equals(qstatus)?"selected":"" %>>通過</option>
                                 <option value="R"  <%="R".equals(qstatus)?"selected":"" %>>不通過</option>
		                     </select>
		                    </td>							
		                     <td align="center" class="tablebg">
	                     	<input name="_qemitdate" id="_qemitdate" value="<%=qemitdate %>" readonly type="text" size="9" />
	                     		~
	                       	<input name="_qrestdate" id="_qrestdate" value="<%=qrestdate %>" readonly type="text" size="9" />
	                        </td>
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
							<td align="center" colspan="5" class="web_title-1"><%=show_title%>維護&nbsp;&nbsp;
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
						<%}else{ %>
						<tr>
							<td align="center" colspan="7" class="web_title-1"><%=show_title%>查詢列表&nbsp;&nbsp;
						</tr>
						<%} %>
						<tr align="center" class="web_bk-2">
							<td colspan="7" align="center">標題列表</td>
						</tr>
						<tr class="web_table-2-1">
							<td width="5%" align="center">項目</td>
						    <td width="15%" align="center">所屬類別</td>
						    <td width="30%" align="center">標題</td>
						    <td width="10%" align="center">審核狀態</td>
						    <td width="10%" align="center">上架日期</td>
						    <td width="10%" align="center">下架日期</td>
						    <td width="20%" align="center" >功能</td>
						</tr>
						<%
							for (int i = 0; i < nps.size(); i++) {
								TableRecord np = (TableRecord) nps.get(i);
						%>
						<form name="list<%=i + 1%>" id="list<%=i + 1%>" method="post">
						<tr class="web_table-2-1">
							<td align="center"><%=((pageno - 1) * page_items) + i + 1%></td>
							<td align="center"><%=app_sm.select(tbldm,np.getString("np_category")).getString("dm_title") %></td>
							<td align="center"><%=np.getString("np_title") %></td>
							<td align="center" >
                                <select name="np_status" onchange="goaction(this.form, '<%=code %>_update.jsp?action=P');">
                                    <option value="N" <%="N".equals(np.getString("np_status"))?"selected":"" %>>未審核</option>
                                    <option value="Y" <%="Y".equals(np.getString("np_status"))?"selected":"" %>>通過</option>
                                    <option value="R" <%="R".equals(np.getString("np_status"))?"selected":"" %>>不通過</option>
                                </select>    
                            </td>
							 <td align="center"><%=np.getString("np_emitdate") %></td>
				             <td align="center"><%=np.getString("np_restdate") %></td>
							<td align="center">
								<%=HtmlCoder.hiddenInputs(names, values)%>
								<input type="hidden" name="np_id" id="np_id" value="<%=np.getString("np_id")%>" />
								<%if (modify_switch) { %>
								<input type="button" value="修改" onclick="goaction(this.form, '<%=code%>_c.jsp');" />&nbsp;
								<%} %>
								<%if (delete_switch) { %>
								<input type="button" value="刪除" onclick="godelete(this.form, '<%=code%>_update.jsp?action=D');" />
								<%} %>
							</td>
						</tr>
						</form>
						<%} %>

						<td class="web_bk-2" colspan="7" align="center" height="26px">
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