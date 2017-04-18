package Utilidades;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class DevolverListas {
	
	private String usuario;
	public DevolverListas(String parameter) {
		// TODO Auto-generated constructor stub
		usuario=parameter;
	}

	public ArrayList<String> infousuario() throws SQLException, ClassNotFoundException
	{
		Conexion c=new Conexion();
		c.conectar();
		ResultSet r=c.sacarresultset("select * from usuarios where usuario like '"+usuario+"'");
		ArrayList<String> l=new ArrayList<>();
		while (r.next())
		{
			
			l.add(r.getString(1));
			l.add(r.getString(2));
			l.add(r.getString(3));
		}
		c.cerrarconexion();
		return l;
	}
	
	public ArrayList<String> respuestasusuario() throws SQLException, ClassNotFoundException
	{
		Conexion c=new Conexion();
		c.conectar();
		ResultSet r=c.sacarresultset("select * from usuarios where usuario like '"+usuario+"'");
		ArrayList<String> l=new ArrayList<>();
		while (r.next())
		{
			
			l.add(r.getString(1));
			l.add(r.getString(2));
			l.add(r.getString(3));
		}
		c.cerrarconexion();
		return l;
	}
	
	/*
	 * Prueba sencilla string string, lo siguiente seria String arraylist
	 */
	public HashMap<String, String> preguntasusuariohm1() throws SQLException, ClassNotFoundException
	{
		System.out.println("select * from preguntas where idusuario like '"+usuario+"'");
		Conexion c=new Conexion();
		c.conectar();
		ResultSet r=c.sacarresultset("select * from preguntas where idusuario like '"+usuario+"'");
		HashMap<String, String> hm=new HashMap<>();
		String dato,numero;
		while (r.next())
		{
			System.out.println(r.getString(1)+r.getString(3));
			hm.put(r.getString(1), r.getString(3));
		}
		c.cerrarconexion();
		return hm;
	}
	
	/*
	 * Hasmap que devolvera una key string y en cada posicion un conjunto de informacion en un array list
	 */
	public HashMap<String, ArrayList> preguntasusuariohm2() throws SQLException, ClassNotFoundException
	{
		System.out.println("select * from preguntas where idusuario like '"+usuario+"'");
		Conexion c=new Conexion();
		c.conectar();
		ResultSet r=c.sacarresultset("select * from preguntas where idusuario like '"+usuario+"'");
		HashMap<String, ArrayList<String>> hm=new HashMap<>();
		ArrayList<String> l=new ArrayList<>();
		String dato,numero;
		while (r.next())
		{
			l.add(r.getString(2)); // Titulo pregunta
			l.add(r.getString(3)); // Descripcion pregunta
			l.add(r.getString(4)); // id usuario
			l.add(r.getString(5)); //fecha y hora pregunta
			hm.put(r.getString(1), l);
		}
		c.cerrarconexion();
		return hm;
	}
	
}
