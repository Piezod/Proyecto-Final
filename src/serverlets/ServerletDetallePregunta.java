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
 * Servlet implementation class DetallePregunta
 */
@WebServlet(description = "Serverlet que sera llamado cuando queramos ir al detalle de una pregunta redirigida desde otro jsp", urlPatterns = { "/DetallePregunta" })
public class ServerletDetallePregunta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerletDetallePregunta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: serverletdetallepregunta ").append(request.getContextPath());
		
		/*
		 * Ponemos el valor del href en la sesion de inicopag y finpag para que nos recargue la query en funcion de lo que hemos pulsado. 
		 * 
		 */
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		HttpSession sesion= request.getSession(true);
			/*
			 * Sacamos el usuario que ha realizado la pregunta 
			 */
			request.getAttribute("titulo");
			System.out.println(Integer.parseInt(request.getParameter("idpregunta")));
			int idpregunta= Integer.parseInt(request.getParameter("idpregunta"));
				sesion.setAttribute("idpregunta", idpregunta);
				sesion.setAttribute("iniciores",0);
				sesion.setAttribute("finres",10);
				response.sendRedirect("Respuesta?idpregunta="+idpregunta);
		
	}

}
