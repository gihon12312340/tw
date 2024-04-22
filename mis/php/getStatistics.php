<?php
// header("Access-Control-Allow-Origin: *");
header("Content-type: application/json");
require_once("config_mysql.php");
require_once('PDOManager.php');

$availableTables = ["game_business", "game_magic"];
if(!isset($_REQUEST["table"]) or !in_array($_REQUEST["table"], $availableTables)){
  die('{"code":400, "msg":"Table info error."}');
}

$pdoManager = new PDOManager();
if($pdoManager->connect()){
  $logTime = date("d-M-Y H:i:s e");
  try{
    $sql = "SELECT SUM(ISNULL(account)) AS anom, SUM(!ISNULL(account)) AS login from {$_REQUEST["table"]};"
    $query = $pdoManager->pdo->query($sql);    
    return json_encode(array("code"=>200, "results"=>$query->fetch_assoc()));
  }
  catch(PDOException $e){
    error_log("[{$logTime}] '{$_SERVER["PHP_SELF"]}': query error -> {$e->getMessage()}\n", 3, "error_log");
    error_log("[{$logTime}] '{$_SERVER["PHP_SELF"]}': insert fail -> ($box_type, $exterier, $edition_type, $content_type, $card, $count, $price, $name, $sex, $age, $phone, now())\n", 3, "error_log");
    exit(array("result"=>false, "msg"=>"error"));
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