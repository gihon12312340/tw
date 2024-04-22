<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
   String mp_id = StringTool.validString(request.getParameter("mp_id"));
   // Get record.
   TableRecord mp = app_sm.select(tblmp, mp_id);
%>
<html><!-- InstanceBegin template="/Templates/basic.dwt" codeOutsideHTMLIsLocked="false" -->
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

function checkform(F) {
    //var today = new Date();
    //var thisyear = today.getFullYear();
	var isEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;  // 使用 isEmail.test(欄位名稱) 檢查 E-Mail 是否格式正確 , 正確為 true
	// validLiteral(欄位)  檢查文數字 , 正確為 true
	// isNaN(欄位)  檢查非數字 , 正確為 true
	// validPhone(欄位) 檢查是否為電話格式 , 正確為 true    
    

	if (F.mp_name.value == "") {
	    alert("請輸入會員姓名!!");
	    F.mp_name.focus();
	    return false;
	} else if (F.mp_account.value == "" || !isEmail.test(F.mp_account.value)) {
        alert("帳號欄位請輸入有效的電子信箱!!");
        F.mp_account.focus();
        return false; 
	} else if (F.mp_password.value == "" || !validLiteral(F.mp_password.value)) {
        alert("密碼欄位請輸入正確的英文及數字!!");
        F.mp_password.focus();
        return false;
    } else if (F.mp_pswd.value == "" || !validLiteral(F.mp_pswd.value)) {
        alert("再次輸入密碼欄位請輸入正確的英文及數字!!");
        F.mp_pswd.focus();
        return false;
    } else if (F.mp_password.value != F.mp_pswd.value) {
        alert("兩次輸入密碼不相同!!");
        F.mp_password.focus();
        return false;
/*   
    } else if (F.mp_account.value == "" || !isEmail.test(F.mp_account.value)) {
        alert("帳號欄位請輸入有效的電子信箱!!");
        F.mp_account.focus();
        return false;
    } else if (F.mp_personid.value != "" && !validPID(F.mp_personid.value)) {
        alert("會員的身份證號碼錯誤!!");
        F.mp_personid.focus();
        return false;
    } else if (F.mp_byear.value == "" || !validNum(F.mp_byear.value) || (thisyear - F.mp_byear.value) > 100 || (thisyear - F.mp_byear.value) < 5) {
        alert("出生年不是有效的年份!!");
        F.mp_byear.focus();
        return false;
    } else if (F.mp_byear.value != "" && !validDate(F.mp_byear.value, F.mp_bmonth.value, F.mp_bday.value)) {
        alert("出生日期不是有效的日期!!");
        return false;
    } else if (F.mp_nightphone.value != "" && !validPhone(F.mp_nightphone.value)) {
        alert("請輸入有效的夜間電話!!");
        F.mp_nightphone.focus();
        return false;
    } else if (F.mp_faxphone.value != "" && !validPhone(F.mp_faxphone.value)) {
        alert("請輸入有效的傳真電話!!");
        F.mp_faxphone.focus();
        return false;
    } else if (F.mp_address.value == "") {
        alert("請輸入通訊地址!!");
        F.mp_address.focus();
        return false;        
    } else if (F.mp_answer.value == "") {
        alert("請輸入忘記密碼答案!!");
        F.mp_answer.focus();
        return false;  
    */
    } else if (F.mp_phone.value == "" || !validPhone(F.mp_phone.value)) {
        alert("請輸入有效的連絡電話!!");
        F.mp_phone.focus();
        return false;    
    } else if (F.mp_cellphone.value == "" || !validPhone(F.mp_cellphone.value)) {
        alert("請輸入有效的行動電話!!");
        F.mp_cellphone.focus();
        return false;
    /*
    } else if (isNaN(F.add_bonus.value)) {
        alert("請輸入正確的加贈點數!!");
        F.add_bonus.focus();
        return false;
    */    
    } else {
        return true;
    }
}
//-->
</script>
<script src="<%=request.getContextPath() %>/js/zip.js"></script>
<link href="../css/adm_css.css" rel="stylesheet" type="text/css">
<!-- InstanceBeginEditable name="head" -->
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
<!-- InstanceEndEditable -->
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
<form name="form0" method="post" action="<%=code %>_update.jsp?action=M&mp_id=<%=mp_id %>&_qcellphone=<%=qcellphone %>&_qaccount=<%=qaccount %>" enctype="multipart/form-data" ">
 
  <input type="hidden" name="mp_status" value="Y">
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
                      <td colspan="4">會員資料維護－修改</td>
                    </tr>
                    <tr align="center">
                      <td width="160" class="web_table-2-1" align="right"><span class="style1">＊</span>會員姓名</td>
                      <td width="340" class="web_table-2-1" align="left">
                      	<input name="mp_name" value="<%=mp.getString("mp_name")%>" type="text" size="20" maxlength="15">  
                      </td>
                      <td width="160" class="web_table-2-1" align="right"><span class="style1">＊</span>申請單位</td>
                      <td width="340" class="web_table-2-1" align="left">
                        <input name="mp_account" value="<%=mp.getString("mp_account")%>" type="text" size="30" maxlength="50">
                      </td>
                    </tr>
                    <tr align="center">
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>職稱</td>
                      <td class="web_table-2-1" align="left">
                        <input name="mp_job" type="text" value="<%=mp.getString("mp_job")%>" size="20" maxlength="10">
                      </td>
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>連絡電話</td>
                      <td class="web_table-2-1" align="left">
                        <input name="mp_phone" type="text" value="<%=mp.getString("mp_phone")%>" size="20">
                      </td>
                    </tr>
                    <tr align="center">
                      <td class="web_table-2-1" align="right">分機</td>
                      <td class="web_table-2-1" align="left">
                        <input name="mp_phone2" type="text" value="<%=mp.getString("mp_phone2")%>" size="20">
                      </td>
                      <td class="web_table-2-1" align="right"><span class="style1">＊</span>Email</td>
                      <td class="web_table-2-1" align="left">
                        <input name="mp_email" type="text" value="<%=mp.getString("mp_email")%>" size="20">
                        
                      </td>
                    </tr>
                    
                    <%--
                    <tr align="center">
                      <td class="web_table-2-1"><div align="right">通訊地址</div></td>
                      <td colspan="3" class="web_table-2-1" align="left">
                        <input type="hidden" name="county" value="<%=mp.getString("mp_county")%>">
                        <input type="hidden" name="city" value="<%=mp.getString("mp_city")%>">
                        縣市<select name="mp_county" id="mp_county" onchange="changeZone(form0.mp_county, form0.mp_city, form0.mp_zipcode, form0.county, form0.city)"></select>
                        鄉鎮區市<select name="mp_city" id="mp_city" onchange="showZipCode(form0.mp_county, form0.mp_city, form0.mp_zipcode, form0.county, form0.city)"></select>
                        郵遞區號<input type="text" name="mp_zipcode" id="mp_zipcode" size="1" value="<%=mp.getString("mp_zipcode")%>" readonly>
                        <input name="mp_address" type="text" value="<%=mp.getString("mp_address")%>" size="60" maxlength='50'>
                        </td>
                    </tr>
                    --%>
                    <%--
                    <tr align="center">
                      <td class="web_table-2-1" align="right">紅利點數</td>
                      <td class="web_table-2-1" align="left"><%=app_df.format(MemberBonus.getTotalBonus(mp.getString("mp_id")))%> 點</td>
                      <td class="web_table-2-1" align="right">加贈紅利點數</td>
                      <td class="web_table-2-1" align="left"><input name="add_bonus" type="text" value="0" size="10" /> 點</td>
                    </tr> 
                    --%>
                                                         
                    <tr align="center">
                      <td class="web_table-2-1" align="right" nowrap>最後修改人員</td>
                      <td class="web_table-2-1" align="left"><%=mp.getString("mp_modifyuser")%></td>
                      <td class="web_table-2-1" align="right" nowrap>最後修改日期</td>
                      <td class="web_table-2-1" align="left"><%=mp.getString("mp_modifydate")%></td>
                    </tr>
                </table></td>
              </tr>
            </table> <br>
            <input type="hidden" name="_qname" value="<%=qname %>">
            <input type="submit" value="確定送出">&nbsp;
            <input type="reset" value="重新設定">&nbsp;
            <input type="button" value="放棄修改" onclick="lastpage.submit();">
            </td>
          </tr>
</form>
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
<script> ResetAll(form0.mp_county, form0.mp_city, form0.mp_zipcode, form0.county, form0.city); </script>
<%=HtmlCoder.getForm("lastpage", request.getHeader("referer"), names, values)%>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>