<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.genesis.utils.StringTool"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%
  String page_code = "search";
  String keywords = StringTool.validString(request.getParameter("search"));
  //System.out.println("k:"+keywords);
  String[] keyword = keywords.split(" ");
  Vector<TableRecord> searchList = new Vector<>();
  Vector<String> codeList = new Vector<>();
  
  
 
//新訊報報模組
  StringBuffer sb = new StringBuffer();
  Vector<String> keys = new Vector<>();
  sb.append("np_code=? and np_lang=? and np_createdate<=? and np_emitdate>=?");
  keys.add("news");
  keys.add(lang);
  keys.add(app_today);
  keys.add(app_today);

  sb.append("and (");
  sb.append("np_title like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=1;i<keyword.length;i++) {
	  sb.append(" or np_title like ?");
	  keys.add("%"+keyword[i]+"%");
  }

  sb.append(" or np_content like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=1;i<keyword.length;i++) {
	  sb.append(" or np_content like ?");
	  keys.add("%"+keyword[i]+"%");
  }

  sb.append(" or np_keywords like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=1;i<keyword.length;i++) {
	  sb.append(" or np_keywords like ?");
	  keys.add("%"+keyword[i]+"%");
  }

  sb.append(" or np_description like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=1;i<keyword.length;i++) {
	  sb.append(" or np_description like ?");
	  keys.add("%"+keyword[i]+"%");
  }
  sb.append(")");

  Vector<TableRecord> nps = app_sm.selectAll(tblnp,sb.toString(),keys.toArray(),"np_emitdate DESC,np_createdate DESC");
  if(nps.size()>0){
	  searchList.addAll(nps);
	  for(int i=0;i<nps.size();i++){
		  codeList.add("news");
	  }
  }
  
//常設展模組
  sb = new StringBuffer();
  keys = new Vector<String>();
  sb.append("cp_code=? and cp_lang=?");
  keys.add("career_exploration_content");
  keys.add(lang);
  
  sb.append(" and (");
  sb.append("cp_title like?");
  keys.add("%"+keyword[0]+"%");
  for(int i=1;i<keyword.length;i++) {
	  sb.append(" or cp_title like?");
	  keys.add(keyword[i]);
  }
  
  sb.append(" or cp_content like?");
  keys.add("%"+keyword[0]+"%");
  for(int i=1;i<keyword.length;i++) {
	  sb.append(" or cp_content like?");
	  keys.add(keyword[i]);
  }
  
  sb.append("or cp_content2 like?");
  keys.add("%"+keyword[0]+"%");
  for(int i=1;i<keyword.length;i++) {
	  sb.append(" or cp_content2 like?");
	  keys.add(keyword[i]);
  }
   
  sb.append("or cp_content3 like?");
  keys.add("%"+keyword[0]+"%");
  for(int i=1;i<keyword.length;i++) {
	  sb.append(" or cp_content3 like?");
	  keys.add(keyword[i]);
  }
  
  sb.append("or cp_content4 like?");
  keys.add("%"+keyword[0]+"%");
  for(int i=1;i<keyword.length;i++) {
	  sb.append(" or cp_content4 like?");
	  keys.add(keyword[i]);
  }
  
  sb.append("or cp_keywords like?");
  keys.add("%"+keyword[0]+"%");
  for(int i=1;i<keyword.length;i++) {
	  sb.append(" or cp_keywords like?");
	  keys.add(keyword[i]);
  }
  
  sb.append("or cp_description like?");
  keys.add("%"+keyword[0]+"%");
  for(int i=1;i<keyword.length;i++) {
	  sb.append(" or cp_description like?");
	  keys.add(keyword[i]);
  }
  sb.append(")");
  Vector<TableRecord> cps = app_sm.selectAll(tblcp,sb.toString(),keys.toArray(),"cp_showseq DESC,cp_createdate DESC");
  if(cps.size()>0) {
	  searchList.addAll(cps);
	  for(int i=0;i<cps.size();i++) {
		  codeList.add("career_exploration_content");
	  }
  }
  
