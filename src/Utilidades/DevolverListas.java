package Utilidades;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
		ResultSet r=c.sacarundato("select * from usuarios where usuario like '"+usuario+"'");
		ArrayList<String> l=new ArrayList<>();
		while (r.next())
		{
			System.out.println("recojo"+r.getString(1));
			l.add(r.getString(1));
		}
		c.cerrarconexion();
		return l;
	}
	
}
