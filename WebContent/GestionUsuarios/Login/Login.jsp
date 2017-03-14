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

      <link rel="stylesheet" href="GestionUsuarios/Login/css/style.css" type="text/css">

  <link href="Bootstrap/css/bootstrap.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
</head>

<body class="fondo">
<%
if(session.getAttribute("usuario")!=null)
{
	response.sendRedirect("Inicio");
}
%>
<div class="container-fluid">
<div class="row">
  <div class="col-md-1 col-sm-1 col-xs-0"></div>
  <div class="col-md-10 col-sm-10 col-xs-12" style="padding-left:0;padding-right:0">
  <form action="ServeletLogin" method="POST" onsubmit="return valideDatos();">
		<!-- Creo un campo oculto con el valor del get con el código de la validación
		para poder validar el usuario y que solo pueda acceder a la cuenta a través
		del link que enviamos por correo -->
<input type="hidden" name="validacion" value="<%=request.getParameter("validacion")  %>">
  <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Entrar</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
		<div class="login-form">
			<div class="sign-in-htm">
			
			   <%
			   // Voy a recorrer un array con cookies para ver si estan almacenadas, en caso afirmativo le pondre al formulario las cookies que tnego almacenadas
					    Cookie[] cookies=request.getCookies();
					    String userName = "", password = "",rememberVal="";
					    if (cookies != null) {
					         for (Cookie cookie : cookies) {
					           if(cookie.getName().equals("cookuser")) {
					             userName = cookie.getValue();
					           }
					           if(cookie.getName().equals("cookpass")){
					             password = cookie.getValue();
					           }
					           if(cookie.getName().equals("cookrem")){
					           rememberVal = cookie.getValue();
					           }
					        }
					    }
					%>
					
				<div class="group">
					<label for="user" class="label">Usuario</label>
					<input type="text" class="input" name="usuario" id="usuario" value="<%=userName%>" />
				</div>
				<div class="group">
					<label for="pass" class="label">Contraseña</label>
					<input id="pass" type="password" class="input" data-type="password" name="password" >
				</div>
				
				
				
		<%
		//Si recojo que la variable erronea , debo poner en el jsp de login una etiqueta que ponga usuario erroneo
		
						   String titulo =""+session.getAttribute("fallo");
						  // System.out.print("fallo null o no "+titulo);
						   if (titulo.equals("loginerroneo")) {
							   %>
							   <div class="error">
							<label for="user" class="label">Usuario o contraseña Incorrectas</label>
							</div>
							   <%
						   }
						 
		 //esto seria en caso de recoger un atributo solo, un usuario, ahora vamos a probar a recoger un objeto con varios datos*/
		 %>
				<div class="group">
					<input id="check" type="checkbox" class="check" name="check" >
					<label for="check" style="color:#aaa"><span class="icon"></span> Recordar Usuario</label>
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
  
  </div>
  <div class="col-md-1 col-sm-1 col-xs-0"></div>
</div>
</div>
  
</body>
</html>
