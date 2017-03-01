<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >

<script type="text/javascript">


function carga() {
	
	document.getElementById("usuario").focus();
	
}

function valideDatos() {
	
	var usuario = document.getElementById("usuario");
	var password = document.getElementById("pass");
	
	if (usuario.value == "" || usuario.value=='')
		{
			alert("Ingresa tu usuario");
			usuario.focus();
			return false;
		}else if (password.value == "" || password.value=='')
		{
			alert("Ingresa tu password");
			password.focus();
			return false;
		}
		else {
			return true;
		}
	
}

</script>

<head>
  <meta charset="UTF-8">
  <title>Estudiantes Conecta2</title>
 	 <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Open+Sans:600'>

      <link rel="stylesheet" href="css/style.css" type="text/css">

  
</head>

<body class="fondo">


<form action="../../ServeletLogin" method="POST" onsubmit="return valideDatos();">

  <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Entrar</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
		<div class="login-form">
			<div class="sign-in-htm">
				<div class="group">
					<label for="user" class="label">Usuario</label>
					<input type="text" class="input" name="usuario" id="usuario">
				</div>
				<div class="group">
					<label for="pass" class="label">Contraseña</label>
					<input id="pass" type="password" class="input" data-type="password" name="password" >
				</div>
				<div class="group">
					<input id="check" type="checkbox" class="check" checked>
					<label for="check"><span class="icon"></span> Recordar Usuario</label>
				</div>
				<div class="group">
					<input type="submit" class="button" value="Entrar">
				</div>
				<div class="hr"></div>
				<div class="foot-lnk">
					<a href="#forgot">Recuperar Contraseña</a>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
  
</body>
</html>
