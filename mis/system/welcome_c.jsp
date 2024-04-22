<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
	String code	= "welcome_c";				// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用

   // Left side type.
   String lefttype = "system";
   // Title.
   String title = "歡迎頁內容";
   // Keyword.
   String keyword = "welcome.content";
   TableRecord ss = SiteSetup.getSetup(keyword);
   // Default data.
   if (ss.getString("ss_id").equals("")) {
       ss.setInsert(app_account);
       ss.setValue("ss_title", title);
       ss.setValue("ss_keyword", keyword);
       ss.setValue("ss_value", "0");
       app_sm.insert(ss);
   }
%>
<html><!-- InstanceBegin template="/Templates/system.dwt" codeOutsideHTMLIsLocked="false" -->
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
	
    if (F.options[0].checked == true) {
        F.ss_value.value = "-1";
    } else if (F.options[1].checked == true) {
        F.ss_value.value = "0";
    }
    if (F.options[2].checked == true) {
        if (F.ss_value.value == "" || !validNum(F.ss_value.value) || F.ss_value.value <= 0) {
            alert("請輸入大於零的秒數!!");
            F.ss_value.focus();
            return false;
        }
    } else if ((tinyMCE.get("ss_text").getContent() == "") && (F.options[1].checked == false)) {
        alert("請輸入歡迎頁內容!!");
        return false;
    } else {
        return true;
    }
}
//-->
</script>
<%@include file="/WEB-INF/jspf/mis/htmleditor.jspf"%>
<link href="../css/adm_css.css" rel="stylesheet" type="text/css">
<!-- InstanceBeginEditable name="head" -->
<style type="text/css">
<!--
.style6 {font-weight: bold}
-->
</style>
<!-- InstanceEndEditable -->
</head>

<body onload="document.form0.au_account.focus();" style="background-color: rgb(255, 255, 255);">
<div align="center">
  <table width="1280" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2"><table width="1280" border="0" cellspacing="0" cellpadding="0">        
<%@include file="/WEB-INF/jspf/mis/top.jspf"%>
      </table></td>
    </tr>
    <tr>
      <td width="3" align="center" valign="top" class="system_bk-2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><IFRAME HEIGHT="500" width="155" MARGINWIDTH="0" MARGINHEIGHT="0" HSPACE="0" VSPACE="0" FRAMEBORDER="0" SCROLLING="no" id="show" name="show" SRC="../leftmenu.jsp"></IFRAME></td>
        </tr>
      </table></td><td width="1125" align="center" valign="top" class="system_bk-2p"><!-- InstanceBeginEditable name="system-page" -->
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
            <td width="60" align="left" valign="middle"><img src="../images/system_icon_1.gif" width="55" height="48"></td>
            <td align="left" valign="middle" class="system_bigword">歡迎頁設定</td>
          </tr>
          <tr>
            <td colspan="2"><hr size="1" noshade></td>
          </tr>
<form name="form0" method="post" action="sitesetup_update.jsp" onsubmit="return checkform(this);">
  <input type="hidden" name="ss_keyword" value="<%=keyword%>">
          <tr align="center">
            <td colspan="2"><table width="95%"  border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
                      <tr align="center">
                        <td colspan="4" class="system_title-1">歡迎頁設定</td>
                      </tr>
                      <tr align="center">
                        <td colspan="4" class="system_bk-2">歡迎頁內容</td>
                      </tr>
                      <tr align="center" class="system_table-2-1">
                        <td colspan="4" class="system_table-2-1">
                          <input name="options" type="radio" value="noindex" <%=ss.getString("ss_value").equals("-1")?"checked":""%>>不轉換至首頁
                          <input name="options" type="radio" value="nowelcome" <%=ss.getString("ss_value").equals("0")?"checked":""%>>不使用歡迎頁
                          <input name="options" type="radio" value="change" <%=Integer.parseInt(ss.getString("ss_value"))>0?"checked":""%>>轉換
                          <input name="ss_value" type="text" value="<%=Integer.parseInt(ss.getString("ss_value"))>0?ss.getString("ss_value"):""%>" size="10" onclick="form0.options[2].checked=true;">秒
                        </td>
                      </tr>
                      <tr align="center" class="system_table-2-1">
                        <td class="admini_bk-2" align="right">內容</td>
                        <td colspan="3" class="system_table-2-1" align="left"><span class="style6">
                          <textarea name="ss_text" cols="110" rows="20" id="ss_text" class = mceEditor><%=ss.getString("ss_text")%></textarea>
<!--  新的網編 不需要下面傳 _filedname 值了... ,   但 在 textarea 裡 要設 id ,因為 在檢核那邊 , 是以 id值 來做判斷!! -->
<%// String _fieldname = "ss_text"; %>
<%//include file="/WEB-INF/jspf/mis/editorscript.jspf"%>
                        </span></td>
                      </tr>
                      <tr class="system_table-2-1">
                        <td width="168" align="right" class="system_table-2-1">最後修改人員</td>
                        <td width="178" align="left" class="system_table-2-1"><%=ss.getString("ss_modifyuser")%></td>
                        <td width="105" align="left" class="system_table-2-1"><div align="right">最後修改日期</div></td>
                        <td width="211" align="left" class="system_table-2-1"><%=ss.getString("ss_modifydate")%></td>
                      </tr>
                  </table>
                  </td>
                </tr>
              </table>                <br>
              <input name="update" type="submit"  value="確定送出">&nbsp;
              <input name="reset" type="button"  value="重新設定" onclick="location.replace('<%=request.getRequestURI()%>');">
            </td>
          </tr>
</form>
          <tr>
            <td colspan="2">&nbsp;</td>
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
<!-- InstanceEnd --></html>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>
