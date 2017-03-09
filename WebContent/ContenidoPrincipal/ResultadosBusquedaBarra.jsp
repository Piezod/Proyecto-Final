<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="serverlets.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resultados Busqueda</title>
</head>
<body>
<h1>resultadosbusuedabarra</h1>


<div class="container-fluid">
	<div class="container-fluid">
	
	<div class="panel panel-info">
  		<div class="panel-heading">
		  <h1 align="center" >Bienvenido a estudiantes conecta2</h1>
		  <h4 align="center">Estos son los resultados que tenemos para la pregunta <%=request.getAttribute("valor") %></h4>
		  <br>
	
	  </div>
	  		  <!-- Envio al serverlet mediante un formulario por el methot post el valor altapregunta.jsp que sera el que recoja y luego sera el que
   			 recargue -->
     <div class="panel-body">
    		<!-- ** IMPORTANTE ** -->
    		 <!-- ** Crearemos unos botones con el type submit y el name contenido, importante siempre se llamara contenido. Este boton
    		 sera el encargado de mandarnos el valor del jsp a cargar. En el value pondremos el nombre del jsp sin la extension, todos los 
    		 botones estaran incluiddos en un formulario que iran redirigidos a un serverlet que se llamara ***serverletcontenido***
    		  ** -->
    
			<form action="Pregunta" method="POST">
					<input type="hidden" name="pagina" value="Altapregunta.jsp"></input>
					 <!-- ** IMPORTANTE ** -->
			  		 <h4 align="center">
			  		 	<button class="btn btn-primary btn-lg"  type="submit" name="contenido" value="AltaPregunta">Realizar nueva pregunta </button>
			  		 </h4>	   
			    </form>
	    </div>
	  </div>
    </div>
    <hr>
	<!-- En aqui recargamos el titulo de las preguntas-->
		<div class="col-md-8 col-md-offset-2">
			
					  <% 
			   	        /*
			   	        Sacaremos las ids de las ultimas 10 preguntas, en un array, este array despues lo recorreremos y pondremos el id de la pregunta en el valor
			   	        del input que enviamos para lamar al jsp de respuesta y mostraremos el titulo de esa pregunta.
			   	        */
						   		 	Conexion co=new Conexion();
						   	     	co.conectar();
			    			int[]x=co.idultimas10preguntas();
			    			
			    			
			    		for (int i=0;i<x.length;i++)
			    		{
			    			
			    			String titu[]=co.sacarpreguntaporid(x[i]);
			    			
			    		 %>
			    		 <!-- Pintamos el cuerpo donde iran los titulos ancho 10, despues la fecha informacion de usuario con ancho 2 y debajo ponemos los tags de la pregunta -->
			    		<form action="DetallePregunta" method="POST">
			    		 <div class="row">
						     <div class="col-md-10">
						    		 	<input type="hidden" name="idpregunta" value="<%=x[i]%>"></input>
										  <button type="submit" name="submit_param" value="submit_value"class="list-group-item list-group-item-info">
										  					  <%=titu[1] %>
										 	 </button>
							</div>
							<div class="col-md-2">
										<table>
											<tr>
												<td><span class="label label-success">
													<abbr  class="initialism" title="AQUI DESPLIEGO YO LO QUE QUIERO PORQUE SE PUEDE Y MOLA"><%=titu[3] %></abbr>
											</td></span></tr>
											<tr><td><span class="label label-default"><abbr title="gg"><%=titu[4] %></abbr></td></span></tr>
										</table>
							</div>
							<div class="col-md-8"><code>  tag1  </code> , <code>  tag2  </code>  ,  <code>  tag3  </code>             ,    <code>  tag4  </code></div>
						</div>
							  <hr>
							  </form>
			    		<%
			    		}
			    		
			    		%>
			  
		</div>
	
	
</div>

</body>
</html>