<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<?php echo "<p>Bem-vindo ao PHP!</p>";  ?>
	<?php print "<p>Bem-vindo ao PHP!</p>";  ?>
	<?= "<p>Bem-vindo ao PHP!</p>";  ?> 
	<?#=phpinfo();?>
	
	<?php
		$cor = "amarela";
		$frase1 = "A cor $cor alegra o ambiente. <br />";
		echo $frase1;
		
		$frase2 = 'A cor $cor alegra o ambiente. <br />';
		echo $frase2;
		
		$a = 5;
		$nome = "Vini CP";
		echo var_dump($a)."<br />";
		echo var_dump($nome)."<br />";
		
		$b = 3.9;
		echo var_dump($b)."<br />";
		$b = (int)$b;
		echo var_dump($b)."<br />";
		$x = 10;
		if (is_int($x))
			echo "<br>Sim, a variável é do tipo inteiro!";
		else
			echo "<br>Não, a variável não é do tipo inteiro.";
		
		define("AMIGO", "FABIO C.");
			echo "<br />" . AMIGO;	
			
		$string = "Mauricio programador";
		echo sha1($string);
	?>
	
	

</body>
</html>