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
	
	public ArrayList<String> preguntasusuario() throws SQLException, ClassNotFoundException
	{
		Conexion c=new Conexion();
		c.conectar();
		ResultSet r=c.sacarresultset("select idpreguntas from preguntas where idusuario like '"+usuario+"'");
		ArrayList<String> l=new ArrayList<>();
		while (r.next())
		{
			l.add(r.getString(1));
		}
		c.cerrarconexion();
		return l;
	}
	
	
}
