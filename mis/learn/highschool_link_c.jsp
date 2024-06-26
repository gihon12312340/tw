<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%
	// 基本參數
	String code = "highschool_link"; 				// 模組識別碼
	String show_title = "升學技高中十五群科連結";				// 模組標題
	
	// 圖片建議尺寸
	String image_info = "(建議尺寸635px * 353px)";
	// 圖片建議尺寸
	String mobile_info = "(建議尺寸830px * 1300px)";

	// 功能參數
	boolean list_switch = true;		// 是否開啟列表功能
	boolean sort_switch = true;		// 是否開啟排序功能
	boolean modify_switch = true;	// 是否開啟修改功能
	boolean keyword_switch = false;	// 是否開啟關鍵字設定
	boolean deadline_switch = false;// 是否開啟上下架日期	
	int add_num = -1;				// 設定可新增的資料筆數 , -1 為無限筆
/*--------------------------------------------------------------------------------------*/	
	Vector aps = app_sm.selectAll(tblap, "ap_code=? and ap_lang=?", new Object[] { code,lang}, "ap_showseq ASC , " + "ap_createdate DESC");
	// 當資料筆數小於設定可新增的筆數時 , 顯示新增按鍵
	boolean add_switch = num_check(add_num,aps);
	
	// 搜尋欄位
	String qtitle = StringTool.validString(request.getParameter("_qtitle"));
	String qemitdate = StringTool.validString(request.getParameter("_qemitdate"), DateTimeTool.getYear() - 1 + DateTimeTool.dateString().substring(4));
	String qrestdate = StringTool.validString(request.getParameter("_qrestdate"), DateTimeTool.getYear() + 1 + DateTimeTool.dateString().substring(4));
	
	// 跳頁參數
	String[] names = new String[] { "npage", "_qtitle", "_qemitdate", "_qrestdate" };
	String[] values = new String[] { String.valueOf(pageno), qtitle, qemitdate, qrestdate };	
	// 回列表頁
	out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));

	// 修改資料id
	String ap_id = StringTool.validString(request.getParameter("ap_id"));
	TableRecord ap = app_sm.select(tblap, ap_id);
	
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
	
	//var image = document.getElementById('ap_image').files[0]; image.size

	if (F.ap_title.value == "") {
        alert("請輸入標題名稱!!");
        F.ap_title.focus();
    } 
    <%--    
    } else if (F.ap_image.value != "" && chnese_chk.test(F.ap_image.value)) {
        alert("檔案名稱不可有包含中文!!");
        F.ap_image.focus();
    --%>
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
		<td width="3" align="center" valign="top" class="market_bk-2">
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
				<td colspan="2" class="market_bk-2b">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td width="60" align="left" valign="middle">
					<img src="../images/market_icon_1.gif" width="55" height="48">
				</td>
				<td align="left" valign="middle" class="market_bigword"><%=show_title%>維護</td>
			</tr>
			<tr>
				<td colspan="2">
				<hr size="1" noshade>
				</td>
			</tr>
			<tr>
				<form name="frm" id="frm" method="post" enctype="multipart/form-data" action="<%=code%>_update.jsp?action=M&ap_id=<%=ap_id %>" onsubmit="javascript:return checkform(this);">
				<td align="center" colspan="2">
				<table width="95%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td class="system_bk-2bk">
						<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
							<tr>
								<td align="center" colspan="4" class="market_title-1"><%=show_title%>維護&nbsp;&nbsp;
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
							<tr align="center" class="market_bk-2">
								<td colspan="4" align="center">修改資訊</td>
							</tr>
							<tr class="market_table-2-1">
								<td width="15%" align="right">標題</td>
								<td colspan="3" width="85%" align="left">
									<input type="text" name="ap_title" id="ap_title" size="137" maxlength="120" value="<%=ap.getString("ap_title")%>"/>
								</td>
							</tr>
					<%-- 
							<tr class="market_table-2-1">
								<td align="right">圖檔說明</td>
								<td colspan="3" align="left">
									<textarea name="ap_alt" id="ap_alt" cols="118" rows="8"><%=ap.getString("ap_alt")%></textarea>
								</td>
							</tr>
					--%>
							<tr class="market_table-2-1">
								<td align="right">連結開啟方式</td>
								<td colspan="3" align="left">
									<select name="ap_target" id="ap_target">
										<option value="none" <%=ap.getString("ap_target").equals("none")?"selected":""%>>不連結</option>
										<option value="_self" <%=ap.getString("ap_target").equals("_self")?"selected":""%>>目前頁面</option>
										<option value="_blank" <%=ap.getString("ap_target").equals("_blank")?"selected":""%>>開新頁面</option>
									</select>
								</td>
							</tr>
							<tr class="market_table-2-1">
								<td align="right">連結網址</td>
								<td colspan="3" align="left">
									<input type="text" name="ap_url" id="ap_url" size="137" value="<%=ap.getString("ap_url")%>"/>
								</td>
							</tr>
							
					<%-- 
							<tr class="market_table-2-1">
								<td rowspan="2" align="right" class="market_table-2-1">輪播圖檔</td>
								<td colspan="3" align="left" class="tablebg">&nbsp;							 
									<img src="<%=app_fetchpath+"/"+code+"/"+lang+"/"+ap.getString("ap_image")%>" width="187">		                      		
								</td>
		                    </tr>
		             
		                    <tr class="market_table-2-1">
								<td colspan="3" align="left" class="tablebg">
									<input name="imgradio" type="radio" value="ucpic" checked onclick="frm.ap_image.value='';">使用原圖<br>
									<input name="imgradio" type="radio" value="new">上傳新圖
									<input name="ap_image" id="ap_image" type="file" class="button" accept="image/*" onclick="frm.imgradio[1].checked=true;"> <%=image_info%>
								</td>
		                    </tr>							
					--%>
							<%if(keyword_switch){ %>
							<tr align="center" class="market_table-2-1">
								<td colspan="4" align="center">關鍵字設定</td>
							</tr>
							<tr class="market_table-2-1">
								<td width="15%" align="right">設定索引[Robots]</td>
								<td width="35%" align="left">
									<select name="ap_robots" id="ap_robots">
										<option value="all" <%="all".equals(ap.getString("ap_robots"))?"selected":"" %>>全部-ALL</option>
										<option value="none" <%="none".equals(ap.getString("ap_robots"))?"selected":"" %>>無索引-None</option>
										<option value="index" <%="index".equals(ap.getString("ap_robots"))?"selected":"" %>>索引該網頁-Index</option>
										<option value="noindex" <%="noindex".equals(ap.getString("ap_robots"))?"selected":"" %>>不索引該網頁-NoIndex</option>
										<option value="follow" <%="follow".equals(ap.getString("ap_robots"))?"selected":"" %>>關注特定連結-Follow</option>
										<option value="nofollow" <%="nofollow".equals(ap.getString("ap_robots"))?"selected":"" %>>不關注特定連結-NoFollow</option>
									</select>
								</td>
								<td width="20%" align="right">設定來訪週期</td>
								<td width="30%" align="left">
									<input type="number" name="ap_revisit_after" id="ap_revisit_after" value="<%=ap.getInt("ap_revisit_after") %>" size="4" maxlength="4" />天
								</td>
							</tr>
							<tr class="market_table-2-1">
								<td align="right">設定主要關鍵字</td>
								<td align="left">
									<input type="text" name="ap_keywords" id="ap_keywords" size="40" maxlength="255" value="<%=ap.getString("ap_keywords") %>"/>
								</td>
								<td align="right">設定網頁版權說明</td>
								<td align="left">
									<input type="text" name="ap_copyright" id="ap_copyright" size="30" value="<%=ap.getString("ap_copyright") %>"/>
								</td>
							</tr>
							<tr class="market_table-2-1">
								<td align="right">
									網頁內容簡介<br />[建議80-100字]
								</td>
								<td colspan="3" align="left">
									<textarea name="ap_description" id="ap_description" cols="118" rows="3" maxlength="255"><%=ap.getString("ap_description") %></textarea>
								</td>
							</tr>
							<tr class="market_table-2-1">
								<td align="right">設定追蹤碼</td>
								<td colspan="3" align="left">
									<textarea name="ap_seo_track" id="ap_seo_track" cols="118" rows="3"><%=ap.getString("ap_seo_track") %></textarea>
								</td>
							</tr>
							<%} %>
							<%if(deadline_switch){ %>
							<tr align="center" class="market_bk-2">
								<td colspan="4" align="center">上下架時間</td>
							</tr>
							<tr class="market_table-2-1">
								<td align="right" class="market_table-2-1">上架日期</td>
								<td align="left" class="tablebg">
									<input name="ap_emitdate" id="_qemitdate" type="text" value="<%=ap.getString("ap_emitdate") %>" size="15" readonly>
								</td>
								<td align="right" class="tablebg">下架日期</td>
								<td align="left" class="tablebg">
									<input name="ap_restdate" id="_qrestdate" type="text" value="<%=ap.getString("ap_restdate") %>" size="15" readonly>
								</td>
							</tr>
							<%} %>
							<tr class="market_table-2-1">
								<td align="right">最後修改人員</td>
								<td align="left"><%=ap.getString("ap_modifyuser") %></td>
								<td align="right">最後修改日期</td>
								<td align="left"><%=ap.getString("ap_modifydate") %></td>
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
				</td>
				</form>

			</tr>
			<tr>
				<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3" class="market_bk-2b">&nbsp;</td>
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