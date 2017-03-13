package serverlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Utilidades.Conexion;

/**
 * Servlet implementation class ServeletImagenes
 */
@WebServlet("/ServeletImagenes")
public class ServeletImagenes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServeletImagenes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String id = request.getParameter("id");
		System.out.println("se ejecuta el doget");
	
		/*ca.co
			Sacamos la imagen de la base de datos y la dibujamos donde tiene que ir el logotipo, en la parte izuierda de la cabecera, en caso de 
			que no exista la imagen o no se encuentre se pondra por defecto el nombre de la aplicación.
		*/
		ResultSet rs1;
		try {
			Conexion ca=new Conexion();
			ca.conectar();
			String imgLen="";
			rs1 = ca.sacarundato("select imagen from Imagenes where idimagen="+id+"");
			/*if (r1.next())
			{ 
				
				
				System.out.println("saco imagen");
				OutputStream img;
				byte barray[]=r1.getBytes(1);
				response.setContentType("image/png");
				img=response.getOutputStream();
				img.write(barray);
				img.flush();
				img.close();*/
				
			if(rs1.next()){
				  imgLen = rs1.getString(1);
				  System.out.println(imgLen.length());
				
				  int len = imgLen.length();
				  byte [] rb = new byte[len];
				  InputStream readImg = rs1.getBinaryStream(1);
				  int index=readImg.read(rb, 0, len);  
				  System.out.println("index"+index);
				  response.reset();
				  response.setContentType("image/jpg");
				  response.getOutputStream().write(rb,0,len);
				  response.getOutputStream().flush();  
				  System.out.println("response"+response.getOutputStream());
				  }
			
		
		
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
