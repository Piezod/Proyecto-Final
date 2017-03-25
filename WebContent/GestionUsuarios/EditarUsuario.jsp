<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Utilidades.Conexion"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EditarUsuario</title>
</head>
<body>
<div class="panel panel-default">
		<form method="post" action="ServletSolicitud" onsubmit="return Comprobarcampos();">
		<div class="panel-heading" align="center">
			<h3 align="center">Solicitar Cambio de datos</h3>
		</div>
		<div class="panel-body" align="center">
			<!-- Este es el estilo para la tabla de los móviles pequeños y medianos -->
			<div class="hidden-md hidden-lg">
			<table class="table">
			<tr>
			<th width="33%" style="text-align:center;"><input type="checkbox" id="cnombrep" name="cnombre" onclick="mostrarocultar('nombre',this)"><br>Nombre</th>
			<th width="33%" style="text-align:center;"><input type="checkbox" id="capellido1p" name="capellido1" onclick="mostrarocultar('apellido1',this)"><br>Primer Apellido</th>
			<th width="33%" style="text-align:center;"><input type="checkbox" id="capellido2p" name="capellido2" onclick="mostrarocultar('apellido2',this)"><br>Segundo Apellido</th>
			</tr>
				<tr id="trnombrep" style="display:none">
					<td>Nombre:</td>
					<td colspan="2"><input type="text" id="pnombre" name="pnombre" class="form-control" value="" onkeyup="actualizar(this)" onkeydown="actualizar(this)"></td>
				</tr>
				<tr id="trapellido1p" style="display:none">
					<td>Primer Apellido:</td>
					<td colspan="2"><input type="text" id="papellido1" name="papellido1" class="form-control" value="" onkeyup="actualizar(this)" onkeydown="actualizar(this)"></td>
				</tr>
				<tr id="trapellido2p" style="display:none">
					<td>Segundo Apellido:</td>
					<td colspan="2"><input type="text" id="papellido2" name="papellido2" class="form-control" value="" onkeyup="actualizar(this)" onkeydown="actualizar(this)"></td>
				</tr>

			</table>
			</div>
			<div class="hidden-sm hidden-xs">
			<table class="table" style="width: 70%">
			<tr  align="center">
			<th width="33%" style="text-align:center;"><input type="checkbox" id="cnombreg" name="cnombre" onclick="mostrarocultar('nombre',this)"> Nombre</th>
			<th width="33%" style="text-align:center;"><input type="checkbox" id="capellido1g" name="capellido1" onclick="mostrarocultar('apellido1'),this"> Primer Apellido</th>
			<th width="33%" style="text-align:center;"><input type="checkbox" id="capellido2g" name="capellido2" onclick="mostrarocultar('apellido2'),this"> Segundo Apellido</th>
			</tr>
				<tr id="trnombreg" style="display:none">
					<td>Nombre:</td>
					<td colspan="2"><input type="text" class="form-control" value="" id="gnombre" name="gnombre" onkeyup="actualizar(this)" onkeydown="actualizar(this)"></td>
				</tr>
				<tr id="trapellido1g" style="display:none">
					<td>Primer Apellido:</td>
					<td colspan="2"><input type="text" class="form-control" value="" id="gapellido1" name="gapellido1" onkeyup="actualizar(this)" onkeydown="actualizar(this)"></td>
				</tr>
				<tr id="trapellido2g" style="display:none">
					<td>Segundo Apellido:</td>
					<td colspan="2"><input type="text" class="form-control" value="" id="gapellido2" name="gapellido2" onkeyup="actualizar(this)" onkeydown="actualizar(this)"></td>
					
				</tr>
				
			</table>
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