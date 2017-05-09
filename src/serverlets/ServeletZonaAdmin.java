package serverlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Utilidades.SolicitudesAdmin;

/**
 * Servlet implementation class ServeletZonaAdmin
 */
@WebServlet("/ServeletZonaAdmin")
public class ServeletZonaAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServeletZonaAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String opcion=(String)request.getParameter("opcion");
		System.out.println("opcion del menu de administracion "+opcion);
		switch (opcion) {
		
		case "solicitud":
			
			SolicitudesAdmin sa=new SolicitudesAdmin();
			
			try {
				HashMap<String, ArrayList> hml2=sa.Solicitudespendientes();
				request.setAttribute("solicitudpendiente", hml2);
				request.setAttribute("usuario", request.getParameter("usuario"));
				String nextJSP = "/Solicitudes";
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
				dispatcher.forward(request,response);
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "notificacion":
			
			System.out.println(request.getParameter("tipo"));
			request.setAttribute("tipo", request.getParameter("tipo"));
			String nextJSP = "/notificaciones";
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
			dispatcher.forward(request,response);
			
			break;

		default:
			String nextJSP1 = "/Inicio";
			RequestDispatcher dispatcher1 = getServletContext().getRequestDispatcher(nextJSP1);
			dispatcher1.forward(request,response);
			break;
		}
	}

}
