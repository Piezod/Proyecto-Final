package serverlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.Normalizer;
import java.util.UUID;

public class Conexion {
	/*
	 * Cabezón
	 */
	private Connection conexion;

	public void conectar() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://31.200.243.193:51987/dbdamproject";
		Connection con = DriverManager.getConnection(url, "usrdamproject", "GgQXVfYTCu3eBsXY");
		if (con != null) {
			conexion = con;
		}

	}

	public boolean comprobarlogin(String user, String pass,String codvalid) throws SQLException {
		boolean enc=false;
		String sql="select * from dbdamproject.usuarios where usuario like ? and pass like ? and validado like ?";
		PreparedStatement consulta = conexion.prepareStatement(sql);
		user=user.replaceAll("\'\"\\@\\$", "");
		pass=pass.replaceAll("\'\"\\@\\$", "");
		consulta.setString(1, user);
		consulta.setString(2, pass);
		consulta.setInt(3, 1);
		ResultSet res = consulta.executeQuery();
		
		enc= res.next();

		if(!enc){
			sql="select * from dbdamproject.usuarios where usuario like ? and pass like ? and validacion like ? and validado like ?";
			PreparedStatement consulta2=conexion.prepareStatement(sql);
			consulta2.setString(1, user);
			consulta2.setString(2, pass);
			consulta2.setString(3, codvalid);
			consulta2.setInt(4, 1);
			ResultSet res2=consulta2.executeQuery();
			if(res2.next()){
				Statement consulta3=conexion.createStatement();
				consulta3.executeUpdate("update dbdamproject.usuarios set validacion='0', validado='1' where usuario like '"+user+"'");
				enc=true;
			}
		}
		
		
		return enc;
	}

	private int contar(String query) throws SQLException {
		Statement consulta = conexion.createStatement();
		ResultSet res = consulta.executeQuery(query);
		int dev;
		res.next();
		dev = res.getInt(1);

		return dev;
	}

	public String generarusuario(String nombre, String apellido1, String apellido2) throws SQLException {
		String usuario = "";
		usuario += nombre.charAt(0);
		if (nombre.contains(" ")) {
			usuario += nombre.split(" ")[1].charAt(0);
		}
		usuario += apellido1;
		usuario += apellido2.charAt(0);
		usuario = usuario.toLowerCase();
		usuario=Normalizer.normalize(usuario, Normalizer.Form.NFD).replaceAll("[^a-zA-Z]", "");
		int num=0;
		 num = contar("select count(*) from dbdamproject.usuarios where usuario like '" + usuario + "'");
		if (num != 0) {
			String usuariotemp="";
			do{
			num++;
			usuariotemp=usuario;
			usuariotemp += num;
			}while(comprobar("select * from usuarios where usuario like '"+usuariotemp+"'"));
		}
		if(num!=0){
		usuario+=num;
		}
		return usuario;
	}

	public int InsertarRegistro(String usuario,String pass,String validacion,String nombre, String apellido1, String apellido2, String email, String curso,
			String ciclo) throws SQLException {
		String sql="Insert into dbdamproject.usuarios values (?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement insertar = conexion.prepareStatement(sql);
		insertar.setString(1, usuario);
		insertar.setString(2, pass);
		insertar.setString(3, nombre);
		insertar.setString(4, apellido1);
		insertar.setString(5, apellido2);
		insertar.setString(6, validacion);
		insertar.setString(7, email);
		insertar.setString(8, curso);
		insertar.setString(9,ciclo);
		insertar.setInt(10, 0);
		
		
		
		int res=insertar.executeUpdate();
		
		return res;
	}
	
	/*
	 * Metodo que nos devuelve el ultimo id de lo que queramos y la tabla, le pasamos la pk y la tabla
	 */
	
	public int ultimoid(String primarykey,String tabla) throws SQLException
	{
		Statement consulta = conexion.createStatement();
		ResultSet res = consulta.executeQuery("select "+primarykey+" from "+tabla);
		int dev=0;
		
		while(res.next())
			{
			dev = res.getInt(primarykey);
			}
		return dev+1;
	}
	
	/*
	 * Metodo para insertar datos en la tabla preguntas, recogeremos del formulario el titulo y la pregunta en si 
	 * y pondremos el usuario que lo ha realizado 
	 */
	public int InsertarPregunta(int idpregunta,String titulo,String descripcion,String usuario) throws SQLException {
		String sql="Insert into dbdamproject.preguntas values (?,?,?,?)";
		System.out.println(ultimoid("idpreguntas", "preguntas")+titulo+descripcion+usuario);
		PreparedStatement insertar = conexion.prepareStatement(sql);
		insertar.setInt(1,idpregunta );
		insertar.setString(2, titulo);
		insertar.setString(3, descripcion);
		insertar.setString(4, usuario);
		
		
		
		int res=insertar.executeUpdate();
		
		return res;
	}

	public String[] sacarusuarios() throws SQLException {

		String x[] = new String[contar("select count(*) from dbdamproject.usuarios")];

		Statement consulta = conexion.createStatement();
		ResultSet res = consulta.executeQuery("select * from dbdamproject.usuarios");

		int i = 0;
		while (res.next()) {
			x[i] = res.getString(1);
			i++;

		}

		return x;
	}
	
	/*
	 * Metodo que devuelve todas las preguntas
	 */
	
	public String[] sacartodaslaspreguntas() throws SQLException {

		String x[] = new String[contar("select count(*) from dbdamproject.preguntas")];

		Statement consulta = conexion.createStatement();
		ResultSet res = consulta.executeQuery("select * from dbdamproject.preguntas");

		int i = 0;
		while (res.next()) {
			x[i] = res.getString(3);
			i++;

		}

		return x;
	}
	
	/*
	 * Metodo que devuelve  la pregunta segun la id que le enviemos
	 */
	
	public String[] sacarpreguntaporid(int id) throws SQLException {

		String x[] = new String[4];

		Statement consulta = conexion.createStatement();
		ResultSet res = consulta.executeQuery("select * from dbdamproject.preguntas where idpreguntas="+id+"");

		int i = 0;
		if (res.next()) {
			x[0] = res.getString(1);
			x[1] = res.getString(2);
			x[2] = res.getString(3);
			x[3] = res.getString(4);

		}

		return x;
	}

	public boolean comprobar(String query) throws SQLException {
		Statement consulta = conexion.createStatement();
		ResultSet res = consulta.executeQuery(query);

		return res.next();
	}

	public String recibirdato(String query) throws SQLException {
		Statement consulta = conexion.createStatement();
		ResultSet res = consulta.executeQuery(query);
		res.next();
		return res.getString(1);
	}
}
