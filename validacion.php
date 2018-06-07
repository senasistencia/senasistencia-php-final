<?php 
session_start();
if(isset($_SESSION['usuario'])){
	
	header('Location: vistas/usuario/index.php');
}

if($_SERVER['REQUEST_METHOD']=='POST'){
    $usuario = $_POST['usuario'];
    $password = $_POST['password'];
    //echo $usuario, $password;
    require('conexion.php');
    $sql = "SELECT FK_DocCliente, Tipo_Rol FROM cliente_rol inner join rol inner join cliente 
            on Documento_Cliente = FK_DocCliente AND FK_Rol = ID_Rol 
        WHERE Documento_Cliente = (SELECT FK_DocCliente FROM usuario WHERE usuario.FK_DocCliente = ? AND usuario.Password_Hash = ?)";
    $consulta = $PDO->prepare($sql);
    $consulta->execute(array($usuario,$password));
    $us = $consulta->fetchAll(PDO::FETCH_ASSOC);
    if(isset($us)){
        print_r($us);
        if(empty($us[0]['FK_DocCliente'])){
            echo "vacio";
        }elseif($us[0]['Tipo_Rol'] == "Usuario"){
            echo "el usuer :(";
        }elseif($us[0]['Tipo_Rol'] == "Administrador" | "administrador"){
            echo "admin";
        }
    }
    
    
}else{
    echo "el else";
}




?>


