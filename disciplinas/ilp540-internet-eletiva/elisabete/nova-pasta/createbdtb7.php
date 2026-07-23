<?php

$host = "localhost";
$bd = "bdcrud7";
$user = "root";
$pass = "";
$tb = "tbcrud7";

try {
    $conx = new PDO("mysql:host=$host", $user, $pass);   // Primeira vez sem o dbname.
    $conx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
    $criadb = "CREATE DATABASE IF NOT EXISTS $bd";
    $conx->exec($criadb);
    echo "Database ok!<br>";  // Para teste.
}
catch(PDOException $e) {
    echo $criadb . "Falha na criação do Banco:<br />" . $e->getMessage();
}  

try {  
  $conx = new PDO("mysql:host=$host;dbname=$bd", $user, $pass);  // Demais vezes com o dbname.
  $criatab = "CREATE TABLE IF NOT EXISTS $bd.$tb (
    `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `firstname` varchar(255) NOT NULL,
    `lastname` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `gender` varchar(255) NOT NULL,
    `age` varchar(255) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1";
  $conx->exec($criatab); 
  echo "Tabela ok!<br>";  // Para teste.  
}
catch(PDOException $e) {
    echo $criatab . "Falha na criação da Tabela:<br />" . $e->getMessage();
}     


$conx = null; 
?>  