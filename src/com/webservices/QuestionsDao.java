package com.webservices;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Utilidades.Conexion;

public class QuestionsDao {

	public List<Questions> getQuestions(int inicio,int fin) {


		List<Questions> questionsList = new ArrayList<>(); 
	      Conexion connection=new Conexion();
	      try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      try {

		      ResultSet res=connection.resulsetpreguntasAndroid(inicio, fin);
			while(res.next()){
			      questionsList.add(new Questions(res.getInt(1),res.getString(2), res.getString(3).replaceAll("<br>","\n"), res.getString(4),connection.contar("select count(*) from preguntas")));

			  }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      connection.cerrarconexion();
	      return questionsList; 
	      
	}

	
	public List<Answers> getAnswers(int inicio,int fin,int idpregunta) {


		List<Answers> questionsList = new ArrayList<>(); 
	      Conexion connection=new Conexion();
	      try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      try {

		    ResultSet res=connection.resulsetrespuestasAndroid(inicio, fin,idpregunta);
			while(res.next()){
			      questionsList.add(new Answers(res.getInt(1),res.getString(2), res.getString(7), res.getInt(3), res.getInt(4),connection.contar("select count(*) from respuestas where idpregunta like '"+idpregunta+"'")));

			  }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      connection.cerrarconexion();
	      return questionsList; 
	      
	}

}
