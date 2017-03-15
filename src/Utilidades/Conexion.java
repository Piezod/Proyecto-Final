package Utilidades;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.UUID;

public class Conexion {

	private Connection conexion;
	public Connection getConexion() {
		return conexion;
	}

	public void setConexion(Connection conexion) {
		this.conexion = conexion;
	}


	public void conectar() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://31.200.243.193:51987/dbdamproject";
		Connection con = DriverManager.getConnection(url, "usrdamproject", "GgQXVfYTCu3eBsXY");
		if (con != null) {
			conexion = con;
		}

	}
	
	public void cerrarconexion() throws SQLException
	{
		conexion.close();
	}
	
	public void nuevacomprobacion(String codigo,String email) throws SQLException{
		PreparedStatement consulta=conexion.prepareStatement("update dbdamproject.usuarios set validacion=? where email like ?");
		consulta.setString(1, codigo);
		consulta.setString(2, email);
		consulta.executeUpdate();
	}

	public boolean comprobarlogin(String user, String pass,String codvalid) throws SQLException {
		boolean enc=false;
		String sql="select * from dbdamproject.usuarios where usuario like ? and pass like ? and validado like ?";
		PreparedStatement consulta = conexion.prepareStatement(sql);
		user=user.replaceAll("\'\"\\@\\$\\%", "");
		pass=pass.replaceAll("\'\"\\@\\$\\%", "");
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
			consulta2.setInt(4, 0);
			ResultSet res2=consulta2.executeQuery();
			if(res2.next()){
				Statement consulta3=conexion.createStatement();
				consulta3.executeUpdate("update dbdamproject.usuarios set validacion='0', validado='1' where usuario like '"+user+"'");
				enc=true;
			}
		}
		
		
		return enc;
	}

	public void actualizarpass(String pass,String codigo) throws SQLException{
		String sql="update dbdamproject.usuarios set pass=?,validacion=?,validado=? where validacion like ?";
		PreparedStatement consulta=conexion.prepareStatement(sql);
		consulta.setString(1, pass.replaceAll("\'\"\\@\\$\\%", ""));
		consulta.setString(2, "0");
		consulta.setString(3, "1");
		consulta.setString(4, codigo.replaceAll("\'\"\\@\\$\\%", ""));
		consulta.executeUpdate();
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
		System.out.println("select max("+primarykey+") from "+tabla);
		ResultSet res = consulta.executeQuery("select "+primarykey+" from "+tabla);
		int dev=0;
		
		while(res.next())
			{
			dev = res.getInt(primarykey);
			}
		System.out.println("metodo ultimoid devuelvo "+(dev+1));
		return (dev+1);
	}
	
	/*
	 * Metodo para insertar datos en la tabla preguntas, recogeremos del formulario el titulo y la pregunta en si 
	 * y pondremos el usuario que lo ha realizado 
	 */
	public int InsertarPregunta(int idpregunta,String titulo,String descripcion,String usuario) throws SQLException {
		
		String fecha = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		//System.out.println(fecha);
		//0000-00-00 00:00:00
		
		
		String sql="Insert into dbdamproject.preguntas values (?,?,?,?,?)";
		System.out.println(ultimoid("idpreguntas", "preguntas")+titulo+descripcion+usuario);
		PreparedStatement insertar = conexion.prepareStatement(sql);
		insertar.setInt(1,idpregunta );
		insertar.setString(2, titulo);
		insertar.setString(3, descripcion);
		insertar.setString(4, usuario);
		insertar.setString(5, fecha);
		
		
		
		int res=insertar.executeUpdate();
		
		return res;
	}
