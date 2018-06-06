<?php 
session_start();
if(isset($_SESSION['usuario'])){
	
	header('Location: vistas/usuario/index.php');
}

if($_SERVER['REQUEST_METHOD']=='POST'){
    $usuario = $_POST['usuario'];
    $password = $_POST['password'];
    require('conexion.php');
    $sql = "SELECT Estado_Usuario FROM usuario WHERE FK_DocCliente = ? && Password_Hash = ?";
    $consulta = $PDO->prepare($sql);
    $consulta->execute(array($usuario,$password));
    $tabla = $consulta->fetchAll(PDO::FETCH_OBJ);
       
   foreach ($tabla as $usuar) {
        
       echo $usuar->Estado_Usuario;
     
   }
    
    

}




?>


