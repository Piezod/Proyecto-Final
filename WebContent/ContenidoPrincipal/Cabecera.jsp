<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Utilidades.Conexion"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="serverlets.*" %>


<script src="Bootstrap/js/jquery-1.11.3.min.js"></script>
<script src="Bootstrap/js/bootstrap.min.js"></script>
<link href="Bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="Bootstrap/css/Estilospropios.css" rel="stylesheet">


</head>
<body>
<!-- **INFORMACION** -->

<!-- Este jsp en un primer momento esta pensado para que sea el cuerpo principal de la aplicacion

	 En el se iran recargando diferentes jsp en la parte central dependiendo de la opcion que nos solicite el usuario.
	 
	 Siempre mantendremos la barra de navegacion superior con sus diferentes opciones y en la parte inferior añadiremos siempre un jsp estatico que sera
	 
	 el pie de la aplicación. Cargar contenido en esta pagina estara gobernado a través de un switch explicado mas adelante. -->
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
          <!-- ** Boton del home ** -->
    
			<a href="Inicio"><input type="image" src="ServeletImagenes?id=2" name="contenido" style="height: 50px"></input></a>
      
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#defaultNavbar1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
      </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    
    <div class="collapse navbar-collapse" id="defaultNavbar1">
    
      <ul class="nav navbar-nav">
      
      
    	
        <li class="active">
        	
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
      <form class="navbar-form navbar-left" role="search" action="ServeletBusqueda" method="POST" >
        <div class="form-group">
          <input type="text" class="form-control" name="valorbusqueda" placeholder="Busqueda Rapida">
        </div>
        <button type="submit" class="btn btn-default">Enviar</button>
      </form>
      
       <ul class="nav navbar-nav navbar-right">
        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("usuario") %><span class="caret"></span></a>
          <ul class="dropdown-menu">

            <li><a href="AreaUsuario">Datos de usuario</a></li>
            <li role="separator" class="divider"></li>
            <li>
            
            <a href="CerrarSesion?logout=1">Cerrar sesion</a>
            
            </li>
          </ul>
        </li>
      </ul>
       
       </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
 
</nav>

</body>