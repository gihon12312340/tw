<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%
	// 基本參數
	String code = "article_category"; 	// 模組識別碼
	String show_title = "技職好文類別";		// 模組標題

	// 讀取上層類別 ID 、當前類別層數
	String qcategory = StringTool.validString(request.getParameter("_qcategory"));
	int now_level = Integer.parseInt(StringTool.validString(request.getParameter("now_level"), "1")); // 當前類別層數

	// 跳頁參數
	String[] names = new String[] { "npage", "_qcategory", "now_level" };
	String[] values = new String[] { String.valueOf(pageno), qcategory, String.valueOf(now_level)};

	// 回列表頁
	out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
%>
<%
try{
	//A:新增,M:修改,D:刪除,S:排序
	String action = StringTool.validString(request.getParameter("action"));
	// 當前類別 ID	
    String dm_id = StringTool.validString(request.getParameter("dm_id"));
	String dm_category 	= StringTool.validString(request.getParameter("dm_category"));
	String dm_title 	= StringTool.validString(request.getParameter("dm_title"));
	
	if("A".equals(action)){ // A: 新增
		if("".equals(dm_title)) {
			out.println("<script> alert('"+show_title+"名稱不可為空白!!'); history.back(); </script>");
			return;
		}
		TableRecord dm = new TableRecord(tbldm);
		dm.setValue("dm_category", dm_category);
		dm.setValue("dm_title", dm_title);
		dm.setValue("dm_code", code);
		dm.setValue("dm_lang", lang);
		dm.setInsert(app_account);
		app_sm.insert(dm);
		out.println("<script> alert('資料新增成功!!'); listpage.submit(); </script>");
		return;
	}

	if("D".equals(action)){ // D: 刪除
		app_sm.delete(tbldm, dm_id);
		if (app_sm.success()) {
		    out.println("<script> alert('資料刪除成功!!'); listpage.submit(); </script>");
		} else {
		    out.println("<script> alert(\""+app_sm.getMessage()+"\"); history.back(); </script>");
		}
		return;
	}
	
	if("M".equals(action)){ // M: 修改
		if("".equals(dm_title)) {
			out.println("<script> alert('"+show_title+"名稱不可為空白!!'); history.back(); </script>");
			return;
		}
		TableRecord dm = app_sm.select(tbldm, dm_id);
		dm.setValue("dm_category", dm_category);
		dm.setValue("dm_title", dm_title);
		dm.setValue("dm_code", code);
		dm.setValue("dm_lang", lang);
		dm.setUpdate(app_account);
		app_sm.update(dm);
		out.println("<script> alert('資料修改成功!!'); listpage.submit(); </script>");
		return;
	}
	
	//檔案路徑與設置
	String dir = application.getRealPath("/") + "uploads/"+code+"/"+lang+"/";
	File f_dir = new File(dir);
	if(!f_dir.exists()){
		f_dir.mkdirs();
	}
	DiskFileUpload fu = new DiskFileUpload();
	fu.setHeaderEncoding("UTF-8");//亂碼關鍵(1)
	//fu.setSizeMax(4194304); //設置文件大小
	//fu.setSizeThreshold(4096); //設置緩衝大小
	//fu.setRepositoryPath(application.getRealPath("/") + "uploads/temp");  //設置臨時目錄
	fu.setRepositoryPath(dir); //設置臨時目錄     
	List fileItems = fu.parseRequest(request);
	Iterator i = fileItems.iterator();
	
	//排序
	if("S".equals(action)){
		String chk_data = "";
		while (i.hasNext()) {
			FileItem fi = (FileItem) i.next();
			if (fi.isFormField()){											//這是用來確定是否為文件屬性 
				String fieldName = new String(fi.getFieldName()); 			//取得表單名
				String fieldvalue = new String(fi.getString("UTF-8")); 		//取得值
				if("selData".equals(fieldName)){chk_data = fieldvalue.trim();}
			}
		}
		String list[] = chk_data.split(",");
		for(int j=0;j<list.length;j++){
			if(!"".equals(list[j].trim())){
				TableRecord data = app_sm.select(tbldm, "dm_id=?",new Object[] { list[j] });
				data.setValue("dm_showseq", j);
				data.setUpdate(app_account);
				app_sm.update(data);
			}
		}
		app_sm.close();
		out.println("<script> alert('排序完成!!');listpage.submit(); </script>");
		return;
	}
}catch(Exception e){
	System.out.println("Error info:["+e+"]File name edit.jsp for ["+code+"]Time:["+DateTimeTool.dateTimeString()+"]");
	out.println("<script> alert('處理失敗'); history.back(); </script>");
}finally{app_sm.close();}
%>