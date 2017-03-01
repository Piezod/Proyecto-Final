<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


 <head> 
 		
 		<script>
 		function generarusu(){
 			if(document.getElementById("nombre").value.length==0){
 				alert("Antes de utilizar esta funcion  rellene el nombre");
 			}else if(document.getElementById("apellidos").value.length==0){
 				alert("Antes de utilizar esta funcion  rellene los apellidos");

 			}else if(document.getElementById("apellidos").value.split(" ").length<2&&document.getElementById("apellidos").value.split(" ")[0].length>0&&document.getElementById("apellidos").value.split(" ")[1].length>0){
 				alert("Debe introducir los dos apellidos del usuario");
 			}
 			else{
 			var x = document.getElementById("nombre").value.charAt(0)+"."+document.getElementById("apellidos").value.split(" ")[0]+"."+document.getElementById("apellidos").value.split(" ")[1].charAt(0);
			document.getElementById("user").value=x;
 			}
			return 0;
 			
 		}
 		
 		</script>
		<meta name="viewport" content="width=device-width, initial-scale=1">


		<!-- Website CSS style -->
		<link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet">

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		<link rel="stylesheet" href="registro.css">
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

		<title>Admin</title>
	</head>
	<body>
		<div class="container">
			<div class="row main">
				<div class="main-login main-center">
					<form class="" id="registro" method="post" action="#">
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Nombre</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="nombre" id="nombre"  placeholder="Nombre"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Apellidos</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="apellidos" id="apellidos"  placeholder="Apellidos"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="email" id="email"  placeholder="Email"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Nombre de Usuario</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><a onclick="generarusu();" href="#"><i class="fa fa-users fa" aria-hidden="true" ></i></a></span>
									<input type="text" class="form-control" name="user" id="user"  placeholder="Genera el Nombre de usuario pulsando en la izquierda" readonly/>
								</div>
							</div>
						</div>

						

						

						<div class="form-group ">
							<a href="http://deepak646.blogspot.in" target="_blank" type="button" id="button" class="btn btn-primary btn-lg btn-block login-button">Register</a>
						</div>
						
					</form>
				</div>
			</div>
		</div>

		 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../../Bootstrap/js/jquery-1.11.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../../Bootstrap/js/bootstrap.min.js"></script>
	</body>


</html>