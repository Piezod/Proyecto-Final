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
<nav class="navbar navbar-default">
  <div class="container-fluid"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#defaultNavbar1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
      <a class="navbar-brand" href="#">Logotipo</a></div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    
    <div class="collapse navbar-collapse" id="defaultNavbar1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"> </span> </a></li>
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
<div class="container-fluid">
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <h1 class="text-center">Usuarios Conecta2</h1>
    </div>
  </div>
  <hr>
</div>

<div class="container-fluid">
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
    <!--  le envio al boton la url directa para que recargue el jsp de altapregunta, no se si sera lo mas optimo pero ahora mismo esto funciona con el a
    al enviarle la informacion del usuario esta en sesion con lo cual se puede recoger perfectamente -->
    <a href="http://localhost:8080/Proyectoprueba/ContenidoPrincipal/Altapregunta.jsp" class="btn btn-primary btn-lg active" role="button" aria-pressed="true" align="center">NUEVA PREGUNTA</a>

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
  <hr>
  <div class="row">
    <div class="text-center col-md-offset-0 col-md-12">
      <p>Copyright &copy; 2017 &middot; Todos los derechos reservados &middot; <a href="http://localhost:8080/Proyectoprueba/GestionUsuarios/Login/Login.jsp.com/" >Estudiantes Conecta2</a></p>
    </div>
  </div>
  <hr>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="file:///C|/Users/Juankar/Desktop/DreamWeaver/js/jquery-1.11.3.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="file:///C|/Users/Juankar/Desktop/DreamWeaver/js/bootstrap.js"></script>
</body>
</html>