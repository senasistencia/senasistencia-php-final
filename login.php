<?php
session_start();
if(isset($_SESSION['usuario'])){
	
	header('Location: vistas/usuario/index.php');
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

		<link rel="stylesheet" href="css/estilos.css">
	</head>

	<body class="grey lighten-3">
		<div class="container">
			<div class="row">
				<form action="validacion.php" method="post" class="card col s12 m8 push-m2 l6 push-l3 login z-depth-1 grey lighten-5">
					<div class="section">
						<img class="logo-login" src="imagenes/logo-login.png" alt="perra">
					</div>
					<div class="divider col s12"></div>
					<div class="section">	
						<div class="row">
							<input name="usuario" class="col s8 offset-s2 validate" type="number" placeholder="Numero de identificación" required="true">
							<input name="password" class="col s8 offset-s2 validate" type="password" placeholder="Contraseña" required="true">
							<button class="btn waves-effect waves-light col s4 offset-s4 z-depth-0 cyan darken-3" type="submit">Ingresar</button>
						</div>						
						<div class="divider"></div>
						<div class="section center-align">
							<a href="" >Recuperar contraseña</a>
						</div>
					</div>
				</form>
			</div>
		</div>
  <div class="footer">
		<strong>© 2018 SENASISTENCIA</strong>		
	</div>


















		<!--CDN solo funciona con internet -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
		<!--libreria local
		<script type="text/javascript" src="js/materialize.min.js"></script>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script> -->
</body>
</html>