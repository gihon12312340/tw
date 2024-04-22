<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="include/function.jsp"%>

<%
String code = "chart";
String show_title = "網站人流統計";
TableRecord na = app_sm.select(tblna,"na_code=? and na_lang=?",new Object[]{"count",lang});
TableRecord na1 = app_sm.select(tblna,"na_code=? and na_lang=?",new Object[]{"count1",lang});
TableRecord na2 = app_sm.select(tblna,"na_code=? and na_lang=?",new Object[]{"count2",lang});
TableRecord na3 = app_sm.select(tblna,"na_code=? and na_lang=?",new Object[]{"count3",lang});

int maxSearchDay = 90; 					// 搜尋天數上限設定(可查詢上限天數預設為90天 超過則強制設定截止日為起始日之90天後)
String startDay = StringTool.validString(request.getParameter("startDate"), "");	// 日期搜尋:起始日
String endDay = StringTool.validString(request.getParameter("endDate"), "");		// 日期搜尋:截止日

/*-- 搜尋日期區間設定 --*/
// 查詢區間修正(以起始日為基準，最多可查詢起始日(含)後90天之統計資料)
if(!"".equals(startDay) && !"".equals(endDay)) {
	// 取得截止日之上限日期
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
	String maxDay = startDay;
	Date dt = sdf.parse(maxDay);
	Calendar rightNow = Calendar.getInstance();
	rightNow.setTime(dt);
	rightNow.add(Calendar.DAY_OF_YEAR, maxSearchDay);			// 90天後之日期
	Date dt1 = rightNow.getTime();
	maxDay = sdf.format(dt1);
	// 日期比較
	Date max_Day = sdf.parse(maxDay);  							// 上限日期
	Date end_Day = sdf.parse(endDay);  							// 截止日期
	if(end_Day.before(max_Day) || end_Day.equals(max_Day)) {
		// 於可查詢之日期區間內
	} else {
		endDay = maxDay;
		out.println("<script>alert('可查詢日期區間最多為起始日期(含)的後"+maxSearchDay+"天，已調整查詢日期區間!!');</script>");
	}
}
// 預設日期
if("".equals(startDay)) {
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
	String dateStr = DateTimeTool.dateString();
	Date dt = sdf.parse(dateStr);
	Calendar rightNow = Calendar.getInstance();
	rightNow.setTime(dt);
	rightNow.add(Calendar.DAY_OF_YEAR, ((maxSearchDay - 60) * -1));	// 起始日設為1個月前
	Date dt1 = rightNow.getTime();
	dateStr = sdf.format(dt1);
	startDay = dateStr;
}
if("".equals(endDay)) {
	endDay = DateTimeTool.dateString();
}


//全站數據
int home_view = 0,
    total_site = 0; //總瀏覽
//學習專區數據
int learn_view = 0,
    highschool_view = 0,
    fiveyear_view = 0,
    university_view = 0,
    article_view = 0,
    video_view = 0;

