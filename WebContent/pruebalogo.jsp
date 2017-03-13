<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="Utilidades.Conexion" %>
      <%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Utilidades.Conexion"%>
<%@page import="java.util.Random"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
Conexion ca=new Conexion();
    		ca.conectar();
    		/*
    			Sacamos la imagen de la base de datos y la dibujamos donde tiene que ir el logotipo, en la parte izuierda de la cabecera, en caso de 
    			que no exista la imagen o no se encuentre se pondra por defecto el nombre de la aplicación.
    		*/
    		ResultSet r1=ca.sacarundato("select imagen from Imagenes where idimagen=1");	
    		
    		if (r1.next())
    		{
    			OutputStream img;
    			byte barray[]=r1.getBytes(1);
    			response.setContentType("image/png");
    			img=response.getOutputStream();
    			img.write(barray);
    			img.flush();
    			img.close();
    		}
    			%>
</body>
</html>