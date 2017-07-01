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
@Path("/QuestionsService") 

public class QuestionsService {
	   QuestionsDao questionsDao = new QuestionsDao();

	   @GET
	   @Path("/questions/{inicio}/{fin}")
	   @Produces(MediaType.APPLICATION_JSON)
	   public List<Questions> getQuestions(@PathParam("inicio") int inicio,@PathParam("fin") int fin){
 
		   return questionsDao.getQuestions(inicio,fin);
	   }

	   @GET
	   @Path("/answers/{inicio}/{fin}/{idpregunta}")
	   @Produces(MediaType.APPLICATION_JSON)
	   public List<Answers> getQuestions(@PathParam("inicio") int inicio,@PathParam("fin") int fin,
			   @PathParam("idpregunta") int idpregunta){
 
		   return questionsDao.getAnswers(inicio,fin,idpregunta);
	   }

}
