<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="serverlets.Conexion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>

<script>
		


	function cambiarhidden(id,valor){
		
		document.getElementById("bt"+id).innerHTML=valor+'<span class="caret"></span>'
		document.getElementById(id).value=valor
		
	}

	function comprobarregistro() {
		//Validaciones del formulario
		
		var error = "";
		if (document.getElementById("nombre").value.length == 0) {
			error += "El nombre no puede estar vacío antes de registrarse";
		}
		if (document.getElementById("apellido1").value.length == 0) {
			if (error.length != 0) {
				error += "\n";
			}
			error += "El primer apellido no puede estar vacío antes de registrarse";
		}
		if (document.getElementById("apellido2").value.length == 0) {
			if (error.length != 0) {
				error += "\n";
			}
			error += "El segundo apellido no puede estar vacío antes de registrarse";
		}
		if (document.getElementById("email").value.length == 0) {
			if (error.length != 0) {
				error += "\n";
			}
			error += "El email no puede estar vacío antes de registrarse";
		} else {
			var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

			if (!re.test(document.getElementById("email").value)) {
				if (error.length != 0) {
					error += "\n";
				}
				error += "El email no tiene un formato válido";
			}
		}
		
		
		if(document.getElementById("ciclo").value.length==0){
			if (error.length != 0) {
				error += "\n";
			}
			error += "Seleccione un ciclo";
		}
		if(document.getElementById("curso").value.length==0){
			if (error.length != 0) {
				error += "\n";
			}
			error += "Seleccione un curso";
		}
		
		if (error.length != 0) {
			alert(error);
			return false;
		} else {
			return true;
		}

	}
	
	<% if((session.getAttribute("Emailduplicado")+"").equals("si")){ %>
	window.onload=function emailduplicado(){
	alert("El email está duplicado")
	}
	
	
	
	<%} %>
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- Website CSS style -->
<link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Website Font style -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link rel="stylesheet" href="registro.css">
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Passion+One'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen'
	rel='stylesheet' type='text/css'>
	
	<script src="../../Bootstrap/js/ajax.js"></script>

