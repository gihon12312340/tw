<?php
header("Access-Control-Allow-Origin: *");
header("Content-type: application/json");
require_once("config_mysql.php");
require_once('PDOManager.php');

if(
  isset($_POST["box_type"]) && 
  isset($_POST["exterier"]) && 
  isset($_POST["edition_type"]) && 
  isset($_POST["content_type"]) && 
  isset($_POST["card"]) && 
  isset($_POST["count"]) && 
  isset($_POST["price"]) && 
  isset($_POST["name"]) && 
  isset($_POST["sex"]) && 
  isset($_POST["age"]) && 
  isset($_POST["phone"])
){
  $box_type = test_input($_POST["box_type"]);
  $exterier = test_input($_POST["exterier"]);
  $edition_type = test_input($_POST["edition_type"]);
  $content_type = test_input($_POST["content_type"]);
  $card = test_input($_POST["card"]);
  $count = test_input($_POST["count"]);
  $price = test_input($_POST["price"]);
  $name = test_input($_POST["name"]);
  $sex = test_input($_POST["sex"]);
  $age = test_input($_POST["age"]);
  $phone = test_input($_POST["phone"]);
}
else{
  $json = json_decode(file_get_contents('php://input'), true);
  if(
    isset($json["box_type"]) && 
    isset($json["exterier"]) && 
    isset($json["edition_type"]) && 
    isset($json["content_type"]) && 
    isset($json["card"]) && 
    isset($json["count"]) && 
    isset($json["price"]) && 
    isset($json["name"]) && 
    isset($json["sex"]) && 
    isset($json["age"]) && 
    isset($json["phone"])
  ){
    $box_type = test_input($json["box_type"]);
    $exterier = test_input($json["exterier"]);
    $edition_type = test_input($json["edition_type"]);
    $content_type = test_input($json["content_type"]);
    $card = test_input($json["card"]);
    $count = test_input($json["count"]);
    $price = test_input($json["price"]);
    $name = test_input($json["name"]);
    $sex = test_input($json["sex"]);
    $age = test_input($json["age"]);
    $phone = test_input($json["phone"]);
  }
  else{
    http_response_code(400);
    die('{"code":400, "msg":"Lack of fields."}');
  }
}

$pdoManager = new PDOManager();
if($pdoManager->connect()){
  $logTime = date("d-M-Y H:i:s e");
  try{
    $query = $pdoManager->pdo->prepare("INSERT INTO `orders` (`id`, `box_type`, `exterier`, `edition_type`, `content_type`, `card`, `count`, `price`, `name`, `sex`, `age`, `phone`, `create_at`)
      VALUES(NULL, :box_type, :exterier, :edition_type, :content_type, :card, :count, :price, :name, :sex, :age, :phone, now());");
    $query->execute(array(
      ":box_type" => $box_type, 
      ":exterier" => $exterier, 
      ":edition_type" => $edition_type, 
      ":content_type" => $content_type, 
      ":card" => $card,
      ":count" => $count, 
      ":price" => $price, 
      ":name" => $name, 
      ":sex" => $sex, 
      ":age" => $age, 
      ":phone" => $phone
    ));
    if($query->rowCount() == 0){
      error_log("[{$logTime}] '{$_SERVER["PHP_SELF"]}': insert fail -> ($box_type, $exterier, $edition_type, $content_type, $card, $count, $price, $name, $sex, $age, $phone, now())\n", 3, "error_log");
      http_response_code(400);
      die('{"code":400, "msg":"Nothing inserted."}');
    }
    
    $id = sprintf("%06d", $pdoManager->pdo->lastInsertId());
    # Line broadcast
    require_once("config_line.php");
    require_once('LineController.php');
    $Line = new LineController();
    $info = $Line->broadcastText(
      "一之鄉客製化禮盒訂單通知".PHP_EOL.
      "訂單編號：$id".PHP_EOL.
      "--禮盒資訊--".PHP_EOL.
      "盒型：$box_type".PHP_EOL.
      "外觀：$exterier".PHP_EOL.
      "版型：$edition_type".PHP_EOL.
      "內容物：$content_type".PHP_EOL.
      "卡片：$card".PHP_EOL.
      "禮盒數量：$count".PHP_EOL.
      "總價：$price".PHP_EOL.
      "--使用者資訊--".PHP_EOL.
      "姓名：$name".PHP_EOL.
      "性別：$sex".PHP_EOL.
      "年齡：$age".PHP_EOL.
      "手機：$phone"
    );
    exit(json_encode(array("code"=>200, "msg"=>"Success", "id"=>"{$id}")));
  }
  catch(PDOException $e){
    error_log("[{$logTime}] '{$_SERVER["PHP_SELF"]}': query error -> {$e->getMessage()}\n", 3, "error_log");
    error_log("[{$logTime}] '{$_SERVER["PHP_SELF"]}': insert fail -> ($box_type, $exterier, $edition_type, $content_type, $card, $count, $price, $name, $sex, $age, $phone, now())\n", 3, "error_log");
    return array("result"=>false, "msg"=>"error");
  }
}
else{
  http_response_code(500);
  die('{"code":500, "msg":"Internal Server Error"}');
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>