Vector<TableRecord> homeData = app_sm.selectAll(tblnk,"nk_type=? and nk_createdate<=? and nk_createdate>=?",
        new Object[]{"home",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:homeData) {
	home_view += data.getInt("nk_sequence");
}
total_site += home_view;
/*學習專區統計 start*/
Vector<TableRecord> learnData = app_sm.selectAll(tblnk,"nk_type=? and nk_createdate<=? and nk_createdate>=?",
		                                         new Object[]{"learn",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:learnData) {
	learn_view += data.getInt("nk_sequence");
}
learn_view += na.getInt("na_learn");

Vector<TableRecord> highschoolData = app_sm.selectAll(tblnk,"nk_type=? and nk_createdate<=? and nk_createdate>=?",
        new Object[]{"highschool",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:highschoolData) {
    highschool_view += data.getInt("nk_sequence");
}
highschool_view += na.getInt("na_highschool");

Vector<TableRecord> fiveyearData = app_sm.selectAll(tblnk,"nk_type=? and nk_createdate<=? and nk_createdate>=?",
        new Object[]{"five_yearcollege",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:fiveyearData) {
    fiveyear_view += data.getInt("nk_sequence");
}
fiveyear_view += na.getInt("na_fiveyear");

Vector<TableRecord> universityData = app_sm.selectAll(tblnk,"nk_type=? and nk_createdate<=? and nk_createdate>=?",
        new Object[]{"university",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:universityData) {
    university_view += data.getInt("nk_sequence");
}
university_view += na.getInt("na_university");

Vector<TableRecord> articleData = app_sm.selectAll(tblnk,"nk_type like? and nk_createdate<=? and nk_createdate>=?",
        new Object[]{"article%",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:articleData) {
    article_view += data.getInt("nk_sequence");
}
article_view += na.getInt("na_article");

Vector<TableRecord> videoData = app_sm.selectAll(tblnk,"nk_type like? and nk_createdate<=? and nk_createdate>=?",
        new Object[]{"video%",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:videoData) {
    video_view += data.getInt("nk_sequence");
}
video_view += na.getInt("na_video");
total_site += learn_view + highschool_view + fiveyear_view + university_view + article_view + video_view;
/*學習專區統計 end*/

/*新訊報報統計start*/
int news_view = 0;
Vector<TableRecord> newsData = app_sm.selectAll(tblnk,"nk_type like? and nk_createdate<=? and nk_createdate>=?",
        new Object[]{"news%",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:newsData) {
    news_view += data.getInt("nk_sequence");
}
news_view += na.getInt("na_news");
total_site += news_view;
/*新訊報報統計end*/

/*常設展統計start*/
int career_view = 0;
Vector<TableRecord> careerData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
        new Object[]{"career_exploration",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:careerData) {
    career_view += data.getInt("nk_sequence");
}
career_view += na.getInt("na_career");
total_site += career_view;
/*常設展統計end*/

/*展場活動統計start*/
int activity_view = 0;
Vector<TableRecord> activityData = app_sm.selectAll(tblnk,"nk_type like? and nk_createdate<=? and nk_createdate>=?",
        new Object[]{"activity%",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:activityData) {
    activity_view += data.getInt("nk_sequence");
}
activity_view += na.getInt("na_activity");
total_site += activity_view;
/*展場活動統計end*/

/*好夥伴統計start*/
int technical_view = 0;
Vector<TableRecord> technicalData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
        new Object[]{"technical",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:technicalData) {
    technical_view += data.getInt("nk_sequence");
}
technical_view += na.getInt("na_technical");
total_site += technical_view;
/*好夥伴活動end*/

/*實作環境參訪統計start*/
//科工館
int imp1_view = 0;
Vector<TableRecord> imp_1Data = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
        new Object[]{"imp_1",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:imp_1Data) {
	imp1_view += data.getInt("nk_sequence");
}
imp1_view += na1.getInt("na_imp1");
total_site += imp1_view;

//國資圖
int imp2_view = 0;
Vector<TableRecord> imp_2Data = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
      new Object[]{"imp_2",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:imp_1Data) {
	imp2_view += data.getInt("nk_sequence");
}
imp2_view += na2.getInt("na_imp2");
total_site += imp2_view;


//科教館
int imp3_view = 0;
Vector<TableRecord> imp_3Data = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
      new Object[]{"imp_3",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:imp_3Data) {
	imp3_view += data.getInt("nk_sequence");
}
imp3_view += na3.getInt("na_imp3");
total_site += imp3_view;
/*實作環境參訪統計end*/

/*報名參訪統計start*/
//科工館
int imp2_1view = 0;
Vector<TableRecord> imp2_1Data = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
      new Object[]{"imp2_1",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:imp2_1Data) {
	imp2_1view += data.getInt("nk_sequence");
}
imp2_1view += na1.getInt("na_imp2_1");
total_site += imp2_1view;

//國資圖
int imp2_2view = 0;
Vector<TableRecord> imp2_2Data = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
      new Object[]{"imp2_2",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:imp2_2Data) {
	imp2_2view += data.getInt("nk_sequence");
}
imp2_2view += na2.getInt("na_imp2_2");
total_site += imp2_2view;

//科教館
int imp2_3view = 0;
Vector<TableRecord> imp2_3Data = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
      new Object[]{"imp2_3",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:imp2_3Data) {
	imp2_3view += data.getInt("nk_sequence");
}
imp2_3view += na3.getInt("na_imp2_3");
total_site += imp2_3view;
/*報名參訪統計end*/

/*聯絡我們統計start*/
int contact_view = 0;
Vector<TableRecord> contactData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
        new Object[]{"contact",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:contactData) {
	contact_view += data.getInt("nk_sequence");
}
contact_view += na.getInt("na_contact");
total_site += contact_view;
/*聯絡我們統計end*/

/*遊戲統計start*/
int total_play = 0, //總遊玩   
    login_play = 0, //總記名遊玩
    anom_play = 0;  //總匿名遊玩

//航運王
int shippingLogin = 0, //記名
    shippingAnom = 0, //匿名
    shippingTotal = 0; //總遊玩
Vector<TableRecord> shippingLoginData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                                            new Object[]{"shippingGame",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:shippingLoginData) {
	shippingLogin += data.getInt("nk_sequence");
}
shippingLogin += na.getInt("na_shipping_login");

Vector<TableRecord> shippingAnomData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
        new Object[]{"shippingAnon",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:shippingAnomData) {
shippingAnom += data.getInt("nk_sequence");
}
shippingAnom += na.getInt("na_shipping_anom");
shippingTotal += shippingLogin+shippingAnom; 

//飛修員
int aircraftLogin = 0, //記名
    aircraftAnom = 0, //匿名
    aircraftTotal = 0; //總遊玩
Vector<TableRecord> aircraftLoginData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                                          new Object[]{"aircraftGame",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:aircraftLoginData) {
	aircraftLogin += data.getInt("nk_sequence");
}
aircraftLogin += na.getInt("na_aircraft_login");
Vector<TableRecord> aircraftAnomData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
      new Object[]{"aircraftAnon",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:aircraftAnomData) {
	aircraftAnom += data.getInt("nk_sequence");
}
aircraftAnom += na.getInt("na_aircraft_anom");
aircraftTotal += aircraftLogin + aircraftAnom; 

//智慧製造洗手乳
int wisdomLogin = 0, //記名
    wisdomAnom = 0, //匿名
    wisdomTotal = 0; //總遊玩
Vector<TableRecord> wisdomLoginData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                                        new Object[]{"wisdomGame",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:wisdomLoginData) {
	wisdomLogin += data.getInt("nk_sequence");
}
wisdomLogin += na.getInt("na_wisdom_login");

Vector<TableRecord> wisdomAnomData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
    new Object[]{"wisdomAnon",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:wisdomAnomData) {
	wisdomAnom += data.getInt("nk_sequence");
}
wisdomAnom += na.getInt("na_wisdom_anom");
wisdomTotal += wisdomLogin + wisdomAnom; 

//無人商店採購
int dreamLogin = 0, //記名
    dreamAnom = 0, //匿名
    dreamTotal = 0; //總遊玩
Vector<TableRecord> dreamLoginData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                                      new Object[]{"dreamGame",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:dreamLoginData) {
	dreamLogin += data.getInt("nk_sequence");
}
dreamLogin += na.getInt("na_dream_login");

Vector<TableRecord> dreamAnomData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
  new Object[]{"dreamAnon",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:dreamAnomData) {
	dreamAnom += data.getInt("nk_sequence");
}
dreamAnom += na.getInt("na_dream_anom");
dreamTotal += dreamLogin + dreamAnom; 

//彩繪技職樂園
int paradiseLogin = 0, //記名
  paradiseAnom = 0, //匿名
  paradiseTotal = 0; //總遊玩
Vector<TableRecord> paradiseLoginData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                                    new Object[]{"paradiseGame",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:paradiseLoginData) {
	paradiseLogin += data.getInt("nk_sequence");
}
paradiseLogin += na.getInt("na_paradise_login");

Vector<TableRecord> paradiseAnomData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                                                      new Object[]{"paradiseAnon",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:paradiseAnomData) {
	paradiseAnom += data.getInt("nk_sequence");
}
paradiseAnom += na.getInt("na_paradise_anom");
paradiseTotal += paradiseLogin + paradiseAnom; 

//智能雞舍
int farmingLogin = 0, //記名
    farmingAnom = 0, //匿名
    farmingTotal = 0; //總遊玩
Vector<TableRecord> farmingLoginData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                                  new Object[]{"farmingGame",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:farmingLoginData) {
	farmingLogin += data.getInt("nk_sequence");
}
farmingLogin += na.getInt("na_farming_login");

Vector<TableRecord> farmingAnomData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                                                    new Object[]{"farmingAnon",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:farmingAnomData) {
	farmingAnom += data.getInt("nk_sequence");
}
farmingAnom += na.getInt("na_farming_anom");
farmingTotal += farmingLogin + farmingAnom;

//抓魚
int fishingLogin = 0, //記名
    fishingAnom = 0, //匿名
    fishingTotal = 0; //總遊玩
Vector<TableRecord> fishingLoginData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                                new Object[]{"aquaticGame",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:fishingLoginData) {
	fishingLogin += data.getInt("nk_sequence");
}
fishingLogin += na.getInt("na_fishing_login");

Vector<TableRecord> fishingAnomData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                                                  new Object[]{"aquaticAnon",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:fishingAnomData) {
	fishingAnom += data.getInt("nk_sequence");
}
fishingAnom += na.getInt("na_fishing_anom");

fishingTotal += fishingLogin + fishingAnom;

//農業小幫手
int droneLogin = 0, //記名
    droneAnom = 0, //匿名
    droneTotal = 0; //總遊玩
Vector<TableRecord> droneLoginData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                              new Object[]{"droneGame",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:droneLoginData) {
	droneLogin += data.getInt("nk_sequence");
}
droneLogin += na.getInt("na_drone_login");

Vector<TableRecord> droneAnomData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                                                new Object[]{"droneAnon",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:droneAnomData) {
	droneAnom += data.getInt("nk_sequence");
}
droneAnom += na.getInt("na_drone_anom");

droneTotal += droneLogin + droneAnom;

//小建築大工程
int buildLogin = 0, //記名
	buildAnom = 0, //匿名
	buildTotal = 0; //總遊玩
Vector<TableRecord> buildLoginData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                            new Object[]{"buildGame",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:buildLoginData) {
	buildLogin += data.getInt("nk_sequence");
}
buildLogin += na.getInt("na_build_login");

Vector<TableRecord> buildAnomData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                                              new Object[]{"buildAnon",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:buildAnomData) {
	buildAnom += data.getInt("nk_sequence");
}
buildAnom += na.getInt("na_build_anom");

buildTotal += buildLogin + buildAnom;

//花草實驗室
int flowerLogin = 0, //記名
	flowerAnom = 0, //匿名
	flowerTotal = 0; //總遊玩
Vector<TableRecord> flowerLoginData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                          new Object[]{"flowerGame",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:flowerLoginData) {
	flowerLogin += data.getInt("nk_sequence");
}
flowerLogin += na.getInt("na_flower_login");

Vector<TableRecord> flowerAnomData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                                            new Object[]{"flowerAnon",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:flowerAnomData) {
	buildAnom += data.getInt("nk_sequence");
}
flowerAnom += na.getInt("na_flower_anom");

flowerTotal += flowerLogin + flowerAnom;

//積木樂園
int brickLogin = 0, //記名
	brickAnom = 0, //匿名
	brickTotal = 0; //總遊玩
Vector<TableRecord> brickLoginData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                        new Object[]{"brickGame",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:brickLoginData) {
	brickLogin += data.getInt("nk_sequence");
}
brickLogin += na.getInt("na_brick_login");

Vector<TableRecord> brickAnomData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                                          new Object[]{"brickAnon",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:brickAnomData) {
	brickAnom += data.getInt("nk_sequence");
}
brickAnom += na.getInt("na_brick_anom");

brickTotal += brickLogin + brickAnom;

//森林
int forestLogin = 0, //記名
	forestAnom = 0, //匿名
	forestTotal = 0; //總遊玩
Vector<TableRecord> forestLoginData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                      new Object[]{"forestGame",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:forestLoginData) {
	forestLogin += data.getInt("nk_sequence");
}
forestLogin += na.getInt("na_forest_login");

Vector<TableRecord> forestAnomData = app_sm.selectAll(tblnk,"nk_type =? and nk_createdate<=? and nk_createdate>=?",
                                        new Object[]{"forestAnon",endDay,startDay},"nk_createdate ASC");
for(TableRecord data:forestAnomData) {
	forestAnom += data.getInt("nk_sequence");
}
forestAnom += na.getInt("na_forest_anom");

forestTotal += forestLogin + forestAnom;




//加總
total_play += shippingTotal + aircraftTotal + wisdomTotal + dreamTotal
            + paradiseTotal + farmingTotal + fishingTotal + droneTotal
            + buildTotal + flowerTotal + brickTotal + forestTotal;
login_play += shippingLogin + aircraftLogin + wisdomLogin + dreamLogin
            + paradiseLogin + farmingLogin + fishingLogin + droneLogin
            + buildLogin + flowerLogin + brickLogin + forestLogin;
anom_play += shippingAnom + aircraftAnom + wisdomAnom + dreamAnom
           + paradiseAnom + farmingAnom + fishingAnom + droneAnom
           + buildAnom +  flowerAnom + brickAnom + forestAnom;
/*遊戲統計end*/

/*會員申請統計*/
Vector<TableRecord> mps = app_sm.selectAll(tblmp,"mp_code=? and mp_createdate >= ? and mp_createdate <= ?",
		                                   new Object[]{"",startDay,endDay});
int member_count = mps.size();
member_count += na.getInt("na_member");

/* 會員總數 2023/09/08 新增 */
Vector<TableRecord> mpts = app_sm.selectAll(tblmp);
int member_total = mpts.size();

Vector<TableRecord> mps_apply = app_sm.selectAll(tblmp,"mp_code=? and mp_createdate >= ? and mp_createdate <= ?",
                                                 new Object[]{"apply",startDay,endDay});
int apply_count = mps_apply.size();
apply_count += na.getInt("na_apply");

/* Ouput records as json */
JSONObject json = new JSONObject();
json.put("home_view", home_view);

// 全站數據狀況分析
json.put("total_site", total_site); // 總瀏覽人次
json.put("total_play", total_play); // 總遊玩人次
json.put("login_play", login_play); // 記名遊玩人次
json.put("anom_play", anom_play); // 匿名遊玩人次

// 會員數量分析
json.put("member_total", member_total); // 會員總數
json.put("member_count", member_count); // 會員數量
json.put("apply_count", apply_count); // 申請發文帳號數量

// 學習專區狀況分析
json.put("learn_view", learn_view); // 認識技職教育瀏覽人次
json.put("highschool_view", highschool_view); // 升學技高瀏覽人次
json.put("fiveyear_view", fiveyear_view); // 升學五專瀏覽人次
json.put("university_view", university_view); // 四技二專瀏覽人次
json.put("article_view", article_view); // 技職好文瀏覽人次
json.put("video_view", video_view); // 技職有影瀏覽人次

// 其他區域狀況分析
json.put("news_view", news_view); // 新訊報報 瀏覽人次
json.put("career_view", career_view); // 職業試探常設展 瀏覽人次
json.put("activity_view", activity_view); // 展場活動 瀏覽人次
json.put("technical_view", technical_view); // 技職教育好夥伴 瀏覽人次
json.put("contact_view", contact_view); // 聯絡我們 瀏覽人次

// 實作環境參訪狀況分析
json.put("imp1_view", imp1_view); // 科工館 瀏覽人次
json.put("imp2_view", imp2_view); // 國資圖 瀏覽人次
json.put("imp3_view", imp3_view); // 科教館 瀏覽人次
json.put("imp2_1view", imp2_1view); // 科工館 瀏覽人次
json.put("imp2_2view", imp2_2view); // 國資圖 瀏覽人次
json.put("imp2_3view", imp2_3view); // 科教館 瀏覽人次

// 遊玩紀錄狀況分析
// json.put("total_play", total_play);
// json.put("login_play", login_play);
// json.put("anom_play", anom_play);
// 神秘森林救援
json.put("forestLogin", forestLogin);
json.put("forestAnom", forestAnom);
json.put("forestTotal", forestTotal);
// 積木樂園
json.put("brickLogin", brickLogin);
json.put("brickAnom", brickAnom);
json.put("brickTotal", brickTotal);
// 花草實驗室
json.put("flowerLogin", flowerLogin);
json.put("flowerAnom", flowerAnom);
json.put("flowerTotal", flowerTotal);
// 小建築大工程
json.put("buildLogin", buildLogin);
json.put("buildAnom", buildAnom);
json.put("buildTotal", buildTotal);
// 誰是航運王
json.put("shippingLogin", shippingLogin);
json.put("shippingAnom", shippingAnom);
json.put("shippingTotal", shippingTotal);
// 超級飛修員
json.put("aircraftLogin", aircraftLogin);
json.put("aircraftAnom", aircraftAnom);
json.put("aircraftTotal", aircraftTotal);
// 智慧製造洗手乳
json.put("wisdomLogin", wisdomLogin);
json.put("wisdomAnom", wisdomAnom);
json.put("wisdomTotal", wisdomTotal);
// 無人商店採購
json.put("dreamLogin", dreamLogin);
json.put("dreamAnom", dreamAnom);
json.put("dreamTotal", dreamTotal);
// 彩繪技職樂園
json.put("paradiseLogin", paradiseLogin);
json.put("paradiseAnom", paradiseAnom);
json.put("paradiseTotal", paradiseTotal);
// 智能雞舍
json.put("farmingLogin", farmingLogin);
json.put("farmingAnom", farmingAnom);
json.put("farmingTotal", farmingTotal);
// 漏網抓魚感測體驗
json.put("fishingLogin", fishingLogin);
json.put("fishingAnom", fishingAnom);
json.put("fishingTotal", fishingTotal);
// 農業小幫手
json.put("droneLogin", droneLogin);
json.put("droneAnom", droneAnom);
json.put("droneTotal", droneTotal);
out.print(json);
out.flush();
%>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>