//展場活動模組
  sb = new StringBuffer();
  keys = new Vector<String>();
  sb.append("cp_code=? and cp_lang=?");
  keys.add("activity");
  keys.add(lang);
  
  sb.append(" and(");
  sb.append("cp_title like ?");
  keys.add(keyword[0]);
  for(int i=1;i<keyword.length;i++) {
	  sb.append("or cp_title like ?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append("or cp_content like ?");
  keys.add(keyword[0]);
  for(int i=1;i<keyword.length;i++) {
	  sb.append("or cp_content like ?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append("or cp_keywords like ?");
  keys.add(keyword[0]);
  for(int i=1;i<keyword.length;i++) {
	  sb.append("or cp_keywords like ?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append("or cp_description like ?");
  keys.add(keyword[0]);
  for(int i=1;i<keyword.length;i++) {
	  sb.append("or cp_description like ?");
	  keys.add("%"+keyword[i]+"%");
  }
  sb.append(")");
  cps = app_sm.selectAll(tblcp,sb.toString(),keys.toArray(),"cp_showseq DESC,cp_createdate DESC");
  if(cps.size() > 0) {
	  searchList.addAll(cps);
	  for(int i=0;i<cps.size();i++) {
		  codeList.add("actvity");
	  }
  }
  
  //認識技職內文1
  sb = new StringBuffer();
  keys = new Vector<>();
  
  sb.append("cp_code=? and cp_lang=?");
  keys.add("learn1");
  keys.add(lang);
  
  sb.append(" and(");
  sb.append("cp_title like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_title like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_content like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_content like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_keywords like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_keywords like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_description like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_description like?");
	  keys.add("%"+keyword[i]+"%");
  }
  sb.append(")");
  
  cps = app_sm.selectAll(tblcp,sb.toString(),keys.toArray(),"cp_showseq DESC,cp_createdate ASC");
  if(cps.size()>0){
	  searchList.addAll(cps);
	  for(int i =0;i<cps.size();i++) {
		  codeList.add("learn1");
	  }
  }
  
//認識技職內文2
  sb = new StringBuffer();
  keys = new Vector<>();
  
  sb.append("cp_code=? and cp_lang=?");
  keys.add("learn2");
  keys.add(lang);
  
  sb.append(" and(");
  sb.append("cp_title like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_title like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_content like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_content like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_keywords like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_keywords like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_description like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_description like?");
	  keys.add("%"+keyword[i]+"%");
  }
  sb.append(")");
  
  cps = app_sm.selectAll(tblcp,sb.toString(),keys.toArray(),"cp_showseq DESC,cp_createdate ASC");
  if(cps.size()>0){
	  searchList.addAll(cps);
	  for(int i =0;i<cps.size();i++) {
		  codeList.add("learn2");
	  }
  }
  
//認識技職內文3
  sb = new StringBuffer();
  keys = new Vector<>();
  
  sb.append("cp_code=? and cp_lang=?");
  keys.add("learn3");
  keys.add(lang);
  
  sb.append(" and(");
  sb.append("cp_title like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_title like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_content like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_content like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_keywords like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_keywords like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_description like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_description like?");
	  keys.add("%"+keyword[i]+"%");
  }
  sb.append(")");
  
  cps = app_sm.selectAll(tblcp,sb.toString(),keys.toArray(),"cp_showseq DESC,cp_createdate ASC");
  if(cps.size()>0){
	  searchList.addAll(cps);
	  for(int i =0;i<cps.size();i++) {
		  codeList.add("learn3");
	  }
  }
  
//技術型高中模組
  sb = new StringBuffer();
  keys = new Vector<>();
  
  sb.append("cp_code=? and cp_lang=?");
  keys.add("highschool");
  keys.add(lang);
  
  sb.append(" and(");
  sb.append("cp_title like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_title like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_content like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_content like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_keywords like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_keywords like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_description like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_description like?");
	  keys.add("%"+keyword[i]+"%");
  }
  sb.append(")");
  
  cps = app_sm.selectAll(tblcp,sb.toString(),keys.toArray(),"cp_showseq DESC,cp_createdate ASC");
  if(cps.size()>0){
	  searchList.addAll(cps);
	  for(int i =0;i<cps.size();i++) {
		  codeList.add("highschool");
	  }
  }

//升學五專模組
  sb = new StringBuffer();
  keys = new Vector<>();
  
  sb.append("cp_code=? and cp_lang=?");
  keys.add("five_yearcollege");
  keys.add(lang);
  
  sb.append(" and(");
  sb.append("cp_title like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_title like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_content like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_content like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_keywords like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_keywords like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_description like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_description like?");
	  keys.add("%"+keyword[i]+"%");
  }
  sb.append(")");
  
  cps = app_sm.selectAll(tblcp,sb.toString(),keys.toArray(),"cp_showseq DESC,cp_createdate ASC");
  if(cps.size()>0){
	  searchList.addAll(cps);
	  for(int i =0;i<cps.size();i++) {
		  codeList.add("five_yearcollege");
	  }
  }

//四技二專模組
  sb = new StringBuffer();
  keys = new Vector<>();
  
  sb.append("cp_code=? and cp_lang=?");
  keys.add("university");
  keys.add(lang);
  
  sb.append(" and(");
  sb.append("cp_title like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_title like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_content like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_content like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_keywords like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_keywords like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_description like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_description like?");
	  keys.add("%"+keyword[i]+"%");
  }
  sb.append(")");
  
  cps = app_sm.selectAll(tblcp,sb.toString(),keys.toArray(),"cp_showseq DESC,cp_createdate ASC");
  if(cps.size()>0){
	  searchList.addAll(cps);
	  for(int i =0;i<cps.size();i++) {
		  codeList.add("university");
	  }
  }
  
