<?php
require('config.php');
    try
    {
      $PDO = new PDO("mysql:host=$server;port=$puertoBD;dbname=$baseDatos;charset=utf8",$user,$pass);
      $PDO->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
      //echo "se conecto";//probar conexion
      
    } catch (PDOException $error)
    {
      echo "no se conecto a la base de datos codigo de error: ";
      die($error->getMessage());
    }

?>