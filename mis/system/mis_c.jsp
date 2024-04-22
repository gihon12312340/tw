<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
	String code	= "mis_c";				// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
	
   // Left side type.
   String lefttype = "system";
   // Tiltes.
   String[] titles = new String[] { "後台抬頭圖", "後台代表圖", "後台預設圖" };
   // Keywords.
   String[] keywords = new String[] { "mis.logo.image", "mis.index.image", "mis.default.image" };
   // Get records.
   Vector misimages = new Vector();
   for (int i = 0; i < titles.length; i++) {
       TableRecord ss = SiteSetup.getSetup(keywords[i]);
       if (ss.getString("ss_id").equals("")) {
           ss = new TableRecord(tblss);
           ss.setInsert(app_account);
           ss.setValue("ss_title", titles[i]);
           ss.setValue("ss_keyword", keywords[i]);
           app_sm.insert(ss);
       }
       misimages.add(ss);
   }
   int index = 0;
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
//-->
</script>
<link href="../css/adm_css.css" rel="stylesheet" type="text/css">
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
      <td width="3" align="center" valign="top" class="system_bk-2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><IFRAME HEIGHT=500 width=155 MARGINWIDTH=0 MARGINHEIGHT=0 HSPACE=0 VSPACE=0 FRAMEBORDER=0 SCROLLING=no
                id="show"  name="show" SRC="../leftmenu.jsp"></IFRAME></td>
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
            <td align="left" valign="middle" class="system_bigword">系統環境設定</td>
          </tr>
          <tr>
            <td colspan="2"><hr size="1" noshade></td>
          </tr>
<form name="form0" method="post" action="mis_c_update.jsp" enctype="multipart/form-data">
          <tr align="center">
            <td colspan="2"><table width="95%"  border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td class="system_bk-2bk"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
                      <tr align="center">
                        <td colspan="4" class="system_title-1">首頁設定－後台</td>
                      </tr>
<% TableRecord ss = (TableRecord)misimages.get(index++); %>
                      <tr class="system_table-2-1">
                        <td width="25%" align="right" class="admini_bk-2">後台抬頭圖片</td>
                        <td width="75%" align="left" class="system_table-2-1" colspan="3">
                          <input name="imgradio<%=index%>" type="radio" value="ucpic" id="default1"><label for="default1">預設圖片</label>
                          <input name="imgradio<%=index%>" type="radio" value="useold" checked id="default2"><label for="default2">使用原圖</label>
                          <input name="imgradio<%=index%>" type="radio" value="uppic" id="default3"><label for="default3">上傳新圖</label>                            
                          <input name="ss_value<%=index%>" type="file" class="button" size="20" onclick="form0.imgradio<%=index%>[2].checked=true;"><br>
                          (建議上傳圖片尺寸490*80)
                        </td>
                      </tr>
<% ss = (TableRecord)misimages.get(index++); %>
                      <tr class="system_table-2-1">
                        <td align="right" class="admini_bk-2">後台代表圖</td>
                        <td align="left" class="system_table-2-1" colspan="3">
                          <input name="imgradio<%=index%>" type="radio" value="ucpic" id="default4"><label for="default4">預設圖片</label>
                          <input name="imgradio<%=index%>" type="radio" value="useold" checked id="default5"><label for="default5">使用原圖</label>
                          <input name="imgradio<%=index%>" type="radio" value="uppic" id="default6"><label for="default6">上傳新圖</label>
                          <input name="ss_value<%=index%>" type="file" class="button" size="20" onclick="form0.imgradio<%=index%>[2].checked=true;"><br>
                          (建議上傳圖片尺寸490*365)
                        </td>
                      </tr>
<% ss = (TableRecord)misimages.get(index++); %>
                      <tr class="system_table-2-1">
                        <td align="right" class="admini_bk-2">後台預設圖</td>
                        <td align="left" class="system_table-2-1" colspan="3">
                          <input name="imgradio<%=index%>" type="radio" value="ucpic" id="default7"><label for="default7">預設圖片</label>
                          <input name="imgradio<%=index%>" type="radio" value="useold" checked id="default8"><label for="default8">使用原圖</label>
                          <input name="imgradio<%=index%>" type="radio" value="uppic" id="default9"><label for="default9">上傳新圖</label>
                          <input name="ss_value<%=index%>" type="file" class="button" size="20" onclick="form0.imgradio<%=index%>[2].checked=true;"><br>
                          (建議上傳圖片尺寸357*268)
                        </td>
                      </tr>
                      <tr class="system_table-2-1">
                        <td width="25%" align="right" class="admini_bk-2">最後修改人員</td>
                        <td width="25%" align="left" class="system_table-2-1"><%=ss.getString("ss_modifyuser") %></td>
                        <td width="25%" align="right"  class="admini_bk-2">最後修改日期</td>
                        <td width="25%" align="left" class="system_table-2-1"><%=ss.getString("ss_modifydate") %></td>
                        </tr>
                      
                  </table>
                  </td>
                </tr>
              </table>                <br>
              <input name="update" type="submit" value="確定送出">&nbsp;  
              <input name="reset" type="reset" value="重新設定">
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
