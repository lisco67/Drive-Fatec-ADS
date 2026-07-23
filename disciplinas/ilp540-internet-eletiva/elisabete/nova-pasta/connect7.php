<?php
$host = "localhost";
$user = "root";
$pass = "";
$bd = "bdcrud7";

try {
    $conx = new PDO("mysql:host=$host;dbname=$bd", $user, $pass); 
    $conx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
    //echo "Conexão ok!<br>";
}
catch(PDOException $e) {
    echo $criadb . "Falha na conexão:<br />" . $e->getMessage();
   
}  
?>  