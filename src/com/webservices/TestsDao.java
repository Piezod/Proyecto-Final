package com.webservices;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Utilidades.Conexion;

public class TestsDao {

	public String insertTest(String asignatura ,double nota,String fecha,String hora,String user) {
		Conexion connection = new Conexion();
		try {
			connection.conectar();
			
			if(connection.InsertarExamen( asignatura, nota, fecha, hora,user)){
				return "{\"result\":1}";

			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			return "{\"result\":-1}";
		}
		return "{\"result\":-1}";

	}
	
	public String updateTest(int id, double nota) {
		Conexion connection = new Conexion();
		try {
			connection.conectar();
			
			if(connection.actualizarTest(id, nota)){
				return "{\"result\":1}";

			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			return "{\"result\":-1}";
		}
		return "{\"result\":-1}";

	}

	public List<Test> getTests(int inicio, int fin,String user) {

		List<Test> testsList = new ArrayList<>();
		Conexion connection = new Conexion();
		try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {

			ResultSet res = connection.resulsettestsAndroid(inicio, fin,user);
			while (res.next()) {
				testsList.add(new Test(res.getString(2), res.getDouble(3),
						res.getString(6),res.getInt(1),res.getString(4),res.getString(5)));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.cerrarconexion();
		return testsList;

	}


	public int getCountTests(String usuario) {
		Conexion connection = new Conexion();
		int count;
		try {
			connection.conectar();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		count = connection.contar("select count(*) from examenes where idUsuario like '"+usuario+"'");

		connection.cerrarconexion();
		return count;
	}

}
