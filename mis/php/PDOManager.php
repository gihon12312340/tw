<?php
/**
 *  資料庫連結器
 */

class PDOManager {
    public $pdo;
    private $dbhost;
    private $dbname;
    private $dbuser;
    private $dbpass;

    public function __construct() {
      $this->dbhost = DB_HOST;
      $this->dbname = DB_NAME;
      $this->dbuser = DB_USER;
      $this->dbpass = DB_PASS;
  }

    public function connect() {
      try{
        $this->pdo = new PDO("mysql:host={$this->dbhost};dbname={$this->dbname}", $this->dbuser, $this->dbpass);
        $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // set the PDO error mode to exception
        $this->pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        $this->pdo->setAttribute(PDO::ATTR_STRINGIFY_FETCHES, false);
        $this->pdo->query("SET CHARACTER SET UTF8");
      }
      catch(PDOException $e){
        $logTime = date("d-M-Y H:i:s e");
        error_log("[{$logTime}] '{$_SERVER["PHP_SELF"]}': connect error -> {$e->getMessage()}\n", 3, "error_log");
        return false;
      }
      return true;
    }
}
?>