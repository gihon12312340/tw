<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jspf/config.jspf"%>
<%@include file="/WEB-INF/jspf/mis/check.jspf"%>
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

//經營大亨
int businessLogin = 0, //記名
	businessAnom = 0, //匿名
	businessTotal = 0; //總遊玩

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

Vector<TableRecord> mps_apply = app_sm.selectAll(tblmp,"mp_code=? and mp_createdate >= ? and mp_createdate <= ?",
                                                 new Object[]{"apply",startDay,endDay});
int apply_count = mps_apply.size();
apply_count += na.getInt("na_apply");
//out.println(total_site);
%>
<!DOCTYPE html>
<html>
<head>

<%@include file="include/head.jsp"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
let total_play = <%= total_play %>;
let login_play = <%= login_play %>;
let anom_play = <%= anom_play %>;
let startDay = '<%= startDay %>'.replaceAll('/', '-');
let endDay = '<%= endDay %>'.replaceAll('/', '-');

function checkSearch(F) {
	if (F.startDate.value > F.endDate.value) {
	     alert("查詢起始日不得大於查詢截止日!!");
	     F.startDate.focus();
	} else {
	     return true;
	}
	return false;
}
google.charts.load('current', {'packages':['corechart']});

google.charts.setOnLoadCallback(drawForestGame);
function drawForestGame() {
	var data = google.visualization.arrayToDataTable([
		['展場名稱', '百分比'],
		<%if(forestTotal > 0) { %>
		['匿名遊玩', <%=forestAnom %>],
		['記名遊玩', <%=forestLogin %>]
		<%} %>
	]);
	
	var options = {
		title: '遊戲:神秘森林救援',
		pieHole: 0.5,
		<%
		// 單切片100%
		if(forestTotal == forestAnom || forestTotal == forestLogin) {
		%>
		<%="pieSliceTextStyle: { color: 'black', }," %>
		<%} %>
		legend: 'none'
	};
	
	var chartforestGame = new google.visualization.PieChart(document.getElementById('forestGameData'));
	chartforestGame.draw(data, options);
}



google.charts.setOnLoadCallback(drawBrickGame);
function drawBrickGame() {
	var data = google.visualization.arrayToDataTable([
		['展場名稱', '百分比'],
		<%if(brickTotal > 0) { %>
		['匿名遊玩', <%=brickAnom %>],
		['記名遊玩', <%=brickLogin %>]
		<%} %>
	]);
	
	var options = {
		title: '遊戲:積木樂園',
		pieHole: 0.5,
		<%
		// 單切片100%
		if(brickTotal == brickAnom || brickTotal == brickLogin) {
		%>
		<%="pieSliceTextStyle: { color: 'black', }," %>
		<%} %>
		legend: 'none'
	};
	
	var chartbrickGame = new google.visualization.PieChart(document.getElementById('brickGameData'));
	chartbrickGame.draw(data, options);
}



google.charts.setOnLoadCallback(drawFlowerGame);
function drawFlowerGame() {
	var data = google.visualization.arrayToDataTable([
		['展場名稱', '百分比'],
		<%if(flowerTotal > 0) { %>
		['匿名遊玩', <%=flowerAnom %>],
		['記名遊玩', <%=flowerLogin %>]
		<%} %>
	]);
	
	var options = {
		title: '遊戲:花草實驗室',
		pieHole: 0.5,
		<%
		// 單切片100%
		if(flowerTotal == flowerAnom || flowerTotal == flowerLogin) {
		%>
		<%="pieSliceTextStyle: { color: 'black', }," %>
		<%} %>
		legend: 'none'
	};
	
	var chartflowerGame = new google.visualization.PieChart(document.getElementById('flowerGameData'));
	chartflowerGame.draw(data, options);
}

