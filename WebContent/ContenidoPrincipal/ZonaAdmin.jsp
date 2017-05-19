<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Zona Admin</title>
<%@include file="Cabecera.jsp"%>
 <LINK href="css/EstilosPagAdmin.css" rel="stylesheet" type="text/css">
 
 <style type="text/css">
 #noty,#noty1{
 display:none;
 }
 
 </style>
 <script type="text/javascript">
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
 function verp()
 {
	 
	 if (document.getElementById("noty").style.display=="block")
		 {
	 document.getElementById("noty").style.display="none";
	 document.getElementById("noty1").style.display="none";
		 }
	 else
		 {
		 document.getElementById("noty").style.display="block";
		 document.getElementById("noty1").style.display="block";
		 }
	 
	 
 }
 $(document).ready(function(){
	    $('#tabla1').fadeIn();
	});
 
	    $("ver").click(function(){
	    	alert("toogle");
	        $("noty").toggle();
	    });
	    
	    $("button").click(function(){
	        $("p").toggle();
	    });
 </script>
</head>
<body>


<%
/*
 Primero veo que no sea null el admin, si es null le envio al login, si esta logado y no es el admin tb le envio para atras
 hago un redirect la cabecera , pero llega a entrar aqui y no se xk :(.
*/
	if (session.getAttribute("admin")==null)
	{
	System.out.println("usuario vacio al admin");
	response.sendRedirect("login");
		}
	else 	if (!session.getAttribute("admin").equals("1"))
	{%>

	<%
	response.sendRedirect("login");
	System.out.println("usuario no es admin");
	} %>
		
 

 
		<div class="container">
			<div class="row">
				<div class="col-md-12">	
					<h1 align="center">Zona Admin</h1>
			</div>
		</div>
		<div class="container" id="tabla1">
			<div class="row">
				<div class="col-md-3">
						<div class="col-sm-12 col-xs-12 col-md-3 " align="center">
						<div class="btn-group-vertical">
							      <button type="button" class="btn btn-primary"  onclick="from('1','llamadaajax','registro')">Registrar Usuarios</button>
							      <button type="button" class="btn btn-primary"  id="vertiponotificacion" onclick="verp(); ">Enviar notificacion</button>
							   
							      <button type="button" class="btn btn-default" id="noty" style="cursor : pointer ; cursor: hand; margin-left: 5%; border-top-right-radius: 4px; border-top-left-radius: 4px; " onclick="from('global','llamadaajax','notificaciones')">Notificacion global</button>
							      <button type="button" class="btn btn-default" id="noty1" style=" cursor : pointer ; cursor: hand; margin-left: 5%" onclick="from('curso','llamadaajax','notificaciones')">Notificacion a curso</button>
								 
								 <a href="ServeletZonaAdmin?opcion=solicitud" class="btn btn-primary">Solicitudes</a>
						 </div>
		  	   </div>
		  
    </div>
    <div class="col-md-8 col-sm-12 col-xs-12" id="llamadaajax">
		  </div>
    </div></div>    
					
					
					
					<!-- 
					  <table class="table table-hover">
					  	<tr>
					  		<td><a href="registro">Registrar Usuarios</a></td>
					  	</tr>
					  	<tr>
					  		<td>Subir nuevos archivos</td>
					  	</tr>
					  	<tr>
					  		<td><p id="vertiponotificacion" onclick="verp(); "> Enviar Nueva Notificacion</p></td>
							  	</tr><tr>
							  		<td id="noty" style="cursor : pointer ; cursor: hand" onclick="from('global','llamadaajax','notificaciones')"><p id="notificacion">Nueva Notificacion Global</p></td>
							  	</tr><tr>
							  		<td id="noty1" style=" cursor : pointer ; cursor: hand" onclick="from('curso','llamadaajax','notificaciones')"><p id="notificacion" > Nueva Notificacion por curso y ciclo</p></td>
							  	</tr>
					  	
					  	<tr>
					  		<td><a href="ServeletZonaAdmin?opcion=solicitud">Solicitudes</a></td>
					  	</tr>
					  </table>
					</div>
				</div>
				<div class="col-md-9" id="llamadaajax"></div> -->
		
</body>
</html>