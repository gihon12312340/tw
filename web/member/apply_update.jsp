<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="../include/words.jsp" %>
<%@page import="com.genesis.utils.StringTool"%>
<%
	// 頁面識別碼
	String page_code = "apply";

	/* 檢核圖形驗証碼
	String r = StringTool.validString((String) session.getAttribute("rand"));
	String ind = StringTool.validString(request.getParameter("ind"));
	if ((!r.equals(ind))||("".equals(r))) {
		out.println("<script> alert('"+alert_str.get("code_error."+lang)+"'); history.back(); </script>");
		return;
	}
    */
	try {
		TableRecord mp = new TableRecord(tblmp);
		for (int j = 0; j < mp.fieldNames().length; j++) {
			String name = mp.fieldNames()[j];
			if (!StringTool.validString(request.getParameter(name)).equals("")) {
				mp.setValue(name, StringTool.validString(request.getParameter(name)));
			}
		}
		//mp.setValue("mp_lang", lang);
		//mp.setValue("mp_reply", "N");
		mp.setValue("mp_code", page_code);
		mp.setInsert("Web_User");
		app_sm.insert(mp);

		//out.println("<script> location='" + page_code + "_sendmail.jsp?cu_id=" + cu.getString("cu_id") + "'; </script>");
		out.println("<script>alert('已收到您的申請，我們會盡快與您聯繫 !!'); location='../../home.jsp'; </script>");
		//out.println("<script> alert('感謝您的發問');location='" + page_code + ".jsp'; </script>");
	} catch (Exception e) {
		System.out.println("Error info:[" + e + "]File name edit.jsp for [" + page_code + "]Time:[" + DateTimeTool.dateTimeString() + "]");
		out.println("<script> alert('"+alert_str.get("system_bug."+lang)+"'); history.back(); </script>");
	} finally {
		app_sm.close();
	}
%>