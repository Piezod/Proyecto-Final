package Admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utilidades.Correo;

/**
 * Servlet implementation class ServerletNotificacion
 */
@WebServlet("/ServerletNotificacion")
public class ServerletNotificacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerletNotificacion() {
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
		//System.out.println("Serverlet notificacion");
		String titulo=request.getParameter("titulo");
		String mensaje=request.getParameter("mensaje");
		
		
		//System.out.println(titulo+mensaje);
		String tipo=request.getParameter("tipo");
		//System.out.println(tipo);
		Correo c=new Correo();
		try
		{
				switch (tipo) {
				case "global":
					c.correoglobal(mensaje, titulo);
					break;
				case "curso":
					
					HttpSession sesion= request.getSession(true);
						c.notificacioncurso(mensaje, titulo,(String)sesion.getAttribute("usuario") );
					break;
		
				default:
					break;
				}
				String nextJSP = "/notificaciones";
				//System.out.println(request.getParameter("tipo"));
				request.setAttribute("tipo", request.getParameter("tipo"));
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
				dispatcher.forward(request,response);
		}
		
		catch (Exception e) {
			//System.out.println("error en la zona de notificacion servlert correo");
		}
		
	}

}
