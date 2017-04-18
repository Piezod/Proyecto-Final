<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="Bootstrap/js/ajax.js"></script>
<script type="text/javascript">
function Comprobarcampos(){

	if(document.getElementById("gnombre").value==""&&document.getElementById("gapellido2").value==""&&document.getElementById("gapellido1").value==""){
		//alert("No se puede enviar una solicitud vac�a")
		$('#myModal').modal('show');
		
		return false;
	}else{
		return true;
	}
}
function actualizar(elemento){
	if(elemento.id[0]=="p"){
		document.getElementById("g"+elemento.id.substring(1)).value=elemento.value
	}else{
		document.getElementById("p"+elemento.id.substring(1)).value=elemento.value	
	}
}
function mostrarocultar(campo){	
	var actual=document.getElementById("tr"+campo+"p").style.display;
	if(actual=="none"){
		var cambiar=""
		var checkbox=true
	}else{
		var cambiar="none"
		var checkbox=false
	}
	document.getElementById("tr"+campo+"p").style.display=cambiar
	document.getElementById("tr"+campo+"g").style.display=cambiar
	
	document.getElementById("c"+campo+"p").checked=checkbox
	document.getElementById("c"+campo+"g").checked=checkbox
	
	document.getElementById("g"+campo).value=""
	document.getElementById("p"+campo).value=""
		
}
</script>

<title>Area de usuario</title>
	<%@include file="../ContenidoPrincipal/Cabecera.jsp"%>

<body>

<div class="container">
 
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog" > <!--  el bakcgorun modifica el marco -->
    
      <!-- Modal content-->
      <div class="modal-content"> <!--  este es el backgroun blanco -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Se ha producido un error</h4>
        </div>
        <div class="modal-body">
          <p>No se puede enviar una solicitud con los campos vacios, por favor revisa los campos y vuelve a intentarlo</p>
        </div>
        <div class="modal-footer" >
          <button type="button" class="btn btn-info" data-dismiss="modal" >Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>




<div class="container-fluid" style="margin-top:5%;">
		<div class="row container-fluid">
		<div class="col-sm-12 col-xs-12 col-md-0 hidden-md hidden-lg" align="left">
		      <button type="button" class="btn btn-default"  onclick="from('<%=session.getAttribute("usuario") %>','contenido','DatosUsuario')">Visualizar</button>
		      <button type="button" class="btn btn-default" onclick="from('<%=session.getAttribute("usuario") %>','contenido','EditarUsuario')">Editar</button>
		      <button type="button" class="btn btn-default" onclick="from('<%=session.getAttribute("usuario") %>','contenido','ActividadUsuario')">Actividad</button>
		      
		  </div>
		  <div class="col-md-3 col-sm-0 col-xs-0 hidden-sm hidden-xs"  align="right">
		  	  <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
		      <button type="button" class="btn btn-default" onclick="from('<%=session.getAttribute("usuario") %>','contenido','DatosUsuario')">Visualizar Datos</button>
		      <button type="button" class="btn btn-default" onclick="from('<%=session.getAttribute("usuario") %>','contenido','EditarUsuario')">Editar Datos</button>
		      <button type="button" class="btn btn-default" onclick="from('<%=session.getAttribute("usuario") %>','contenido','ActividadUsuario')">Actividad de usuario</button>
		      
	        </div>
		  </div>
		  
		  <div class="col-md-8 col-sm-12 col-xs-12" id="contenido">
		  	<%@include file="DatosUsuario.jsp" %>
		  </div>
		  <div class="col-md-1 visible-md"></div>
    </div>

		
	</div>
		<%@include file="../ContenidoPrincipal/pie.jsp"%>
	
</body>
</html>