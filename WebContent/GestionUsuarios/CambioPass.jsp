<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Utilidades.Conexion"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cambiopass</title>


	

<body>
<div class="panel panel-default">
		<form method="post" action="ServletCambioPass" onsubmit="return Comprobarcampos();">
		<div class="panel-heading" align="center">
			<h3 align="center">Cambie la contraseña de su cuenta</h3>
		</div>
		<div class="panel-body" align="center">
			<div class="row">
				<div class="col-sm-3">Contraseña:</div>
				<div class="col-sm-7"><input class="form-control" type="password" id="password" name="password" onkeyup="passwordStrength(this.value)"/></div>
				<div class="col-sm-3" id="validacionpass"></div>
			
			</div>
			<div class="row">
				<div class="col-sm-3">Repite la contraseña:</div>
				<div class="col-sm-7"><input class="form-control" type="password" id="reppass" name="reppass"/></div>
				<div class="col-sm-3" id="validacionrep"></div>
			
			</div>
			<div class="row">
				<div class="col-sm-7 col-sm-offset-3">
				<div class="progress progress-striped active">
					<div id="pstrength" class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
				</div>
			</div>
		</div>
		<div class="panel-footer">
		<button type="submit" 
		<%Conexion c=(Conexion) session.getAttribute("conexion");
		//c.conectar();
		if(c.comprobar("select * from dbdamproject.solicitudes where usuario like '"+session.getAttribute("usuario")+"' and pendiente like '1'")){
			%>
			class="btn btn-danger" disabled>Solicitud pendiente
			<%
		}else{
		%>
		
		
		
		
		
		class="btn btn-primary">Enviar Solicitud
		<%
		}
		//c.cerrarconexion(); %>
		
		</button>
		</div>
		</form>
	</div>
	
	
    
    
	

</body>
</html>