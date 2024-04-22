<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
<%

	//針對各語系設定欄位
	// Tiltes.
	String[] titles = new String[] { 
		"網站前台名稱", "索引", 
		"來訪週期", "關鍵字", "版權說明", "內容簡介", "追踪碼", 
		"3D實境館連結","Facebook社群連結",
		"指導單位", "承辦單位", "協辦單位", "協辦館所", "載入頁",
		"館場名稱1","館場名稱2","館場名稱3","館場名稱4","館場名稱5",
		"館場人數1","館場人數2","館場人數3","館場人數4","館場人數5"
	};
	
	// Keywords.
	String[] keywords = new String[] { 
		"web_title", "seo.robots",
		"seo.revisit_after", "seo.keywords", "seo.copyright", "seo.description", "seo.track",
		"cp.3Durl","cp.facebook",
		"cp.unit1", "cp.unit2", "cp.unit3", "cp.co-organizer", "ss.loading",
		"cp.place0","cp.place1","cp.place2","cp.place3","cp.place4",
		"cp.headcount0","cp.headcount1","cp.headcount2","cp.headcount3","cp.headcount4"
	};
	
	// Get records.
	Vector misimages = new Vector();
	for (int i = 0; i < titles.length; i++) {
		TableRecord ss = SiteSetup.getSetup(keywords[i] + "." + lang);
		ss.setUpdate(app_account);
		String value = StringTool.validString(request.getParameter(keywords[i]));
		ss.setValue("ss_text", value);
		ss.setUpdate(app_account);
		app_sm.update(ss);
	}
	
	//針對不分語系共通設定欄位
	// Tiltes.
	String[] titles_1 = new String[] { 
			"載入頁", "技職體驗-分頁設定", "六大類群主題資源區-資訊分享設定"
	};
	
	// Keywords.
	String[] keywords_1 = new String[] { 
			"ss.loading", "ss.experience.pageno", "ss.sixinfo.showno"
	};
	
	// Get records.
	Vector misimages_1 = new Vector();
	for (int i = 0; i < titles_1.length; i++) {
		TableRecord ss = SiteSetup.getSetup(keywords_1[i]);
		ss.setUpdate(app_account);
		String value = StringTool.validString(request.getParameter(keywords_1[i]));
		ss.setValue("ss_value", value);
		ss.setUpdate(app_account);
		app_sm.update(ss);
	}	
	
	
	
	if (app_sm.success()) {
		out.println("<script> alert('資料修改成功!!'); location='websetup_c.jsp'; </script>");
	} else {
		out.println("<script> alert(\"" + app_sm.getMessage()
				+ "\"); history.back(); </script>");
	}
%>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>