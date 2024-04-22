<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	String reportType = request.getParameter("reportType");
	String sessionKey = null;
	// 若有多檔需下載 , 可以識別字做為區分
	// 報名記錄匯出
	
	
	if("statistic_export".equals(reportType)){ sessionKey = "statistic_file";  }
	if("clear_statistic_export".equals(reportType)){ session.setAttribute("statistic_file","");  }
	
	if("chart_export".equals(reportType)){ sessionKey = "chart_file";  }
	if("clear_chart_export".equals(reportType)){ session.setAttribute("chart_file","");  }
	
	// 回傳前端 Ajax Session 的狀態值
	Object res = session.getAttribute(sessionKey);
	out.print(res);
%>