<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>

<%
/* 會員總數 2023/09/16 新增 */
Vector<TableRecord> mpts = app_sm.selectAll(tblmp);
int member_total = mpts.size();
response.setHeader("Access-Control-Allow-Origin", "*");
//response.setContentType("application/json");
//response.setCharacterEncoding("UTF-8");
out.println(String.format("{\"member_total\":%d}", member_total));
%>

<%@include file="/WEB-INF/jspf/connclose.jspf"%>