google.charts.setOnLoadCallback(drawBuildGame);
function drawBuildGame() {
	var data = google.visualization.arrayToDataTable([
		['展場名稱', '百分比'],
		<%if(buildTotal > 0) { %>
		['匿名遊玩', <%=buildAnom %>],
		['記名遊玩', <%=buildLogin %>]
		<%} %>
	]);
	
	var options = {
		title: '遊戲:小建築大工程',
		pieHole: 0.5,
		<%
		// 單切片100%
		if(buildTotal == buildAnom || buildTotal == buildLogin) {
		%>
		<%="pieSliceTextStyle: { color: 'black', }," %>
		<%} %>
		legend: 'none'
	};
	
	var chartBuildGame = new google.visualization.PieChart(document.getElementById('buildGameData'));
	chartBuildGame.draw(data, options);
}
google.charts.setOnLoadCallback(drawShippingGame);
function drawShippingGame() {
	var data = google.visualization.arrayToDataTable([
		['展場名稱', '百分比'],
		<%if(shippingTotal > 0) { %>
		['匿名遊玩', <%=shippingAnom %>],
		['記名遊玩', <%=shippingLogin %>]
		<%} %>
	]);
	
	var options = {
		title: '遊戲:誰是航運王',
		pieHole: 0.5,
		<%
		// 單切片100%
		if(shippingTotal == shippingAnom || shippingTotal == shippingLogin) {
		%>
		<%="pieSliceTextStyle: { color: 'black', }," %>
		<%} %>
		legend: 'none'
	};
	
	var chartShippingGame = new google.visualization.PieChart(document.getElementById('shippingGameData'));
	chartShippingGame.draw(data, options);
}

google.charts.setOnLoadCallback(drawAircraftGame);
function drawAircraftGame() {
	var data = google.visualization.arrayToDataTable([
		['展場名稱', '百分比'],
		<%if(aircraftTotal > 0) { %>
		['匿名遊玩', <%=aircraftAnom %>],
		['記名遊玩', <%=aircraftLogin %>]
		<%} %>
	]);
	
	var options = {
		title: '遊戲:超級飛修員',
		pieHole: 0.5,
		<%
		// 單切片100%
		if(aircraftTotal == aircraftAnom || aircraftTotal == aircraftLogin) {
		%>
		<%="pieSliceTextStyle: { color: 'black', }," %>
		<%} %>
		legend: 'none'
	};
	
	var chartAircraftGame = new google.visualization.PieChart(document.getElementById('aircraftGameData'));
	chartAircraftGame.draw(data, options);
}

google.charts.setOnLoadCallback(drawWisdomGame);
function drawWisdomGame() {
	var data = google.visualization.arrayToDataTable([
		['展場名稱', '百分比'],
		<%if(wisdomTotal > 0) { %>
		['匿名遊玩', <%=wisdomAnom %>],
		['記名遊玩', <%=wisdomLogin %>]
		<%} %>
	]);
	
	var options = {
		title: '遊戲:智慧製造洗手乳',
		pieHole: 0.5,
		<%
		// 單切片100%
		if(wisdomTotal == wisdomAnom || wisdomTotal == wisdomLogin) {
		%>
		<%="pieSliceTextStyle: { color: 'black', }," %>
		<%} %>
		legend: 'none'
	};
	
	var chartWisdomGame = new google.visualization.PieChart(document.getElementById('wisdomGameData'));
	chartWisdomGame.draw(data, options);
}

google.charts.setOnLoadCallback(drawDreamGame);
function drawDreamGame() {
	var data = google.visualization.arrayToDataTable([
		['展場名稱', '百分比'],
		<%if(dreamTotal > 0) { %>
		['匿名遊玩', <%=dreamAnom %>],
		['記名遊玩', <%=dreamLogin %>]
		<%} %>
	]);
	
	var options = {
		title: '遊戲:無人商店採購',
		pieHole: 0.5,
		<%
		// 單切片100%
		if(dreamTotal == dreamAnom || dreamTotal == dreamLogin) {
		%>
		<%="pieSliceTextStyle: { color: 'black', }," %>
		<%} %>
		legend: 'none'
	};
	
	var chartDreamGame = new google.visualization.PieChart(document.getElementById('dreamGameData'));
	chartDreamGame.draw(data, options);
}

