<!DOCTYPE html>
<html>
	<head>
	<title></title>
	</head>
	<body>	
	<?php
		  extract ($_POST);
		  $resp_email = filter_var($email3, FILTER_VALIDATE_EMAIL);
		  if ($resp_email)
			  echo "<p>Endereço do email ok!</p>";
		  else 
			   echo "<p>Endereço do email inválido!</p>";
		  $resp_url = filter_var($site3, FILTER_VALIDATE_URL);
		  if ($resp_url)
			  echo "<p>Endereço do site (URL) ok!</p>";
		  else 
			  echo "<p>Endereço do site (URL) inválido!</p>";
	  ?>   
	  <!-- Saiba mais: http://php.net/manual/en/filter.filters.validate.php -->
	  
	</body>
</html>