package com.webservices;

import Utilidades.*;
import java.io.File; 
import java.io.FileInputStream; 
import java.io.FileNotFoundException;  
import java.io.FileOutputStream; 
import java.io.IOException; 
import java.io.ObjectInputStream; 
import java.io.ObjectOutputStream;
import java.sql.SQLException;
import java.util.ArrayList; 
import java.util.List;

import javax.servlet.http.HttpSession;  

public class UserDao { 
	   public List<User> getUser(String login,String pass){ 
		      
		      List<User> userList = new ArrayList<>(); 
		      User user=new User(login, pass);
		      Conexion connection=new Conexion();
		      try {
				connection.conectar();
				user.setValid(connection.comprobarlogin(user.getUser(), user.getPassword(), "0"));
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      user.setPassword(user.getPassword().hashCode()+"");
		      if(user.isValid()){
			      user.setEmail(connection.sacarundatostring("select email from usuarios where usuario like '"+user.getUser()+"'"));
		      }
		      else{
		    	  user.setEmail("");
		      }
		      userList.add(user);
		      connection.cerrarconexion();

		      return userList; 
		   }
	   
	   
	   public boolean SendEmailResetPassword(String email){
		   Conexion connection=new Conexion();
		   try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			if(connection.comprobar("select * from dbdamproject.usuarios where email like '"+email+"'")){
				String validacion=Long.toHexString(Double.doubleToLongBits(Math.random()));
				connection.nuevacomprobacion(validacion, email);
				String ruta="http://90.162.66.76/EstudiantesConecta2/recuperarpass";
				Correo correo=new Correo("<h1>Parece que ha perdido su contraseña</h1>Acceda a <a href="+'"'+ruta+"?cod="+validacion+'"'+">este link</a> para reestablecer su contraseña<br>O introduzca este código en su app "+validacion+"<br><strong>Si usted no ha solicitado este cambio ignore este correo</strong>", email, "Recuperacion de contraseña estudiantes conectados");
				correo.SendMail();
			    connection.cerrarconexion();

				return true;

	   }
			else{
			    connection.cerrarconexion();
				return false;
			}

	   }

	   public boolean CheckEmail(String email){
		   Conexion connection=new Conexion();
		   try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			if(connection.comprobar("select * from dbdamproject.usuarios where email like '"+email+"'  and validacion not like '0'")){
			    connection.cerrarconexion();
				return true;
	   }
			else{
			    connection.cerrarconexion();
				return false;
			}

	   }
	public boolean CheckEmailValidation(String email, String code) {
		Conexion connection=new Conexion();
		   try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			if(connection.comprobar("select * from dbdamproject.usuarios where email like '"+email+"' and validacion like '"+code+"'")){
			    connection.cerrarconexion();
				return true;

	   }
			else{
			    connection.cerrarconexion();
				return false;
			}

	}


	public boolean Newpassword(String code, String newpass) {
		// TODO Auto-generated method stub
		Conexion connection=new Conexion();
		   try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			if(connection.actualizarpass(newpass, code)==1){
				return true;

	   }
			else{
				return false;
			}
	}
   
}
