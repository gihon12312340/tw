<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
   app_user.setValue("au_password", StringTool.validString(request.getParameter("au_password")));
   app_user.setValue("au_modifyuser", app_user.getValue("au_account"));
   app_user.setValue("au_modifydate", DateTimeTool.dateString());
   app_sm.update(app_user, new String[] { "au_id" });
   session.invalidate();
%>
<%
   if (app_sm.success()) {
       out.println("<script> alert('密碼修改成功!!請重新登入!!'); location='../index.jsp'; </script>");
   } else {
       out.println("<script> alert(\""+app_sm.getMessage()+"\"); location='../index.jsp'; </script>");
   }
%>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>