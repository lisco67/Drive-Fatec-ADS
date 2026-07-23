<?php
// INSERT - Segurança: https://codingcyber.org/improve-php-security-7342/
$bd = "bdcrud7";
$tb = "tbcrud7";
@require_once('connect7.php');

if(isset($_POST) & !empty($_POST)){
    
    $sql = "INSERT INTO $bd.$tb (firstname, lastname, email, gender, age) VALUES(?,?,?,?,?)"; 
    // ?,?... - placeholders posicionais.
    
    $result = $conx->prepare($sql); 
    // prepare() - BD analisa/compila/otimiza ciclo.
    
    $result->bindParam(1, $fnome);  // com as variáveis extraídas...
    $result->bindParam(2, $fsbnome); 
    $result->bindParam(3, $femail);
    $result->bindParam(4, $fsex);
    $result->bindParam(5, $fidade);
    // Blindagem dos dados:
    
    extract($_POST); 
    // extract() - Recebe dados do formulário e atribui às variáveis.
    // Seis passos sobre segurança -> https://codingcyber.org/improve-php-security-7342/
    
    $res = $result->execute();
    // execute() - Pode executar várias vezes o $sql já preparado...
    
    if($res){
        header('location: view7.php');
     }else{
        echo "Falha na inclusão do cadastro...";
     }
}
$conx = null; 
?>