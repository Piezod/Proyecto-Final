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
		      userList.add(user);
		      return userList; 
		   } 
	  
   
}
