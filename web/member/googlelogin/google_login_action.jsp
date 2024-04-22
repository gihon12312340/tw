<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.*"%>
<%@page import=" javax.*"%>
<%@page import="org.json.*"%>
<%@ page import="org.apache.commons.logging.Log" %>
<%@ page import="org.apache.commons.logging.LogFactory" %>
<%@ include file="/WEB-INF/jspf/config.jspf"%>
<%  
    
	//返回網址
	String location_href=StringTool.validString((String)session.getAttribute("location_href"));
    String backURL = "";
    if("apply".equals((String)session.getAttribute("page_code"))){
    	backURL = request.getScheme()+"://"+request.getServerName()+":"+request.getLocalPort()+request.getContextPath()+"/web/member/apply.jsp";
    }else if("order_list".equals((String)session.getAttribute("page_code"))) {
    	backURL = request.getScheme()+"://"+request.getServerName()+":"+request.getLocalPort()+request.getContextPath()+"/web/member/order_list.jsp";
    }else if("game_in".equals((String)session.getAttribute("page_code"))){
    	backURL = request.getScheme()+"://"+request.getServerName()+":"+request.getLocalPort()+request.getContextPath()+"/web/game/game_in.jsp?game_id=maker_lion";
    }else{
        backURL = (String)session.getAttribute("backURL");
    }
	
    URL urlObtainToken =  new URL("https://accounts.google.com/o/oauth2/token");
	HttpURLConnection connectionObtainToken =  (HttpURLConnection) urlObtainToken.openConnection();
	// 設定此connection使用POST
	connectionObtainToken.setRequestMethod("POST");
	connectionObtainToken.setDoOutput(true);
	// 開始傳送參數 
	OutputStreamWriter writer  = new OutputStreamWriter(connectionObtainToken.getOutputStream());
	writer.write("code="+request.getParameter("code")+"&");   								// 取得Google回傳的參數code
	writer.write("client_id="+SiteSetup.getText("cp.google_appid.tw")+"&");   				// 這裡請將xxxx替換成自己的client_id
	writer.write("client_secret="+SiteSetup.getText("google.api.client_secret.tw")+"&");   	// 這裡請將xxxx替換成自己的client_serect
	writer.write("redirect_uri="+SiteSetup.getText("google.api.redirect_uri.tw")+"&");   	// 這裡請將xxxx替換成自己的redirect_uri
	writer.write("grant_type=authorization_code");  
	writer.close();
	connectionObtainToken.connect();
	/*
	System.out.println("code"+request.getParameter("code"));
	System.out.println("client_id"+SiteSetup.getText("cp.google_appid.tw"));
	System.out.println("client_secret"+SiteSetup.getText("google.api.client_secret.tw"));
	System.out.println("redirect_uri"+SiteSetup.getText("google.api.redirect_uri.tw"));
	
	System.out.println("google token connection="+connectionObtainToken.getResponseCode()); 
	System.out.println("google token connection message="+connectionObtainToken.getResponseMessage());
	*/
	// 如果認證成功
	if(connectionObtainToken.getResponseCode() != HttpURLConnection.HTTP_OK){
		System.out.println("token 過期"); 
		out.println("<script>alert('請重新登入')</script>");
		//out.println("<script>location.href='../sign_in.jsp'</script>");
		out.println("<script>location.href='../../../home.jsp'</script>");
		return;
	}
	StringBuilder sbLines   = new StringBuilder("");
	// 取得Google回傳的資料(JSON格式)
	BufferedReader reader =new BufferedReader(new InputStreamReader(connectionObtainToken.getInputStream(),"utf-8"));
	String strLine = "";
	while((strLine=reader.readLine())!=null){
		sbLines.append(strLine);
	}
	// 把上面取回來的資料，放進JSONObject中，以方便我們直接存取到想要的參數
	JSONObject jo= new JSONObject(sbLines.toString());
	// 印出Google回傳的access token
	//System.out.println("connectionObtainToken trturn json="+jo.toString()); 
	//System.out.println("access_token="+jo.getString("access_token")); 
	URL urUserInfo =new URL("https://www.googleapis.com/oauth2/v1/userinfo?access_token="+jo.getString("access_token")); 
	//URL urUserInfo =new URL("https://www.googleapis.com/oauth2/v1/plus.login?access_token="+jo.getString("access_token")); 
	HttpURLConnection connObtainUserInfo =  (HttpURLConnection) urUserInfo.openConnection();
	//如果認證成功
	String strLine1 = "";
	BufferedReader reader1 =new BufferedReader(new InputStreamReader(connObtainUserInfo.getInputStream(),"utf-8"));
	StringBuilder sbLines1   = new StringBuilder("");
	if (connObtainUserInfo.getResponseCode() != HttpURLConnection.HTTP_OK){
		System.out.println("連接不到google api 以致無法請求個資"); 
		out.println("<script>alert('請重新登入')</script>");	
		//out.println("<script>location.href='../web/member/sign_in.jsp'</script>");
		out.println("<script>location.href='../../../home.jsp'</script>");
		return;
	}
	// 取得Google回傳的資料(JSON格式)
	while((strLine1=reader1.readLine())!=null) {
		sbLines1.append(strLine1);
	}
	// 把上面取回來的資料，放進JSONObject中，以方便我們直接存取到想要的參數
	JSONObject jo1 = new JSONObject(sbLines1.toString());
	// 印出Google回傳的profile json
	//System.out.println("google個資json="+jo1.toString()); 
	//System.out.println("google個資email="+jo1.getString("email")); 
	/*google個資json=
	{
		"picture":"https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4292rsc6r5M/photo.jpg",
		"id":"1047790652393664179453",
		"email":"motorjack01@gmail.com",
		"locale":"zh-TW",
		"link":"https://plus.google.com/1047790652393664179453",
		"name":"姓名",
		"gender":"male",
		"family_name":"姓",
		"given_name":"名",
		"verified_email":true
	}
	*/
	//String picture=jo1.getString("picture");
	String id=jo1.getString("id");
	String email = ""; 
	//String locale=jo1.getString("locale");
	//String link=jo1.getString("link");
	//String gender=jo1.getString("gender");
	String name = "";
	//String family_name=jo1.getString("family_name");
	//String given_name=jo1.getString("given_name");
	if("".equals(jo1.getString("email"))) {
		out.println("<script>alert('抓取不到您的email，請回google做設定喔~')</script>");
		//out.println("<script>location.href='../web/member/sign_in.jsp'</script>");
		out.println("<script>location.href='../../../home.jsp'</script>");
		return;
	} else {
		email = jo1.getString("email");
	}
	if("".equals(jo1.getString("name"))) {
		out.println("<script>alert('抓取不到您的姓名，請回google做設定喔~')</script>");
		//out.println("<script>location.href='../web/member/sign_in.jsp'</script>");
		out.println("<script>location.href='../../../home.jsp'</script>");
		return;
	} else {
		name = jo1.getString("name");
	}
	//開始針對帳號做事
	// System.out.println("id-----"+id);
	// System.out.println("email-----"+email);
	// System.out.println("name-----"+name);
  
  // 2023-07-30 Zheng Min
  Log logger = LogFactory.getLog(this.getClass());
  URL edm = new URL("https://edm.mindnodeair.com/api/twmakers/records/google-login");
  HttpURLConnection connEdmLogging = (HttpURLConnection) edm.openConnection();
	connEdmLogging.setRequestMethod("PUT");
	connEdmLogging.setRequestProperty("User-Agent", "Mozilla/5.0");
  connEdmLogging.setRequestProperty("Content-Type", "application/json");
	connEdmLogging.setDoOutput(true);
	// 開始傳送參數 
	writer = new OutputStreamWriter(connEdmLogging.getOutputStream());
	//writer.write("{\"test\":\"test\"}");  
	writer.write(sbLines1.toString());  
	writer.close();
	connEdmLogging.connect();
	
	/*System.out.println("EDM connection status ="+connEdmLogging.getResponseCode()); 
	System.out.println("EDM connection message ="+connEdmLogging.getResponseMessage());*/
	if(connEdmLogging.getResponseCode() != HttpURLConnection.HTTP_OK){
    logger.error(connEdmLogging.getResponseMessage());
    BufferedReader resReader = new BufferedReader(new InputStreamReader(connEdmLogging.getErrorStream(),"utf-8"));
    while((strLine=resReader.readLine())!=null) {
      logger.error(strLine);
    }
    
		//System.out.println(connEdmLogging.getResponseMessage()); 
		//out.println(connEdmLogging.getResponseMessage());
		return;
	}
	
	Vector mps = app_sm.selectAll(tblmp,"mp_google_id=? AND mp_account=?",new Object[]{id,email});
	TableRecord mp = null;
	if(mps.size()>0) {
		mp = (TableRecord)mps.get(0);
		
		if("Y".equals(mp.getString("mp_status"))) {
			session.setAttribute("member", mp);
			session.setAttribute("uid",mp.getString("mp_account"));
			out.println("<script> alert('歡迎 "+mp.getString("mp_name")+" 您已成功使用google帳號登入 !!'); location.href='"+backURL+"';  </script>");
			return;
		} else {
			out.println("<script> alert('您的帳號遭到停權 故無法登入!'); location='../../../home.jsp';  </script>");
			return;
		}
		
	} else {
		//產出亂數英數字 沒有數字0 英文英文大寫I,O，小寫L
		String[] milecode = {
			"n","p","q","r","s","t","u","v","w",
		    "K","L","M","N","P","Q","R","S","T",
		    "A","B","C","D","E","F","G","H","J",
		    "1","2","3","4","5","6","7","8","9",
		    "d","e","f","g","h","i","j","k","m",
		    "U","V","W","X","Y","Z","a","b","c",    
		    "x","y","z"}; 
		String mp_password = "";
	    for(int j=0;j<16;j++) {
	    	mp_password += milecode[(int)(Math.random()*milecode.length)];
	    }
		// Names and values.
		TableRecord google_mp = new TableRecord(tblmp);
		google_mp.setValue("mp_google_id" , id);
		google_mp.setValue("mp_account"   , email);
		google_mp.setValue("mp_name"      , name);
		google_mp.setValue("mp_password"  , mp_password);
		google_mp.setValue("mp_status"    , "Y");
		google_mp.setValue("mp_mail_status"  , "Y");
		google_mp.setInsert("Web_User");
		
		app_sm.insert(google_mp);
		
		session.setAttribute("member" , google_mp);
		session.setAttribute("uid",google_mp.getString("mp_account"));
		
		out.println("<script> alert('歡迎 "+google_mp.getString("mp_name")+" 您已成功使用google帳號登入 !!'); history.back();  </script>");
		//out.println("<script> location='../member_sendmail_out.jsp?mp_id="+google_mp.getString("mp_id")+"';</script>");
		//out.println("<script> location='../member_sendmail.jsp?mp_id="+google_mp.getString("mp_id")+"';</script>");
		//out.println("<script> alert('歡迎 "+google_mp.getString("mp_name")+" 您已成功註冊並使用google帳號登入 !!'); location='../../../home.jsp?action=sc';  </script>");
		
		return;
	}
%>