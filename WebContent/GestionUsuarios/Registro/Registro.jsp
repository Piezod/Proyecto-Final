<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>

<script>
	function comprobarregistro() {
		var error = "";
		if (document.getElementById("nombre").value.length == 0) {
			error += "El nombre no puede estar vacío antes de registrarse";
		}
		if (document.getElementById("apellido1").value.length == 0) {
			if (error.length != 0) {
				error += "\n";
			}
			error += "El primer apellido no puede estar vacío antes de registrarse";
		}
		if (document.getElementById("apellido2").value.length == 0) {
			if (error.length != 0) {
				error += "\n";
			}
			error += "El segundo apellido no puede estar vacío antes de registrarse";
		}
		if (document.getElementById("email").value.length == 0) {
			if (error.length != 0) {
				error += "\n";
			}
			error += "El email no puede estar vacío antes de registrarse";
		} else {
			var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

			if (!re.test(document.getElementById("email").value)) {
				if (error.length != 0) {
					error += "\n";
				}
				error += "El email no tiene un formato válido";
			}
		}

		if (error.length != 0) {
			alert(error);
			return false;
		} else {
			alert("Registro correcto");
			return true;
		}

	}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- Website CSS style -->
<link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Website Font style -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link rel="stylesheet" href="registro.css">
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Passion+One'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen'
	rel='stylesheet' type='text/css'>

<title>Admin</title>
</head>
<body>
	<div class="container">
		<div class="row main">
			<div class="main-login main-center">
				<form class="" id="registro" method="post"
					action="../../ServeletRegistro"
					onsubmit="return comprobarregistro();">

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Nombre</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"></i></span>
								<input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre" />
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Apellido
							1</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"></i></span>
								<input type="text" class="form-control" name="apellido1" id="apellido1" placeholder="Primer apellido" />
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Apellido
							2</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"></i></span>
								<input type="text" class="form-control" name="apellido2" id="apellido2" placeholder="Segundo apellido" />
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="cols-sm-2 control-label">Email</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-envelope fa"></i></span>
								<input type="text" class="form-control" name="email" id="email" placeholder="Email" />
							</div>
						</div>
					</div>

					

					<div class="form-group">
						<label class="cols-sm-2 control-label">Ciclo</label>
						<div class="btn-group">
						  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Default button<span class="caret"></span></button>
						  <ul class="dropdown-menu">

						    <li role="presentation"><a href="#">Desarrollo de Aplicaciones Multiplataforma(D.A.M)</a></li>
						    <li role="presentation"><a href="#">Asistencia a la Dirección</a></li>
						    <li role="presentation"><a href="#">Administracion de Sistemas Informaticos y Redes(A.S.I.R)</a></li>
						    <li role="presentation"><a href="#">Sistemas Electrotécnicos y Automatizados</a></li>
						    <li role="presentation"><a href="#">Administración y Finanzas</a></li>
						    
						  </ul>
						</div>
								
							
						</div>
							






					<div class="form-group ">
						<input type="submit" value="Registrate" id="button"
							class="btn btn-primary btn-lg btn-block login-button">
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