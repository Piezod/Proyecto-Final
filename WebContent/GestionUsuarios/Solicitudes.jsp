<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.HashMap"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <!--  Imports que hay que realizar para utilizar jstl  -->
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Solicitudes pendientes</title>
<style type="text/css">
#wrapper{
    background-image:url('some-image.jpg');
    display:none;
}
#info{
	display:none;
}
#loading{
	display:none;
	}
#prueba,#titulo
{
	display:none;
}
</style>

 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
    $('#titulo').fadeIn();
});
/*
$(document).on("click", "#somebutton", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
    $.get("ServerletSolicitudes", function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
        $("#somediv").text(responseText);           // Locate HTML DOM element with ID "somediv" and set its text content with the response text.
    });
});*/

$(document).ready(function(){
    resultado();
});

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

function resultado()
{
	var tipo = getParameterByName('tipo'); // "tipo"
	var idsolicitud = getParameterByName('idsolicitud'); // "idsolicitud"
	
	if (tipo=="baja")
		{
		$('#info').show();
		document.getElementById("infotext").innerHTML = "Se ha realizado la cancelacion de la solicitud numero "+idsolicitud+" !!";
		
		}
	else if (tipo=="cambio")
		{
		$('#info').show();
		document.getElementById("infotext").innerHTML = "Se ha realizado el cambio satisfactoriamente de la solicitud numero "+idsolicitud+ " !!";
		}
	
	}


function confirmarbaja(idsolicitud){
	
	   $('#confirmarbaja').modal('show');
	   //alert(idrespu);
	   document.getElementById("idsolicitud").value = idsolicitud;
	   document.getElementById("tipo").value = "baja";
	   mensaje = "Estas seguro que quieres darlo de baja?";
	   document.getElementById("mensajemodal").innerHTML=mensaje;
	};
	
	function confirmarcambio(idsolicitud){
		
		   $('#confirmarbaja').modal('show');
		   //alert(idrespu);
		    document.getElementById("tipo").value = "cambio";
		   document.getElementById("idsolicitud").value = idsolicitud;
		   mensaje = "Estas seguro de autorizar el cambio?";
		   document.getElementById("mensajemodal").innerHTML=mensaje;
		};

</script>
<%
HashMap hml2=(HashMap)request.getAttribute("solicitudpendiente");
pageContext.setAttribute("solicitudpendiente", hml2);
%>

</head>
<body>
<%
if (session.getAttribute("usuario")==null)
{
	response.sendRedirect("login");
	System.out.println("usuario vacio");
}else if (!session.getAttribute("admin").equals("1"))
{
	response.sendRedirect("login");
System.out.println("usuario no es admin");
}%>

<%@include file="../../ContenidoPrincipal/Cabecera.jsp"%>
		<div class="container" >
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="alert alert-success" id="info">
							<p id="infotext"></p>
						</div>
				</div>
			<div class="row">
					<div class="col-md-12">	
						<h1 align="center">Solicitudes Pendientes</h1>
				</div>
			</div>
		</div>
		</div>
		
		<div class="container" id="titulo">
			<div class="row">
		<div class="col-md-4 col-md-offset-2">
					  <table class="table table-hover">
		  	<tr>
		  		<th> Numero peticion</th>
		  		<th> Usuario </th>
		  		<th> Nombre solicitado </th>
		  		<th> Apellido1 </th>
		  		<th> Apellido2</th>
		  		<th> Accion </th>
		  	</tr>
		  	<tr>
			<c:forEach var="item"  items="${solicitudpendiente}">
			<form action="gestiondelassolicitudes" method="POST">
						<div class="col-md-9">
						 <tr>
						 	<td>${item.value.get(0)} </td>
						 	<td>${item.value.get(1)} </td>
						 	<td>${item.value.get(2)} </td>
						 	<td>${item.value.get(3)} </td>
						 	<td>${item.value.get(4)} </td>
						 	<td> 
						 		 <span class="glyphicon glyphicon-remove" title="cancelar peticion" style="color:red ; cursor: pointer; cursor: hand;" cursor: pointer;
						 		  aria-hidden="true" onclick="confirmarbaja(${item.value.get(0)});"></span></a>
				  	  	  		 <span class="glyphicon glyphicon-ok" title="aceptar solicitud" style="color:green; cursor: pointer; cursor: hand;" aria-hidden="true" onclick="confirmarcambio(${item.value.get(0)});"></span>
				  	  	  	</td>
						 	<td><img src="Fondos/ajax-loader.gif" id="loading"/></td>
						</tr>
					</div>
				
			</form>
			</c:forEach>
		  </table>
		</div>
			</div>
		</div>
			
			<!-- Modales para las acciones -->
			
			    <!-- Modal de confirmar elminar -->	
<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="confirmarbaja" role="dialog">
    <div class="modal-dialog" > <!--  el bakcgorun modifica el marco -->  
      <!-- Modal content-->
      <div class="modal-content"> <!--  este es el backgroun blanco -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Eliminar Respuesta</h4>
        </div>
        <div class="modal-body">
          <p id="mensajemodal"> </div>
        <div class="modal-footer" >
	        <form class="form-horizontal" action="ServerletSolicitudes" method="POST" id="datossolicitud">
	       	  <input type="hidden" id="idsolicitud" name="idsolicitud"></input>
	          <button type="submit" class="btn btn-info" value="20" id="enviar" >Confirmar</button>
	          	<input type="hidden" id="tipo" name="tipo" >
	          <button type="button" class="btn btn-info" data-dismiss="modal" >Cerrar</button>
          </form>
        </div>
      </div>
      
    </div>
  </div>
  


</div>
</body>
</html>