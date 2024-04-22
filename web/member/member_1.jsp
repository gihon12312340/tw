<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@page import="org.json.JSONObject" %>
<%@page import="com.genesis.utils.StringTool"%>
<%
	String page_code = "member";																			// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
	String code = StringTool.validString(request.getParameter("code"));										// login 登入 , logout 登出
	String src = StringTool.validString(request.getParameter("src"));										// 來源代碼
	
	//會員登入
	if("login".equals(code)) {
		
	} else if("logout".equals(code)) { 
	//會員登出
		session.removeAttribute("member");
		out.println("<script> alert('您已成功登出!!'); location='../../home.jsp';  </script>");
	}
	//關閉連線池
	app_sm.close();
%>