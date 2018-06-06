<?php 
session_start();
if(!isset($_SESSION['usuario'])){
	
	header('Location: ../../login.php');
}

?>
<!DOCTYPE html>
<html>
<head>
		<!--Import Google Icon Font-->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<!--Import materialize.css-->
		<!-- <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/> estilos locales-->
		<!-- CDN solo funciona con internet-->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

		<link rel="stylesheet" href="../../css/estilos.css">
</head>
<body>