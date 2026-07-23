<!Doctype html>
<html>
<head>
<title>Listagem</title>
<script>
    function verifica(varid){
      if(confirm("Tem certeza que deseja excluir permanentemente este cadastro?"))  
        window.location="delete7.php?varid=" + varid;  
    }  
</script>  
</head>
<body>
    
<?php
//VIEW
$bd ="bdcrud7"; 
$tb ="tbcrud7"; 
@require_once('connect7.php');   
    
$sel = "SELECT * FROM $bd.$tb";
$result = $conx->query($sel);  // Retorna array.
?>
<h2>Listagem</h2>
<table class="table">
	<tr>
		<th>Id</th>
		<th>Nome</th>
		<th>E-Mail</th>
		<th>Sexo</th>
		<th>Idade</th>
		<th>Operação</th>
	</tr>  
<?php 
  while($linha = $result->fetch(PDO::FETCH_ASSOC)){
?>
<tr>
	<td><?= $linha['id']; ?></td>   <!-- Imprime dados. -->
	<td><?= $linha['firstname'] . " " . $linha['lastname']; ?></td>
	<td><?= $linha['email']; ?></td>
	<td><?= $linha['gender']; ?></td>
	<td><?= $linha['age']; ?></td>
	<td><a href="edit7.php?varid=<?=$linha['id']?>">Editar</a>
        <a href="#" onclick="verifica(<?=$linha['id']?>)">Excluir</a></td>
</tr>
<?php }
   //$result->rowCount() para DELETE, INSERT ou UPDATE: 
    ?>
<tr><td colspan="6"><?="Total de registros = ".$result->rowCount();?></td></tr>    
<tr><td colspan="6"><a href="#" onclick="window.location='formulario7.html';">Cadastrar</a></td></tr>    
</table> 
    
<?php    
  $conx = null;  
?> 
    
</body>
</html>