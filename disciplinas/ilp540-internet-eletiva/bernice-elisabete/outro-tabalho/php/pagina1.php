<!DOCTYPE html>
<html>
	<head>
	<title></title>
	</head>
	<body>	
		<?php
			setcookie("cor","vermelho");
		?>
		
		<?php
		$nome = "xyz";
		$valor = "Marcos de Moura";
		setcookie($nome,$valor,time()+3600);
		?>
		
		<?php
		session_start();
		$_SESSION["nome"] = "Amanda";
		$_SESSION["setor"] = "Administrativo";
		?>
		
		<a href="pagina2.php">Página Dois</a>
	</body>
</html>