<title>Admin</title>
</head>
<body>
		
	<div class="container">
		<div class="row main">
			<div class="main-login main-center">
				<form class="" id="registro" method="post"
					action="../../ServeletRegistro"
					onsubmit="return comprobarregistro();">

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Nombre</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"></i></span>
								<%
								//Esta comprobación nos vale para todo
								//Compruebo que el atributo de la sesion del nombre no exista
								//Así si existe lo relleno directamente con el valor en caso de
								//Fallo del login
								if(!(session.getAttribute("nombre")+"").equals("null")){
									
									%>
								<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre" value="<%=session.getAttribute("nombre") %>"/>
								
								
								<%}else{
								//Si no existe lo creo vacio
								%>
								<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre" />
								<%} %>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Primer apellido</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"></i></span>
								<%if(!(session.getAttribute("apellido1")+"").equals("null")){ %>
								<input type="text" class="form-control" name="apellido1" id="apellido1" placeholder="Primer apellido" value="<%=session.getAttribute("apellido1") %>"/>
								
								
								<%}else{ %>
								<input type="text" class="form-control" name="apellido1" id="apellido1" placeholder="Primer apellido" />
								<%} %>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Segundo apellido</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"></i></span>
								<%if(!(session.getAttribute("apellido2")+"").equals("null")){ %>
								<input type="text" class="form-control" name="apellido2" id="apellido2" placeholder="Segundo apellido" value="<%=session.getAttribute("apellido2") %>"/>
								
								
								<%}else{ %>
								<input type="text" class="form-control" name="apellido2" id="apellido2" placeholder="Segundo apellido" />
								<%} %>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="cols-sm-2 control-label">Email</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-envelope fa"></i></span>
								<%if(!(session.getAttribute("email")+"").equals("null")){ %>
								<input type="text" class="form-control" name="email" id="email" placeholder="Email" value="<%=session.getAttribute("email") %>"/>
						
								<%}else{%>
								<input type="text" class="form-control" name="email" id="email" placeholder="Email" />
								<%} %>
							</div>
						</div>
						<%if( (session.getAttribute("Emailduplicado")+"").equals("si")&&!(session.getAttribute("email")+"").equals("null")){ %>
						
						<div class="error">
						<p>El email está duplicado
						</div>
						
						<%} %>
					</div>

					

					<div class="form-group">
					<table width="100%">
					<tr>
					<td width="50%">
					<%
					//Realizo la misma comprobación de la variable de sesión pero con los input hiddens que son los que pasan
					//El valor del ciclo

					if(!(session.getAttribute("curso")+"").equals("null")){ %>
					<input type="hidden" name="ciclo" id="ciclo" value="<%=session.getAttribute("ciclo") %>">
						
								<%}else{%>
					<input type="hidden" name="ciclo" id="ciclo" value="">
								<%} %>
					
					<label class="cols-sm-2 control-label">Ciclo</label>
						
					</td>
					<td width="50%">
					<%if(!(session.getAttribute("curso")+"").equals("null")){ %>
					<input type="hidden" name="curso" id="curso" value="<%=session.getAttribute("curso") %>">
						
								<%}else{%>
					<input type="hidden" name="curso" id="curso" value="">
								<%} %>
					<label class="cols-sm-2 control-label">Curso</label>
						
					</td>
					</tr>
					<tr>
					<td width="50%">
					<div class="btn-group">
					<%
					//Realizo la misma comprobación de la variable de sesión pero con los botones
					if(!(session.getAttribute("ciclo")+"").equals("null")){ %>
						  <button id="btciclo" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("ciclo") %><span class="caret"></span></button>
						
								<%}else{%>
						  <button id="btciclo" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Seleccione el ciclo<span class="caret"></span></button>
								<%} %>
						  <ul class="dropdown-menu">

						    <li><a href="#" onclick="cambiarhidden('ciclo','DAM');return false">Desarrollo de Aplicaciones Multiplataforma(D.A.M)</a></li>
						    <li><a href="#" onclick="cambiarhidden('ciclo','AD');return false">Asistencia a la Dirección(A.D)</a></li>
						    <li><a href="#" onclick="cambiarhidden('ciclo','ASIR');return false">Administracion de Sistemas Informaticos y Redes(A.S.I.R)</a></li>
						    <li><a href="#" onclick="cambiarhidden('ciclo','SEA');return false">Sistemas Electrotécnicos y Automatizados(S.E.A)</a></li>
						    <li><a href="#" onclick="cambiarhidden('ciclo','AF');return false">Administración y Finanzas(A.F)</a></li>
						    
						  </ul>
						</div>
					</td>
					<td width="50%">
					
					<div class="btn-group">
					<%if(!(session.getAttribute("curso")+"").equals("null")){ %>
						  <button id="btcurso" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("curso") %><span class="caret"></span></button>
						
								<%}else{%>
						  <button id="btcurso" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Seleccione el curso<span class="caret"></span></button>
								<%} %>
						  <ul class="dropdown-menu">
						    <li><a href="#" onclick="cambiarhidden('curso','1º');return false">1º</a></li>
						    <li><a href="#" onclick="cambiarhidden('curso','2º');return false">2º</a></li>
						    
						  </ul>
						</div>
					</td>
					
					</tr>
					</table>							
						</div>
							

					<div class="form-group ">
						<input type="submit" value="Registrate" id="button"
							class="btn btn-primary btn-lg btn-block login-button">
					</div>

				</form>
			</div>
		</div>
	</div>
	<%
	//Destruyo la sesión para que si refrescas la página o sales no se te 
	//queden los campos llenos
	session.invalidate(); %>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../../Bootstrap/js/jquery-1.11.3.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../Bootstrap/js/bootstrap.min.js"></script>
</body>


</html>