package serverlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;


public class Conexion {
	/* 
	Cabezón
	*/
	private Connection conexion;
	public void conectar() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://31.200.243.193:51987/dbdamproject";
		Connection con = DriverManager.getConnection(url, "usrdamproject","GgQXVfYTCu3eBsXY");
		if(con!=null){
			conexion=con;
		}

	}
	  
	public boolean comprobarlogin(String user,String pass) throws SQLException{
		Statement consulta=conexion.createStatement();
		
		ResultSet res=consulta.executeQuery("select * from dbdamproject.usuarios where usuario like '"+user+"' and pass like '"+pass+"'");
		//System.out.println("select * from dbdamproject.usuarios where usuario like '"+user+"' and pass like '"+pass+"'");
		//ResultSet res=consulta.executeQuery("select * from usuarios where idusuarios like '"+user+"' and pass like '"+pass+"'");
		return res.next();
	}
	
	private int contar(String query) throws SQLException{
		Statement consulta=conexion.createStatement();
		ResultSet res=consulta.executeQuery(query);
		int dev;
		res.next();
			dev=res.getInt(1);
		
		return dev;
	}
	
	private String generarusuario(String nombre,String apellido1,String apellido2) throws SQLException{
		String usuario="";
		usuario+=nombre.charAt(0);
		if(nombre.contains(" ")){
			usuario+=nombre.split(" ")[1].charAt(0);
		}
		usuario+=apellido1;
		usuario+=apellido2.charAt(0);
		usuario=usuario.toLowerCase();
		int num= contar("select count(*) from dbdamproject.usuarios where usuario like '"+usuario+"'");
		if(num!=0){
			usuario+=num;
		}
	
		return usuario;
	}
	
	public void InsertarRegistro(String nombre,String apellido1,String apellido2,String email,String curso,String ciclo) throws SQLException{
		Statement insertar=conexion.createStatement();		
		
		insertar.executeUpdate("Insert into dbdamproject.usuarios values ('"+generarusuario(nombre,apellido1,apellido2)+"','"+UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10)+"','"+nombre+"','"+apellido1+"','"+apellido2+"','"+Long.toHexString(Double.doubleToLongBits(Math.random()))+"','"+email+"','"+curso+"','"+ciclo+"')");
	}
	
	/*
	 * Metodo que recarga un array con los usuarios que tenemos en la base de datos
	 */
	public String [] nombredeusuarios() throws SQLException
	{
		int l=contar("select count(*) from dbdamproject.usuarios");
		String []x = new String [l];
		
		Statement consulta=conexion.createStatement();
		
		ResultSet res=consulta.executeQuery("select * from dbdamproject.usuarios");
		int i=0;
			while (res.next())
			{
				
				x[i]=res.getString("usuario");
				i++;
			}
		return x;
	}
}
