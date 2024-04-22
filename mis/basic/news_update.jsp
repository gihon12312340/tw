<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@include file="include/function.jsp"%>
<%
	// 基本參數
	String code = "news"; 					// 模組識別碼
	String show_title = "新訊報報";			// 模組標題

	// 設定圖檔上傳 MB 數
	Integer fSize = 1;

	// 搜尋欄位
	String qtitle = StringTool.validString(request.getParameter("_qtitle"));
	String qcategory = StringTool.validString(request.getParameter("_qcategory"),"%");
	String qemitdate = StringTool.validString(request.getParameter("_qemitdate"), DateTimeTool.getYear() - 10 + DateTimeTool.dateString().substring(4));
	String qrestdate = StringTool.validString(request.getParameter("_qrestdate"), DateTimeTool.getYear() + 1 + DateTimeTool.dateString().substring(4));
	String qstatus = StringTool.validString(request.getParameter("_qstatus"));

	// 跳頁參數
	String[] names = new String[] { "npage", "_qtitle", "_qcategory", "_qemitdate", "_qrestdate", "_qstatus" };
	String[] values = new String[] { String.valueOf(pageno), qtitle, qcategory, qemitdate, qrestdate, qstatus };
%>
<%
try{
	//A:新增,M:修改,D:刪除,S:排序
	String action = StringTool.validString(request.getParameter("action"));
	// 修改資料id
	String np_id = StringTool.validString(request.getParameter("np_id"));
	
	//刪除
	if("D".equals(action)){
		TableRecord np = app_sm.select(tblnp, np_id);
		//FileTool.deleteFile(app_uploadpath+"/"+code+"/"+lang+"/"+np.getString("np_image"));
		//FileTool.deleteFile(app_uploadpath+"/"+code+"/"+lang+"/"+np.getString("np_mobile"));
		app_sm.delete(np);
		app_sm.close();
		//確認是否有其它資料顯示相同圖片(有其它檔案欄位再新增code)
		if (app_sm.success()) {
			if(app_sm.selectAll(tblnp, "np_image=?", new Object[] { np.getString("np_image") }).size() == 0) {
				FileTool.deleteFile(app_uploadpath+"/"+code+"/"+lang+"/"+np.getString("np_image"));
			}
			// 回列表頁
			out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
			out.println("<script> alert('刪除成功!!'); listpage.submit(); </script>");
		}else {
			out.println("<script> alert(\""+app_sm.getMessage()+"\"); history.back(); </script>");
		}	
		return;
	}
	
	if("P".equals(action)) {
		TableRecord np = app_sm.select(tblnp,np_id);
		String np_status = StringTool.validString(request.getParameter("np_status"));
		np.setValue("np_status",np_status);
		np.setUpdate(app_account);
		app_sm.update(np);
		app_sm.close();
		
		if(app_sm.success()) {
			// 回列表頁
			out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
			out.println("<script> alert('修改成功!!'); listpage.submit(); </script>");
		} else{
			out.println("<script> alert(\""+app_sm.getMessage()+"\"); history.back(); </script>");
		}
	    
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
		String chk_np = "";
		while (i.hasNext()) {
			FileItem fi = (FileItem) i.next();
			if (fi.isFormField()){											//這是用來確定是否為文件屬性 
				String fieldName = new String(fi.getFieldName()); 			//取得表單名
				String fieldvalue = new String(fi.getString("UTF-8")); 		//取得值
				if("selData".equals(fieldName)){chk_np = fieldvalue.trim();}
			}
		}
		String list[] = chk_np.split(",");
		for(int j=0;j<list.length;j++){
			if(!"".equals(list[j].trim())){
				TableRecord np = app_sm.select(tblnp, "np_id=?",new Object[] { list[j] });
				np.setValue("np_showseq", j);
				np.setUpdate(app_account);
				app_sm.update(np);
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
		TableRecord np = new TableRecord(tblnp);
		np.setInsert(app_account);
		//---------------------檔案上傳-----------------------------------------------
		while (i.hasNext()) {
			FileItem fi = (FileItem) i.next();
			if (fi.isFormField()){ //這是用來確定是否為文件屬性 
				String fieldName = new String(fi.getFieldName()); //取得表單名
				String fieldvalue = new String(fi.getString("UTF-8")); //取得值
				//System.out.println(fieldName);
				if(fieldName.equals("np_title")){
					Vector checks = app_sm.selectAll(tblnp,"np_title =? and "+"np_code=?",new Object[]{fieldvalue, code});
					if(checks.size()>0){
						out.println("<script> alert('標題重複!!'); history.back(); </script>");
						return;
					}else{
						np.setValue(fieldName, fieldvalue.trim());//設定欄位值
					}
				
			    }else{
					np.setValue(fieldName, fieldvalue.trim());//設定欄位值
			    }
				
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
				//fileName_1 = np.getString("np_id")+"_"+fileName_1;
				
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
					np.setValue(fi.getFieldName(), fileName_1);//設定圖
				}
			}
		}
		np.setValue("np_code", code);	// 識別碼
		np.setValue("np_lang", lang);	// 語系		
		app_sm.insert(np);
		// 回列表頁
		out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
		out.println("<script> alert('新增成功!!'); listpage.submit(); </script>");
	}else if("M".equals(action)){//修改
		TableRecord np = app_sm.select(tblnp, "np_id=?",new Object[] { np_id });
		np.setUpdate(app_account);
	if("news".equals(np.getString("np_code"))){
		while (i.hasNext()) {

			FileItem fi = (FileItem) i.next();
			if (fi.isFormField()){ //這是用來確定是否為文件屬性 
				String fieldName = new String(fi.getFieldName()); //取得表單名
				String fieldvalue = new String(fi.getString("UTF-8")); //取得值
				if(fieldName.equals("np_title")){
					Vector checks = app_sm.selectAll(tblnp,"np_title =? and "+"np_id !=? and "+"np_code=?",new Object[]{fieldvalue, np_id, code});
					if(checks.size()>0){
						out.println("<script> alert('標題重複!!'); history.back(); </script>");
						return;
					}else{
						np.setValue(fieldName, fieldvalue.trim());//設定欄位值
					}
			
			    }else if(!fieldName.startsWith("imgradio")){
			    	if("_qtitle".equals(fieldName)){ //解決查詢標題為中文時傳值的問題
						values[1] = fieldvalue.trim();
					}else{
						np.setValue(fieldName, fieldvalue.trim());//設定欄位值
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
				//fileName_1 = np.getString("np_id")+"_"+fileName_1;
				
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
					if(!"".equals(np.getString(fi.getFieldName()))){
						//確認其它資料沒有使用相同檔案
						if(app_sm.selectAll(tblnp, fi.getFieldName()+"=?", new Object[] {np.getString(fi.getFieldName()) }).size() == 1) {
							FileTool.deleteFile(app_uploadpath+"/"+code+"/"+lang+"/"+np.getString(fi.getFieldName()));
						}
					}
					
					fi.write(new File(dir, fileName_1 ));
					np.setValue(fi.getFieldName(), fileName_1);//設定圖
				}
			}
		}		
		app_sm.update(np);
		// 回列表頁
		out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
		out.println("<script> alert('修改成功!!');listpage.submit(); </script>");
	}else if("post_course".equals(np.getString("np_code"))){
		dir = application.getRealPath("/") + "uploads/"+"post_course"+"/"+lang+"/";
		f_dir = new File(dir);
		if(!f_dir.exists()){
			f_dir.mkdirs();
		}
		//關聯的發文資料
		TableRecord cp_post_course = app_sm.select(tblcp,np.getString("np_upcategory"));
		while (i.hasNext()) {
			FileItem fi = (FileItem) i.next();
			if (fi.isFormField()){ //這是用來確定是否為文件屬性 
				String fieldName = new String(fi.getFieldName()); //取得表單名
				String fieldvalue = new String(fi.getString("UTF-8")); //取得值
				if(fieldName.equals("np_title")){
					Vector checks = app_sm.selectAll(tblnp,"np_title =? and "+"np_id !=? and "+"np_code=?",new Object[]{fieldvalue, np_id, code});
					if(checks.size()>0){
						out.println("<script> alert('標題重複!!'); history.back(); </script>");
						return;
					}else{
						cp_post_course.setValue("cp_title",fieldvalue.trim()); //修改關聯的發文資料
						//np.setValue(fieldName, fieldvalue.trim());//設定欄位值
					}
			
			    }else if(!(fieldName.startsWith("imgradio") || fieldName.equals("np_content"))){
			    	if("_qtitle".equals(fieldName)){ //解決查詢標題為中文時傳值的問題
						values[1] = fieldvalue.trim();
					}else{
						np.setValue(fieldName, fieldvalue.trim());//設定欄位值
					}
			    	
			    }else if(fieldName.equals("np_content")) {
			    	cp_post_course.setValue("cp_content",fieldvalue.trim());
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
				//fileName_1 = np.getString("np_id")+"_"+fileName_1;
				
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
					if(!"".equals(cp_post_course.getString("cp_image"))){
						//確認其它資料沒有使用相同檔案
						if(app_sm.selectAll(tblcp, "cp_image=?", new Object[] {np.getString(fi.getFieldName()) }).size() == 1) {
							FileTool.deleteFile(app_uploadpath+"/"+"post_course"+"/"+lang+"/"+np.getString(fi.getFieldName()));
						}
					}
					
					fi.write(new File(dir, fileName_1 ));
					cp_post_course.setValue("cp_image", fileName_1);//設定圖
				}
			}
		}		
		app_sm.update(np);
		//update關聯的會員發文資料
		cp_post_course.setUpdate(app_account);
		app_sm.update(cp_post_course);
		// 回列表頁
		out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
		out.println("<script> alert('修改成功!!');listpage.submit(); </script>");
	}
	}
}catch(Exception e){
	System.out.println("Error info:["+e+"]File name edit.jsp for ["+code+"]Time:["+DateTimeTool.dateTimeString()+"]");
	out.println("<script> alert('處理失敗'); history.back(); </script>");
}finally{app_sm.close();}
%>