//技職好文模組
  sb = new StringBuffer();
  keys = new Vector<>();
  
  sb.append("cp_code=? and cp_lang=?");
  keys.add("article");
  keys.add(lang);
  
  sb.append(" and(");
  sb.append("cp_title like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_title like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_content like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_content like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_keywords like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_keywords like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_description like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_description like?");
	  keys.add("%"+keyword[i]+"%");
  }
  sb.append(")");
  
  cps = app_sm.selectAll(tblcp,sb.toString(),keys.toArray(),"cp_showseq DESC,cp_createdate ASC");
  if(cps.size()>0){
	  searchList.addAll(cps);
	  for(int i =0;i<cps.size();i++) {
		  codeList.add("article");
	  }
  }
  
//技職有影模組
  sb = new StringBuffer();
  keys = new Vector<>();
  
  sb.append("cp_code=? and cp_lang=?");
  keys.add("video");
  keys.add(lang);
  
  sb.append(" and(");
  sb.append("cp_title like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_title like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_content like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_content like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_keywords like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_keywords like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_description like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_description like?");
	  keys.add("%"+keyword[i]+"%");
  }
  sb.append(")");
  
  cps = app_sm.selectAll(tblcp,sb.toString(),keys.toArray(),"cp_showseq DESC,cp_createdate ASC");
  if(cps.size()>0){
	  searchList.addAll(cps);
	  for(int i =0;i<cps.size();i++) {
		  codeList.add("video");
	  }
  }
  
//實作環境模組
  sb = new StringBuffer();
  keys = new Vector<>();
  
  sb.append("cp_code=? and cp_lang=?");
  keys.add("implement");
  keys.add(lang);
  
  sb.append(" and(");
  sb.append("cp_title like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_title like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_content like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_content like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_keywords like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_keywords like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_description like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_description like?");
	  keys.add("%"+keyword[i]+"%");
  }
  sb.append(")");
  
  cps = app_sm.selectAll(tblcp,sb.toString(),keys.toArray(),"cp_showseq ASC,cp_createdate DESC");
  if(cps.size()>0){
	  searchList.addAll(cps);
	  for(int i =0;i<cps.size();i++) {
		  codeList.add("implement");
	  }
  }
  
//技職教育好夥伴模組
  sb = new StringBuffer();
  keys = new Vector<>();
  
  sb.append("cp_code=? and cp_lang=?");
  keys.add("technical");
  keys.add(lang);
  
  sb.append(" and(");
  sb.append("cp_title like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_title like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_content like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_content like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_keywords like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_keywords like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_description like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_description like?");
	  keys.add("%"+keyword[i]+"%");
  }
  sb.append(")");
  
  cps = app_sm.selectAll(tblcp,sb.toString(),keys.toArray(),"cp_showseq ASC,cp_createdate DESC");
  if(cps.size()>0){
	  searchList.addAll(cps);
	  for(int i =0;i<cps.size();i++) {
		  codeList.add("technical");
	  }
  }
  
