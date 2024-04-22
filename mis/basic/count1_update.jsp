<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%	
	//基本參數
	String code = "count1"; 			// 模組識別碼
	String upload_code = "count1"; 	// 上傳資料夾識別碼
	String show_title = "瀏覽人次維護"; 			// 模組標題

	// 設定圖檔上傳 MB 數
	Integer fSize = 1;

	// 搜尋欄位
	String qtitle = StringTool.validString(request.getParameter("_qtitle"));

	// 跳頁參數
	String[] names = new String[] { "npage", "_qtitle" };
	String[] values = new String[] { String.valueOf(pageno), qtitle};
%>	
<%
try {
	//A:新增,M:修改,D:刪除,S:排序
	String action = StringTool.validString(request.getParameter("action"));
	// 修改資料id
	String na_id = StringTool.validString(request.getParameter("na_id"));
	
	//刪除
	if("D".equals(action)){
		TableRecord na = app_sm.select(tblna, na_id);
		//FileTool.deleteFile(app_uploadpath+"/"+code+"/"+lang+"/"+na.getString("na_image"));
		//FileTool.deleteFile(app_uploadpath+"/"+code+"/"+lang+"/"+na.getString("na_mobile"));
		app_sm.delete(na);
		app_sm.close();
		//確認是否有其它資料顯示相同圖片(有其它檔案欄位再新增code)
		if (app_sm.success()) {
			if(app_sm.selectAll(tblna, "na_image=?", new Object[] { na.getString("na_image") }).size() == 0) {
				FileTool.deleteFile(app_uploadpath+"/"+upload_code+"/"+lang+"/"+na.getString("na_image"));
			}
			// 回列表頁
			out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
			out.println("<script> alert('刪除成功!!'); listpage.submit(); </script>");
		}else {
			out.println("<script> alert(\""+app_sm.getMessage()+"\"); history.back(); </script>");
		}	
		return;
	}
	
	//檔案路徑與設置
	String dir = application.getRealPath("/") + "uploads/"+upload_code+"/"+lang+"/";
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
		String chk_na = "";
		while (i.hasNext()) {
			FileItem fi = (FileItem) i.next();
			if (fi.isFormField()){											//這是用來確定是否為文件屬性 
				String fieldName = new String(fi.getFieldName()); 			//取得表單名
				String fieldvalue = new String(fi.getString("UTF-8")); 		//取得值
				if("selData".equals(fieldName)){chk_na = fieldvalue.trim();}
			}
		}
		String list[] = chk_na.split(",");
		for(int j=0;j<list.length;j++){
			if(!"".equals(list[j].trim())){
				TableRecord na = app_sm.select(tblna, "na_id=?",new Object[] { list[j] });
				na.setValue("na_showseq", j);
				na.setUpdate(app_account);
				app_sm.update(na);
			}
		}
		app_sm.close();
		// 回排序頁
		out.write(HtmlCoder.getForm("sortpage", code + "_sort.jsp", names, values));
		out.println("<script> alert('排序完成!!');sortpage.submit(); </script>");
		return;
	}
	
	//新增
	if("A".equals(action)){		
		TableRecord na = new TableRecord(tblna);
		na.setInsert(app_account);
		//---------------------檔案上傳-----------------------------------------------
		while (i.hasNext()) {
			FileItem fi = (FileItem) i.next();
			if (fi.isFormField()){ //這是用來確定是否為文件屬性 
				String fieldName = new String(fi.getFieldName()); //取得表單名
				String fieldvalue = new String(fi.getString("UTF-8")); //取得值
				
				if(fieldName.equals("na_title")){
					Vector checks = app_sm.selectAll(tblna,"na_title =? and na_code=? and na_lang=?",new Object[]{fieldvalue, code, lang});
					if(checks.size()>0){
						out.println("<script> alert('標題重複!!'); history.back(); </script>");
						return;
					}
				}
				na.setValue(fieldName, fieldvalue.trim());//設定欄位值
				
			}else { //處理文件
				int g = fi.getName().lastIndexOf("\\");
				String fileName = fi.getName();
				String fileName_1 = "";
				if(g<0){
	                fileName = fi.getName();//兼容非ie
	                fileName_1 = fi.getName();
	            }else{
	                fileName = fi.getName().substring(g);//取得上傳文件名
	                fileName_1 = fileName.substring(1,fileName.length());
	            }
				//fileName_1 = na.getString("na_id")+"_"+fileName_1;
				
				if (fileName != null && !"".equals(fileName)) {
					String chk_str = fileName;
					/*
					if(chk_str.getBytes().length != new String(chk_str).length()){
						out.println("<script> alert('上傳檔名不可為中文'); history.back(); </script>");
						return;
					}
					*/
					if((fSize * 1024 * 1024) < fi.getSize()) {
						out.println("<script> alert('上傳檔案不可超過"+String.valueOf(fSize)+"MB'); history.back(); </script>");
						return;
					}
					fi.write(new File(dir, fileName_1 ));
					na.setValue(fi.getFieldName(), fileName_1);//設定圖
				}
			}
		}
		na.setValue("na_code", code);	// 識別碼
		na.setValue("na_lang", lang);	// 語系		
		app_sm.insert(na);
		// 回列表頁
		out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
		out.println("<script> alert('新增成功!!');listpage.submit(); </script>");
	}else if("M".equals(action)){//修改
		TableRecord na = app_sm.select(tblna, "na_id=?",new Object[] { na_id });
		na.setUpdate(app_account);
		while (i.hasNext()) {

			FileItem fi = (FileItem) i.next();
			if (fi.isFormField()){ //這是用來確定是否為文件屬性 
				String fieldName = new String(fi.getFieldName()); //取得表單名
				String fieldvalue = new String(fi.getString("UTF-8")); //取得值
			
				if(fieldName.equals("na_title")){
					Vector checks = app_sm.selectAll(tblna,"na_title =? and na_id <>? and na_code=? and na_lang=?",new Object[]{fieldvalue, na_id, code, lang});
					if(checks.size()>0){
						out.println("<script> alert('標題重複!!'); history.back(); </script>");
						return;
					}else{
						na.setValue(fieldName, fieldvalue.trim());//設定欄位值
					}
			
			    }else if(!fieldName.startsWith("imgradio")){
			    	if("_qtitle".equals(fieldName)){ //解決查詢標題為中文時傳值的問題
						values[1] = fieldvalue.trim();
					}else{
						na.setValue(fieldName, fieldvalue.trim());//設定欄位值
					}
			    }
			}else { //處理文件(file)
				int g = fi.getName().lastIndexOf("\\");
				String fileName = fi.getName();
				String fileName_1 = "";
				if(g<0){
	                fileName = fi.getName();//兼容非ie
	                fileName_1 = fi.getName();
	            }
	            else{
	                fileName = fi.getName().substring(g);					//取得上傳文件名
	                fileName_1 = fileName.substring(1,fileName.length());
	            }
				//fileName_1 = na.getString("na_id")+"_"+fileName_1;
				
				if (fileName != null && !"".equals(fileName)) {
					String chk_str = fileName;
					/*
					if(chk_str.getBytes().length != new String(chk_str).length()){
						out.println("<script> alert('上傳檔名不可為中文'); history.back(); </script>");
						return;
					}
					*/
					if((fSize * 1024 * 1024) < fi.getSize()) {
						out.println("<script> alert('上傳檔案不可超過"+String.valueOf(fSize)+"MB'); history.back(); </script>");
						return;
					}
					// Delete 原來的 image file.
					if(!"".equals(na.getString(fi.getFieldName()))){
						//確認其它資料沒有使用相同檔案
						if(app_sm.selectAll(tblna, fi.getFieldName()+"=?", new Object[] {na.getString(fi.getFieldName()) }).size() == 1) {
							FileTool.deleteFile(app_uploadpath+"/"+upload_code+"/"+lang+"/"+na.getString(fi.getFieldName()));
						}
					}
					
					fi.write(new File(dir, fileName_1 ));
					na.setValue(fi.getFieldName(), fileName_1);//設定圖
				}
			}
		}		
		app_sm.update(na);
		// 回列表頁
		out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
	    out.println("<script> alert('修改成功!!'); listpage.submit(); </script>");
	}
}catch(Exception e){
	System.out.println("Project:" + projectName + ", Error info:["+e+"]File name edit.jsp for ["+code+"]Time:["+DateTimeTool.dateTimeString()+"]");
	out.println("<script> alert('處理失敗'); history.back(); </script>");
}finally{app_sm.close();}
%>