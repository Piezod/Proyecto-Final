package serverlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AltaPregunta
 */
@WebServlet("/AltaPregunta")
public class AltaPregunta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaPregunta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		
	HttpSession sesion= request.getSession(true);
		
		/*
		 * Sacamos el usuario que ha realizado la pregunta para ingresarlo en la base de datos
		 */
		request.getAttribute("titulo");
		String titulo= request.getParameter("titulo");
		/*
		 * Recogemos el valor del textarea y hacemos un replace \n por el <br> para guardar el salto de linea y el formato que nos ha introducido el 
		 * usuario
		 */
		String mensaje=request.getParameter("mensaje").toString().replaceAll("\n"," <br> ");
		
		Conexion c=new Conexion();
		
		
		try {
			c.conectar();
			c.InsertarPregunta(titulo, mensaje, (String)sesion.getAttribute("usuario"));
			System.out.println("haciendo insert en la tabla");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
