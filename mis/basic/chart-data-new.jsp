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

/*遊戲統計start*/
int total_play = 0, //總遊玩   
    login_play = 0, //總記名遊玩
    anom_play = 0;  //總匿名遊玩

//航運王
int shippingLogin = 0, //記名
    shippingAnom = 0, //匿名
    shippingTotal = 0; //總遊玩
Vector<TableRecord> shippingLoginData = app_sm.selectAll(tblnk,"nk_type =?",
                                            new Object[]{"shippingGame"},"nk_createdate ASC");
for(TableRecord data:shippingLoginData) {
	shippingLogin += data.getInt("nk_sequence");
}
shippingLogin += na.getInt("na_shipping_login");

Vector<TableRecord> shippingAnomData = app_sm.selectAll(tblnk,"nk_type =?",
        new Object[]{"shippingAnon"},"nk_createdate ASC");
for(TableRecord data:shippingAnomData) {
shippingAnom += data.getInt("nk_sequence");
}
shippingAnom += na.getInt("na_shipping_anom");
shippingTotal += shippingLogin+shippingAnom; 

//飛修員
int aircraftLogin = 0, //記名
    aircraftAnom = 0, //匿名
    aircraftTotal = 0; //總遊玩
Vector<TableRecord> aircraftLoginData = app_sm.selectAll(tblnk,"nk_type =?",
                                          new Object[]{"aircraftGame"},"nk_createdate ASC");
for(TableRecord data:aircraftLoginData) {
	aircraftLogin += data.getInt("nk_sequence");
}
aircraftLogin += na.getInt("na_aircraft_login");
Vector<TableRecord> aircraftAnomData = app_sm.selectAll(tblnk,"nk_type =?",
      new Object[]{"aircraftAnon"},"nk_createdate ASC");
for(TableRecord data:aircraftAnomData) {
	aircraftAnom += data.getInt("nk_sequence");
}
aircraftAnom += na.getInt("na_aircraft_anom");
aircraftTotal += aircraftLogin + aircraftAnom; 

//智慧製造洗手乳
int wisdomLogin = 0, //記名
    wisdomAnom = 0, //匿名
    wisdomTotal = 0; //總遊玩
Vector<TableRecord> wisdomLoginData = app_sm.selectAll(tblnk,"nk_type =?",
                                        new Object[]{"wisdomGame"},"nk_createdate ASC");
for(TableRecord data:wisdomLoginData) {
	wisdomLogin += data.getInt("nk_sequence");
}
wisdomLogin += na.getInt("na_wisdom_login");

Vector<TableRecord> wisdomAnomData = app_sm.selectAll(tblnk,"nk_type =?",
    new Object[]{"wisdomAnon"},"nk_createdate ASC");
for(TableRecord data:wisdomAnomData) {
	wisdomAnom += data.getInt("nk_sequence");
}
wisdomAnom += na.getInt("na_wisdom_anom");
wisdomTotal += wisdomLogin + wisdomAnom; 

//無人商店採購
int dreamLogin = 0, //記名
    dreamAnom = 0, //匿名
    dreamTotal = 0; //總遊玩
Vector<TableRecord> dreamLoginData = app_sm.selectAll(tblnk,"nk_type =?",
                                      new Object[]{"dreamGame"},"nk_createdate ASC");
for(TableRecord data:dreamLoginData) {
	dreamLogin += data.getInt("nk_sequence");
}
dreamLogin += na.getInt("na_dream_login");

Vector<TableRecord> dreamAnomData = app_sm.selectAll(tblnk,"nk_type =?",
  new Object[]{"dreamAnon"},"nk_createdate ASC");
for(TableRecord data:dreamAnomData) {
	dreamAnom += data.getInt("nk_sequence");
}
dreamAnom += na.getInt("na_dream_anom");
dreamTotal += dreamLogin + dreamAnom; 

//彩繪技職樂園
int paradiseLogin = 0, //記名
  paradiseAnom = 0, //匿名
  paradiseTotal = 0; //總遊玩
Vector<TableRecord> paradiseLoginData = app_sm.selectAll(tblnk,"nk_type =?",
                                    new Object[]{"paradiseGame"},"nk_createdate ASC");
for(TableRecord data:paradiseLoginData) {
	paradiseLogin += data.getInt("nk_sequence");
}
paradiseLogin += na.getInt("na_paradise_login");

Vector<TableRecord> paradiseAnomData = app_sm.selectAll(tblnk,"nk_type =?",
                                                      new Object[]{"paradiseAnon"},"nk_createdate ASC");
for(TableRecord data:paradiseAnomData) {
	paradiseAnom += data.getInt("nk_sequence");
}
paradiseAnom += na.getInt("na_paradise_anom");
paradiseTotal += paradiseLogin + paradiseAnom; 

//智能雞舍
int farmingLogin = 0, //記名
    farmingAnom = 0, //匿名
    farmingTotal = 0; //總遊玩
Vector<TableRecord> farmingLoginData = app_sm.selectAll(tblnk,"nk_type =?",
                                  new Object[]{"farmingGame"},"nk_createdate ASC");
for(TableRecord data:farmingLoginData) {
	farmingLogin += data.getInt("nk_sequence");
}
farmingLogin += na.getInt("na_farming_login");

Vector<TableRecord> farmingAnomData = app_sm.selectAll(tblnk,"nk_type =?",
                                                    new Object[]{"farmingAnon"},"nk_createdate ASC");
