<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%@page import="org.apache.poi.hssf.usermodel.*"%>
<%@page import="org.apache.poi.ss.usermodel.Font"%>
<%@page import="org.apache.poi.ss.usermodel.*"%>
<%@page import="org.apache.poi.hssf.util.*"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%
	/*
	// Login account.
	String xls_filename=(String)session.getAttribute("xls_filename");
	session.setAttribute("xls_filename",xls_filename);
	 */

	// 以利前端檢查時 , 了解正在進行檔案匯出的工作
	session.setAttribute("statistic_file", "start");

	// 基本參數
	String code = "statistic";				// 模組識別碼
	String qtitle = StringTool.validString(request.getParameter("_qtitle"));
	String vr_code = StringTool.validString(request.getParameter("vr_code"));
    //System.out.println("code : "+vr_code);
	//String qcategory = StringTool.validString(request.getParameter("_qcategory"));
    
	
	String[] names = new String[] { "npage", "_qtitle","vr_code" };
	String[] values = new String[] { String.valueOf(pageno), qtitle,vr_code };
	
	
	
    // Get records.
    StringBuffer sb = new StringBuffer();
    Vector keys = new Vector();
    //String vr_code 		= "statistic";
   
    sb.append("vr_code=? and ");
    keys.add(vr_code);
    sb.append("vr_title like? and vr_lang=?");
    //keys.add("%" + qcategory + "%");	
	keys.add("%" + qtitle + "%");	
    keys.add(lang);


