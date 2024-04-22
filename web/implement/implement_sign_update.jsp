<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="../include/words.jsp" %>
<%@page import="com.genesis.utils.StringTool"%>
<%
	// 頁面識別碼
	String page_code = "implement_sign";
	// 檢核圖形驗証碼
	String r = StringTool.validString((String) session.getAttribute("rand"));
	String ind = StringTool.validString(request.getParameter("ind"));
	if ((!r.equals(ind))||("".equals(r))) {
		out.println("<script> alert('"+alert_str.get("code_error."+lang)+"'); history.back(); </script>");
		return;
	}
    //檢查重複報名
    String aa_email = StringTool.validString(request.getParameter("aa_email"));
    String ai_id = StringTool.validString(request.getParameter("ai_id"));
    TableRecord aa_chk = app_sm.select(tblaa,"aa_email=? and ai_id=?",
    		                   new Object[]{aa_email,ai_id});
    if(aa_chk != null){
        if(!aa_chk.getString("aa_id").isEmpty()) {
    	    out.println("<script> alert('"+"您已報名過此活動"+"'); history.back(); </script>");	
        }
    }
	try {
		TableRecord aa = new TableRecord(tblaa);
		for (int j = 0; j < aa.fieldNames().length; j++) {
			String name = aa.fieldNames()[j];
			if (!StringTool.validString(request.getParameter(name)).equals("")) {
				
				aa.setValue(name, StringTool.validString(request.getParameter(name)));
			}
		}
		aa.setValue("aa_lang", lang);
		//cu.setValue("cu_reply", "N");
		String aa_code = app_sm.select(tblai,ai_id).getString("ai_code");
		aa.setValue("aa_code", aa_code);
		aa.setValue("aa_status","R");
		aa.setInsert("Web_User");
		app_sm.insert(aa);

		out.println("<script> location='" + page_code + "_in.jsp?aa_id=" + aa.getString("aa_id") + "#implementId'; </script>");
		//out.println("<script>alert('已收到您的問題，我們會盡快與您聯繫 !!'); location='../index/index.jsp'; </script>");
		//out.println("<script> alert('感謝您的發問');location='" + page_code + ".jsp'; </script>");
	} catch (Exception e) {
		System.out.println("Error info:[" + e + "]File name edit.jsp for [" + page_code + "]Time:[" + DateTimeTool.dateTimeString() + "]");
		out.println("<script> alert('"+alert_str.get("code_error."+lang)+"'); history.back(); </script>");
	} finally {
		app_sm.close();
	}
%>