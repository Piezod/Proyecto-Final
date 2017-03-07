<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>
function comprobarpass(){
	if(document.getElementById("pass").value.length<6){
		document.getElementById("errorpass").className="error"
		document.getElementById("errorpass").innerHTML='<p style="font-size:90%">La contraseña es demasiado corta<br>(6 caracteres mínimo)'
		document.getElementById("recu").disabled=true
		}else{
		document.getElementById("recu").disabled=false
		document.getElementById("errorpass").className=""
		document.getElementById("errorpass").innerHTML=""
	}

}
function comprobarcpass(){
	if(document.getElementById("cpass").value!=document.getElementById("pass").value){
		document.getElementById("errorcpass").className="error"
		document.getElementById("errorcpass").innerHTML='<p style="font-size:90%">Las contraseñas no coinciden'
		document.getElementById("recu").disabled=true
		}else{
		document.getElementById("recu").disabled=false
		document.getElementById("errorcpass").className=""
		document.getElementById("errorcpass").innerHTML=""
	}
}

<% if((session.getAttribute("error")+"").equals("incorrecto")){ %>
window.onload=function emailduplicado(){
alert("El email no existe en nuestra base de datos")
}

<%}if((session.getAttribute("error")+"").equals("correcto")){ %>
window.onload=function emailcorrecto(){
	alert("Email correcto le hemos enviado un correo para que restaure su contraseña")
	}
<%}if((session.getAttribute("codigoinvalido")+"").equals("si")){%>

window.onload=function validacionincorrecta(){
	alert("El codigo de validacion no es correcto")
	}
<%}%>

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recuperar contraseña</title>

<link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Open+Sans:600'>

      <link rel="stylesheet" href="GestionUsuarios/Login/css/stylerecup.css" type="text/css">

  
</head>

<body class="fondo">
<% if((request.getParameter("cod")+"").equals("null")){ %>
<form action="ServerletRecuperarPass" method="POST">
<input type="hidden" name="caso" value="email">

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
  <%}else{ %>
  <form method="post" action="ServerletRecuperarPass">
  <input type="hidden" name="caso" value="pass">
  <input type="hidden" name="cod" id="cod" value="<%=request.getParameter("cod") %>">
  <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Recuperar contraseña</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
	<div class="login-form">
			<div class="sign-in-htm">
			
			   
					
				<div class="group">
					<label for="user" class="label">Nueva contraseña</label>
					<input type="password" class="input" name="pass" id="pass" value="" onchange="return comprobarpass();"/>
				</div>
				<div id="errorpass"></div>
				
				<div class="group">
					<label for="user" class="label">Confirme la contraseña</label>
					<input type="password" class="input" name="cpass" id="cpass" value="" onchange="return comprobarcpass();"/>
				</div>
				<div id="errorcpass"></div>
				
			<div class="group">
					<input type="submit" id="recu" class="button" value="Aplicar contraseña">
			</div>
			</div>
		</div>
		</div>
		</div>
  
  </form>
  <%}
	session.invalidate();%>
</body>
</html>