Vector <TableRecord> vrs = app_sm.selectAll(tblvr, sb.toString(), keys.toArray() , "vr_createdate DESC");

	// 指定位置存相關資料
	int counter = 0;
	if (vrs == null || vrs.size() == 0) {
		out.write("<script>alert('查無資料可供匯出！');</script>");
		session.setAttribute("statistic_file", "no");
	} else {
		try {

			/*
			// 讀取 execl 範版
			HSSFWorkbook wb = new HSSFWorkbook(session.getServletContext().getResourceAsStream("/mis/basic/export/product_export.xls"));
			HSSFSheet sheet = wb.getSheetAt(0);
			 */

			//建立新Excel
			HSSFWorkbook wb = new HSSFWorkbook();
			HSSFSheet sheet = wb.createSheet("sheet 1");
			



			//字型設定
			Font font = wb.createFont();
			font.setFontName("新細明體"); 															//設定字體
			//font.setFontHeightInPoints((short) 14); 												//設定字體大小
			//font.setColor(HSSFColor.WHITE.index); 												//顏色
			//font.setBoldweight(Font.BOLDWEIGHT_BOLD);  											//粗體

			//設定儲存格格式 
			CellStyle styleRow1 = wb.createCellStyle();
			styleRow1.setAlignment(HSSFCellStyle.ALIGN_CENTER); 									//水平置中
			styleRow1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); 							//垂直置中
			//styleRow2.setFillForegroundColor(HSSFColor.BLUE.index);								//填滿顏色
			//styleRow2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			styleRow1.setFont(font);																//設定字體
			//styleRow1.setWrapText(true);  														//可以換行
			//sheet.setDefaultColumnWidth(20); 														//欄寬

			// 將資料內容寫入指定檔案	 
			String clientFileName = app_account + "_statistic_export.xls";
			//欄位名稱
			String[] fildnames = new String[] {
					
					"標題",
					"年度",
					"月份",
					"年齡",
					"性別",
					"團體參訪",
					"原/偏鄉",
					"活動辦理紀錄",
					"課程資訊及數據",
					"參與人數"
			};
			
			int total = 0;	
			
			for (int i = 0; i < vrs.size(); i++) {
//System.out.println(i);
				TableRecord vr = vrs.get(i);
				
				String 
				       vr_title,
				       vr_year,
				       vr_month,
				       vr_age,
				       vr_gender,
				       vr_group,
				       vr_town,
				       vr_record,
				       vr_info,
				       vr_people;
               			    
				       

				

			 	// 於每一行的位中放入資料
						//vr_category = app_sm.select(tbldm,vr.getString("vr_category")).getString("dm_title");
			 	        vr_title = vr.getString("vr_title");
			 	        vr_year = vr.getString("vr_year");
			 	        vr_month = vr.getString("vr_month");
			 	        vr_age = vr.getString("vr_age");
			 	        vr_gender = vr.getString("vr_gender");
			 	        vr_group = vr.getString("vr_group");
			 	        vr_town = vr.getString("vr_town");
			 	        vr_record = vr.getString("vr_record");
			 	        vr_info = vr.getString("vr_info");
			 	        vr_people = String.valueOf(vr.getInt("vr_people"));
			 	        
			 	        total += vr.getInt("vr_people"); 

				//匯出的欄位資料內容
				String[] export = { 
						//vr_category,
				        vr_title,
				        vr_year,
					    vr_month,
					    vr_age,
					    vr_gender,
					    vr_group,
					    vr_town,
					    vr_record,
					    vr_info,
					    vr_people
				};

				//先填入欄位名稱
				if (i == 0) {
					HSSFRow row = sheet.createRow(counter);
					for (int e = 0; e < fildnames.length; e++) {
						Cell cell = row.createCell(e);
						CellStyle styleRow2 = wb.createCellStyle();
						styleRow2.setAlignment(HSSFCellStyle.ALIGN_CENTER); 							//水平置中
						styleRow2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); 					//垂直置中
						//styleRow2.setFillForegroundColor(HSSFColor.BLUE.index);						//填滿顏色
						//styleRow2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
						Font font2 = wb.createFont();
						font2.setFontName("新細明體"); 													//設定字體
						font2.setFontHeightInPoints((short) 14); 										//設定字體大小
						//font2.setColor(HSSFColor.WHITE.index); 										//顏色
						//font2.setBoldweight(Font.BOLDWEIGHT_BOLD);  									//粗體
						styleRow2.setFont(font2); 														//設定字體
						cell.setCellStyle(styleRow2); 													//套用格式
						cell.setCellValue(fildnames[e]); 												//填入值
						sheet.autoSizeColumn(e); 														//自動調整欄位寬度
					}
				}

				// 新增一列空白列 開始放入資料
				counter++;
				HSSFRow row = sheet.createRow(counter);

				for (int e = 0; e < export.length; e++) {
					Cell cell = row.createCell(e);
					cell.setCellStyle(styleRow1);		//套用格式
					cell.setCellValue(export[e]);		//填入值
					sheet.autoSizeColumn(e);			//自動調整欄位寬度
				}
			}
			
			HSSFRow row = sheet.createRow(counter+2);
            
			Cell cell1 = row.createCell(0);
			cell1.setCellStyle(styleRow1);		//套用格式
			cell1.setCellValue("總人數");		//填入值
			sheet.autoSizeColumn(0);
			
			Cell cell2 = row.createCell(1);
			cell2.setCellStyle(styleRow1);		//套用格式
			cell2.setCellValue(total);		//填入值
			sheet.autoSizeColumn(0);			//自動調整欄位寬度

			// 無路徑-檔案目錄新增
			File outputFolder = new File(app_uploadpath+ "/root/report/");
			if (!outputFolder.exists()) {
				outputFolder.mkdir();
			}
			// 新增檔案 / 若存在則刪除同檔
			File outputFile = new File(outputFolder, clientFileName);
			if (outputFile.exists()) {
				outputFile.delete();
			}
			//輸出
			FileOutputStream fos = new FileOutputStream(outputFile);

			wb.write(fos);
			fos.flush();
			fos.close();

			// 以利前端檢查時 , 了解已完成檔案匯出的工作
			session.setAttribute("statistic_file", "end");
		} catch (Exception e) {
			out.write("<script>alert('匯出失敗！');</script>");
			session.setAttribute("statistic_file", "error");
			System.out.println(e.getMessage());
		}
	}
%>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>