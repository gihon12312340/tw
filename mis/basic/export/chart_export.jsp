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
	
	
	String home_view = StringTool.validString(request.getParameter("home_view")),
	       total_site = StringTool.validString(request.getParameter("total_site")),
	       member_count = StringTool.validString(request.getParameter("member_count")),
	       apply_count = StringTool.validString(request.getParameter("apply_count")),
	       learn_view = StringTool.validString(request.getParameter("learn_view")),
	       highschool_view = StringTool.validString(request.getParameter("highschool_view")),
	       fiveyear_view = StringTool.validString(request.getParameter("fiveyear_view")),
	       university_view = StringTool.validString(request.getParameter("university_view")),
	       article_view = StringTool.validString(request.getParameter("article_view")),
	       video_view = StringTool.validString(request.getParameter("video_view")),
	       news_view = StringTool.validString(request.getParameter("news_view")),
	       career_view = StringTool.validString(request.getParameter("career_view")),
	       activity_view = StringTool.validString(request.getParameter("activity_view")),
	       technical_view = StringTool.validString(request.getParameter("technical_view")),
	      
	       imp1_view = StringTool.validString(request.getParameter("imp1_view")),
	       imp2_view = StringTool.validString(request.getParameter("imp2_view")),
	       imp3_view = StringTool.validString(request.getParameter("imp3_view")),
	       imp2_1view = StringTool.validString(request.getParameter("imp2_1view")),
	       imp2_2view = StringTool.validString(request.getParameter("imp2_2view")),
	       imp2_3view = StringTool.validString(request.getParameter("imp2_3view")),
	       contact_view = StringTool.validString(request.getParameter("contact_view")),
	       
	       total_play = StringTool.validString(request.getParameter("total_play")),
	       login_play = StringTool.validString(request.getParameter("login_play")),
	       anom_play = StringTool.validString(request.getParameter("anom_play")),
	       
	       forestLogin = StringTool.validString(request.getParameter("forestLogin")),
	       forestAnom = StringTool.validString(request.getParameter("forestAnom")),
	       forestTotal = StringTool.validString(request.getParameter("forestTotal")),
	       
	       brickLogin = StringTool.validString(request.getParameter("brickLogin")),
	       brickAnom = StringTool.validString(request.getParameter("brickAnom")),
	       brickTotal = StringTool.validString(request.getParameter("brickTotal")),
	       
	       flowerLogin = StringTool.validString(request.getParameter("flowerLogin")),
	       flowerAnom = StringTool.validString(request.getParameter("flowerAnom")),
	       flowerTotal = StringTool.validString(request.getParameter("flowerTotal")),
	       
	       buildLogin = StringTool.validString(request.getParameter("buildLogin")),
	       buildAnom = StringTool.validString(request.getParameter("buildAnom")),
	       buildTotal = StringTool.validString(request.getParameter("buildTotal")),
	       
	       shippingLogin = StringTool.validString(request.getParameter("shippingLogin")),
	       shippingAnom = StringTool.validString(request.getParameter("shippingAnom")),
	       shippingTotal = StringTool.validString(request.getParameter("shippingTotal")),
	      
	       aircraftLogin = StringTool.validString(request.getParameter("aircraftLogin")),
	       aircraftAnom = StringTool.validString(request.getParameter("aircraftAnom")),
	       aircraftTotal = StringTool.validString(request.getParameter("aircraftTotal")),
	       
	       wisdomLogin = StringTool.validString(request.getParameter("wisdomLogin")),
	       wisdomAnom = StringTool.validString(request.getParameter("wisdomAnom")),
	       wisdomTotal = StringTool.validString(request.getParameter("wisdomTotal")),
	      
	       dreamLogin = StringTool.validString(request.getParameter("dreamLogin")),
	       dreamAnom = StringTool.validString(request.getParameter("dreamAnom")),
	       dreamTotal = StringTool.validString(request.getParameter("dreamTotal")),
	       
	       paradiseLogin = StringTool.validString(request.getParameter("paradiseLogin")),
	       paradiseAnom = StringTool.validString(request.getParameter("paradiseAnom")),
	       paradiseTotal = StringTool.validString(request.getParameter("paradiseTotal")),
	       
	       farmingLogin = StringTool.validString(request.getParameter("farmingLogin")),
	       farmingAnom = StringTool.validString(request.getParameter("farmingAnom")),
	       farmingTotal = StringTool.validString(request.getParameter("farmingTotal")),
	       
	       fishingLogin = StringTool.validString(request.getParameter("fishingLogin")),
	       fishingAnom = StringTool.validString(request.getParameter("fishingAnom")),
	       fishingTotal = StringTool.validString(request.getParameter("fishingTotal")),
	       
	       droneLogin = StringTool.validString(request.getParameter("droneLogin")),
	       droneAnom = StringTool.validString(request.getParameter("droneAnom")),
	       droneTotal = StringTool.validString(request.getParameter("droneTotal"));
	

	
Vector<String[]> data = new Vector<>();

