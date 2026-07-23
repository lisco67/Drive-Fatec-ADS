<!DOCTYPE html>
<html>
	<head>
	<title></title>
	</head>
	<body>	
	  <?php
		$data = filter_input_array( INPUT_GET, [
					   'nome2' => FILTER_SANITIZE_STRING,
					   'email2' => FILTER_SANITIZE_EMAIL,
					   'site2' => FILTER_SANITIZE_URL
					  ]);       // Limpa os dados de caracteres HTML; 
	   extract($data);  //Extrai dados e salva-os nas respectivas variáveis.
	   echo "Oi $nome2, seu email é $email2 e seu site: $site2.<br />";
	  ?>     
	</body>
</html>