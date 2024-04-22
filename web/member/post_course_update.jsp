<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@page import="com.genesis.utils.StringTool"%>

<%@include file="include/function.jsp"%>
<%	
	// 基本參數
	String code = "post_course"; 					// 模組識別碼
	String show_title = "技職好文資訊維護";		// 模組標題
    String app_account = "Web_User";
	// 設定圖檔上傳 MB 數
	Integer fSize = 1;

	// 搜尋欄位
	String qtitle = StringTool.validString(request.getParameter("_qtitle"));
	String qcategory = StringTool.validString(request.getParameter("_qcategory"),"%");

	// 跳頁參數
	String[] names = new String[] { "npage", "_qtitle", "_qcategory" };
	String[] values = new String[] { String.valueOf(pageno), qtitle, qcategory };
	
	
%>	
<%
try{
	//A:新增,M:修改,D:刪除,S:排序
	String action = StringTool.validString(request.getParameter("action"));
	// 修改資料id
	String cp_id = StringTool.validString(request.getParameter("cp_id"));
	
	//刪除
	if("D".equals(action)){
		TableRecord cp = app_sm.select(tblcp, cp_id);
		//FileTool.deleteFile(app_uploadpath+"/"+code+"/"+lang+"/"+cp.getString("cp_image"));
		//FileTool.deleteFile(app_uploadpath+"/"+code+"/"+lang+"/"+cp.getString("cp_mobile"));
		app_sm.delete(cp);
		app_sm.close();
		//確認是否有其它資料顯示相同圖片(有其它檔案欄位再新增code)
		if (app_sm.success()) {
			if(app_sm.selectAll(tblcp, "cp_image=?", new Object[] { cp.getString("cp_image") }).size() == 0) {
				FileTool.deleteFile(app_uploadpath+"/"+code+"/"+lang+"/"+cp.getString("cp_image"));
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
	
	//判斷要發佈到哪一頁
	String destination = "";
	boolean toNews = false;
	boolean toImplement = false;
	while(i.hasNext()) {
		FileItem fi = (FileItem) i.next();
        if(fi.isFormField()) {
        	String fieldName = new String(fi.getFieldName()); //取得表單名
			String fieldvalue = new String(fi.getString("UTF-8")); //取得值
			
			if("destination".equals(fieldName)) {
			    toNews = fieldvalue.contains("news")?true:false;
			    toImplement = fieldvalue.contains("implement")?true:false;
			}
        }
	}
	i = fileItems.iterator(); //重製迭代器
	//排序
	if("S".equals(action)){
		String chk_cp = "";
		while (i.hasNext()) {
			FileItem fi = (FileItem) i.next();
			if (fi.isFormField()){											//這是用來確定是否為文件屬性 
				String fieldName = new String(fi.getFieldName()); 			//取得表單名
				String fieldvalue = new String(fi.getString("UTF-8")); 		//取得值
				if("selData".equals(fieldName)){chk_cp = fieldvalue.trim();}
			}
		}
		String list[] = chk_cp.split(",");
		for(int j=0;j<list.length;j++){
			if(!"".equals(list[j].trim())){
				TableRecord cp = app_sm.select(tblcp, "cp_id=?",new Object[] { list[j] });
				cp.setValue("cp_showseq", j);
				cp.setUpdate(app_account);
				app_sm.update(cp);
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
		TableRecord cp = new TableRecord(tblcp);
		cp.setInsert(app_account);
		//---------------------檔案上傳-----------------------------------------------
		while (i.hasNext()) {
			FileItem fi = (FileItem) i.next();
			if (fi.isFormField()){ //這是用來確定是否為文件屬性 
				String fieldName = new String(fi.getFieldName()); //取得表單名
				String fieldvalue = new String(fi.getString("UTF-8")); //取得值
				System.out.println(fieldName+" : "+fieldvalue);
				//跳過特定欄位
				if(fieldName.equals("destination") || fieldName.equals("destination_temp") || fieldName.equals("file_name") || fieldName.equals("editor")) {
					continue;
				}
				if(fieldName.equals("cp_title")){
					Vector checks = app_sm.selectAll(tblcp,"cp_title =? and cp_code=? and cp_lang=?",new Object[]{fieldvalue, code, lang});
					if(checks.size()>0){
						out.println("<script> alert('標題重複!!'); history.back(); </script>");
						return;
					}
				}
				cp.setValue(fieldName, fieldvalue.trim());//設定欄位值
				
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
				//fileName_1 = cp.getString("cp_id")+"_"+fileName_1;
				
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
					cp.setValue(fi.getFieldName(), fileName_1);//設定圖
				}
			}
		}
		cp.setValue("cp_code", code);	// 識別碼
		cp.setValue("cp_lang", lang);	// 語系		
		app_sm.insert(cp);
		
		//把資料insert到cp_code = implement_news
        if(toImplement) {
        	TableRecord cp_implement_news = new TableRecord(tblcp);
        	cp_implement_news.setValue("cp_title",cp.getString("cp_title"));
        	cp_implement_news.setValue("cp_content",cp.getString("cp_content"));
        	cp_implement_news.setValue("cp_status","N");
        	cp_implement_news.setValue("cp_category",cp.getString("cp_id")); //建立關聯
        	/*塞入預設SEO(首頁共用值)*/
        	cp_implement_news.setValue("cp_robots",SiteSetup.getText("seo.robots."+lang));
        	cp_implement_news.setValue("cp_revisit_after",SiteSetup.getText("seo.revisit_after."+lang));
        	cp_implement_news.setValue("cp_keywords",SiteSetup.getText("seo.keywords."+lang));
        	cp_implement_news.setValue("cp_description",SiteSetup.getText("seo.description."+lang));
        	cp_implement_news.setValue("cp_copyright",SiteSetup.getText("seo.copyright."+lang));
        	cp_implement_news.setValue("cp_seo_track",SiteSetup.getText("seo.track."+lang));
        	/*塞入預設SEO(首頁共用值)*/
        	cp_implement_news.setValue("cp_code","implement_news"); 
        	cp_implement_news.setValue("cp_lang",lang);
        	cp_implement_news.setInsert("Web_User");
        	
            app_sm.insert(cp_implement_news);                    	
        }
		
		if(toNews) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd",Locale.ENGLISH);
		    //
			//DateFormat df = DateFormat.getDateInstance();
		    Date date = sdf.parse(app_today);
		    //
		    Calendar calendar = Calendar.getInstance();
		    calendar.setTime(date);
		    calendar.add(calendar.YEAR, 1);
		    String today_plus_year = sdf.format(calendar.getTime());
		   
		    //System.out.println(sdf.format(calendar.getTime()));
			//把資料塞到news
		    TableRecord np_implement = new TableRecord(tblnp);
			np_implement.setValue("np_title",cp.getString("cp_title"));
			np_implement.setValue("np_content",cp.getString("cp_content"));
			np_implement.setValue("np_upcategory",cp.getString("cp_id")); //建立關聯
			np_implement.setValue("np_status","N");
			/*塞入預設SEO(首頁共用值)*/
            np_implement.setValue("np_robots",SiteSetup.getText("seo.robots."+lang));
            np_implement.setValue("np_revisit_after",SiteSetup.getText("seo.revisit_after."+lang));
            np_implement.setValue("np_keywords",SiteSetup.getText("seo.keywords."+lang));
            np_implement.setValue("np_description",SiteSetup.getText("seo.description."+lang));
            np_implement.setValue("np_copyright",SiteSetup.getText("seo.copyright."+lang));
            np_implement.setValue("np_seo_track",SiteSetup.getText("seo.track."+lang));			
        	/*塞入預設SEO(首頁共用值)*/
			np_implement.setValue("np_code","post_course");
			np_implement.setValue("np_lang",lang);
			np_implement.setValue("np_emitdate",app_today);
			np_implement.setValue("np_restdate",today_plus_year);
			
			np_implement.setInsert("Web_User");
			
			app_sm.insert(np_implement);
			
		}
		// 回列表頁
		out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
		out.println("<script> alert('新增成功!!');listpage.submit(); </script>");
	}else if("M".equals(action)){//修改

		TableRecord cp = app_sm.select(tblcp, "cp_id=?",new Object[] { cp_id });
		cp.setUpdate("Web_User");
		while (i.hasNext()) {

			FileItem fi = (FileItem) i.next();
			if (fi.isFormField()){ //這是用來確定是否為文件屬性 
				String fieldName = new String(fi.getFieldName()); //取得表單名
				String fieldvalue = new String(fi.getString("UTF-8")); //取得值
			    if(fieldName.equals("destination") || fieldName.equals("destination_temp")) {
			    	continue;
			    }
				if(fieldName.equals("cp_title")){
					Vector checks = app_sm.selectAll(tblcp,"cp_title =? and cp_id <>? and cp_code=? and cp_lang=?",new Object[]{fieldvalue, cp_id, code, lang});
					if(checks.size()>0){
						out.println("<script> alert('標題重複!!'); history.back(); </script>");
						return;
					}else{
						cp.setValue(fieldName, fieldvalue.trim());//設定欄位值
					}
			
			    }else if(!fieldName.startsWith("imgradio")){
			    	if("_qtitle".equals(fieldName)){ //解決查詢標題為中文時傳值的問題
						values[1] = fieldvalue.trim();
					}else{
						cp.setValue(fieldName, fieldvalue.trim());//設定欄位值
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
				//fileName_1 = cp.getString("cp_id")+"_"+fileName_1;
				
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
					if(!"".equals(cp.getString(fi.getFieldName()))) {
						//確認其它資料沒有使用相同檔案
						if(app_sm.selectAll(tblcp, fi.getFieldName()+"=?", new Object[] {cp.getString(fi.getFieldName()) }).size() == 1) {
							FileTool.deleteFile(app_uploadpath+"/"+code+"/"+lang+"/"+cp.getString(fi.getFieldName()));
						}
					}

					fi.write(new File(dir, fileName_1 ));
					cp.setValue(fi.getFieldName(), fileName_1);//設定圖
				}
			}
		}		
		app_sm.update(cp);
		
		if(toImplement) {
			TableRecord cp_implement_news = app_sm.select(tblcp,"cp_category=?",new Object[]{cp.getString("cp_id")});
			if(!cp_implement_news.getString("cp_id").isEmpty()) {
				cp_implement_news.setValue("cp_title",cp.getString("cp_title"));
				cp_implement_news.setValue("cp_content",cp.getString("cp_content"));
				cp_implement_news.setUpdate("Web_user");
				app_sm.update(cp_implement_news);
			}else {
				cp_implement_news.setValue("cp_title",cp.getString("cp_title"));
	        	cp_implement_news.setValue("cp_content",cp.getString("cp_content"));
	        	cp_implement_news.setValue("cp_status","N");
	        	cp_implement_news.setValue("cp_category",cp.getString("cp_id"));
	        	cp_implement_news.setValue("cp_code","implement_news");
	        	cp_implement_news.setValue("cp_lang",lang);
	        	cp_implement_news.setInsert("Web_User");
	        	
	            app_sm.insert(cp_implement_news);  
			}
		}
		
		if(toNews) {
			TableRecord np = app_sm.select(tblnp,"np_upcategory=?",new Object[]{cp.getString("cp_id")});
			if(!np.getString("np_id").isEmpty()){
				np.setValue("np_title",cp.getString("cp_title"));
				np.setValue("np_content",cp.getString("cp_content"));
				np.setUpdate("Web_User");
				
				app_sm.update(np);
			}else {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			    DateFormat df = DateFormat.getDateInstance();
			    Date date = df.parse(app_today);
			    Calendar calendar = Calendar.getInstance();
			    calendar.setTime(date);
			    calendar.add(calendar.YEAR, 1);
			    String today_plus_year = sdf.format(calendar.getTime());
			   
			    System.out.println(sdf.format(calendar.getTime()));
				TableRecord np_implement = new TableRecord(tblnp);
				np_implement.setValue("np_title",cp.getString("cp_title"));
				np_implement.setValue("np_content",cp.getString("cp_content"));
				np_implement.setValue("np_upcategory",cp.getString("cp_id"));
				np_implement.setValue("np_status","N");
				np_implement.setValue("np_code","post_course");
				np_implement.setValue("np_lang",lang);
				np_implement.setValue("np_emitdate",app_today);
				np_implement.setValue("np_restdate",today_plus_year);
				
				np_implement.setInsert("Web_User");
				
				app_sm.insert(np_implement);
			}
		}
		// 回列表頁
		out.write(HtmlCoder.getForm("listpage", code + ".jsp", names, values));
	    out.println("<script> alert('修改成功!!'); listpage.submit(); </script>");
	}
}catch(Exception e){
	System.out.println("Error info:["+e+"]File name edit.jsp for ["+code+"]Time:["+DateTimeTool.dateTimeString()+"]");
	out.println("<script> alert('處理失敗'); history.back(); </script>");
}finally{app_sm.close();}
%>