<?php
    try
    {
      $PDO = new PDO("mysql:host=localhost;dbname=senasistencia;charset=utf8","root","");
      $PDO->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $error)
    {
      echo "no se conecto a la base de datos codigo de error: ";
      die($error->getMessage());
    }

?>