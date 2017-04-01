package Utilidades;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DevolverListas {
	
	public ArrayList<String> infousuario() throws SQLException
	{
		Conexion c=new Conexion();
		
		ResultSet r=c.sacarundato("select * from usuarios");
		ArrayList<String> l=new ArrayList<>();
		while (r.next())
		{
			l.add(r.getString(1));
		}
		return l;
	}
	
}
