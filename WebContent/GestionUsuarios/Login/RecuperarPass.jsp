<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recuperar contraseña</title>

<link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Open+Sans:600'>

      <link rel="stylesheet" href="GestionUsuarios/Login/css/stylerecup.css" type="text/css">

  
</head>

<body class="fondo">

<form action="ServerletRecuperarPass" method="POST">

  <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Recuperar contraseña</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
		<div class="login-form">
			<div class="sign-in-htm">
			
			   
					
				<div class="group">
					<label for="user" class="label">Email</label>
					<input type="text" class="input" name="email" id="email" value="" />
				</div>
				
				
			<div class="group">
					<input type="submit" class="button" value="Recuperar contraseña">
			</div>
			</div>
		</div>
	</div>
</div>
</form>
  
</body>
</html>