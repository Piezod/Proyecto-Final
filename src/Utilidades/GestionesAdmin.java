package Utilidades;

import java.sql.ResultSet;
import java.sql.SQLException;

public class GestionesAdmin {

	/** Metodo para realizar el cambio de los datos y aceptar la solicitud que manda el usuario 
	 * @param idsolicitud la id de solicitud que se recoje para posteriormente tratarlo y sacar toda la informacion y actualizarla.
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public void AceptarSolicitudCambio(int idsolicitud) throws ClassNotFoundException, SQLException
	{
		Conexion c=new Conexion();
		c.conectar();
		String query="select * from solicitudes where idsolicitud = "+idsolicitud+"";
		System.out.println(query);
		
		ResultSet r=c.sacarresultset(query);
		
		if (r.next())
		{
		
			actualizar(r.getString(3), c, "nombre",r.getString(2));	 //nombre
			actualizar(r.getString(4), c, "apellido1",r.getString(2));    //apellido1
			actualizar(r.getString(5), c, "apellido2",r.getString(2));   //apellido2
			String queryid="UPDATE solicitudes set pendiente=0 where idsolicitud ="+r.getInt(1);
			//System.out.println("cambiando el estado "+queryid);
			c.actualizardato(queryid);
				
		}
		else
		{
			System.out.println("no se ha podido encontrar la id de solicitud, fallo en la actualizacion");
		}
		
		
		c.cerrarconexion();
		
	}
	
	/** Metodo para realizar el update del campo de usuarios para el metodo actualizar
	 * 
	 * @param dato el dato a cambiar
	 * @param c objeto de clase conexion
	 * @param campo la columna a la que se quiere cambiar
	 * @param usuario el usuario que lo realiza
	 * @throws SQLException
	 */
	public void actualizar(String dato, Conexion c,String campo,String usuario) throws SQLException
	{
		 if (dato.length()>0)
		 {
			 c.actualizardato("UPDATE usuarios set "+campo+" = '"+dato+"' where usuario like '"+usuario+"' ");
		 }
	}

	/** Metodo para realizar el cambio de la solicitud a 0 y asi cancelarla, 
	 * @param idsolicitud
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public void CancelarSolicitud(int idsolicitud) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		Conexion c=new Conexion();
		c.conectar();
		String query="select * from solicitudes where idsolicitud = "+idsolicitud+"";
		System.out.println(query);
		
		ResultSet r=c.sacarresultset(query);
		
		if (r.next())
		{
			String queryid="UPDATE solicitudes set pendiente=0 where idsolicitud ="+r.getInt(1);
			c.actualizardato(queryid);
		}
		else
		{
			System.out.println("no se ha podido encontrar la id de solicitud, fallo en la actualizacion");
		}
		
		
		c.cerrarconexion();
	}
}
