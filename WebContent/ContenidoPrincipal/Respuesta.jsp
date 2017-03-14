<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Utilidades.Conexion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<head>
 



<%@include file="Cabecera.jsp"%>
	
	

<body>

<div class="container-fluid">
<div class="row">
  <div class="col-md-offset-0 col-md-12">
  	<ol class="breadcrumb">
  		<li><a href="#">Inicio</a></li>
  		<li class="active">Detalle pregunta</li>
	</ol>
</div>
	<div class="row" style="margin-top: 5%">
	    <div class="col-md-8 col-md-offset-2">
			<div class="panel panel-info">
					  <div class="panel-heading">
					   <% 
			   	        /*
			   	        Aqui estoy recargando los nombres del usuario de momento , habra que validar que si esta pulsado las mas visitas recargar
			   	        las preguntas segun el boton del tab pulsado.
			   	        */
			   		 	Conexion c=new Conexion();
			    		c.conectar();
			    		if (session.getAttribute("idpregunta")==null)
							{
								%>
									<h3>Cargar jsp de pagina no encontrada</h3>
								<title>Pregunta no encontrada</title>
								<%
							}
			    		else
			    		{
			    			
			    		
			    		String []xo=c.sacarpreguntaporid((int)session.getAttribute("idpregunta"));
			    		
			    		 %>
			    		<title><%=xo[1]%></title>
			    		
						<h3 class="panel-title" align="center"><%=xo[1]%></h3>
					  </div>
					  
					  <div class="panel-footer" align="left" style="min-height: 200px;">
					  
			    			<div class="container-fluid" id="comment" >
			    			<%=xo[2] %>
			    				
			    			</div>
			    		
			    	 </div>
			    	 <%
			    	 }
			    	 %>
			</div>

		  </div>
	</div>
</div>
<%@include file="pie.jsp"%>
  <p onclick="previsualizacion();">PULSAR PARA CARGAR PREVISUALIZACION</p>
</body>
</html>
