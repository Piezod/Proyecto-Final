<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="serverlets.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>



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

<body>


<div class="container-fluid">
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <h1 class="text-center">Bienvenido a nuestra aplicacion, Home</h1>
    </div>
  </div>
  <hr>
</div>

<div class="container-fluid">
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
    <!-- Envio al serverlet mediante un formulario por el methot post el valor altapregunta.jsp que sera el que recoja y luego sera el que
    recargue -->
    
    <!-- ** IMPORTANTE ** -->
    	 <!-- ** Crearemos unos botones con el type submit y el name contenido, importante siempre se llamara contenido. Este boton
    	 sera el encargado de mandarnos el valor del jsp a cargar. En el value pondremos el nombre del jsp sin la extension, todos los 
    	 botones estaran incluiddos en un formulario que iran redirigidos a un serverlet que se llamara ***serverletcontenido***
    	  ** -->
    
			<form action="<%=session.getAttribute("ruta")%>ServerletContenido" method="POST">
			<input type="hidden" name="pagina" value="Altapregunta.jsp"></input>
			<button class="btn btn-primary btn-lg active"  type="submit" name="contenido" value="AltaPregunta">Nueva pregunta</button>			
			</form>
			
	 <!-- ** IMPORTANTE ** -->
    </div>
  </div>
  <hr>
</div>

<div class="container">
<ul class="nav nav-tabs">
    <li role="presentation" class="active"><a href="#">Ultimas Respuestas</a></li>
    
    
    <li role="presentation"><a href="#">Mas Contestadas</a></li>
    
    
    <li role="presentation"><a href="#">Semana</a></li>
    
    
    <li role="presentation"><a href="#">Mes</a></li>
    
    
    <li class="disabled"><a href="#">Disabled tab</a></li>
    
    
  </ul>
<hr>
  <div class="row">
    <div class="text-justify col-sm-4">  </div>
   	        <% 
   	        /*
   	        Aqui estoy recargando los nombres del usuario de momento , habra que validar que si esta pulsado las mas visitas recargar
   	        las preguntas segun el boton del tab pulsado.
   	        */
   		 	Conexion c=new Conexion();
    		c.conectar();
    			String[]x=c.sacarusuarios();
    		for (int i=0;i<c.sacarusuarios().length;i++)
    		{
    			int j=new Random(300).nextInt();
    		 %>
    			<hr><h1></h1>
    			<a href="#">La pregunta de este usuario <%=x[i] %> <span class="badge"><%=j %></span></a><br>
    			<code><%=x[i] %></code><code>Etiqueta2</code>
    		<%
    		}
    		
    		%>
</div>
</div>
</body>
</html>