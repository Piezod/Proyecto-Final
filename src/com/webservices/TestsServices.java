package com.webservices;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.json.JSONObject;

@Path("/TestService") 
public class TestsServices {

	TestsDao testDao=new TestsDao();
	
	@POST
	   @Path("/updatetest")
	   @Consumes(MediaType.APPLICATION_JSON)
	   @Produces(MediaType.APPLICATION_JSON)
	   public String uploadTest(String json){
	        JSONObject jsonobject = new JSONObject(json); 

		   return testDao.updateTest(jsonobject.getInt("id"),jsonobject.getDouble("nota"));
	   }
	@POST
	   @Path("/inserttest")
	   @Consumes(MediaType.APPLICATION_JSON)
	   @Produces(MediaType.APPLICATION_JSON)
	   public String insertTest(String json){
	        JSONObject jsonobject = new JSONObject(json); 

		   return testDao.insertTest(jsonobject.getString("asignatura"),
				   jsonobject.getDouble("nota"), jsonobject.getString("fecha"),
				   jsonobject.getString("hora"), jsonobject.getString("user"));
	   }
	
		@GET
	   @Path("/tests/{inicio}/{fin}/{user}")
	   @Produces(MediaType.APPLICATION_JSON)
	   public List<Test> getQuestions(@PathParam("inicio") int inicio,@PathParam("fin") int fin,
			   @PathParam("user") String user){

		   return testDao.getTests(inicio,fin,user);
	   }
	   
	   @GET
	   @Path("/testscount/{usuario}")
	   @Produces(MediaType.TEXT_PLAIN)
	   public int getQuestionsCount(@PathParam("usuario") String usuario){

		   return testDao.getCountTests(usuario);
	   }

}
