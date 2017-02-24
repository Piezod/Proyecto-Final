
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Conexion {
	/*
	Cabezón
	*/
	Connection conexion;
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
		ResultSet res=consulta.executeQuery("select * from usuarios where idusuarios like '"+user+"' and pass like '"+pass+"'");
		
		//ResultSet res=consulta.executeQuery("select * from usuarios where idusuarios like '"+user+"' and pass like '"+pass+"'");
		return res.next();
	}
}
