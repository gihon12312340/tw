<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@ page import="java.util.List"%>
<%
if(app_account.equals("root")){
	// Tiltes.
	String[] titles = new String[]{"網站後台名稱", "about 模組名稱", "project 模組名稱", "product 模組名稱", "product 類別層數", "job 模組名稱", "contact 模組名稱", "contact 備註說明"};
	// Keywords.
	String[] keywords = new String[]{"mis_title", "about_title", "project_title", "product_title", "product_category", "job_title", "contact_title", "contact_remark"};
	// Get records.
	Vector smtps = new Vector();
	for (int i = 0; i < titles.length; i++) {
		TableRecord ss = SiteSetup.getSetup(keywords[i] + "." + lang);
		ss.setUpdate(app_account);
		String value = StringTool.validString(request
				.getParameter(keywords[i]));
		ss.setValue("ss_text", value);
		ss.setUpdate(app_account);
		app_sm.update(ss);
	}
	if (app_sm.success()) {
		out.println("<script> alert('資料修改成功!!'); location='rootsetup_c.jsp'; </script>");
	} else {
		out.println("<script> alert(\"" + app_sm.getMessage()+ "\"); history.back(); </script>");
	}
}
%>
<%
	Integer fSize = 1024; // 設定圖檔上傳 K 數

	try {		

		//檔案路徑與設置
		String dir = application.getRealPath("/") + "web/images/";
		DiskFileUpload fu = new DiskFileUpload();
		fu.setHeaderEncoding("UTF-8");//亂碼關鍵(1)
		fu.setSizeMax(4194304); //設置文件大小
		fu.setSizeThreshold(4096); //設置緩衝大小
		fu.setRepositoryPath(dir); //設置臨時目錄     
		List fileItems = fu.parseRequest(request);
		Iterator i = fileItems.iterator();

		//---------------------檔案上傳-----------------------------------------------
		while (i.hasNext()) {
			FileItem fi = (FileItem) i.next();
			if (fi.isFormField()) { //這是用來確定是否為文件屬性 
				String fieldName = new String(fi.getFieldName()); //取得表單名
				String fieldvalue = new String(fi.getString("UTF-8")); //取得值

				if(fieldName.indexOf("image")==-1){
					TableRecord ss = SiteSetup.getSetup(fieldName + "." + lang);
					ss.setUpdate(app_account);
					ss.setValue("ss_text", fieldvalue);
					ss.setUpdate(app_account);
					app_sm.update(ss);
				}
			} else { //處理文件
				int g = fi.getName().lastIndexOf("\\");
				String fileName = fi.getName();
				String fileName_1 = "";
				if (g < 0) {
					fileName = fi.getName();//兼容非ie
					fileName_1 = fi.getName();
				} else {
					fileName = fi.getName().substring(g); //取得上傳文件名
					// System.out.println(fileName);
					fileName_1 = fileName.substring(1, fileName.length());
				}
				if (fileName != null && !"".equals(fileName)) {
					String chk_str = fileName;
					/*
					if(chk_str.getBytes().length != new String(chk_str).length()){
						out.println("<script> alert('上傳檔名不可為中文'); history.back(); </script>");
						return;
					}
					*/
					if(fi.getFieldName().equals("css")) {
						fi.write(new File(application.getRealPath("/") + "web/css/", fileName_1));
					} else if(fi.getFieldName().equals("web_logo")) {
						fi.write(new File(application.getRealPath("/") + "web/images/", fileName_1));
					} else if(fi.getFieldName().equals("mis_logo")) {
						fi.write(new File(application.getRealPath("/") + "mis/images/", fileName_1));
					} else {
						if(!"".equals(SiteSetup.getSetup(fi.getFieldName() + "." + lang).getString("ss_text"))){
							FileTool.deleteFile(dir+SiteSetup.getSetup(fi.getFieldName() + "." + lang).getString("ss_text"));
						}
						fi.write(new File(dir, fileName_1));
						TableRecord ss = SiteSetup.getSetup(fi.getFieldName() + "." + lang);
						ss.setUpdate(app_account);
						ss.setValue("ss_text", fileName_1);
						ss.setUpdate(app_account);
						app_sm.update(ss);
					}
				}
			}
		}
		out.println("<script> alert('資料修改成功!!'); location='rootsetup_c.jsp'; </script>");
	} catch (Exception e) {
		System.out.println("Error info:[" + e + "]File name edit.jsp for [rootsetup.jsp]Time:[" + DateTimeTool.dateTimeString() + "]");
		out.println("<script> alert('處理失敗'); history.back(); </script>");
	} finally {
		app_sm.close();
	}
%>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>