/*
 *  Metodo para sacar todos los usuarios de la base de datos y entregarlos en un array para trabajar con el
 */
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
	 * Metodo para hacer una consulta a la bse de datos y obtener un dato segun la query que le enviemos, nos devolvera el resulset porque no sabemos
	 * de que tipo de dato estamos hablando, file,string,int
	 */
	
	public ResultSet sacarundato(String query) throws SQLException
	{
		Statement consulta=conexion.createStatement();
		ResultSet res=consulta.executeQuery(query);
		
		return res;
	}
	
	/*
	 * Metodo para hacer una consulta a la bse de datos y obtener un dato segun la query que le enviemos, nos devolvera el resulset porque no sabemos
	 * de que tipo de dato estamos hablando, file,string,int
	 */
	
	public String sacarundatostring(String query) throws SQLException
	{
		Statement consulta=conexion.createStatement();
		ResultSet res=consulta.executeQuery(query);
		String x=null;
		if (res.next())
		{
			 x=res.getString(1);
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

		String x[] = new String[5];

		Statement consulta = conexion.createStatement();
		ResultSet res = consulta.executeQuery("select * from dbdamproject.preguntas where idpreguntas="+id+"");

		int i = 0;
		if (res.next()) {
			x[0] = res.getString(1); //idpregunta
			x[1] = res.getString(2); //titulo
			x[2] = res.getString(3); //descripcion
			x[3] = res.getString(4); //idusuario
			x[4] = res.getString(5); //fechayhora
		}

		return x;
	}
	
	/*
	 * Metodo que devuelve  los datos de las  ultimas preguntas introducidas en la bd
	 */
	
	public int[] idultimas10preguntas() throws SQLException {

		int x[] = new int[10];

		Statement consulta = conexion.createStatement();
		ResultSet res = consulta.executeQuery("select idpreguntas from dbdamproject.preguntas order by idpreguntas desc limit 10");

		int i = 0;
		while (res.next()) {
			x[i] = res.getInt(1); //idpregunta
			i++;

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
	
	/*
	 * Metodo que nos devuelve el array con las ids de las preguntas que cumplen con lo que estamos buscando
	 */
	public int [] busquedaheader(String valor) throws SQLException {
		Statement consulta = conexion.createStatement();
		ResultSet res = consulta.executeQuery("SELECT count(*) FROM dbdamproject.preguntas where descripcion like '%"+valor+"%'");		
		int cantidad=0;
		//System.out.println("metodo busquedaheader");
		if (res.next())
		{
			cantidad=res.getInt(1);
		}
		else
		{
			cantidad=0;
		}
		
		int valores[]=new int[cantidad];
		res = consulta.executeQuery("SELECT idpreguntas FROM dbdamproject.preguntas where descripcion like '%"+valor+"%'");
		int i=0;
			while (res.next())
			{
				valores[i]=res.getInt(1);
				//System.out.println(res.getInt(1));
				i++;
			}

			return valores;	
	}
	
	/*
	 * Metodo que devuelve un resulset para que luego sea recorrido por un for en el jsp de mostrar las preguntas que tengan que ver algo con lo preguntado  y en cada
	 * interaccion que nos dibuje las respuestas con los datos del resulset 
	 * 
	 */
	
	public ResultSet resulsetpregunta(String  valorpregunta) throws SQLException {
		Statement consulta = conexion.createStatement();
		ResultSet res = consulta.executeQuery("SELECT * FROM dbdamproject.preguntas where descripcion like '%"+valorpregunta+"%' or titulo like '%"+valorpregunta+"%'");		
		return res;
	}
	
	/*
	 * Metodo que devuelve un resulset para que luego sea recorrido por un for en el jsp de mostrar las respuestas y en cada
	 * interaccion que nos dibuje las respuestas con los datos del resulset 
	 * 
	 */
	
	public ResultSet sacarrespuestasporid(int  idpregunta) throws SQLException {
		Statement consulta = conexion.createStatement();
		ResultSet res = consulta.executeQuery("SELECT * FROM dbdamproject.respuestas where idpregunta="+idpregunta+"");		
		return res;
	}
	
	/*
	 *  Metodo para insertar las respuestas, preparamos los statements por seguridad
	 *  
	 */
	
	public int InsertarRespuestas( String respuesta,int idpregunta,String usuario) throws SQLException {
		
		//Valores en la base de datos idrespuesta,respuesta,votospositivos,votosnegativos,mejorrespuesta,idpregunta
		String fecha = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String sql="Insert into dbdamproject.respuestas values (?,?,?,?,?,?,?,?)";
		PreparedStatement insertar = conexion.prepareStatement(sql);
		insertar.setInt(1,(ultimoid("idrespuesta", "dbdamproject.respuestas")+1));
		
		insertar.setString(2, respuesta);
		insertar.setInt(3, 100);
		insertar.setInt(4, 2);
		insertar.setInt(5, 0);
		insertar.setInt(6, idpregunta);
		insertar.setString(7, usuario);
		insertar.setString(8, fecha);
		int res=insertar.executeUpdate();
		
		return res;
	}
	
	
public int SumarVoto( int idrespuesta, String tipovoto) throws SQLException {
	
	
		String sql="update dbdamproject.respuestas set "+tipovoto+"=? where idrespuesta=?";
		PreparedStatement insertar = conexion.prepareStatement(sql);
		int numerootos=Integer.parseInt(sacarundatostring("select "+tipovoto+" from dbdamproject.respuestas where idrespuesta="+idrespuesta+""));
		insertar.setInt(1,numerootos+1);
		insertar.setInt(2, idrespuesta);
		int res=insertar.executeUpdate();
		
		return res;
	}
	
	
}
