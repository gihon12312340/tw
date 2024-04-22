<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
    //相關參數設定
	String code 		= "apply";					// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
	String show_title 	= "申請發文帳號資料";				// 功能標題
	int page_items		= 15;						// 列表分頁筆數設定

   // Conditions.
   String qpublish = StringTool.validString(request.getParameter("_qpublish_status"));
   String qunit = StringTool.validString(request.getParameter("_qunit"));
   String qname = StringTool.validString(request.getParameter("_qname"));
   String qcellphone = StringTool.validString(request.getParameter("_qcellphone"));
   if(qpublish.isEmpty()){
	   qpublish="%";
   }

   String action = StringTool.validString(request.getParameter("action"));
   String mp_id = StringTool.validString(request.getParameter("mp_id"));
   
   // 會員停權
   if("stop".equals(action)){
	   TableRecord mp1 = app_sm.select(tblmp,"mp_id=?",new Object[]{mp_id});
		String status = "Y".equals(mp1.getString("mp_status"))?"N":"Y";
	    mp1.setUpdate(app_account);
	    mp1.setValue("mp_status", status);
	    app_sm.update(mp1);
	    if("Y".equals(status)){
			out.println("<script> alert('"+mp1.getString("mp_name")+" 已恢復正常使用權限'); </script>");
	    } else {
			out.println("<script> alert('"+mp1.getString("mp_name")+" 已被停權'); </script>");
	    }
   }
   
   // Names and values.
   String[] names = new String[] { "npage", "_qname", "_qpublish_status", "_qunit" ,"qcellphone"};
   String[] values = new String[] { String.valueOf(pageno), qname, qpublish, qunit,qcellphone };
   // Get records.
   StringBuffer sb = new StringBuffer();
   Vector keys = new Vector();
   
   sb.append("mp_publish_status like? and mp_unit like? and mp_name like? and mp_code=?");
   keys.add(qpublish);
   keys.add("%"+qunit+"%");
   keys.add("%"+qname+"%");
   keys.add(code);
   Vector mps = app_sm.selectAll(tblmp, sb.toString(), keys.toArray()," mp_createdate DESC");
   // Data paging.
   app_dp = new DataPager(mps,page_items); 			// 查詢列表筆數
   mps = app_dp.getPageContent(pageno);

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@include file="/WEB-INF/jspf/norobots.jspf"%>
<!-- InstanceBeginEditable name="doctitle" -->
<title><%=app_mistitle%></title>
<!-- InstanceEndEditable --><script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function checkform(F) {

        return true;
}
//-->
</script>
<%@include file="/WEB-INF/jspf/mis/pagerscript.jspf"%>
<script src="../js/jquery-1.8.3.js" type="text/javascript" ></script>
<link href="../css/adm_css.css" rel="stylesheet" type="text/css" />
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
</head>

<body style="background-color: rgb(255, 255, 255);">
<div align="center">
  <table width="1280" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2"><table width="1280" border="0" cellspacing="0" cellpadding="0">        
