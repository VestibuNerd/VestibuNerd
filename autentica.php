<?php 
	//$conexao = require_once('conexao.php');
	
	$conexao = new mysqli('localhost', 'root', 'bcd127', 'dbvestibunerd');
	
	$apelido = $_GET['apelido'];
	$senha = $_GET['senha'];
	
	$sql = "SELECT * FROM tblvestibulando WHERE apelido='".$apelido."' AND senha='".$senha."';";

	$select = mysqli_query($conexao, $sql);
	
	if($rsusuario=mysqli_fetch_array($select)){
		$vestibulando = array(
			'idVestibulando'=>$rsusuario['idVestibulando'],
			'idCartao'=>$rsusuario['idCartao'],
			'apelido'=>$rsusuario['apelido'],
			'nome'=>$rsusuario['nome'],
			'email'=>$rsusuario['email'],
			'celular'=>$rsusuario['celular']);
		
		$usuario_json = json_encode($vestibulando);
		
		echo($usuario_json);
	}
	
	mysqli_close($conexao);
?>