for(TableRecord data:farmingAnomData) {
	farmingAnom += data.getInt("nk_sequence");
}
farmingAnom += na.getInt("na_farming_anom");
farmingTotal += farmingLogin + farmingAnom;

//抓魚
int fishingLogin = 0, //記名
    fishingAnom = 0, //匿名
    fishingTotal = 0; //總遊玩
Vector<TableRecord> fishingLoginData = app_sm.selectAll(tblnk,"nk_type =?",
                                new Object[]{"aquaticGame"},"nk_createdate ASC");
for(TableRecord data:fishingLoginData) {
	fishingLogin += data.getInt("nk_sequence");
}
fishingLogin += na.getInt("na_fishing_login");

Vector<TableRecord> fishingAnomData = app_sm.selectAll(tblnk,"nk_type =?",
                                                  new Object[]{"aquaticAnon"},"nk_createdate ASC");
for(TableRecord data:fishingAnomData) {
	fishingAnom += data.getInt("nk_sequence");
}
fishingAnom += na.getInt("na_fishing_anom");

fishingTotal += fishingLogin + fishingAnom;

//農業小幫手
int droneLogin = 0, //記名
    droneAnom = 0, //匿名
    droneTotal = 0; //總遊玩
Vector<TableRecord> droneLoginData = app_sm.selectAll(tblnk,"nk_type =?",
                              new Object[]{"droneGame"},"nk_createdate ASC");
for(TableRecord data:droneLoginData) {
	droneLogin += data.getInt("nk_sequence");
}
droneLogin += na.getInt("na_drone_login");

Vector<TableRecord> droneAnomData = app_sm.selectAll(tblnk,"nk_type =?",
                                                new Object[]{"droneAnon"},"nk_createdate ASC");
for(TableRecord data:droneAnomData) {
	droneAnom += data.getInt("nk_sequence");
}
droneAnom += na.getInt("na_drone_anom");

droneTotal += droneLogin + droneAnom;

//小建築大工程
int buildLogin = 0, //記名
	buildAnom = 0, //匿名
	buildTotal = 0; //總遊玩
Vector<TableRecord> buildLoginData = app_sm.selectAll(tblnk,"nk_type =?",
                            new Object[]{"buildGame"},"nk_createdate ASC");
for(TableRecord data:buildLoginData) {
	buildLogin += data.getInt("nk_sequence");
}
buildLogin += na.getInt("na_build_login");

Vector<TableRecord> buildAnomData = app_sm.selectAll(tblnk,"nk_type =?",
                                              new Object[]{"buildAnon"},"nk_createdate ASC");
for(TableRecord data:buildAnomData) {
	buildAnom += data.getInt("nk_sequence");
}
buildAnom += na.getInt("na_build_anom");

buildTotal += buildLogin + buildAnom;

//花草實驗室
int flowerLogin = 0, //記名
	flowerAnom = 0, //匿名
	flowerTotal = 0; //總遊玩
Vector<TableRecord> flowerLoginData = app_sm.selectAll(tblnk,"nk_type =?",
                          new Object[]{"flowerGame"},"nk_createdate ASC");
for(TableRecord data:flowerLoginData) {
	flowerLogin += data.getInt("nk_sequence");
}
flowerLogin += na.getInt("na_flower_login");

Vector<TableRecord> flowerAnomData = app_sm.selectAll(tblnk,"nk_type =?",
                                            new Object[]{"flowerAnon"},"nk_createdate ASC");
for(TableRecord data:flowerAnomData) {
	buildAnom += data.getInt("nk_sequence");
}
flowerAnom += na.getInt("na_flower_anom");

flowerTotal += flowerLogin + flowerAnom;

//積木樂園
int brickLogin = 0, //記名
	brickAnom = 0, //匿名
	brickTotal = 0; //總遊玩
Vector<TableRecord> brickLoginData = app_sm.selectAll(tblnk,"nk_type =?",
                        new Object[]{"brickGame"},"nk_createdate ASC");
for(TableRecord data:brickLoginData) {
	brickLogin += data.getInt("nk_sequence");
}
brickLogin += na.getInt("na_brick_login");

Vector<TableRecord> brickAnomData = app_sm.selectAll(tblnk,"nk_type =?",
                                          new Object[]{"brickAnon"},"nk_createdate ASC");
for(TableRecord data:brickAnomData) {
	brickAnom += data.getInt("nk_sequence");
}
brickAnom += na.getInt("na_brick_anom");

brickTotal += brickLogin + brickAnom;

//森林
int forestLogin = 0, //記名
	forestAnom = 0, //匿名
	forestTotal = 0; //總遊玩
Vector<TableRecord> forestLoginData = app_sm.selectAll(tblnk,"nk_type =?",
                      new Object[]{"forestGame"},"nk_createdate ASC");
for(TableRecord data:forestLoginData) {
	forestLogin += data.getInt("nk_sequence");
}
forestLogin += na.getInt("na_forest_login");

Vector<TableRecord> forestAnomData = app_sm.selectAll(tblnk,"nk_type =?",
                                        new Object[]{"forestAnon"},"nk_createdate ASC");
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

/* 會員總數 2023/09/08 新增 */
Vector<TableRecord> mpts = app_sm.selectAll(tblmp);
int member_total = mpts.size();

/* Ouput records as json */
JSONObject json = new JSONObject();

json.put("member_total", member_total); // 會員總數
json.put("total_play", total_play);
json.put("login_play", login_play);
json.put("anom_play", anom_play);

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