//聯絡我們模組
  sb = new StringBuffer();
  keys = new Vector<>();
  
  sb.append("cp_code=? and cp_lang=?");
  keys.add("contact_info");
  keys.add(lang);
  
  sb.append(" and(");
  sb.append("cp_title like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_title like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_content like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_content like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_keywords like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_keywords like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_description like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_description like?");
	  keys.add("%"+keyword[i]+"%");
  }
  sb.append(")");
  
  cps = app_sm.selectAll(tblcp,sb.toString(),keys.toArray(),"cp_showseq DESC,cp_createdate ASC");
  if(cps.size()>0){
	  searchList.addAll(cps);
	  for(int i =0;i<cps.size();i++) {
		  codeList.add("contact_info");
	  }
  }
  
  //安全政策
  
  sb = new StringBuffer();
  keys = new Vector<>();
  
  sb.append("cp_code=? and cp_lang=?");
  keys.add("policy");
  keys.add(lang);
  
  sb.append(" and(");
  sb.append("cp_title like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_title like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_content like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_content like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_keywords like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_keywords like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_description like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_description like?");
	  keys.add("%"+keyword[i]+"%");
  }
  sb.append(")");
  
  cps = app_sm.selectAll(tblcp,sb.toString(),keys.toArray(),"cp_showseq DESC,cp_createdate ASC");
  if(cps.size()>0){
	  searchList.addAll(cps);
	  for(int i =0;i<cps.size();i++) {
		  codeList.add("policy");
	  }
  }
  
//隱私政策模組
  sb = new StringBuffer();
  keys = new Vector<>();
  
  sb.append("cp_code=? and cp_lang=?");
  keys.add("privacy");
  keys.add(lang);
  
  sb.append(" and(");
  sb.append("cp_title like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_title like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_content like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_content like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_keywords like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_keywords like?");
	  keys.add("%"+keyword[i]+"%");
  }
  
  sb.append(" or cp_description like ?");
  keys.add("%"+keyword[0]+"%");
  for(int i=0;i<keyword.length;i++) {
	  sb.append(" or cp_description like?");
	  keys.add("%"+keyword[i]+"%");
  }
  sb.append(")");
  
  cps = app_sm.selectAll(tblcp,sb.toString(),keys.toArray(),"cp_showseq DESC,cp_createdate ASC");
  if(cps.size()>0){
	  searchList.addAll(cps);
	  for(int i =0;i<cps.size();i++) {
		  codeList.add("privacy");
	  }
  }
  
  int page_items = 10;    												// 預設列表分頁筆數設定
	
  // 設定資料分頁每頁筆數
  String pageSet = SiteSetup.getSetup("ss."+page_code+".pageno").getString("ss_value");
  if(!"0".equals(pageSet)) {
      page_items = (!"".equals(pageSet))?Integer.valueOf(pageSet):page_items;
	  app_dp = new DataPager(searchList, page_items);
	  searchList = app_dp.getPageContent(pageno);
  }
%>
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/in.dwt" codeOutsideHTMLIsLocked="false" -->
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge"/><!--讓ie在切換瀏覽器模式時 文件模式會使用最新的版本-->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />



<!--RWD用-->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--RWD用-->

<!--android 手機板主題顏色用 更改網址列顏色-->
<meta name="theme-color" content="#0088d2">
<!--android 手機板主題顏色用-->

<meta name="format-detection" content="telephone=no"><!--取消行動版 safari 自動偵測數字成電話號碼-->

<title><%=app_webtitle %></title>

<link rel="shortcut icon" href="../images/favicon.png" /><!--電腦版icon-->
<link rel="apple-touch-icon" href="../images/icon.png" /><!--手機版icon  57x57px-->
<link rel="apple-touch-icon" sizes="72x72" href="../images/icon-72.png" /><!--手機版icon  72x72px-->
<link rel="apple-touch-icon" sizes="114x114" href="../images/icon%402.png" /><!--手機版icon  114x114px-->

<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/style_header.css"/>
<link rel="stylesheet" type="text/css" href="../css/style_footer.css"/>




