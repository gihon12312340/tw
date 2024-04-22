<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.List" %>
<%
// 相關參數設定
String code 		= "apply";				// 功能識別碼 , 於資料庫做資料識別及模組程式檔名用
String show_title 	= "申請發文帳號";				// 功能標題
Integer fSize = 1; 							// 設定圖檔上傳 MB 數

try {
	String action = StringTool.validString(request.getParameter("action"));//A:新增,M:修改 , C:等級設定
	String mp_id = StringTool.validString(request.getParameter("mp_id"));

	// Conditions.
    String qcellphone = StringTool.validString(request.getParameter("_qcellphone"));
    String qaccount = StringTool.validString(request.getParameter("_qaccount"));
    String qname = StringTool.validString(request.getParameter("_qname"));
	
	// Names and values.
    String[] names = new String[] { "npage", "_qname", "_qcellphone", "_qaccount" };
    String[] values = new String[] { String.valueOf(pageno), qname, qcellphone, qaccount };	
	
	if("D".equals(action)){ //刪除
	   TableRecord mp_apply = app_sm.select(tblmp, "mp_id=?",new Object[] { mp_id });
	   TableRecord mp = app_sm.select(tblmp,"mp_code=? and mp_account=?",
               new Object[]{"",mp_apply.getString("mp_account")});
	   mp.setValue("mp_publish_status","R");
	   mp.setUpdate(app_account);
	   app_sm.update(mp);
	   app_sm.delete(tblmp, "mp_id=?", new String[] {mp_id});
	   app_sm.close();
	   
	   out.println(HtmlCoder.form("backdata", code+".jsp", names, values));
	   out.println("<script> alert('刪除成功!!'); backdata.submit(); </script>");
	   return;		
	}else if("P".equals(action)){
		TableRecord mp_apply = app_sm.select(tblmp, "mp_id=?",new Object[] { mp_id });
		String mp_publish_status = request.getParameter("mp_publish_status");
		mp_apply.setValue("mp_publish_status",mp_publish_status);
		mp_apply.setUpdate(app_account);
		app_sm.update(mp_apply);
		
		TableRecord mp = app_sm.select(tblmp,"mp_code=? and mp_account=?",
				                       new Object[]{"",mp_apply.getString("mp_account")});
		mp.setValue("mp_publish_status",mp_publish_status);
		mp.setUpdate(app_account);
		app_sm.update(mp);
		
		app_sm.close();
		
		out.println(HtmlCoder.form("backdata", code+".jsp", names, values));
		out.println("<script> alert('修改成功!!'); backdata.submit(); </script>");
		return;
	}
	
	//檔案路徑與設置
    String dir = app_uploadpath+"/member";
	DiskFileUpload fu = new DiskFileUpload();
	fu.setHeaderEncoding("UTF-8");//亂碼關鍵(1)
	fu.setSizeMax(4194304); //設置文件大小
	fu.setSizeThreshold(4096); //設置緩衝大小
	fu.setRepositoryPath(dir); //設置臨時目錄     
	List fileItems = fu.parseRequest(request);
	Iterator i = fileItems.iterator();

	//--------------------------------------------------------------//
	
	if("A".equals(action)){//新增
		TableRecord mp = new TableRecord(tblmp);
		//---------------------檔案上傳-----------------------------------------------
		while (i.hasNext()) {
			FileItem fi = (FileItem) i.next();
			if (fi.isFormField()){ //這是用來確定是否為文件屬性 
				String fieldName = new String(fi.getFieldName()); //取得表單名
				String fieldvalue = new String(fi.getString("UTF-8")); //取得值
				// System.out.println(fieldName);
				if("mp_account".equals(fieldName)){
					String chk_id = app_sm.select(tblmp, "mp_account=?", new Object[]{fieldvalue.trim()}).getString("mp_id");
					if(!"".equals(chk_id)){out.println("<script> alert('該會員帳號已被使用!!'); history.back(); </script>");return;}
				}
				if(!"mp_pswd".equals(fieldName)){
					mp.setValue(fieldName, fieldvalue.trim());//設定欄位值
				}
			}else { //處理文件
				int g = fi.getName().lastIndexOf("\\");
				String fileName = fi.getName();
				String fileName_1 = "";
				if(g<0){
	                fileName = fi.getName();//兼容非ie
	                fileName_1 = fi.getName();
	            }
	            else{
	                fileName = fi.getName().substring(g);//取得上傳文件名
	                fileName_1 = fileName.substring(1,fileName.length());
	            }
				if (fileName != null && !"".equals(fileName)) {
					String chk_str = fileName;
					/*
					if(chk_str.getBytes().length != new String(chk_str).length()){
						out.println("<script> alert('上傳檔名不可為中文'); history.back(); </script>");
						return;
					}
					*/
					fi.write(new File(dir, fileName_1 ));
					mp.setValue(fi.getFieldName(), fileName_1);//設定圖
				}
			}
		}
		mp.setValue("mp_regcode", "ok");
		mp.setValue("mp_code", "member");
		mp.setInsert(app_account);
		app_sm.insert(mp);	
		out.println("<script> alert('新增成功!!');location='"+code+".jsp'; </script>"); 
	}else if("M".equals(action)){//修改
		TableRecord mp = app_sm.select(tblmp, "mp_id=?",new Object[] { mp_id });
		int add_bonus = 0;
		while (i.hasNext()) {

			FileItem fi = (FileItem) i.next();
			if (fi.isFormField()) {//這是用來確定是否為文件(file)屬性
				String fieldName = fi.getFieldName(); //取得表單名
				String fieldvalue = new String(fi.getString("UTF-8")); //取得值
				if("mp_email".equals(fieldName)){
					String chk_id = app_sm.select(tblmp, "mp_email=? AND mp_id<>? ", new Object[]{fieldvalue.trim() , mp_id}).getString("mp_id");
					if(!"".equals(chk_id)){out.println("<script> alert('該會員帳號已被使用!!'); history.back(); </script>");return;}
				}
				// 判断那些欄位要例外處理
				if("mp_pswd".equals(fieldName) || "add_bonus".equals(fieldName) || "_qname".equals(fieldName)){
					if("_qname".equals(fieldName)){								//解決查詢標題為中文時傳值的問題
						values[1] = fieldvalue.trim();
					}
					/* 會員紅利增加或扣除
					if("add_bonus".equals(fieldName) && (Integer.parseInt(fieldvalue.trim())) > 0) { 
						add_bonus = Integer.parseInt(fieldvalue.trim());
						TableRecord mb = new TableRecord(tblmb);
						mb.setValue("mp_id",mp_id);
						mb.setValue("os_date",app_today);
						mb.setValue("mb_desc","系統歸還或加贈");	   			
						mb.setValue("mb_getbonus",new Integer(add_bonus));
						mb.setValue("mb_usebonus",new Integer(0));
						mb.setValue("mb_reason","system");

						mb.setInsert(mp.getString("mp_account"));
						app_sm.insert(mb);
					}
					*/
				} else {
					mp.setValue(fieldName, fieldvalue.trim());//設定欄位值
				}
				
			} else { //處理文件(file)
				int g = fi.getName().lastIndexOf("\\");
				String fileName = fi.getName();
				String fileName_1 = "";
				if(g<0){
	                fileName = fi.getName();//兼容非ie
	                fileName_1 = fi.getName();
	            }
	            else{
	                fileName = fi.getName().substring(g);//取得上傳文件名
	                fileName_1 = fileName.substring(1,fileName.length());
	            }
				//if((fSize * 1024 * 1024) < fi.getSize() && "mp_image".equals(fi.getFieldName())){
				//	out.println("<script> alert('上傳檔案不可超過"+String.valueOf(fSize)+"MB'); history.back(); </script>");return;
				//}
				if (fileName != null && !"".equals(fileName)) {
					String chk_str = fileName;
					/*
					if(chk_str.getBytes().length != new String(chk_str).length()){
						out.println("<script> alert('上傳檔名不可為中文'); history.back(); </script>");
						return;
					}
					*/
					fi.write(new File(dir, fileName_1 ));
					mp.setValue(fi.getFieldName(), fileName_1);//設定圖
				}
			}
		}
		// Update record.
		mp.setUpdate(app_account);
		app_sm.update(mp);

		out.println(HtmlCoder.form("backdata", code+".jsp", names, values));
		if (add_bonus > 0 ) out.println("<script> alert('資料修改成功!!並已完成系統歸還或加贈紅利點數 "+add_bonus+" 點'); backdata.submit(); </script>");
		else out.println("<script> alert('資料修改成功!!'); backdata.submit(); </script>");
	}
}catch(Exception e){
	System.out.println("Error info:["+e+"]File name edit.jsp for ["+code+"]Time:["+DateTimeTool.dateTimeString()+"]");
	out.println("<script> alert('處理失敗'); history.back(); </script>");
}finally{app_sm.close();}
%>