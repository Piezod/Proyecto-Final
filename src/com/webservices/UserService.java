package com.webservices;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;  
@Path("/UserService") 

	public class UserService {  
	   UserDao userDao = new UserDao();  
	   
	   @GET
	   @Path("/users/{login}/{pass}")
	   @Produces(MediaType.APPLICATION_JSON)
	   public List<User> getUser(@PathParam("login") String login
			   ,@PathParam("pass") String pass){
		   return userDao.getUser(login, pass);
	   }

}
