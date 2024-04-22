<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.List" %>
<%@ page import="org.json.*"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<% 
	/*
	Web Service 寫法 
	request.getParameter("auth_token") --- get Parameter value
	request.getHeader("key"); --- get Header value
	
	/*------------------------get request body ---------------------------------------
	BufferedReader body = request.getReader();
	
	String str, wholeStr = "";
	while((str = body.readLine()) != null){
	        wholeStr += str;
	}
	/*------------------------get request body ---------------------------------------*/

	JSONObject show_str = new JSONObject();
	String page_code = "receive";
	
	BufferedReader body = request.getReader();
	
	String str, wholeStr = "";
	while((str = body.readLine()) != null) {
		wholeStr += str;
	}
	//System.out.println("body : \r\n" + wholeStr);
	
	JSONObject parser = new JSONObject();
	
	try {
		parser = new JSONObject(wholeStr);
		String action = parser.optString("action");			// 目前遊戲進行階段(start:遊戲開始 result:遊玩結束)
		String uid	  = parser.optString("uid");			// 玩家帳號(沒有登入時為空值)

		/*-- 遊戲開始:紀錄玩家資訊及遊玩人數更新 --*/
		if("start".equals(action)) {
			if(!"".equals(uid)) {
				// 更新遊玩人數記錄(記名)
				String setHistory = IDTool.getUID("buildGame", DateTimeTool.dateString(""), 6);

				// 取得玩家資訊
				TableRecord mp = app_sm.select(tblmp, "mp_account=?", new Object[]{ uid });
				
				// 保存該玩家本次遊玩記錄
				TableRecord gs = new TableRecord(tblgs);
				gs.setValue("gs_no", "buildGame-"+setHistory);
				gs.setValue("gs_account", uid);
				gs.setValue("gs_name", mp.getString("mp_name"));
				gs.setValue("gs_build_score1", "-1");
				gs.setValue("gs_build_score2", "-1");
				gs.setValue("gs_lang", lang);
				gs.setValue("gs_code", "build");
				gs.setInsert("Web_User");
				app_sm.insert(gs);
			} else {
				// 更新遊玩人數記錄(匿名)
				String setHistory = IDTool.getUID("buildAnon", DateTimeTool.dateString(""), 6);

				// 保存本次遊玩記錄
				TableRecord gs = new TableRecord(tblgs);
				gs.setValue("gs_no", "buildAnon-"+setHistory);
				gs.setValue("gs_account", "未登入");
				gs.setValue("gs_name", "匿名玩家");
				gs.setValue("gs_build_score1", "-1");
				gs.setValue("gs_build_score2", "-1");
				gs.setValue("gs_lang", lang);
				gs.setValue("gs_code", "build");
				gs.setInsert("Web_User");
				app_sm.insert(gs);
			}
		/*-- 遊玩結束:修正玩家遊玩資訊及遊玩人數數據 --*/
		} else if("result".equals(action)) {
			String gs_build_score1 = parser.optString("building_score_1");		// 遊玩分數
			String gs_build_score2 = parser.optString("building_score_2");		// 無人機顏色
			//System.out.println("uid = " + uid + ", gs_drone_score = " + gs_drone_score + ", gs_drone_color = " + gs_drone_color);

			if(!"".equals(uid)) {
				/*-- 整理該名玩家於本遊戲中的記錄,記錄超過10筆時需將最舊記錄刪除 --*/
				Vector<TableRecord> gss = app_sm.selectAll(tblgs, "gs_code=? and gs_lang=? and gs_account=?"
						, new Object[]{ "build", lang, uid }, "gs_createdate ASC");
				if(gss.size() == 10) {
					app_sm.delete(gss.firstElement());
				}
				
				// 取得玩家資訊
				TableRecord mp = app_sm.select(tblmp, "mp_account=?", new Object[]{ uid });
				// 更新該玩家本次遊玩記錄(取最新一筆無記錄的資料出來更新)
				TableRecord gs = app_sm.select(tblgs, "gs_no like ? and gs_account=? and gs_build_score1=? and gs_build_score2=? and gs_code=? and gs_lang=?"
						, new Object[]{ "%buildGame%", uid, "-1", "-1", "build", lang }, "gs_createdate DESC");
				if(!"".equals(gs.getString("gs_id"))) {
					gs.setValue("gs_build_score1", gs_build_score1);
					gs.setValue("gs_build_score2", gs_build_score2);
					gs.setUpdate("Web_User");
					app_sm.update(gs);
				}
			} else {
				// 更新該玩家本次遊玩記錄(取最新一筆無記錄的資料出來更新)
				TableRecord gs = app_sm.select(tblgs, "gs_no like ? and gs_account=? and gs_build_score1=? and gs_build_score2=? and gs_code=? and gs_lang=?"
						, new Object[]{ "%buildAnon%", "未登入", "-1", "-1", "build", lang }, "gs_createdate DESC");
				if(!"".equals(gs.getString("gs_id"))) {
					gs.setValue("gs_build_score1", gs_build_score1);
					gs.setValue("gs_build_score2", gs_build_score2);
					gs.setUpdate("Web_User");
					app_sm.update(gs);
				}
			}
		}
	} catch (JSONException ex1) {
		show_str.put("code", 400);
		show_str.put("message", "傳入Json格式有誤");
		System.out.println("Project:" + projectName + ", Exception:" + ex1);
    }
	out.clear();
	out.print(show_str);
%>