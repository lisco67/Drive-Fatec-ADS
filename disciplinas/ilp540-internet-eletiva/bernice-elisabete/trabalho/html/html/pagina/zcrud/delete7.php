<?php

@require_once('connect7.php');
$tb = "tbcrud7";	
 
$del = "DELETE FROM $tb WHERE id=?";
$result = $conx->prepare($del);
$res = $result->execute(array($_GET['varid']));

if($res){
 	header('location: view7.php');
 }else{
 	echo "Failed to Delete Record";
 }
$conx = null;    
?>        