String[] siteTotalName = {"總瀏覽人次","總遊玩人次","記名遊玩人次","匿名遊玩人次"};
String[] siteTotalValue = {total_site,total_play,login_play,anom_play};	
data.add(siteTotalName);
data.add(siteTotalValue);

String[] memberName = {"會員人數","申請發文帳號人數"};
String[] memberValue = {member_count,apply_count};	
data.add(memberName);
data.add(memberValue);

String[] learnName = {"認識技職教育瀏覽人次","升學技高瀏覽人次","升學五專瀏覽人次","四技二專瀏覽人次","技職好文瀏覽人次","技職有影瀏覽人次"};
String[] learnValue = {learn_view,highschool_view,fiveyear_view,university_view,article_view,video_view};
data.add(learnName);
data.add(learnValue);

String[] forestName = {"神秘森林救援 總遊玩人次","神秘森林救援 記名遊玩人次","神秘森林救援 匿名遊玩人次"};
String[] forestValue = {forestTotal,forestLogin,forestAnom};
data.add(forestName);
data.add(forestValue);

String[] brickName = {"積木樂園 總遊玩人次","積木樂園 記名遊玩人次","積木樂園 匿名遊玩人次"};
String[] brickValue = {brickTotal,brickLogin,brickAnom};
data.add(brickName);
data.add(brickValue);

String[] flowerName = {"花草實驗室 總遊玩人次","花草實驗室 記名遊玩人次","花草實驗室 匿名遊玩人次"};
String[] flowerValue = {flowerTotal,flowerLogin,flowerAnom};
data.add(flowerName);
data.add(flowerValue);


String[] buildName = {"小建築大工程 總遊玩人次","小建築大工程 記名遊玩人次","小建築大工程 匿名遊玩人次"};
String[] buildValue = {buildTotal,buildLogin,buildAnom};
data.add(buildName);
data.add(buildValue);

String[] shippingName = {"誰是航運王 總遊玩人次","誰是航運王 記名遊玩人次","誰是航運王 匿名遊玩人次"};
String[] shippingValue = {shippingTotal,shippingLogin,shippingAnom};
data.add(shippingName);
data.add(shippingValue);

String[] aircraftName = {"超級飛修員 總遊玩人次","超級飛修員 記名遊玩人次","超級飛修員 匿名遊玩人次"};
String[] aircraftValue = {aircraftTotal,aircraftLogin,aircraftAnom};
data.add(aircraftName);
data.add(aircraftValue);

String[] wisdomName = {"智慧製造洗手乳 總遊玩人次","智慧製造洗手乳 記名遊玩人次","智慧製造洗手乳 匿名遊玩人次"};
String[] wisdomValue = {wisdomTotal,wisdomLogin,wisdomAnom};
data.add(wisdomName);
data.add(wisdomValue);

String[] dreamName = {"無人商店採購 總遊玩人次","無人商店採購 記名遊玩人次","無人商店採購 匿名遊玩人次"};
String[] dreamValue = {dreamTotal,dreamLogin,dreamAnom};
data.add(dreamName);
data.add(dreamValue);

String[] paradiseName = {"彩繪技職樂園 總遊玩人次","彩繪技職樂園 記名遊玩人次","彩繪技職樂園 匿名遊玩人次"};
String[] paradiseValue = {paradiseTotal,paradiseLogin,paradiseAnom};
data.add(paradiseName);
data.add(paradiseValue);

String[] farmingName = {"智能雞舍 總遊玩人次","智能雞舍 記名遊玩人次","智能雞舍 匿名遊玩人次"};
String[] farmingValue = {farmingTotal,farmingLogin,farmingAnom};
data.add(farmingName);
data.add(farmingValue);

String[] fishingName = {"漏網抓魚感測體驗 總遊玩人次","漏網抓魚感測體驗 記名遊玩人次","漏網抓魚感測體驗 匿名遊玩人次"};
String[] fishingValue = {fishingTotal,fishingLogin,fishingAnom};
data.add(fishingName);
data.add(fishingValue);

String[] droneName = {"農業小幫手 總遊玩人次","農業小幫手 記名遊玩人次","農業小幫手 匿名遊玩人次"};
String[] droneValue = {droneTotal,droneLogin,droneAnom};
data.add(droneName);
data.add(droneValue);

String[] imp1Name = {"技職實作環境","科工館 瀏覽人次","國資圖 瀏覽人次","科教館 瀏覽人次"};
String[] imp1Value = {"",imp1_view,imp2_view,imp2_view};
data.add(imp1Name);
data.add(imp1Value);

String[] imp2Name = {"報名參訪體驗資訊","科工館 瀏覽人次","國資圖 瀏覽人次","科教館 瀏覽人次"};
String[] imp2Value = {"",imp2_1view,imp2_2view,imp2_3view};
data.add(imp2Name);
data.add(imp2Value);


String[] othersName = {"新訊報報 瀏覽人次","職業試探常設展 瀏覽人次","展場活動 瀏覽人次","技職教育好夥伴 瀏覽人次","聯絡我們 瀏覽人次"};
String[] othersValue = {news_view,career_view,activity_view,technical_view,contact_view};
data.add(othersName);
data.add(othersValue);

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