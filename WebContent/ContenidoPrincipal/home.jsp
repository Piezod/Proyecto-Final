<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="serverlets.*" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Documento sin título</title>
<link href="file:///C|/Users/Juankar/AppData/Roaming/Adobe/Dreamweaver CC 2017/es_ES/Configuration/Temp/Assets/eamC1CF.tmp/css/bootstrap.css" rel="stylesheet" type="text/css">
<head>
<!-- Css para cambiar el formatode los botones para que parezcan hrefs -->

<link href="css/botonhref.css" rel="stylesheet" type="text/css">

 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../Bootstrap/js/jquery-1.11.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../Bootstrap/js/bootstrap.min.js"></script>
<link href="../Bootstrap/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="../Bootstrap/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<title>Estudiantes Conectados Main</title>
</head>
</head>
<body>
<div class="container-fluid">
	<div class="container-fluid">
	
	<div class="panel panel-info">
  		<div class="panel-heading">
		  <h1 align="center" >Bienvenido a estudiantes conecta2</h1>
		  <h4 align="center">Puedes realizar una pregunta a nuestro asistente para que te resuelva la duda , en caso de que no la encuentres no dudes en realizar una pregunta</h4>
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
    
			<form action="ServerletContenido" method="POST">
					<input type="hidden" name="pagina" value="Altapregunta.jsp"></input>
					 <!-- ** IMPORTANTE ** -->
			  		 <h4 alialign="center"></h6><button class="btn btn-primary btn-sm"  type="submit" name="contenido" value="AltaPregunta">Realizar nueva pregunta </button></h4>	   
			    </form>
	    </div>
	  </div>
    </div>
    <hr>
    
    <div class="container-fluid">
    	
   	 
    	<div class="row">
    	  <div class="col-md-2"> <!-- Izquierda -->
    	  	
    	  	 
    	  </div>
    	  
    	  <div class="col-md-8"> <!-- Centro -->
    	  	<ul class="nav nav-tabs" >
				<li role="presentation"><a href="#">Mas Contestadas</a></li>
				<li role="presentation"><a href="#">Semana</a></li>
				<li role="presentation"><a href="#">Mes</a></li>
			</ul>
    	  </div>
    	  <div class="col-md-2"> <!-- Derecha -->
    	  	
    	  	
    	  </div>
  	  </div>
    
	</div>
	
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
			    			System.out.println("la id es "+x[i]);
			    			String titu[]=co.sacarpreguntaporid(x[i]);
			    			System.out.println("El titulo sera "+titu[1]);
			    			
			    		 %>
			    		 	<input type="hidden" name="idpregunta" value="<%=x[i]%>">
							 	 <button type="submit" name="submit_param" value="submit_value"class="btn btn-default">
							  					  <%=titu[1] %>
							 	 </button>
							 
							  <br>
			    		<%
			    		}
			    		
			    		%>
		</div>
	
	
</div>
</body>
</html>
