package com.webservices;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Utilidades.Conexion;

public class QuestionsDao {

	public List<Questions> getQuestions(int inicio, int fin) {

		List<Questions> questionsList = new ArrayList<>();
		Conexion connection = new Conexion();
		try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {

			ResultSet res = connection.resulsetpreguntasAndroid(inicio, fin);
			while (res.next()) {
				questionsList.add(new Questions(res.getInt(1), res.getString(2),
						res.getString(3).replaceAll("<br>", "\n").replace("<pre>", "").replaceAll("</pre>", ""),
						res.getString(4)));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.cerrarconexion();
		return questionsList;

	}

	public int getCountQuestions() {
		Conexion connection = new Conexion();
		int count;
		try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		count = connection.contar("select count(*) from preguntas");

		connection.cerrarconexion();
		return count;
	}

	public List<Answers> getAnswers(int inicio, int fin, int idpregunta) {

		List<Answers> questionsList = new ArrayList<>();
		Conexion connection = new Conexion();
		try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {

			ResultSet res = connection.resulsetrespuestasAndroid(inicio, fin, idpregunta);
			while (res.next()) {
				questionsList.add(new Answers(res.getInt(1),
						res.getString(2).replaceAll("<br>", "\n").replace("<pre>", "").replaceAll("</pre>", ""),
						res.getString(7), res.getInt(3), res.getInt(4), res.getInt(5)));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.cerrarconexion();
		return questionsList;

	}

	public int getCountAnswers(int idpregunta) {
		Conexion connection = new Conexion();
		int count;
		try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		count = connection.contar("select count(*) from respuestas where idpregunta like '" + idpregunta + "'");
		connection.cerrarconexion();
		return count;
	}

	public int getCountAnswersUser(String user,String valid) {
		Conexion connection = new Conexion();
		int count;
		try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		if(valid.equals("1")){
			count = connection.contar("select count(*) from respuestas where idusuario like '" + user + "' and mejorrespuesta like '"+valid+"'");
		}
		else{
			count = connection.contar("select count(*) from respuestas where idusuario like '" + user + "'");
		}
		connection.cerrarconexion();
		return count;
	}

	public int uploadAnswer(String answer, String user, int idpregunta) {

		Conexion connection = new Conexion();
		int count;
		try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		count = connection.InsertarRespuestas(answer.replaceAll("__", "<br>").replaceAll("_", " "), idpregunta,
				user.replace("_", "."), "0");
		connection.cerrarconexion();
		return count;
	}

	public int uploadQuestion(String title, String content, String user) {

		Conexion connection = new Conexion();
		int count;
		try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		count = connection.InsertarPregunta(title.replaceAll("_", " "),
				content.replaceAll("__", "<br>").replaceAll("_", " "), user.replace("_", "."), "0");
		connection.cerrarconexion();
		return count;
	}

	public List<Questions> getUserQuestions(int inicio, int fin, String user) {

		List<Questions> questionsList = new ArrayList<>();
		Conexion connection = new Conexion();
		try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			ResultSet res = connection.resulsetpreguntasAndroidUser(inicio, fin,user);
			while (res.next()) {
				questionsList.add(new Questions(res.getInt(1), res.getString(2),
						res.getString(3).replaceAll("<br>", "\n").replace("<pre>", "").replaceAll("</pre>", ""),
						res.getString(4)));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.cerrarconexion();
		return questionsList;

	}

	public int getCountUserQuestions(String user) {
		Conexion connection = new Conexion();
		int count;
		try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		count = connection.contar("select count(*) from preguntas where idusuario like '" + user + "'");
		connection.cerrarconexion();
		return count;
	}

	public List<Answers> getAnswersUser(int inicio,int fin,String user, String valid) {
		List<Answers> answersList = new ArrayList<>();
		Conexion connection = new Conexion();
		try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {

			ResultSet res = connection.resulsetrespuestasAndroidProfile(inicio, fin, user,valid);
			while (res.next()) {
				answersList.add(new Answers(res.getInt(1),
						res.getString(2).replaceAll("<br>", "\n").replace("<pre>", "").replaceAll("</pre>", ""),
						res.getString(7), res.getInt(3), res.getInt(4), res.getInt(5)));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.cerrarconexion();
		return answersList;
	}
}
