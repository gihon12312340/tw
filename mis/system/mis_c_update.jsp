<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="<%=app_uploadpath+"/"%>" />
  
</jsp:useBean>
<%
// modify for johnny 2008.10.11
   MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
   //image radio's value
   String  imgradioValue1 = StringTool.validString(mrequest.getParameter("imgradio1"));
   String  imgradioValue2 = StringTool.validString(mrequest.getParameter("imgradio2"));
   String  imgradioValue3 = StringTool.validString(mrequest.getParameter("imgradio3"));
   String[] imageNames = new String[] { "ss_value1", "ss_value2", "ss_value3" };
   String[] radios = new String[] {imgradioValue1,imgradioValue2,imgradioValue3};
   String[] keywords = new String[] { "mis.logo.image", "mis.index.image", "mis.default.image" };
   
   TableRecord aa = null ;
   for(int i = 0; i < radios.length ; i++){	   
	   aa = app_sm.select(tblss,"ss_keyword = ?", new Object[]{keywords[i]});	   
       //如果選預設圖的話 , 就刪掉 ss_value 欄位
       if (radios[i].equals("ucpic")) {
    	   FileTool.deleteFile(app_uploadpath+"/" + aa.getString("ss_value"));
    	   aa.setValue("ss_value","");    	   
       } else if(radios[i].equals("useold")) {
    	   aa.setValue("ss_value",aa.getString("ss_value"));
       } else if(radios[i].equals("uppic")){
    	 //上傳圖片
    	      FileTool.deleteFile(app_uploadpath+"/" + aa.getString("ss_value"));
    	      Hashtable files = mrequest.getFiles();
    	      if (files != null && !files.isEmpty()) {    	          
    	              UploadFile file = (UploadFile) files.get(imageNames[i]);
    	              String fileName = file.getFileName();
    	             if (fileName != null) {
    	                 if (fileName.lastIndexOf(".") > -1) {
    	                     file.setFileName(IDTool.getUID("SS")+fileName.substring(fileName.lastIndexOf(".")));
    	                 } else {
    	                     file.setFileName(IDTool.getUID("SS"));
    	                 }
    	                  aa.setValue("ss_value", file.getFileName());
    	                  upBean.store(mrequest, imageNames[i]);
    	                }
    	            }
    	        }
       
       app_sm.update(aa);
       }
   
/* 原本寫法
   // Tiltes.
   String[] titles = new String[] { "後台抬頭圖", "後台代表圖", "後台預設圖" };
   // Keywords.
   String[] keywords = new String[] { "mis.logo.image", "mis.index.image", "mis.default.image" };
   // Parameters for FileUploader.
   String[] radioNames = new String[] { "imgradio1", "imgradio2", "imgradio3" };
   String[] imageNames = new String[] { "ss_value1", "ss_value2", "ss_value3" };
   // Upload preparation.
   FileUploader fur = new FileUploader(request, app_uploadpath);
   fur.setRadioNames(radioNames);
   fur.setImageNames(imageNames);
   String[] filenames = fur.upload(imageNames.length, "SS");
   for (int i = 0; i < radioNames.length; i++) {
       if (filenames[i].equals("")) {
           continue;
       }
       TableRecord ss = SiteSetup.getSetup(keywords[i]);
       // Delete original image.
       FileTool.deleteFile(app_uploadpath+"/"+ss.getString("ss_value"));
       ss.setUpdate(app_account);
       ss.setValue("ss_value", filenames[i]);
       app_sm.update(ss);
   }
*/   
   if (app_sm.success()) {
       out.println("<script> alert('資料修改成功!!'); location='mis_c.jsp'; </script>");
   } else {
       out.println("<script> alert(\""+app_sm.getMessage()+"\"); history.back(); </script>");
   }
   app_sm.close();
%>