<!--google material icon-->
<link rel="stylesheet" href="../icon_fonts/material_icons/material-icons.css">

<!-- 新增 版本更新jQuery modify by Judy 20230113 start -->
<!-- jQuery版本3.6.3 -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" type="text/javascript"></script>
<!-- <script src="../js/jquery/jquery-3.6.3.min.js" type="text/javascript"></script> -->  <!-- 為了弱掃留原始檔案 -->

<!-- jQuery 遷移插件_簡化從舊版本jQuery的轉換3.4.0-->
<script src="https://code.jquery.com/jquery-migrate-3.4.0.min.js" type="text/javascript"></script>
<!-- <script src="../js/jquery/jquery-migrate-3.4.0.min.js" type="text/javascript"></script> -->  <!-- 為了弱掃留原始檔案 -->
<!-- 新增 版本更新jQuery modify by Judy 20230113 end -->

<script src="../js/common.js" type="text/javascript"></script><!--JavaScript共用區-->

<!--漣漪效果 第一塊 start-->
<!-- <link href="web/js/ripples/ripples.css" rel="stylesheet" type="text/css" />
<script src="web/js/ripples/material.js" type="text/javascript"></script>
<script src="web/js/ripples/ripples.min.js" type="text/javascript"></script> -->
<!--漣漪效果 第一塊 end-->
	
    
<!--新增修改banner套件 modify by pekey 20190625 start-->    
<!--輪播特效 第一塊 開始-->
<!-- <link rel="stylesheet" type="text/css" href="web/js/swiper-master/css/swiper.css"/> -->
<!--輪播特效 第一塊 結束-->
<!--新增修改banner套件 modify by pekey 20190625 end-->

<!-- Link Swiper's CSS_Swiper 8.0.6 -->
<link rel="stylesheet" href="../js/swiper-master/css/swiper-bundle.min.css" />


<!--當卷軸到一定高度時，物件才會出現-->    	
<script type="text/javascript" src="../js/wow/wow.min.js"></script>
<link rel="stylesheet" type="text/css" href="../js/animate/animate.css"/>
<script type="text/javascript" src="../js/wow/wow_example.js"></script>

    

<!-- Noto Sans Traditional Chinese字型 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">


<!--每滑到該區域重複執行-->   
<link rel="stylesheet" type="text/css" href="../js/aos/aos.css"/>   

<!-- bootstrap-icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">

<!--loading畫面-->
<script>
	$(window).load(function(){
			$('#loading').hide();
	});
</script>  



<!-- Link Swiper's CSS -->
<link
    rel="stylesheet"
    href="https://unpkg.com/swiper/swiper-bundle.min.css"
/>

<!-- load Progress 進度條 -->
<link rel="stylesheet" type="text/css" href="../js/loading_bar/loading-bar.css"/>
<script type="text/javascript" src="../js/loading_bar/loading-bar.js"></script>

<%@include file="/WEB-INF/jspf/mis/pagerscript.jspf"%>

<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>

<body>
  <%@include file="../../web/include/top_menu.jsp" %>
    <!--main-->
    <div class="main inmain">

        <!-- 首頁banner區 -->
       <%@include file="../../web/include/top_banner.jsp" %>

