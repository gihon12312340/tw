<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
	//相關參數設定
	String code 		= "apply";					// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
	String show_title 	= "申請發文帳號";				// 功能標題
	
	// Conditions.
    String qcellphone = StringTool.validString(request.getParameter("_qcellphone"));
    String qaccount = StringTool.validString(request.getParameter("_qaccount"));
    String qname = StringTool.validString(request.getParameter("_qname"));
	
	// Names and values.
	String[] names = new String[] { "npage", "_qname", "_qcellphone", "_qaccount" };
	String[] values = new String[] { String.valueOf(pageno), qname, qcellphone, qaccount };
   
   // Selected id.
   String mpid = StringTool.validString(request.getParameter("mp_id"));
   // Get record.
   TableRecord mp = app_sm.select(tblmp, mpid);
%>
<html>
<head>
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
//-->
</script>
<link href="../css/adm_css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
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
            <td width="8%" align="left" valign="middle"><img src="../images/web_icon_1.gif" width="55" height="48" /></td>
            <td width="92%" align="left" valign="middle" class="web_bigword">會員資料維護</td>
          </tr>
          <tr>
            <td colspan="2"><hr size="1" noshade></td>
          </tr>
          <tr align="center">
            <td colspan="2"><table width="95%"  border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
                    <tr align="center">
                      <td colspan="4" class="web_title-1"> 會員資料維護&nbsp;
                      	<span>
                        	<input name="" type="button" value="會員資料新增" onClick="location='<%=code %>_a.jsp'" />
                      	</span>&nbsp;
                        <span>
                        	<input name="" type="button" value="會員資料查詢" onClick="location='<%=code %>.jsp'" />
                        </span>
                      </td>
                    </tr>
                    <tr align="center" class="web_bk-2">
                      <td colspan="4">會員資料檢視</td>
                    </tr>
                    <tr align="center">
                      <td width="120" class="web_table-2-1" align="right">申請單位</td>
                      <td width="200" class="web_table-2-1" align="left"><%=mp.getString("mp_account")%></td>
                      <td width="120" class="web_table-2-1" align="right">會員姓名</td>
                      <td width="200" class="web_table-2-1" align="left"><%=mp.getString("mp_name")%></td>
                    </tr>
                    <tr align="center">
                      <td class="web_table-2-1" align="right">連絡電話</td>
                      <td class="web_table-2-1" align="left"><%=mp.getString("mp_phone")%></td>
                      <td class="web_table-2-1" align="right">分機</td>
                      <td class="web_table-2-1" align="left"><%=mp.getString("mp_phone2")%></td>
                    </tr>
                    <tr align="center">
                      <td class="web_table-2-1" align="right">職稱</td>
                      <td class="web_table-2-1" align="left"><%=mp.getString("mp_job")%></td>
                      <td class="web_table-2-1" align="right">EMAIL</td>
                      <td colspan="3" class="web_table-2-1" align="left"><%=mp.getString("mp_email")%></td>
                    </tr>
                    <tr align="center">
                      <td class="web_table-2-1" align="right">最後修改人員</td>
                      <td class="web_table-2-1" align="left"><%=mp.getString("mp_modifyuser")%></td>
                      <td class="web_table-2-1" align="right">最後修改日期</td>
                      <td class="web_table-2-1" align="left"><%=mp.getString("mp_modifydate")%></td>
                    </tr>
                </table></td>
              </tr>
            </table>              <br>
            <input name="previous" type="button" value="回上一頁" onClick="lastpage.submit();">
            </td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" class="web_bk-2b">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
<%=HtmlCoder.form("lastpage", code + ".jsp", names, values)%>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>