package Utilidades;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class SolicitudesAdmin {
	
	
	/** Metodo que rellena un hasmap con la informacion de la tabla de solicitudes
	 * @return devuelve un hasmap con la informacion de la tabla de solicitudes, la key sera cada id de la solicitud
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public HashMap<String, ArrayList> Solicitudespendientes() throws SQLException, ClassNotFoundException
	{
		String query="select * from solicitudes where pendiente = 1 ";
		System.out.println(query);
		Conexion c=new Conexion();
		c.conectar();
		
		ResultSet r=c.sacarresultset(query);
		HashMap<String, ArrayList> hm=new HashMap<>();
		GestionCadenas gc=new GestionCadenas(null);
		String dato,numero;
		/*
		 *  Como las respuestas pueden ser muy largas, mostraremos solo X caracteres. LLamaremos a un metodo de la clase de recortarcadenas
		 *  y ella sera la que trate la respuesta y la ponga en el hasmap. 
		 */
		while (r.next())
		{
			ArrayList l=new ArrayList<>();
			l.add(r.getString(1)); //idsolicitud
			l.add(r.getString(2)); //usuario
			l.add(r.getString(3)); //nombre
			l.add(r.getString(4)); //apellido
			l.add(r.getString(5)); //apellido2
			l.add(r.getString(6)); //pendiente
			hm.put(r.getString(1), l); // configuro cada vuelta del hasmap con la key (idrespuesta) y la l que es el arraylist con la info de esa respuesta
		}
		c.cerrarconexion();
		return hm;
	}

}
