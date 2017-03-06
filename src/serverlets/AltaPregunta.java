package serverlets;

import java.io.IOException;
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
		String mensaje= request.getParameter("mensaje");
		System.out.println("Estoy en altapreguntaserverlet titulo"+titulo+" mensaje "+mensaje);
		System.out.println(titulo);
		System.out.println(mensaje);
		System.out.println(titulo.length());
		System.out.println(mensaje.length());
		
		
		
		
		
	}

}
