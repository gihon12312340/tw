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
	session.setAttribute("chart_file", "start");

	// 基本參數
	String code = "chart";				// 模組識別碼
	//String qtitle = StringTool.validString(request.getParameter("_qtitle"));
	//String vr_code = StringTool.validString(request.getParameter("vr_code"));
    //System.out.println("code : "+vr_code);
	//String qcategory = StringTool.validString(request.getParameter("_qcategory"));
    
	/*
	String[] names = new String[] { "npage", "_qtitle","vr_code" };
	String[] values = new String[] { String.valueOf(pageno), qtitle,vr_code };
	"home_view","total_site","learn_view","highschool_view",
    "fiveyear_view","university_view","article_view","video_view",
     "news_view","career_view","activity_view","technical_view",
      "imp1_view","imp2_view","imp3_view",
      "imp2_1view","imp2_2view","imp2_3view",
      "contact_view",
      "total_play","login_play","anom_play",
      "shippingLogin","shippingAnom","shippingTotal",
      "aircraftLogin","aircraftAnom","aircraftTotal",
      "wisdomLogin","wisdomAnom","wisdomTotal",
      "paradiseLogin","paradiseAnom","paradiseTotal",
      "farmingLogin","farmingAnom","farmingTotal",
      "fishingLogin","fishingAnom","fishingTotal",
      "droneLogin","droneAnom","droneTotal",};
	*/
	String
	       imp1_view = StringTool.validString(request.getParameter("imp1_view")),
	       imp2_view = StringTool.validString(request.getParameter("imp2_view")),
	       imp3_view = StringTool.validString(request.getParameter("imp3_view")),
	       imp2_1view = StringTool.validString(request.getParameter("imp2_1view")),
	       imp2_2view = StringTool.validString(request.getParameter("imp2_2view")),
	       imp2_3view = StringTool.validString(request.getParameter("imp2_3view"));
	       code = StringTool.validString(request.getParameter("code"));

String[] exportNames = new String[2];
String[] exportValues = new String[2];
if("chart1".equals(code)) {
	exportNames = new String[]{"技職實作環境 科工館 瀏覽人次","報名參訪體驗資訊 科工館 瀏覽人次"};
    exportValues = new String[]{imp1_view,imp2_1view};
}else if("chart2".equals(code)) {
	exportNames = new String[]{"技職實作環境 國資圖 瀏覽人次","報名參訪體驗資訊 國資圖 瀏覽人次"};
    exportValues = new String[]{imp2_view,imp2_2view};
}else if("chart3".equals(code)) {
	exportNames = new String[]{"技職實作環境 科教館 瀏覽人次","報名參訪體驗資訊 科教館 瀏覽人次"};
    exportValues = new String[]{imp3_view,imp2_3view};
}
	       
Vector<String[]> data = new Vector<>();
data.add(exportNames);
data.add(exportValues);




	// 指定位置存相關資料
	int counter = 0;
	if (false) {
		out.write("<script>alert('查無資料可供匯出！');</script>");
		session.setAttribute("chart_file", "no");
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
			String clientFileName = app_account + "_chart_export.xls";
			
			for(String[] eachRow:data){
				String[] export = eachRow;
				
				counter++;
				HSSFRow row = sheet.createRow(counter);

				for (int e = 0; e < export.length; e++) {
					Cell cell = row.createCell(e);
					cell.setCellStyle(styleRow1);		//套用格式
					cell.setCellValue(export[e]);		//填入值
					sheet.autoSizeColumn(e);			//自動調整欄位寬度
				}
			}
			
			
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
			session.setAttribute("chart_file", "end");
		} catch (Exception e) {
			out.write("<script>alert('匯出失敗！');</script>");
			session.setAttribute("chart_file", "error");
			System.out.println(e.getMessage());
		}
	}
%>

<%@include file="/WEB-INF/jspf/connclose.jspf"%>