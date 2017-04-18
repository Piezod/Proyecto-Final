package Utilidades;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Savepoint;
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

	
	/** Conectamos a base de datos e instanciamos la conexion si es null
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public void conectar() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://31.200.243.193:51987/dbdamproject";
		Connection con = DriverManager.getConnection(url, "usrdamproject", "GgQXVfYTCu3eBsXY");
		if (con != null) {
			conexion = con;
		}

	}
	
	public void cerrarconexion()
	{
		try {
			conexion.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			insertarerror(e);
		}
	}
	/** Método para insertar en la bd un error generado en los try catch e insertamos el error y la stack trace
	 * @param ex
	 */
	public void insertarerror(Exception ex){
		StringWriter writer = new StringWriter();
		PrintWriter printWriter = new PrintWriter( writer );
		ex.printStackTrace( printWriter );
		printWriter.flush();

		String error = writer.toString();
		
		try{
			conectar();
			Statement insertar=conexion.createStatement();
			insertar.executeUpdate("Insert into logs values(null,'"+ex.getMessage()+"')");
		}catch (SQLException | ClassNotFoundException e){
			//System.out.println("Error ");
			e.printStackTrace();
		}
	}
	/** Generamos una comprovacion nueva para los usuarios para poder recuperar la contraseña
	 * @param codigo Código para insertar en la base de datos y actualizarlo
	 * @param email E-mail al que poner el código nuevo
	 * @return Devuelve true si todo ha salido correcto o falso si ha dado alguna excepcion
	 */
	public boolean nuevacomprobacion(String codigo,String email){
		boolean err=false;
		try {
			conexion.setAutoCommit(false);
			PreparedStatement consulta=conexion.prepareStatement("update dbdamproject.usuarios set validacion=? where email like ?");
			consulta.setString(1, codigo);
			consulta.setString(2, email);
			consulta.executeUpdate();
			conexion.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			insertarerror(e);
			
			err=true;
			try {
				conexion.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			try {
				conexion.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return err;
	}

	/** Comprobación del login 
	 * @param user Cadena de usuario de login
	 * @param pass Cadena de contraseña para el login
	 * @param codvalid Codigo de validacion opcional para validar el usuario en caso de que no esté activo
	 * @return Devuelve true si Todo ha salido correcto o estaba inactivo y el código era correcto o falso si ha habido algun error
	 */
	public boolean comprobarlogin(String user, String pass,String codvalid){
		boolean enc=false;
		try{
			//Preparo la consulta
			String sql="select * from dbdamproject.usuarios where usuario like ? and pass like ? and validado like ?";
			PreparedStatement consulta = conexion.prepareStatement(sql);
			//Limpio el usuario y la contraseña de caracteres no deseados
			user=user.replaceAll("\'\"\\@\\$\\%", "");
			pass=pass.replaceAll("\'\"\\@\\$\\%", "");
			consulta.setString(1, user);
			consulta.setString(2,pass.hashCode()+"");
			consulta.setInt(3, 1);
			ResultSet res = consulta.executeQuery();
			enc= res.next();
			//Si no encuentra al usuario por login normal
			if(!enc){
				//Compruebo si no esta validado y coincide el código de validacion
				sql="select * from dbdamproject.usuarios where usuario like ? and pass like ? and validacion like ? and validado like ?";
				PreparedStatement consulta2=conexion.prepareStatement(sql);
				consulta2.setString(1, user);
				consulta2.setString(2, pass.hashCode()+"");
				consulta2.setString(3, codvalid);
				consulta2.setInt(4, 0);
				ResultSet res2=consulta2.executeQuery();
				//Si es correcta la consulta lo que significa que todavia no estaba validado el usuario
				if(res2.next()){
					//Realizo un update en el usuario en el que borro el codigo de validacion y lo pongo validado
					//De este modo podrá directamente acceder sin entrar en el if
					conexion.setAutoCommit(false);
					Statement consulta3=conexion.createStatement();
					consulta3.executeUpdate("update dbdamproject.usuarios set validacion='0', validado='1' where usuario like '"+user+"'");
					enc=true;
				}
			}
		}
		catch(SQLException e){
			insertarerror(e);
			enc=true;
		}
		finally{
			try {
				//Si el autocommit esta desactivado lo activo porque no puedo comprobar en que parte del try me ha fallado
				if(!conexion.getAutoCommit()){
					conexion.setAutoCommit(true);
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				insertarerror(e1);
			}
		}
		return enc;
			
	}

	/** Método para actualizar la contraseña a traves de la opcion de recordar la contraseña
	 * @param pass Nueva contraseña
	 * @param codigo codigo de validacion
	 */
	public void actualizarpass(String pass,String codigo){
		try{
			conexion.setAutoCommit(false);
			//Preparo el update
			String sql="update dbdamproject.usuarios set pass=?,validacion=?,validado=? where validacion like ?";
			PreparedStatement consulta=conexion.prepareStatement(sql);
			//Quito los caracteres extraños y paso la contraseña a hash
			consulta.setString(1, pass.replaceAll("\'\"\\@\\$\\%", "").hashCode()+"");
			consulta.setString(2, "0");
			consulta.setString(3, "1");
			consulta.setString(4, codigo.replaceAll("\'\"\\@\\$\\%", ""));
			//Hago el update
			consulta.executeUpdate();
			conexion.commit();
		}catch (SQLException e){
			//Si hay algun error en el update volvemos a un estado anterior
			insertarerror(e);
			try {
				conexion.rollback();
			} catch (SQLException e1) {
				// Si hay algun error en el rollback
				insertarerror(e);			
				}
		}finally {
			try {
				conexion.setAutoCommit(true);
			} catch (SQLException e) {
				//Si hay algun error en el autocommit
				insertarerror(e);			
			}
		}
	}
	/**
	 * @param query
	 * @return
	 * @throws SQLException
	 */
	private int contar(String query) {
		try{
		Statement consulta = conexion.createStatement();
		ResultSet res = consulta.executeQuery(query);
		int dev;
		res.next();
		dev = res.getInt(1);

		return dev;
		}catch(SQLException e){
			insertarerror(e);
			return -1;
		}
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

	/** Método para registrar usuarios a partir del registro
	 * @param usuario Nombre de Usuario generado por un método anterior
	 * @param pass Contraseña generada automaticamente
	 * @param validacion Código de validacion aleatorio para validar el primer login
	 * @param nombre Nombre del usuario
	 * @param apellido1 Primer apellido del usuario
	 * @param apellido2 Segundo apellido del usuario
	 * @param email email del usuario al que se le enviara un correo con los datos del login
	 * @param curso Curso del usuario
	 * @param ciclo Ciclo del usuario
	 * @return Devuelve el codigo del usuario creado o -1 si ha dado algun error
	 */
	public int InsertarRegistro(String usuario,String pass,String validacion,String nombre, String apellido1, String apellido2, String email, String curso,
			String ciclo) {
		int res=0;
		try {
			//Bloqueo a la conexion para que no se actualice sola
			conexion.setAutoCommit(false);
		//Preparo la insercion
		String sql="Insert into dbdamproject.usuarios values (?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement insertar = conexion.prepareStatement(sql);
		//Pongo los parametros en el Statement
		insertar.setString(1, usuario);
		//Encripto la contraseña en hash
		insertar.setString(2, pass.hashCode()+"");
		insertar.setString(3, nombre);
		insertar.setString(4, apellido1);
		insertar.setString(5, apellido2);
		insertar.setString(6, validacion);
		insertar.setString(7, email);
		insertar.setString(8, curso);
		insertar.setString(9,ciclo);
		insertar.setInt(10, 0);
		insertar.setInt(11, 0);
		
		
		//Si todo esta correcto ejecuto el update
		res=insertar.executeUpdate();
		//Mando un commit a la base de datos
		conexion.commit();
		
		} catch (SQLException e) {
			//Si ha dado algún error devuelvo la bd a un estado anterior
			try {
				conexion.rollback();
			} catch (SQLException e1) {
				//Si da algún error en el rollback
				insertarerror(e1);
			}

			insertarerror(e);
			res= -1;
			//El resultado del insert lo pongo a -1
		}
		finally {
			//Pase lo que pase vuelvo a poner el autocommit a true
			try {
				conexion.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				insertarerror(e);
			}
		}
		
		return res;

	}
	

	
	/** Metodo que nos devuelve el ultimo id mas 1 para que podamos realizar nuevos inserts.
	 * @param primarykey La clave primaria de la tabla a buscar
	 * @param tabla La tabla sobre la que se hará la consulta
	 * @return Devuelve El ultimo código +1 o 0 en caso de algun error.
	 */
	public int ultimoid(String primarykey,String tabla){
		int dev=0;

		try{
		Statement consulta = conexion.createStatement();
		System.out.println("select max("+primarykey+") from "+tabla);
		ResultSet res = consulta.executeQuery("select max("+primarykey+") from "+tabla);
		
		if(res.next())
			{
			dev = res.getInt(1);
			}
		dev=dev+1;
		}
		catch (SQLException e)
		{
			insertarerror(e);
		}
		return (dev);
		
	}
	

	private void insertaractividad(int idpreg,int idres,String texto,String usuario,String fecha){
		try {
			PreparedStatement insertar=conexion.prepareStatement("insert into dbdamproject.actividad values (?,?,?,?,?)");
			insertar.setInt(1, idpreg);
			insertar.setInt(2, idres);
			insertar.setString(3, texto);
			insertar.setString(4, texto);
			insertar.setString(5, usuario);
			insertar.executeQuery();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			insertarerror(e);
		}
	}

	/** Método para insertar preguntas en la base de datos
	 * @param idpregunta
	 * @param titulo
	 * @param descripcion
	 * @param usuario
	 * @return
	 */
	public int InsertarPregunta(String titulo,String descripcion,String usuario){
		int res=0;
		try{
			conexion.setAutoCommit(false);
		String fecha = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		//System.out.println(fecha);
		//0000-00-00 00:00:00
		
		
		String sql="Insert into dbdamproject.preguntas values (?,?,?,?,?)";
		PreparedStatement insertar = conexion.prepareStatement(sql);
		insertar.setString(1,null );
		insertar.setString(2, titulo);
		insertar.setString(3, descripcion);
		insertar.setString(4, usuario);
		insertar.setString(5, fecha);
		res=ultimoid("idpregunta", "preguntas");
		insertar.executeUpdate();
		insertaractividad(res, 0, titulo, usuario, fecha);
		conexion.commit();
		}catch(SQLException e){
			res=-1;
			try {
				conexion.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				insertarerror(e);
			}
		}
		finally{
			try {
				conexion.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				insertarerror(e);
			}

		}
		return res;

	}
		

	/** Metodo para sacar todos los usuarios de la base de datos y entregarlos en un array para trabajar con el
	 * @return Array de usuarios
	 */
	public String[] sacarusuarios(){
		String[] x=new String[0];

		try{
			x= new String[contar("select count(*) from dbdamproject.usuarios")];
			Statement consulta = conexion.createStatement();
			ResultSet res = consulta.executeQuery("select * from dbdamproject.usuarios");
	
			int i = 0;
			while (res.next()) {
				x[i] = res.getString(1);
				i++;
	
			}
			
		}
		catch(SQLException e)
		{
			insertarerror(e);
		}
		return x;

	}
	
	/*
	 * Metodo para hacer una consulta a la bse de datos y obtener un dato segun la query que le enviemos, nos devolvera el resulset porque no sabemos
	 * de que tipo de dato estamos hablando, file,string,int
	 */
	
	public ResultSet sacarresultset(String query)
	{
		try{
			Statement consulta=conexion.createStatement();
			ResultSet res=consulta.executeQuery(query);
			
			return res;
		}
		catch (SQLException e)
		{
			insertarerror(e);
			return null;
		}
	}
	
	/*
	 * Metodo para hacer una consulta a la bse de datos y obtener un dato segun la query que le enviemos, nos devolvera el resulset porque no sabemos
	 * de que tipo de dato estamos hablando, file,string,int
	 */
	
	public String sacarundatostring(String query)
	{
		try{
			Statement consulta=conexion.createStatement();
			//System.out.println("sacardato"+query);
			ResultSet res=consulta.executeQuery(query);
			String x=null;
			if (res.next())
			{
				 x=res.getString(1);
			}
			return x;
		}
		catch(SQLException e){
			return "-1";
		}
		
	}
	
	/*
	 * Metodo que devuelve todas las preguntas
	 */
	
	public String[] sacartodaslaspreguntas() {
		try{
			String[] x = new String[contar("select count(*) from dbdamproject.preguntas")];
	
			Statement consulta = conexion.createStatement();
			ResultSet res = consulta.executeQuery("select * from dbdamproject.preguntas");
	
			int i = 0;
			while (res.next()) {
				x[i] = res.getString(3);
				i++;
	
			}
			return x;
		}catch(SQLException e){
			insertarerror(e);
			String[] x=new String[0];
			return x;

		}
	}
	
	/*
	 * Metodo que devuelve  la pregunta segun la id que le enviemos
	 */
	
	public String[] sacarpreguntaporid(int id) {
		try{
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
		catch (SQLException e){
			insertarerror(e);
			return new String[0];
		}
		
	}
	
	/*
	 * Metodo que devuelve  los datos de las  ultimas preguntas introducidas en la bd
	 */
	
	public int[] idultimas10preguntas(int inicio,int fin) {
		try
		{
		int x[] = new int[10];

		Statement consulta = conexion.createStatement();
		ResultSet res = consulta.executeQuery("select idpreguntas from dbdamproject.preguntas order by idpreguntas desc limit "+inicio+","+fin+"");

		int i = 0;
		while (res.next()) {
			x[i] = res.getInt(1); //idpregunta
			i++;

		}

		return x;
		}
		catch (SQLException e)
		{
			insertarerror(e);
			return new int[0];
		}
	}
	

	public boolean comprobar(String query){
		try{
			Statement consulta = conexion.createStatement();
			ResultSet res = consulta.executeQuery(query);
			return res.next();
		}
		catch(SQLException e)
		{
			insertarerror(e);
			return false;
		}
		
		
	}

	public String recibirdato(String query){
		try{
			Statement consulta = conexion.createStatement();
			ResultSet res = consulta.executeQuery(query);
			res.next();
			return res.getString(1);
		}
		catch(SQLException e){
			return "-1";
		}
	}
	
	/*
	 * Metodo que nos devuelve el array con las ids de las preguntas que cumplen con lo que estamos buscando
	 */
	public int [] busquedaheader(String valor) {
		try{
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
		}catch(SQLException e){
			insertarerror(e);
			return new int[0];
		}
	}
	
	/*
	 * Metodo que devuelve un resulset para que luego sea recorrido por un for en el jsp de mostrar las preguntas que tengan que ver algo con lo preguntado  y en cada
	 * interaccion que nos dibuje las respuestas con los datos del resulset 
	 * 
	 */
	
	public ResultSet resulsetpregunta(String  valorpregunta, int inicio, int fin) {
		try{
			Statement consulta = conexion.createStatement();
			ResultSet res = consulta.executeQuery("SELECT * FROM dbdamproject.preguntas where descripcion like '%"+valorpregunta+"%' or titulo like '%"+valorpregunta+"%'limit "+inicio+","+fin+"");		
			return res;
		}catch(SQLException e){
			insertarerror(e);
			return null;
		}
		
	}
	
	/*
	 * Metodo que devuelve un resulset para que luego sea recorrido por un for en el jsp de mostrar las respuestas y en cada
	 * interaccion que nos dibuje las respuestas con los datos del resulset 
	 * 
	 */
	

	public ResultSet sacarrespuestasporid(int  idpregunta, int inicio, int fin) {
		try{
			Statement consulta = conexion.createStatement();
			ResultSet res = consulta.executeQuery("SELECT * FROM dbdamproject.respuestas where idpregunta="+idpregunta+" limit "+inicio+","+fin+"" );		
			return res;
		}catch(SQLException e){
			insertarerror(e);
			return null;
		}
		
	}
	
	/*
	 *  Metodo para insertar las respuestas, preparamos los statements por seguridad
	 *  
	 */
	

		
	public int InsertarRespuestas( String respuesta,int idpregunta,String usuario) {
		int res=-1;
		try{
			conexion.setAutoCommit(false);
			//Valores en la base de datos idrespuesta,respuesta,votospositivos,votosnegativos,mejorrespuesta,idpregunta
			String fecha = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
			String sql="Insert into dbdamproject.respuestas values (?,?,?,?,?,?,?,?)";
			PreparedStatement insertar = conexion.prepareStatement(sql);
			int ultimoid=ultimoid("idrespuesta", "dbdamproject.respuestas");
			insertar.setInt(1,ultimoid);
			
			insertar.setString(2, respuesta);
			insertar.setInt(3, 0);
			insertar.setInt(4, 0);
			insertar.setInt(5, 0);
			insertar.setInt(6, idpregunta);
			insertar.setString(7, usuario);
			insertar.setString(8, fecha);
			res=insertar.executeUpdate();
			insertaractividad(0, ultimoid, respuesta, usuario, fecha);
		}catch(SQLException e){
			insertarerror(e);
			return -1;
		}
		finally{
			
				try {
					if(!conexion.getAutoCommit()){
					conexion.setAutoCommit(true);
					}
					return res;

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					insertarerror(e);
				}
			}
		return res;
		}
		
	
	
	/*
	 * Metodo que nos sirve para sumar un voto, se le pasa como parametro la respuesta y el tipo de voto si sera positivo o negativo.
	 * 
	 */
	
public int SumarVoto( int idrespuesta, String tipovoto){
	
	//System.out.println("update dbdamproject.respuestas set "+tipovoto+"=? where idrespuesta="+idrespuesta+"");
		try{
			String sql="update dbdamproject.respuestas set "+tipovoto+"=? where idrespuesta=?";
			PreparedStatement insertar = conexion.prepareStatement(sql);
			int numerootos=Integer.parseInt(sacarundatostring("select "+tipovoto+" from dbdamproject.respuestas where idrespuesta="+idrespuesta+""));
			insertar.setInt(1,numerootos+1);
			insertar.setInt(2, idrespuesta);
			int res=insertar.executeUpdate();
			
			return res;
		}catch(SQLException e){
			insertarerror(e);
			return -1;
		}
	
		
	}
	
	public void insertarsolicitud(String usuario,String nombre,String apellido1,String apellido2){
		try{
			conexion.setAutoCommit(false);
			String sql="insert into dbdamproject.solicitudes values(?,?,?,?,?,?)";
			PreparedStatement insertar=conexion.prepareStatement(sql);
			insertar.setInt(1, ultimoid("idsolicitud", "solicitudes"));
			insertar.setString(2, usuario);
			insertar.setString(3, nombre);
			insertar.setString(4, apellido1);
			insertar.setString(5, apellido2);
			insertar.setInt(6, 1);
			insertar.executeUpdate();
			conexion.commit();
		}catch(SQLException e){
			insertarerror(e);
			try {
				conexion.rollback();
			} catch (SQLException e1) {
				insertarerror(e);
			}
		}
		finally{
			try {
				conexion.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				insertarerror(e);
			}
		}
		
	}
	
	public int[] idstag(String busqueda, int inicio){
		try {
			PreparedStatement consulta=conexion.prepareStatement("select * from tags where nombre like '%"+busqueda+"%' or descripcion like '%"+busqueda+"%' limit "+inicio*9+",9");
			
			ResultSet res=consulta.executeQuery();
			int[] ids=new int[contar("select count(*) from tags where nombre like '%"+busqueda+"%' or descripcion like '%"+busqueda+"%' limit "+inicio*9+",9")];
			for(int i=0;i<ids.length;i++){
				res.next();
				ids[i]=res.getInt(1);
			}
			return ids;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			insertarerror(e);
			return new int[0];
		}
		
		
		
	}
	
	
}