<%@include file="/WEB-INF/jspf/mis/top.jspf"%>
      </table></td>
    </tr>
    <tr>
      <td width="3" align="center" valign="top" class="web_bk-2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><IFRAME HEIGHT="500" width="155" MARGINWIDTH="0" MARGINHEIGHT="0" HSPACE="0" VSPACE="0" FRAMEBORDER="0" SCROLLING="no" id="show" name="show" SRC="../leftmenu.jsp"></IFRAME></td>
        </tr>
      </table></td><td width="1125" align="center" valign="top" class="system_bk-2p"><!-- InstanceBeginEditable name="system-page" -->
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
            <td width="60" align="left" valign="middle"><img src="../images/web_icon_1.gif" width="55" height="48"></td>
            <td align="left" valign="middle" class="web_bigword"><%=show_title %>維護</td>          
          </tr>
          <tr>
            <td colspan="2"><hr size="1" noshade></td>
          </tr>
          <tr align="center">
            <td colspan="2"><table width="95%"  border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
                    <tr align="center">
                      <td colspan="5" class="web_title-1"> 會員資料維護&nbsp;
                      	<%--
                      	<span>
                        	<input name="" type="button" value="會員資料新增" onClick="location='<%=code %>_a.jsp'" />
                      	</span>&nbsp;
                        --%>
                        <span>
                        	<input name="" type="button" value="會員資料查詢" onClick="location='<%=code %>.jsp'" />
                        </span>
                      </td>
                    </tr>
                    <tr align="center" class="web_bk-2">
                      <td colspan="5">會員資料維護－查詢</td>
                    </tr>
                    <tr align="center" class="web_table-2-1">
                        <td width="20%">申請單位</td>
                        <td width="20%">真實姓名</td>
                        <td width="20%">電話號碼</td>
                        <td width="20%">審核狀態</td>
                        <td width="20%">&nbsp;</td>
                    </tr>
                    
		  <form name="form0" method="post" action="<%=code %>.jsp" onsubmit="return checkform(this);">          
		         
                    <tr class="web_table-2-1">
                      <td align="center" ><input name="_qunit" id="_qunit" value="<%=qunit %>" type="text" size="27" /></td>
                      <td align="center" ><input name="_qname" id="_qname" value="<%=qname %>" type="text" size="27" /></td>
                      <td align="center" ><input name="_qcellphone" id="_qcellphone" value="<%=qcellphone %>" type="text" size="27" /></td>
                      <td align="center" >
                          <select name="_qpublish_status" id="_qpublish_status">
                              <option value="" <%="%".equals(qpublish)?"selected":"" %>>全部</option>
                              <option value="R" <%="R".equals(qpublish)?"selected":"" %>>未審核</option>
                              <option value="Y"  <%="Y".equals(qpublish)?"selected":"" %>>通過</option>
                              <option value="X"  <%="X".equals(qpublish)?"selected":"" %>>不通過</option>
                          </select>
                      </td>
                      <td align="center" class="tablebg">
                        <input name="query" type="submit" value="查詢">&nbsp;
            			<input type="button" value="清除" onclick="clearData(this.form);" />
                      </td>
                    </tr>
		  </form>
		                      
                    <tr align="center" class="web_bk-2">
                      <td colspan="5">會員資料維護－查詢列表</td>
                    </tr>
                    <tr align="center" class="web_table-2-1">
                        <td>申請單位</td>
                        <td>真實姓名</td>
                        <td>電話號碼</td>
                        <td>審核狀態</td>
                        <td>功能</td>
                    </tr>
<%   
   for (int i = 0; i < mps.size(); i++) {
       TableRecord mp = (TableRecord)mps.get(i);
%>
<form name="form<%=i+1%>" method="post">
<%=HtmlCoder.hiddenInputs(names, values)%>
  <input type="hidden" name="mp_id" value="<%=mp.getString("mp_id")%>">
                    <tr class="web_table-2-1">
                      <td align="center" ><%=mp.getString("mp_unit")%></td>
                      <td align="left" ><div align="center"><%=mp.getString("mp_name")%></div></td>
                      <td align="left" ><div align="center"><%=mp.getString("mp_phone")%></div></td>
                      <td align="left" >
                          <div align="center">
                              <select name="mp_publish_status" onchange="goaction(this.form, '<%=code %>_update.jsp?action=P');">
                                <option value="R" <%="R".equals(mp.getString("mp_publish_status"))?"selected":"" %>>未審核</option>
                                <option value="Y" <%="Y".equals(mp.getString("mp_publish_status"))?"selected":"" %>>通過</option>
                                <option value="X" <%="X".equals(mp.getString("mp_publish_status"))?"selected":"" %>>不通過</option>
                              </select>
                          </div>
                      </td>
                      <td align="left" ><div align="center">
                        <input name="detail<%=i+1%>" type="button" value="查閱" onClick="goaction(this.form, '<%=code %>_b2.jsp');">
                        <input name="modify<%=i+1%>" type="button" value="修改" onClick="goaction(this.form, '<%=code %>_c.jsp');">
                        
                        &nbsp;&nbsp;&nbsp;&nbsp;<input name="delete<%=i+1%>" type="button" value="刪除" onClick="godelete(this.form, '<%=code %>_update.jsp?action=D');">
                      </div></td>
                    </tr>
</form>
<% } %>
                </table></td>
              </tr>
            </table>
<%@include file="/WEB-INF/jspf/mis/pager.jspf"%>
            </td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" class="web_bk-2b">&nbsp;</td>
          </tr>
        </table>
      <!-- InstanceEndEditable --></td>
    </tr>
  </table>
</div>
</body>
<!-- InstanceEnd --></html>
<%=HtmlCoder.getForm("pageform", request.getRequestURI(), names, values)%>
<script language="JavaScript" type="text/JavaScript">
<!--
function clearData(F){
	$("#_qname").val("");
	$("#_qaccount").val("");
	$("#_qcellphone").val("");
}
//-->
</script>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>