<!-- ================================= -->
<!-- InstanceBeginEditable name="pageContent" -->

        <div class="pageContent">

            <div class="pageContent_icon">

                <!-- 內頁太空人icon -->
                <div class="inmainAstronaut_icon">
                    <img src="../images/astronaut_icon.svg" alt="">
                </div>

                <!-- 內頁星球icon -->
                <div class="inmainRocket_icon">
                    <img src="../images/planet_icon3.png" alt="">
                </div>

            </div>
            <div id="searchId"></div>
            <div class="wrap">
                
                <!--內頁標題樣式1--><!--無左側標題 -->
                <div class="titStyle1 style1_noleft">
                    <h2>搜尋結果</h2>
                </div>

                <!-- 左右側 -->
                <div class="container">

                    <!--右側-->
                    <div class="right noleft"> <!-- 右側_無左選單noleft -->

                        <!--內頁標題樣式2-->
                        <!-- <div class="titStyle2">
                            <h2>搜尋結果</h2>
                        </div> -->

                        <div class="containerIn">
                          <div class="searchArea">
                            <ul>
                            <%
                            String serverName = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
                    		if (request.getServerPort() == 80) {
                    			serverName = request.getScheme() + "://" + request.getServerName();
                    		}
                    		int counter = 0;
                    	if(searchList.size()>0) {	
                    		for(TableRecord data:searchList){
                    			String dataCode = codeList.get(counter++),
									   dbName = "",
									   url = serverName + request.getContextPath(),
									   title = "",
									   desc = "";
                    			if("news".equals(dataCode)) {
                    				dbName = "np";
                    				url += "/web/news/news_in.jsp?np_id="+data.getString(dbName+"_id");
                    				title = data.getString(dbName+"_title");
                    			}else if("career_exploration_content".equals(dataCode)){
                    				dbName="cp";
                    				url += "/web/career_exploration/career_exploration.jsp?dm_id="+data.getString("cp_category");
                    			    title = data.getString("cp_title");
                    			}else if("activity".equals(dataCode)) {
                    				url += "/web/activity/activity_in.jsp?cp_id="+data.getString("cp_id");
                    				title = data.getString("cp_title");
                    			}else if("learn1".equals(dataCode) || "learn2".equals(dataCode) || "learn3".equals(dataCode)) {
                    				url += "/web/learn/learn.jsp";
                    				title = "認識技職教育";
                    			}else if("highschool".equals(dataCode)) {
                    				url += "/web/learn/highschool.jsp?cp_id="+data.getString("cp_id");
                    				title = data.getString("cp_title");
                    			}else if("five_yearcollege".equals(dataCode)) {
                    				url += "/web/learn/five_yearcollege.jsp";
                    				title = "升學五專";
                    			}else if("university".equals(dataCode)) {
                    				url += "/web/learn/university.jsp?cp_id="+data.getString("cp_id");
                    			    title = data.getString("cp_title");
                    			}else if("article".equals(dataCode)) {
                    				url += "/web/learn/article_in.jsp?cp_id="+data.getString("cp_id");
                    				title = data.getString("cp_title");
                    			}else if("video".equals(dataCode)) {
                    				url += "/web/learn/video.jsp";
                    				title = "技職有影";
                    			}else if("implement".equals(dataCode)) {
                    				url += "/web/implement/implement.jsp?cp_id="+data.getString("cp_id");
                    			    title = data.getString("cp_title");
                    			}else if("technical".equals(dataCode)) {
                    				url += "/web/technical/technical.jsp?cp_id="+data.getString("cp_id");
                    				title = data.getString("cp_title");
                    			}else if("contact_info".equals(dataCode)) {
                    				url += "/web/contact/contact.jsp";
                    				title = "聯絡資訊";
                    			}else if("policy".equals(dataCode)) {
                    				url += "/web/policy/policy.jsp";
                    				title = "網站安全政策";
                    			}else if("privacy".equals(dataCode)) {
                    				url += "/web/policy/privacy.jsp";
                    				title = "隱私權政策";
                    			}
                    		
                            %>
                               <li>
                                 <a href="<%=url%>">
                                   <h3><%=title %></h3>
                                   <h4><%=url %></h4>
                                 </a>
                              </li>
                           <%} %>
                         <%} else{%>
                              <li>
                                 <a >
                                   <h3>查無搜尋結果</h3>
                                   
                                 </a>
                              </li>
                         <%} %>
                             </ul>
                           </div>
                           
                            <div class="number_pageArea">
                                <!--分頁區塊-->
                                <%-- 分頁 --%>
								<%if(!"".equals(pageSet) && !"0".equals(pageSet)) { %>
								<%@include file="/WEB-INF/jspf/web/rwd_pager.jspf"%>
								<form name="pageform" id="pageform" method="post" action="<%=request.getRequestURI() %>">
									<input type="hidden" name="npage" id="npage" value="<%=pageno%>" />
									<input type="hidden" name="_qsearch" value="<%=keywords %>" />
								</form>
								<%} %>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>

        </div>

        </div>
     
<!-- InstanceEndEditable -->   
     
<!-- ================================= -->

	</div>
    
    
    
    <!--footer-->
	<%@include file="../../web/include/copyright.jsp" %>
</body>
<!-- InstanceEnd --></html>
