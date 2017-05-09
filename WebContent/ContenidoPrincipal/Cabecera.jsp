<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="Utilidades.*" %>



<link href="${pageContext.request.contextPath}/Bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Bootstrap/css/Estilospropios.css" rel="stylesheet">

 <script src="${pageContext.request.contextPath}/Bootstrap/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/Bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/Bootstrap/js/ajax.js"></script> 
 <LINK href="css/EstilosNavBar.css" rel="stylesheet" type="text/css">
</head>
<body>

<%

if (session.getAttribute("usuario")==null)
{
	response.sendRedirect("login");
	System.out.println("usuario vacio");
	%>
<%} 


if(session.getAttribute("conexion")!=null){
	Conexion c=(Conexion)session.getAttribute("conexion");
}else{
	Conexion c=new Conexion();
	c.conectar();
	session.setAttribute("conexion", c);
}
%>
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
    
			<a href="${pageContext.request.contextPath}/Inicio"><input type="image" src="ServeletImagenes?id=2" name="contenido" style="height: 50px"></input></a>
      
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#defaultNavbar1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
      </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    
    <div class="collapse navbar-collapse" id="defaultNavbar1">
    
      <ul class="nav navbar-nav">
      
      
    	
        
        <li><a href="${pageContext.request.contextPath}/ServerletRespuestaPaginacion?pag=usuarios&inicio=0&fin=10&pagpulsada=1&iniciopagina=1">Usuarios</a></li>
		
      </ul>
      <form class="navbar-form navbar-left" role="search" action="ServeletBusqueda" method="POST" >
        <div class="form-group">
          <input type="text" class="form-control" name="valorbusqueda" placeholder="Busqueda Rapida">
        </div>
        <button type="submit" class="btn btn-default">Enviar</button>
      </form>
      
       <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Novedades</a></li>
        <li class="dropdown" style="margin-right:10px"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("usuario") %><span class="caret"></span></a>
          <ul class="dropdown-menu">

            <li><a href="${pageContext.request.contextPath}/AreaUsuario">Datos de usuario</a></li>
            <%if((session.getAttribute("admin")!=null && session.getAttribute("admin").equals("1"))){ %>
            <li role="separator" class="divider"></li>
            <li><a href="${pageContext.request.contextPath}/zonaadmin">Zona Administrador</a></li>
            <%} %>
            <li role="separator" class="divider"></li>
            <li>
            
            <a href="${pageContext.request.contextPath}/CerrarSesion?logout=1">Cerrar sesion</a>
            
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