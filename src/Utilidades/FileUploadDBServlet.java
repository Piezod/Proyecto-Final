package Utilidades;

 
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {
     
    // database connection settings
    private String dbURL = "jdbc:mysql://31.200.243.193:51987/dbdamproject";
    private String dbUser = "usrdamproject";
    private String dbPass = "GgQXVfYTCu3eBsXY";
    private Connection conexion;
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        try {
			conectar();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error conectar");
		}
        
        
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = conexion ; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            System.out.println("conecto");
            // constructs SQL statement
            String sql = "INSERT INTO dbdamproject.Imagenes (idimagen, imagen) values (?, ?)";
            System.out.println("la sql es"+sql);
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, ultimoid("idimagen", "Imagenes"));
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(2, inputStream);
            }
 
            // sends the statement to the database server
            System.out.println(statement.toString());
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            System.out.println("error catch");
            ex.printStackTrace();
        } finally {
        	System.out.println("error finally");
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
        }
    }
    
    public void conectar() throws ClassNotFoundException, SQLException {
    	System.out.println("Entro en conectar");
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://31.200.243.193:51987/dbdamproject";
		Connection con = DriverManager.getConnection(url, "usrdamproject", "GgQXVfYTCu3eBsXY");
		if (con != null) {
			conexion = con;
		}
		
		System.out.println("conecto correcto");

	}
    
    public int ultimoid(String primarykey,String tabla) throws SQLException
	{
		Statement consulta = conexion.createStatement();
		ResultSet res = consulta.executeQuery("select "+primarykey+" from "+tabla);
		int dev=0;
		System.out.println("ultimoid");
		while(res.next())
			{
			dev = res.getInt(primarykey);
			}
		System.out.println(dev);
		return dev+1;
	}
}