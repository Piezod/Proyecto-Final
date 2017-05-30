package Admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Utilidades.GestionesAdmin;

/**
 * Servlet implementation class ServerletSolicitudes
 */
@WebServlet("/ServerletSolicitudes")
public class ServerletSolicitudes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerletSolicitudes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*  String text = "el texto que he recuperado de msfsfsfsfsis cosas en java y tal";
		  String dato=request.getParameter("name");
		  System.out.println("eldatoes"+dato);
		    response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
		    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
		    response.getWriter().write(text+dato);
		    // Write response body.
		    */
		//System.out.println("entro en solicitudserverlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idsolicitud=Integer.parseInt(request.getParameter("idsolicitud"));
		
		GestionesAdmin ga=new GestionesAdmin();
		try {
			if (request.getParameter("tipo").equals("baja"))
			{
				ga.CancelarSolicitud(idsolicitud);

				response.sendRedirect("ServeletZonaAdmin?opcion=solicitud&idsolicitud="+idsolicitud+"&tipo=baja");
			}
			else
			{
			ga.AceptarSolicitudCambio(idsolicitud);

			response.sendRedirect("ServeletZonaAdmin?opcion=solicitud&idsolicitud="+idsolicitud+"&tipo=cambio");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
