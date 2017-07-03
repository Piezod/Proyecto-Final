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

	   @GET
	   @Path("/remindpass/{email}")
	   @Produces(MediaType.TEXT_PLAIN)
	   public String SendEmailResetPassword(@PathParam("email") String email){
		   if(userDao.SendEmailResetPassword(email)){
			   return "Correct";
		   }
		   else{
			   return "False";
		   }
		   
	   }

	   @GET
	   @Path("/checkemail/{email}")
	   @Produces(MediaType.TEXT_PLAIN)
	   public String CheckEmail(@PathParam("email") String email){
		   if(userDao.CheckEmail(email)){
			   return "Correct";
		   }
		   else{
			   return "False";
		   }
		   
	   }
	   
	   @GET
	   @Path("/checkcode/{email}/{code}")
	   @Produces(MediaType.TEXT_PLAIN)
	   public String CheckCode(@PathParam("email") String email,@PathParam("code") String code){
		   if(userDao.CheckEmailValidation(email,code)){
			   return "Correct";
		   }
		   else{
			   return "False";
		   }
		   
	   }

	   @GET
	   @Path("/updatepassword/{code}/{newpass}")
	   @Produces(MediaType.TEXT_PLAIN)
	   public String UpdatePass(@PathParam("code") String code,@PathParam("newpass") String newpass){
		   if(userDao.Newpassword(code,newpass)){
			   
			   return "Correct";
		   }
		   else{
			   return "False";
		   }
		   
	   }
	   @GET
	   @Path("/userdata/{user}")
	   @Produces(MediaType.APPLICATION_JSON)
	   public List<UserData> UserData(@PathParam("user") String user){
		
		   
		   
		   
		   return userDao.getUserInfo(user);
			   
			   
		   
	   }
	   
}
