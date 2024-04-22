<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%
	// 基本參數
	String code = "activity_apply_2"; 			// 模組識別碼
	String show_title = "科工館-活動報名紀錄維護";		// 模組標題
	
	// 搜尋欄位
	String qemitdate = StringTool.validString(request.getParameter("_qemitdate"), DateTimeTool.getYear() - 1 + DateTimeTool.dateString().substring(4));
	String qrestdate = StringTool.validString(request.getParameter("_qrestdate"), DateTimeTool.getYear() + 1 + DateTimeTool.dateString().substring(4));
	String qname = StringTool.validString(request.getParameter("_qname"));
	String qreply = StringTool.validString(request.getParameter("_qreply"));
	String qemail = StringTool.validString(request.getParameter("_qemail"));
	String qphone = StringTool.validString(request.getParameter("_qphone"));
 
	// 跳頁參數
	String[] names = new String[] { "npage", "_qname", "_qreply" , "_qemail" , "_qphone" ,"_qemitdate", "_qrestdate"};
	String[] values = new String[] { String.valueOf(pageno), qname, qreply , qemail ,qphone , qemitdate, qrestdate};
%>
<%
	try {
		// A:新增,M:修改,D:刪除,S:排序,P:顯示
		String action = StringTool.validString(request.getParameter("action"));
		String aa_title = StringTool.validString(request.getParameter("aa_title"));
		// 修改資料id	
		String aa_id = StringTool.validString(request.getParameter("aa_id"));

		// 設定收件者
		if("POP3".equals(action)){
			String[] titles = new String[] { show_title+"聯絡我們正本收件者",show_title+"聯絡我們副本收件者" };
			String[] keywords = new String[] { "original" , "duplicate" };
			Vector smtps = new Vector();
			for (int i = 0; i < titles.length; i++) {
			    TableRecord ss = SiteSetup.getSetup(keywords[i]+"."+code+"."+lang);
			    ss.setUpdate(app_account);
			    String value = StringTool.validString(request.getParameter(keywords[i]));
			    ss.setValue("ss_value", value);
			    ss.setUpdate(app_account);
			    app_sm.update(ss);
			}
			// 回收件者頁
			out.write(HtmlCoder.getForm("poppage", code + "_pop.jsp", names, values));
			out.println("<script> alert('收件者設定成功!!'); poppage.submit(); </script>");
			return;
			
		// 變更處理狀態	
		}else if("REPLY".equals(action)){
			TableRecord aa = app_sm.select(tblaa, "aa_id=?", new Object[] { aa_id });
			aa.setUpdate(app_account);
			aa.setValue("aa_reply", "Y".equals(StringTool.validString(request.getParameter("aa_reply")))?"Y":"N");
			app_sm.update(aa);
			// 回列表頁
			out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
			out.println("<script> alert('修改成功!!');listpage.submit(); </script> ");
			return;

		// 刪除
		}else if ("D".equals(action)) {
			TableRecord aa = app_sm.select(tblaa, aa_id);
			app_sm.delete(aa);
			app_sm.close();
			// 回列表頁
			out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
			out.println("<script> alert('刪除成功!!');listpage.submit(); </script>");
			return;
		
		}else if("P".equals(action)) { //審核
			TableRecord aa = app_sm.select(tblaa, aa_id);
		    String status = request.getParameter("aa_status");
		    aa.setValue("aa_status",request.getParameter("aa_status"));
		    aa.setUpdate(app_account);
		    app_sm.update(aa);
		    
		    app_sm.close();
		 // 回列表頁
		    if("R".equals(status)) {
		    	out.write(HtmlCoder.getForm("listpage", code + ".jsp?", names, values));
		 	    out.println("<script> alert('修改成功!!');listpage.submit(); </script> ");
		    }else{
		        out.write(HtmlCoder.getForm("listpage", code + "_sendmail.jsp?status="+status+"&aa_id="+aa_id, names, values));
		 	    out.println("<script> alert('修改成功!!');listpage.submit(); </script> ");
		    }
		 	//return;
		}
		
	} catch (Exception e) {
		System.out.println("Project:" + projectName + ", Error info:[" + e + "]File name edit.jsp for ["+ code + "]Time:[" + DateTimeTool.dateTimeString() + "]");
		out.println("<script> alert('處理失敗'); history.back(); </script>");
	} finally {
		app_sm.close();
	}
%>