google.charts.setOnLoadCallback(drawParadiseGame);
function drawParadiseGame() {
	var data = google.visualization.arrayToDataTable([
		['展場名稱', '百分比'],
		<%if(paradiseTotal > 0) { %>
		['匿名遊玩', <%=paradiseAnom %>],
		['記名遊玩', <%=paradiseLogin %>]
		<%} %>
	]);
	
	var options = {
		title: '遊戲:彩繪技職樂園',
		pieHole: 0.5,
		<%
		// 單切片100%
		if(paradiseTotal == paradiseAnom || paradiseTotal == paradiseLogin) {
		%>
		<%="pieSliceTextStyle: { color: 'black', }," %>
		<%} %>
		legend: 'none'
	};
	
	var chartParadiseGame = new google.visualization.PieChart(document.getElementById('paradiseGameData'));
	chartParadiseGame.draw(data, options);
}

google.charts.setOnLoadCallback(drawFarmingGame);
function drawFarmingGame() {
	var data = google.visualization.arrayToDataTable([
		['展場名稱', '百分比'],
		<%if(farmingTotal > 0) { %>
		['匿名遊玩', <%=farmingAnom %>],
		['記名遊玩', <%=farmingLogin %>]
		<%} %>
	]);
	
	var options = {
		title: '遊戲:智能雞舍',
		pieHole: 0.5,
		<%
		// 單切片100%
		if(farmingTotal == farmingAnom || farmingTotal == farmingLogin) {
		%>
		<%="pieSliceTextStyle: { color: 'black', }," %>
		<%} %>
		legend: 'none'
	};
	
	var chartFarmingGame = new google.visualization.PieChart(document.getElementById('farmingGameData'));
	chartFarmingGame.draw(data, options);
}

google.charts.setOnLoadCallback(drawFishingGame);
function drawFishingGame() {
	var data = google.visualization.arrayToDataTable([
		['展場名稱', '百分比'],
		<%if(fishingTotal > 0) { %>
		['匿名遊玩', <%=fishingAnom %>],
		['記名遊玩', <%=fishingLogin %>]
		<%} %>
	]);
	
	var options = {
		title: '遊戲:漏網抓魚感測體驗',
		pieHole: 0.5,
		<%
		// 單切片100%
		if(fishingTotal == fishingAnom || fishingTotal == fishingLogin) {
		%>
		<%="pieSliceTextStyle: { color: 'black', }," %>
		<%} %>
		legend: 'none'
	};
	
	var chartFishingGame = new google.visualization.PieChart(document.getElementById('fishingGameData'));
	chartFishingGame.draw(data, options);
}

google.charts.setOnLoadCallback(drawDroneGame);
function drawDroneGame() {
	var data = google.visualization.arrayToDataTable([
		['展場名稱', '百分比'],
		<%if(droneTotal > 0) { %>
		['匿名遊玩', <%=droneAnom %>],
		['記名遊玩', <%=droneLogin %>]
		<%} %>
	]);
	
	var options = {
		title: '遊戲:農業小幫手',
		pieHole: 0.5,
		<%
		// 單切片100%
		if(droneTotal == droneAnom || droneTotal == droneLogin) {
		%>
		<%="pieSliceTextStyle: { color: 'black', }," %>
		<%} %>
		legend: 'none'
	};
	
	var chartDroneGame = new google.visualization.PieChart(document.getElementById('droneGameData'));
	chartDroneGame.draw(data, options);
}
</script>
<script>
<%-- 啟動檔案匯出功能 --%>
function export_file() {
	$(".block").show();
	var theForm = document.frm1;
		theForm.action="export/chart_export.jsp";
		theForm.target="_exportFrame";
		theForm.submit();
}

