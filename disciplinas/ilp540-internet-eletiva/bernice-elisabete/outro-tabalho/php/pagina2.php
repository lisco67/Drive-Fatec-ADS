<!DOCTYPE html>
<html>
	<head>
	<title></title>
	</head>
	<body>	
		<?php
		echo $_COOKIE["cor"];
		setcookie("cor","azul");
		print_r($_COOKIE);

		//echo $_COOKIE['xyz'];
		setcookie("xyz","Marcos de Moura",time()-1);
		?>
		
		<?php
		session_start();
		echo "<br>Nome: " . $_SESSION["nome"].".<br>";
		echo "Setor: " . $_SESSION["setor"].".";
		?>
	</body>
</html>