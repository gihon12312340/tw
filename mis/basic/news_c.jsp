<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%
	//基本參數
	String code = "news"; 					// 模組識別碼
	String show_title = "新訊報報";				// 模組標題

	// 圖片建議尺寸
	String image_info = "(建議尺寸198px * 140px)";
	// 圖片建議尺寸
	//String mobile_info = "(建議尺寸830px * 1300px)";
	
	// 功能參數
	boolean list_switch = true;		// 是否開啟列表功能
	boolean sort_switch = false;	// 是否開啟排序功能
	boolean modify_switch = true;	// 是否開啟修改功能
	boolean keyword_switch = true;	// 是否開啟關鍵字設定
	boolean deadline_switch = true; // 是否開啟上下架日期	
	int add_num = -1;				// 設定可新增的資料筆數 , -1 為無限筆
/*-------------------------------------------------------------------------*/
	Vector nps = app_sm.selectAll(tblnp, "np_code=? and np_lang=?", new Object[] { code,lang }, "np_showseq ASC , " + "np_createdate DESC");
	// 當資料筆數小於設定可新增的筆數時 , 顯示新增按鍵
	boolean add_switch = num_check(add_num,nps);		

	// 搜尋欄位
	String qtitle = StringTool.validString(request.getParameter("_qtitle"));
	String qcategory = StringTool.validString(request.getParameter("_qcategory"));
	String qemitdate = StringTool.validString(request.getParameter("_qemitdate"), DateTimeTool.getYear() - 10 + DateTimeTool.dateString().substring(4));
	String qrestdate = StringTool.validString(request.getParameter("_qrestdate"), DateTimeTool.getYear() + 1 + DateTimeTool.dateString().substring(4));
	String qstatus = StringTool.validString(request.getParameter("_qstatus"));
	
	// 跳頁參數
	String[] names = new String[] { "npage", "_qtitle", "_qcategory", "_qemitdate", "_qrestdate" };
	String[] values = new String[] { String.valueOf(pageno), qtitle, qcategory, qemitdate, qrestdate };
	// 回列表頁
	out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
	
	//所屬類別
	Vector<TableRecord> dms = app_sm.selectAll(tbldm, "dm_lang=? and dm_code=? and dm_category=?", new Object[]{ lang, code+"_category", "" } , "dm_showseq ASC , dm_createdate DESC");
	
	// 修改資料id
	String np_id = StringTool.validString(request.getParameter("np_id"));
	TableRecord np = app_sm.select(tblnp, np_id);
	//關聯的會員發文資料
	TableRecord cp_post_course = app_sm.select(tblcp,np.getString("np_upcategory"));
	
	boolean is_post_course = false;
	String title="";
	String content="";
	String imgPath = "";
	if("news".equals(np.getString("np_code"))) {
		title = np.getString("np_title");
		content = np.getString("np_content");
		imgPath = app_fetchpath + "/news/" + lang+ "/"+np.getString("np_image");
	}else if("post_course".equals(np.getString("np_code"))) {
		is_post_course = true;
		title = cp_post_course.getString("cp_title");
		content = cp_post_course.getString("cp_content");
		imgPath = app_fetchpath + "/post_course/" + lang+ "/" + cp_post_course.getString("cp_image");
	}
	
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
	} else if (F.np_image.value != "" && !file_chk.test(F.np_image.value.toLowerCase())) {
		alert("附檔名限為jpg|jpeg|gif|png!!");
		F.np_image.focus();
    } else if (F.np_emitdate.value > F.np_restdate.value) {
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
				<form name="frm" id="frm" method="post" enctype="multipart/form-data" action="<%=code%>_update.jsp?action=M&np_id=<%=np_id %>&_qtitle=<%=qtitle %>&npage=<%=pageno %>&_qcategory=<%=qcategory %>&_qemitdate=<%=qemitdate %>&_qrestdate=<%=qrestdate %>&_qstatus=<%=qstatus %>" onsubmit="javascript:return checkform(this);">
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
								<td colspan="4" align="center">修改資訊</td>
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
	                  			<option value="<%=dm.getString("dm_id") %>" <%=dm.getString("dm_id").equals(np.getString("np_category"))?"selected":"" %>><%=dm.getString("dm_title") %></option>
								<% } %>
								</select>
								</td>
							</tr>
							 
							<tr class="web_table-2-1">
								<td width="15%" align="right">標題</td>
								<td colspan="3" width="85%" align="left">
									<input type="text" name="np_title" id="np_title" size="137" maxlength="120" value="<%=title%>" <%=is_post_course?"readonly":"" %>/>
								</td>
							</tr>
							
							
							
					
							
							<tr class="web_table-2-1">
								<td align="right">內文</td>
								<td colspan="3" align="left">
								    <%if(is_post_course) {%>
								    <textarea  cols="118" rows="8" readonly><%=content %></textarea>
								    <%}else { %>
									<textarea name="np_content" id="np_content" cols="118" rows="8" class="mceEditor"><%=content %></textarea>
								    <%} %>
								</td>
							</tr>
							
							<tr class="web_table-2-1">
								<td rowspan="2" align="right" class="web_table-2-1">消息圖片</td>	
								<td colspan="3" align="left" class="tablebg">&nbsp;
						        <% if(!(np.getString("np_image").isEmpty() && cp_post_course.getString("cp_image").isEmpty())){ %>
									<img src="<%=imgPath%>" width="198">		                      		
							    <% } %>
								</td>
		                    </tr>
		                    <%if(!is_post_course) {%>
		                    <tr class="web_table-2-1">
								<td colspan="3" align="left" class="tablebg">
									<input name="imgradio" type="radio" value="ucpic" checked onclick="frm.np_image.value='';">使用原圖<br>
									<input name="imgradio" type="radio" value="new">上傳新圖
									<input name="np_image" id="np_image" type="file" class="button" accept="image/*" onclick="frm.imgradio[1].checked=true;"> <%=image_info%>
								</td>
		                    </tr>
		                    <%} %>
							<%if(keyword_switch){ %>
							<tr align="center" class="web_bk-2">
								<td colspan="4" align="center">關鍵字設定</td>
							</tr>
							<tr class="web_table-2-1">
								<td width="15%" align="right">設定索引[Robots]</td>
								<td width="35%" align="left">
									<select name="np_robots" id="np_robots">
										<option value="all" <%="all".equals(np.getString("np_robots"))?"selected":"" %>>全部-ALL</option>
										<option value="none" <%="none".equals(np.getString("np_robots"))?"selected":"" %>>無索引-None</option>
										<option value="index" <%="index".equals(np.getString("np_robots"))?"selected":"" %>>索引該網頁-Index</option>
										<option value="noindex" <%="noindex".equals(np.getString("np_robots"))?"selected":"" %>>不索引該網頁-NoIndex</option>
										<option value="follow" <%="follow".equals(np.getString("np_robots"))?"selected":"" %>>關注特定連結-Follow</option>
										<option value="nofollow" <%="nofollow".equals(np.getString("np_robots"))?"selected":"" %>>不關注特定連結-NoFollow</option>
									</select>
								</td>
								<td width="20%" align="right">設定來訪週期</td>
								<td width="30%" align="left">
									<input type="number" name="np_revisit_after" id="np_revisit_after" value="<%=np.getString("np_revisit_after") %>" size="4" maxlength="4" />天
								</td>
							</tr>
							<tr class="web_table-2-1">
								<td align="right">設定主要關鍵字</td>
								<td align="left">
									<input type="text" name="np_keywords" id="np_keywords" size="40" maxlength="255" value="<%=np.getString("np_keywords") %>"/>
								</td>
								<td align="right">設定網頁版權說明</td>
								<td align="left">
									<input type="text" name="np_copyright" id="np_copyright" size="30" value="<%=np.getString("np_copyright") %>"/>
								</td>
							</tr>
							<tr class="web_table-2-1">
								<td align="right">
									網頁內容簡介<br />[建議80-100字]
								</td>
								<td colspan="3" align="left">
									<textarea name="np_description" id="np_description" cols="118" rows="3" maxlength="255"><%=np.getString("np_description") %></textarea>
								</td>
							</tr>
							<tr class="web_table-2-1">
								<td align="right">設定追蹤碼</td>
								<td colspan="3" align="left">
									<textarea name="np_seo_track" id="np_seo_track" cols="118" rows="3"><%=np.getString("np_seo_track") %></textarea>
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
									<input name="np_emitdate" id="_qemitdate" type="text" value="<%=np.getString("np_emitdate") %>" size="15" readonly>
								</td>
								<td align="right" class="tablebg">下架日期</td>
								<td align="left" class="tablebg">
									<input name="np_restdate" id="_qrestdate" type="text" value="<%=np.getString("np_restdate") %>" size="15" readonly>
								</td>
							</tr>
							<%} %>
							<tr class="web_table-2-1">
								<td align="right">最後修改人員</td>
								<td align="left"><%=np.getString("np_modifyuser") %></td>
								<td align="right">最後修改日期</td>
								<td align="left"><%=np.getString("np_modifydate") %></td>
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