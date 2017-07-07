package com.webservices;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
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

import org.json.JSONObject;

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
	   @Path("/questionscount")
	   @Produces(MediaType.TEXT_PLAIN)
	   public int getQuestionsCount(){
 
		   return questionsDao.getCountQuestions();
	   }
	   
	   @GET
	   @Path("/questionssearch/{inicio}/{fin}/{search}")
	   @Produces(MediaType.APPLICATION_JSON)
	   public List<Questions> getQuestionsSearch(@PathParam("inicio") int inicio
			   ,@PathParam("fin") int fin,@PathParam("search") String search){
 
		   return questionsDao.getQuestionssearch(inicio,fin,search);
	   }
	   
	   @GET
	   @Path("/questionscountsearch/{search}")
	   @Produces(MediaType.TEXT_PLAIN)
	   public int getQuestionsCountSeach(@PathParam("search") String search){
 
		   return questionsDao.getCountQuestionssearch(search);
	   }
	   
	   @GET
	   @Path("/questionsuser/{inicio}/{fin}/{user}")
	   @Produces(MediaType.APPLICATION_JSON)
	   public List<Questions> getQuestionsUser(@PathParam("inicio") int inicio,@PathParam("fin") int fin,
			   @PathParam("user") String user){
 
		   return questionsDao.getUserQuestions(inicio,fin,user);
	   }
	   
	   @GET
	   @Path("/questionscountuser/{user}")
	   @Produces(MediaType.TEXT_PLAIN)
	   public int getUserQuestionsCount(@PathParam("user") String user){
 
		   return questionsDao.getCountUserQuestions(user);
	   }

	   @GET
	   @Path("/answers/{inicio}/{fin}/{idpregunta}")
	   @Produces(MediaType.APPLICATION_JSON)
	   public List<Answers> getQuestions(@PathParam("inicio") int inicio,@PathParam("fin") int fin,
			   @PathParam("idpregunta") int idpregunta){
 
		   return questionsDao.getAnswers(inicio,fin,idpregunta);
	   }

	   @GET
	   @Path("/answerscount/{idpregunta}")
	   @Produces(MediaType.TEXT_PLAIN)
	   public int getAnswersCount(@PathParam("idpregunta") int idpregunta){
 
		   return questionsDao.getCountAnswers(idpregunta);
	   }

	   @GET
	   @Path("/answerscountuser/{user}/{valid}")
	   @Produces(MediaType.TEXT_PLAIN)
	   public int getAnswerCountUser(@PathParam("user") String user,@PathParam("valid") String valid){
 
		   return questionsDao.getCountAnswersUser(user,valid);
	   }
	   
	   @GET
	   @Path("/answersuser/{user}/{valid}/{inicio}/{fin}")
	   @Produces(MediaType.APPLICATION_JSON)
	   public List<Answers> getAnswersUser(@PathParam("user") String user,@PathParam("valid") String valid,
			   @PathParam("inicio") int inicio,@PathParam("fin") int fin){
 
		   return questionsDao.getAnswersUser(inicio,fin,user,valid);
	   }
	   

	   @GET
	   @Path("/uploadanswer/{answer}/{user}/{idpregunta}")
	   @Produces(MediaType.TEXT_PLAIN)
	   public String uploadAnswer(@PathParam("answer") String answer
			   ,@PathParam("user") String user,@PathParam("idpregunta") int idpregunta){
 
		   return questionsDao.uploadAnswer(answer,user,idpregunta);
	   }
	   
	   @POST
	   @Path("/uploadanswer")
	   @Consumes(MediaType.APPLICATION_JSON)
	   @Produces(MediaType.APPLICATION_JSON)
	   public String uploadAnswerPost(String json){
	        JSONObject jsonobject = new JSONObject(json); 

		   return questionsDao.uploadAnswer(jsonobject.getString("answer"),jsonobject.getString("author")
				   ,jsonobject.getInt("idquestion"));
	   }

	   
	   @POST
	   @Path("/uploadquestion")
	   @Consumes(MediaType.APPLICATION_JSON)
	   @Produces(MediaType.APPLICATION_JSON)
	   public String uploadQuestionPost(String json){
	        JSONObject jsonobject = new JSONObject(json); 

	        return questionsDao.uploadQuestion(jsonobject.getString("title")
	        		,jsonobject.getString("content"),
	        		jsonobject.getString("user"));
		   
	   }
	   
	   

}
