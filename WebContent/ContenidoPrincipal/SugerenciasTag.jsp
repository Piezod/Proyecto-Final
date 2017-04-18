<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Utilidades.Conexion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

<% Conexion c=(Conexion)session.getAttribute("conexion");
int pagina=0;	
if(request.getParameter("page")!=null){
		pagina=Integer.parseInt(request.getParameter("page"));
	}
	int[] ids=c.idstag(request.getParameter("id"), pagina);
	
	for(int i=0;i<ids.length;i++){
		if(i==0||i==3||i==6){
			%>
			<div class="row">
			<%
		}
		ResultSet res=c.sacarresultset("select * from tags where id like '"+ids[i]+"'");
		res.next();
		String tag,desc;
		tag=res.getString(2);
		desc=res.getString(3);
		%>
		
		<div class="col-md-4">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<%= tag %>
				</div>
				<div class="panel-body">
					<%= desc %>
				</div>
			</div>
		</div>
		
		<%
		if(i==2||i==5||i==8||i==ids.length-1){
			%>
			</div>
			<%
		}
	}
	
	if(ids.length==0){
		%>
		<h3>No encuentras un tag que se ajuste a tu pregunta crea uno</h3>
		<div class="panel panel-primary">
		<div class="panel-heading">
		<input type="text" class="form-control" placeholder="Tu tag"/>
		</div>
		<div class="panel-body">
			<input type="text" class="form-control" placeholder="Una breve descripcion"/>
		</div>
		<div class="panel-footer">
			<input class="btn btn-primary" type="submit">
		</div>
		</div>
		
		
		<%
	}
	
	%>
	
	
</body>
</html>