<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="serverlets.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="file:///C|/Users/Juankar/Desktop/DreamWeaver/js/jquery-1.11.3.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="file:///C|/Users/Juankar/Desktop/DreamWeaver/js/bootstrap.js"></script>
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


<nav class="navbar navbar-default">
  <div class="container-fluid"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#defaultNavbar1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
      <a class="navbar-brand" href="#">Logotipo</a></div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    
    <div class="collapse navbar-collapse" id="defaultNavbar1">
      <ul class="nav navbar-nav">
      
      <!-- ** Boton del home ** -->
        <li class="active">
        	<form action="ServerletContenido" method="POST">
			<input type="hidden" name="pagina" value="home"></input>
			<button class="btn btn-primary btn-lg active"  type="submit" name="contenido" value="home"><span class="glyphicon glyphicon-home" aria-hidden="true"> </span> </button>			
			</form>
        </li>
        
        
        <li><a href="#">Usuarios</a></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Informacion <span class=" glyphicon glyphicon-pencil" aria-hidden="true"></span><span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#" align="center">Accion1</a></li>
             <li class="divider"></li>
            <li><a href="#" align="center">Accion2</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Busqueda Rapida">
        </div>
        <button type="submit" class="btn btn-default">Enviar</button>
      </form>
      
      
       <div  class="nav navbar-nav navbar-right">
       <a class="navbar-brand" align="right">Bienvenido alumno <span class="label label-success"><%=session.getAttribute("usuario") %></span></a></div>
       
       </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
 
</nav>

</head>

<body>
<hr>

<div class="container-fluid">
								<%
								
								if (session.getAttribute("contenido")==null || session.getAttribute("contenido").equals("home"))
								{
									out.println("Debo de poner el home");
								}
								else
								{
									out.println("Debo poner el valor del contenido "+session.getAttribute("contenido"));
								}
								out.println("El valor de la sesion contenido es "+session.getAttribute("contenido"));
    							
    						
    						String opcion=""+session.getAttribute("contenido");
    		
									switch (opcion)
									{
									case  "AltaPregunta" :
										out.print("dentrodelsegunsea ponemos el jspdealtapregunta");
										%>
										<%@include file="Altapregunta.jsp"%>
										<%break;

									default:
										out.print("dentrodelsegunsea ponemos el home");
										%>
									<%@include file="home.jsp"%> 
										
										<% break;
									}
								
								%>
</div>
<div class="container-fluid">
	<%@include file="pie.jsp"%> 
</div>
</body>
</html>