function exportProgress(){   <%-- 檢查檔案是否已經匯出完成 --%>
$.ajax({
	async:false,
	type:"GET",
    url: "export/exportcheck.jsp",
    data: {reportType:"chart_export"},
    success: function(res){
    	res = $.trim(res);
    	// console.log(res);
    	if(res == "start"){
    		$(".block").show();
		}else if((res.indexOf("end")>-1) || (res == "no")){
			$(".block").hide();
			clearProgress();
			if(res.indexOf("end")>-1) {
				location.href = "<%=app_fetchpath+"/root/report/" + app_account + "_chart_export.xls" %>";
			}
			//else history.back();
		}
    	window.setTimeout("exportProgress()",1500);
    }
}); 		
}
var timer = window.setTimeout("exportProgress()",1500);
function clearProgress(){  <%-- 清除檔案匯出完成後之 Session 值 --%>
$.ajax({
	async:false,
	type:"GET",
    url: "export/exportcheck.jsp",
    data: {reportType:"clear_chart_export"},
    success: function(res){
    }
}); 		
}
</script>
<%--
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	
	<%-- 日期區間搜尋 
	function checkSearch(F) {
		if (F.startDate.value > F.endDate.value) {
		     alert("查詢起始日不得大於查詢截止日!!");
		     F.startDate.focus();
		} else {
		     return true;
		}
		return false;
	}
	
	--%>
</head>
<body>
    <%-- 黑色遮蔽 --%>
    <div class="block" style="width:100%; height:100%; position:fixed; color:#fff; display:none;">
	    <img src="export/images/block_bg.png" width="100%" height="100%" style="position:fixed; z-index:99998;"/>
	    <div style="margin: 0 auto;width: 400px;height: 50px;position: relative;top: 50%; z-index:99999; text-align:center;">
    	    資料匯出準備中，請稍待片刻 ......
	    </div>
    </div>
<%-- 黑色遮蔽 --%>
	<div align="center">
		<table width="1280" border="0" cellpadding="0" cellspacing="0">
			<%-- Top --%>
			<tr>
				<td colspan="2">
					<table width="1280" border="0" cellspacing="0" cellpadding="0">
						<%@include file="/WEB-INF/jspf/mis/top.jspf"%>
					</table>
				</td>
			</tr>
			<tr>
				<%-- Left --%>
				<td width="3" align="center" valign="top" class="web_bk-2">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<IFRAME HEIGHT="800" width="155" MARGINWIDTH="0"
								MARGINHEIGHT="0" HSPACE="0" VSPACE="0" FRAMEBORDER="0"
								SCROLLING="no" id="show" name="show" SRC="../leftmenu.jsp"></IFRAME>
							</td>
						</tr>
					</table>
				</td>
				
				<%-- Right --%>
				<td width="1125" align="center" valign="top" class="system_bk-2p">
					<table width="95%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
<%--全站數據狀況分析 --%>
						<tr>
							<td width="25%" align="left" valign="middle">
								<font style="line-height:40px; font-size:24px; color:#4fb0ff;">
									<b>全站數據狀況分析</b>
								</font>
							</td>
							
						</tr>
						<tr>
							<td colspan="8">
							<hr size="1" noshade>
							</td>
						</tr>
						<tr>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>總瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(total_site) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>總遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(total_play) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>記名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(login_play) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>匿名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(anom_play) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="8">
							<hr size="1" noshade>
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
					</table>
