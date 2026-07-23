<?php  
session_start();
$id = $_SESSION['sid'];

@require("connect7.php");  
$bd = "bdcrud7";
$tb = "tbcrud7";

if(isset($_POST) & !empty($_POST)){
    $upd = "UPDATE $bd.$tb SET firstname=:firstname, lastname=:lastname, email=:email, gender=:gender, age=:age WHERE id=:id";
    $result = $conx->prepare($upd);
    $res = $result->execute(
    array(
        ':firstname' 	=> $_POST['fnome'],
        ':lastname' 	=> $_POST['fsbnome'],
        'email' 		=> $_POST['femail'],
        'gender' 		=> $_POST['fsex'],
        'age' 			=> $_POST['fidade'],
        'id' 			=> $_SESSION['sid']
    ));
}
else
   header("location: view7.php");

if($res){
    header("location: view7.php");
 }else{
 	echo "failed to update data";
 }
 $conx = null;    
?>        