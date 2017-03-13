<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="serverlets.*" %>
   <%@ page import="Utilidades.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="Bootstrap/js/jquery-1.11.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="Bootstrap/js/bootstrap.min.js"></script>
<link href="Bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="Bootstrap/css/Estilospropios.css" rel="stylesheet">

<script type="text/javascript" src="Bootstrap/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resultados Busqueda</title>
</head>
<body>
  	 <%@include file="Cabecera.jsp"%>

<h1>resultadosbusuedabarra</h1>


<div class="container-fluid">
	<div class="container-fluid">
	
	<div class="panel panel-info">
  		<div class="panel-heading">
		  <h1 align="center" >Bienvenido a estudiantes conecta2</h1>
		  <h4 align="center">Estos son los resultados que tenemos para la pregunta <%= request.getParameter("search") %></h4>
		  <br>
	
	  </div>
     <div class="panel-body">
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

			   		 	Conexion c=new Conexion();
			   	     	c.conectar();
			   	     	/*
			   	     	Recargo un resulset en el cual le paso el parametro de busqueda
			   	     	*/
    			ResultSet r=c.resulsetpregunta(request.getParameter("search"));
    			
    			/*
    			Recorro el resulset
    			*/
    		while (r.next())
    		{
    			%>
    			<h1>La id es <%=r.getString(1)%></h1>
    			
    			<%
    				if (r.getString(3).length()>250)
    				{
    					%>
    					<h3>
    						La respuesta es <%=r.getString(3).substring(0,250)+" ..." %>
    					</h3>
    					<%
    				}
    				else
    				{
    					%>
    					<h3>
    						La respuesta es <%=r.getString(3)+" ..." %>
    					</h3>
    					<%
    				}
    			
    		
    		}
			  %>
		</div>
	
	
</div>

</body>
</html>