<table width="95%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>

						<tr>
							<td width="25%" align="left" valign="middle">
								<font style="line-height:40px; font-size:24px; color:#4fb0ff;">
									<b>會員數量分析</b>
								</font>
							</td>
							<%-- 日期區間查詢 --%>
							
							<td width="25%" align="center">
								<form name="searchForm" method="post" action="chart.jsp" onsubmit="javascript:return checkSearch(this);">
									<input name="startDate" id="_qemitdate" type="text" value="<%=startDay %>" size="6" readonly />
									~
									<input name="endDate" id="_qrestdate" type="text" value="<%=endDay %>" size="6" readonly />
									
									<input name="searchBtn" type="submit" />
									<input type="button" name="export" id="export" onclick="export_file()" value="匯出"/>
								</form>
							</td >
							<%-- 
							<td align="center">
							    <input type="button" name="export" id="export" onclick="export_file()" value="匯出"/>
							</td>
						    --%>
						</tr>
						<tr>
							<td colspan="8">
							<hr size="1" noshade>
							</td>
						</tr>
						
						<tr>
							<td width="50%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>會員數量</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(member_count) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="50%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>申請發文帳號數量</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(apply_count) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							
							<%-- 
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>匿名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(anom_play) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						    --%>
						</tr>
						<tr>
							<td colspan="8">
							<hr size="1" noshade>
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
					</table>

