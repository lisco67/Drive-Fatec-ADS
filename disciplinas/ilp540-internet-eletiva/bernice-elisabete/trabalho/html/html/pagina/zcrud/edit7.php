<?php
//SELECT ID
require_once('connect7.php');
$bd = "bdcrud7";
$tb = "tbcrud7";

$id = $_GET['varid'];

session_start();
$_SESSION['sid']= $id;

$sel = "SELECT * FROM $bd.$tb WHERE id=$id";
$selid = $conx->query($sel); 
$linha = $selid->fetch(PDO::FETCH_ASSOC);

?>

<!Doctype html>
<html>
    <head>
    <title>Edita</title>
    </head>
    <body>
<form method="post" action="update7.php">
	<h2>Editar</h2>    
	   <p>
	      Nome: <input type="text" name="fnome" value="<?=$linha['firstname'] ?>" placeholder="First Name" />
	   </p><p>
	      Sobrenome: <input type="text" name="fsbnome" value="<?=$linha['lastname'] ?>" placeholder="Last Name" />
	   </p><p>
	      E-mail: <input type="email" name="femail" value="<?=$linha['email'] ?>" placeholder="E-Mail" />
	   </p><p>
	      Sexo: <input type="radio" name="fsex" value="m" <?php if($linha['gender'] == 'm'){ echo "checked";} ?>> M
    
	      <input type="radio" name="fsex" value="f" <?php if($linha['gender'] == 'f'){ echo "checked";} ?>> F
	   </p><p>
		  Idade: <select name="fidade">
			<option></option>
			<option value="20" <?php if($linha['age'] == '20'){ echo "selected";} ?>>20</option>
			<option value="21" <?php if($linha['age'] == '21'){ echo "selected";} ?>>21</option>
			<option value="22" <?php if($linha['age'] == '22'){ echo "selected";} ?>>22</option>
			<option value="23" <?php if($linha['age'] == '23'){ echo "selected";} ?> >23</option>
			<option value="24" <?php if($linha['age'] == '24'){ echo "selected";} ?>>24</option>
			<option value="25" <?php if($linha['age'] == '25'){ echo "selected";} ?>>25</option>
		  </select>
	   </p><p>
	      <input type="submit" value="Alterar" />
          
       </p>    
</form>
        
<?php    
  $conx = null;  
?>        
                                
</body>
</html>