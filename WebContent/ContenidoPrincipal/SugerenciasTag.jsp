<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Utilidades.Conexion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script>

</script>
</head>
<body>

<% Conexion c=(Conexion)session.getAttribute("conexion");
int pagina=0;	
if(request.getParameter("page")!=null){
		pagina=Integer.parseInt(request.getParameter("page"));
	}
	String id=request.getParameter("id");
	int contar=c.contarconexclusionestags(id);
	int pagmaxima=contar/9;
	if(contar%9!=0){
		pagmaxima++;
	}

	int[] ids=c.idstag(id, pagina,pagmaxima);

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
		if(desc!=null){
		%>
		
		<div class="col-md-4">
			<div class="panel panel-primary" onclick="anadirtag('<%= res.getInt(1) %>','<%= tag %>');">
			
				<input type="hidden" id="tag<%= res.getInt(1) %>" name="tag<%= res.getInt(1) %>" value="<%= res.getInt(1) %>">
				<div class="panel-heading"  style="cursor:pointer">
					<%=i+ tag %>
				</div>
				<div class="panel-body">
					<%= desc %>
				</div>
			</div>
		</div>
		
		<%
		}
		if(i==2||i==5||i==8||i==ids.length-1){
			%>
			</div>
			
			
			<%
		}
	}
	%>
	
	<div style="text-align:center">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  <% 
				  	if(pagina==0){
				  %>
				  	<li class="disabled"  style="cursor:pointer">
				  	<a aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    
				  <%
				  	}
				  	else{
				  %>
				 	<li  style="cursor:pointer">
				 	<a onclick="frompag(document.getElementById('tag').value+'_'+document.getElementById('idsusados').value,<%=pagina-1 %>,'tagsugeridos','SugerenciasTag')" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				  <%
				  	}
				  %>
				      </li>
				    <%
				    for(int j=0;j<pagmaxima;j++){
				    	
				    	if(j==pagina){
				    	%>
				    		<li class="active"><a onclick="from(document.getElementById('tag').value+'_'+document.getElementById('idsusados').value,<%=j %>,'tagsugeridos','SugerenciasTag')"><%= j+1 %></a></li>

				    	<%
				    	}
				    	else{
				    	%>
				    		<li  style="cursor:pointer"><a onclick="frompag(document.getElementById('tag').value+'_'+document.getElementById('idsusados').value,<%=j %>,'tagsugeridos','SugerenciasTag')"><%= j+1 %></a></li>
				    	
				    	<%
				    }
				    }
				  	if(pagina+1==pagmaxima){
				  %>
				  	<li class="disabled">
				  	<a aria-label="Next">
				    
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				  <%
				  	}
				  	else{
				  %>
				 	<li style="cursor:pointer">
				 	<a onclick="frompag(document.getElementById('tag').value+'_'+document.getElementById('idsusados').value,<%=pagina+1 %>,'tagsugeridos','SugerenciasTag')" aria-label="Next">
				    
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				  <%
				  	}
				  %>
				      
				    </li>
				  </ul>
				</nav>			
			</div>
	
	
	<%
	
	if(ids.length==0){
		%>
		
		<h3>No encuentras un tag que se ajuste a tu pregunta, crea uno</h3>
		<div class="panel panel-primary">
		<div class="panel-heading">
		<input type="text" id="nombretag" class="form-control" placeholder="Tu tag"/>
		</div>
		<div class="panel-body">
			<input type="text" id="descripciontag" class="form-control" placeholder="Una breve descripcion"/>
		</div>
		<div class="panel-footer">
			<input class="btn btn-primary" value="Crear tag" type="button" onclick="from(document.getElementById('nombretag').value+','+document.getElementById('descripciontag').value,'tagsugeridos','ServletAltaTag')">
		</div>
		</div>
		
		
		<%
	}
	
	%>
	
	
</body>
</html>