<%--學習專區狀況分析 --%>
<table width="95%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>

						<tr>
							<td width="25%" align="left" valign="middle">
								<font style="line-height:40px; font-size:24px; color:#4fb0ff;">
									<b>學習專區狀況分析</b>
								</font>
							</td>
							<%-- 日期區間查詢 
							
							<td width="25%" align="center">
								<form name="searchForm" method="post" action="chart.jsp" onsubmit="javascript:return checkSearch(this);">
									<input name="startDate" id="_qemitdate" type="text" value="<%=startDay %>" size="6" readonly />
									~
									<input name="endDate" id="_qrestdate" type="text" value="<%=endDay %>" size="6" readonly />
									
									<input name="searchBtn" type="submit" />
								</form>
							</td >
							<td align="center">
							    <input type="button" name="export" id="export" onclick="export_file()" value="匯出"/>
							</td>
							--%>
						</tr>
						<tr>
							<td colspan="8">
							<hr size="1" noshade>
							</td>
						</tr>
						<tr>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>認識技職教育瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(learn_view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>升學技高瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(highschool_view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>升學五專瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(fiveyear_view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>四技二專瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(university_view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>技職好文瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(article_view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>技職有影瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(video_view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="8">
							<hr size="1" noshade>
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
					</table>
<%--遊玩紀錄數據狀況分析 --%>
<table width="95%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>

						<tr>
							<td width="25%" align="left" valign="middle">
								<font style="line-height:40px; font-size:24px; color:#4fb0ff;">
									<b>遊玩紀錄狀況分析</b>
								</font>
							</td>
						</tr>
						<tr>
							<td colspan="8">
							<hr size="1" noshade>
							</td>
						</tr>
						
						<tr>
						    <td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:0% 0% 0% 0%; border-radius:10px;" >
									<div id="businessGameData" style="width:300px; height:300px; border-radius:10px;"></div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>經營大亨 總遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b id=businessTotal><%=app_df.format(businessTotal) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>經營大亨 記名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b id=businessLogin><%=app_df.format(businessLogin) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>經營大亨 匿名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b id=businessAnom><%=app_df.format(businessAnom) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
						    <td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:0% 0% 0% 0%; border-radius:10px;" >
									<div id="forestGameData" style="width:300px; height:300px; border-radius:10px;"></div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>神秘森林救援 總遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(forestTotal) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>神秘森林救援 記名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(forestLogin) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>神秘森林救援 匿名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(forestAnom) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
						    <td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:0% 0% 0% 0%; border-radius:10px;" >
									<div id="brickGameData" style="width:300px; height:300px; border-radius:10px;"></div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>積木樂園 總遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(brickTotal) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>積木樂園 記名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(brickLogin) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>積木樂園 匿名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(brickAnom) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						<tr>
						    <td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:0% 0% 0% 0%; border-radius:10px;" >
									<div id="flowerGameData" style="width:300px; height:300px; border-radius:10px;"></div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>花草實驗室 總遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(flowerTotal) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>花草實驗室 記名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(flowerLogin) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>花草實驗室 匿名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(flowerAnom) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						<tr>
						    <td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:0% 0% 0% 0%; border-radius:10px;" >
									<div id="buildGameData" style="width:300px; height:300px; border-radius:10px;"></div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>小建築大工程 總遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(buildTotal) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>小建築大工程 記名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(buildLogin) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>小建築大工程 匿名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(buildAnom) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						<tr>
						    <td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:0% 0% 0% 0%; border-radius:10px;" >
									<div id="shippingGameData" style="width:300px; height:300px; border-radius:10px;"></div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>誰是航運王 總遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(shippingTotal) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>誰是航運王 記名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(shippingLogin) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>誰是航運王 匿名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(shippingAnom) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						<tr>
						    <td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:0% 0% 0% 0%; border-radius:10px;" >
									<div id="aircraftGameData" style="width:300px; height:300px; border-radius:10px;"></div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>超級飛修員 總遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(aircraftTotal) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>超級飛修員 記名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(aircraftLogin) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>超級飛修員 匿名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(aircraftAnom) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						<tr>
						    <td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:0% 0% 0% 0%; border-radius:10px;" >
									<div id="wisdomGameData" style="width:300px; height:300px; border-radius:10px;"></div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>智慧製造洗手乳 總遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(wisdomTotal) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>智慧製造洗手乳 記名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(wisdomLogin) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>智慧製造洗手乳 匿名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(wisdomAnom) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						<tr>
						    <td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:0% 0% 0% 0%; border-radius:10px;" >
									<div id="dreamGameData" style="width:300px; height:300px; border-radius:10px;"></div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>無人商店採購 總遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(dreamTotal) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>無人商店採購 記名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(dreamLogin) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>無人商店採購 匿名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(dreamAnom) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						<tr>
						    <td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:0% 0% 0% 0%; border-radius:10px;" >
									<div id="paradiseGameData" style="width:300px; height:300px; border-radius:10px;"></div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>彩繪技職樂園 總遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(paradiseTotal) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>彩繪技職樂園 記名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(paradiseLogin) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>彩繪技職樂園 匿名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(paradiseAnom) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						<tr>
						    <td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:0% 0% 0% 0%; border-radius:10px;" >
									<div id="farmingGameData" style="width:300px; height:300px; border-radius:10px;"></div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>智能雞舍 總遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(farmingTotal) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>智能雞舍 記名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(farmingLogin) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>智能雞舍 匿名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(farmingAnom) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:0% 0% 0% 0%; border-radius:10px;" >
									<div id="fishingGameData" style="width:300px; height:300px; border-radius:10px;"></div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>漏網抓魚感測體驗 總遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(fishingTotal) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>漏網抓魚感測體驗 記名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(fishingLogin) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>漏網抓魚感測體驗 匿名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(fishingAnom) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:0% 0% 0% 0%; border-radius:10px;" >
									<div id="droneGameData" style="width:300px; height:300px; border-radius:10px;"></div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>農業小幫手 總遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(droneTotal) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>農業小幫手 記名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(droneLogin) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>農業小幫手 匿名遊玩人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(droneAnom) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="8">
							<hr size="1" noshade>
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
					</table>
<%--實作環境狀況分析 --%>
<table width="95%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>

						<tr>
							<td width="25%" align="left" valign="middle">
								<font style="line-height:40px; font-size:24px; color:#4fb0ff;">
									<b>實作環境參訪狀況分析</b>
								</font>
							</td>
							<%-- 日期區間查詢 --%>
							<%-- %>
							<td width="25%" align="center">
								<form name="searchForm" method="post" action="statistics.jsp" onsubmit="javascript:return checkSearch(this);">
									<input name="startDate" id="_qemitdate" type="text" value="<%=DateTimeTool.dateString()%>" size="6" readonly />
									~
									<input name="endDate" id="_qrestdate" type="text" value="2099/12/31" size="6" readonly />
									
									<input name="searchBtn" type="submit" />
								</form>
							</td>
							<%-- --%>
						</tr>
						<tr>
							<td colspan="8">
							<hr size="1" noshade>
							</td>
						</tr>
						
						<tr>
						    <td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>技職實作環境</b></font>
									</div>
									
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>科工館 瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(imp1_view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>國資圖 瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(imp2_view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>科教館 瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(imp3_view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
							
						</tr>
						<tr>
						    <td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>報名參訪體驗資訊</b></font>
									</div>
									
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>科工館 瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(imp2_1view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>國資圖 瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(imp2_2view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>科教館 瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(imp2_3view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
							
						</tr>
						<tr>
							<td colspan="8">
							<hr size="1" noshade>
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
					</table>

<table width="95%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
<%--全站數據狀況分析 --%>
						<tr>
							<td width="25%" align="left" valign="middle">
								<font style="line-height:40px; font-size:24px; color:#4fb0ff;">
									<b>其他區域狀況分析</b>
								</font>
							</td>
						</tr>
						<tr>
							<td colspan="8">
							<hr size="1" noshade>
							</td>
						</tr>
						<tr>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>新訊報報 瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(news_view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>職業試探常設展 瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(career_view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;">
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>展場活動 瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(activity_view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>次</b></font>
									</div>
								</div>
							</td>
						</tr>
						<tr >
							<td width="25%" style="background-color:#bae0ff;" >
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>技職教育好夥伴 瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(technical_view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							<td width="25%" style="background-color:#bae0ff;" >
								<div style="background-color:white; margin: 2% 1% 2% 1%; padding:15% 0% 15% 0%; border-radius:20px;">
									<div align="center">
										<font size="3" color="#000000"><b>聯絡我們 瀏覽人次</b></font>
									</div>
									<br />
									<div align="center">
										<font size="2" color="#5ab5ff"><b><%=app_df.format(contact_view) %></b></font>
										<br />
										<hr style="width:80%;height:2px;border-width:0;color:#cdcdcd;background-color:#cdcdcd">
										<font size="1" color="gray"><b>人</b></font>
									</div>
								</div>
							</td>
							
						</tr>
						
	
						
						
						<tr>
							<td colspan="8">
							<hr size="1" noshade>
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
					</table>








	</div>
  <script>
  function drawBusinessGame() {
    // fetch(`https://edm.mindnodeair.com/api/game/business/statistics?start=${startDay}&end=${endDay}`)
    fetch('https://edm.mindnodeair.com/api/game/business/statistics?start='+startDay+'&end='+endDay)
    .then(res => res.json())
    .then(json => {
      console.log(json);
      let businessLogin = 0, businessAnom = 0, businessTotal = 0;
      if("anom" in json){
        businessAnom = json["anom"];
      }
      if("login" in json){
        businessLogin = json["login"];
      }
      businessTotal += businessLogin + businessAnom;
      
      var pieData = [['展場名稱', '百分比']];
      if(businessTotal > 0){
        pieData.concat([
          ['匿名遊玩', businessAnom],
          ['記名遊玩', businessLogin]
        ]);
      }
      var data = google.visualization.arrayToDataTable(pieData);
      
      var options = {
        title: '遊戲:經營大亨',
        pieHole: 0.5,
        legend: 'none'
      };
      if(businessTotal == businessAnom || businessTotal == businessLogin) {
        options["pieSliceTextStyle"] = {color: 'black'};
      }
      
      var chartBusinessGame = new google.visualization.PieChart(document.getElementById('businessGameData'));
      chartBusinessGame.draw(data, options);
      
      // update value
      document.querySelector("#businessLogin").innerHTML = businessLogin;
      document.querySelector("#businessAnom").innerHTML = businessAnom;
      document.querySelector("#businessTotal").innerHTML = businessTotal;
      // update export form
      
      // update total value
    });
  }
  google.charts.setOnLoadCallback(drawBusinessGame);
  </script>
</body>
</html>
<%
String[] names= {
		  "home_view","total_site",
		  "member_count","apply_count",
		  "learn_view","highschool_view",
          "fiveyear_view","university_view","article_view","video_view",
          "news_view","career_view","activity_view","technical_view",
          
          "imp1_view","imp2_view","imp3_view",
          "imp2_1view","imp2_2view","imp2_3view",
          "contact_view",
          //遊玩人次
          "total_play","login_play","anom_play",
          "forestLogin","forestAnom","forestTotal",
          "brickLogin","brickAnom","brickTotal",
          "flowerLogin","flowerAnom","flowerTotal",
          "buildLogin","buildAnom","buildTotal",
          "shippingLogin","shippingAnom","shippingTotal",
          "aircraftLogin","aircraftAnom","aircraftTotal",
          "wisdomLogin","wisdomAnom","wisdomTotal",
          "dreamLogin","dreamAnom","dreamTotal",
          "paradiseLogin","paradiseAnom","paradiseTotal",
          "farmingLogin","farmingAnom","farmingTotal",
          "fishingLogin","fishingAnom","fishingTotal",
          "droneLogin","droneAnom","droneTotal"};
String[] values = {String.valueOf(home_view),
         String.valueOf(total_site),
         String.valueOf(member_count),
         String.valueOf(apply_count),
         String.valueOf(learn_view),
         String.valueOf(highschool_view),
         String.valueOf(fiveyear_view),
         String.valueOf(university_view),
         String.valueOf(article_view),
         String.valueOf(video_view),
         String.valueOf(news_view),
         String.valueOf(career_view),
         String.valueOf(activity_view),
         String.valueOf(technical_view),
         
         String.valueOf(imp1_view),
         String.valueOf(imp2_view),
         String.valueOf(imp3_view),
         String.valueOf(imp2_1view),
         String.valueOf(imp2_2view),
         String.valueOf(imp2_3view),
         String.valueOf(contact_view),
         //遊玩人次
         String.valueOf(total_play),
         String.valueOf(login_play),
         String.valueOf(anom_play),
         
         String.valueOf(forestLogin),
         String.valueOf(forestAnom),
         String.valueOf(forestTotal),
         
         String.valueOf(brickLogin),
         String.valueOf(brickAnom),
         String.valueOf(brickTotal),
         
         String.valueOf(flowerLogin),
         String.valueOf(flowerAnom),
         String.valueOf(flowerTotal),
         
         String.valueOf(buildLogin),
         String.valueOf(buildAnom),
         String.valueOf(buildTotal),
         
         String.valueOf(shippingLogin),
         String.valueOf(shippingAnom),
         String.valueOf(shippingTotal),
         
         String.valueOf(aircraftLogin),
         String.valueOf(aircraftAnom),
         String.valueOf(aircraftTotal),
        
         String.valueOf(wisdomLogin),
         String.valueOf(wisdomAnom),
         String.valueOf(wisdomTotal),
         
         String.valueOf(dreamLogin),
         String.valueOf(dreamAnom),
         String.valueOf(dreamTotal),
         
         String.valueOf(paradiseLogin),
         String.valueOf(paradiseAnom),
         String.valueOf(paradiseTotal),
         
         String.valueOf(farmingLogin),
         String.valueOf(farmingAnom),
         String.valueOf(farmingTotal),
         
         String.valueOf(fishingLogin),
         String.valueOf(fishingAnom),
         String.valueOf(fishingTotal),
         
         String.valueOf(droneLogin),
         String.valueOf(droneAnom),
         String.valueOf(droneTotal)
};                     
%>
<iframe name="_exportFrame" width="0" height="0" style="display:none"></iframe>
<%=HtmlCoder.getForm("frm1", request.getRequestURI(), names, values)%>
<%@include file="/WEB-INF/jspf/connclose.jspf"%>