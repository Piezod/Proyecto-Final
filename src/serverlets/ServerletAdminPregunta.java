package serverlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utilidades.Conexion;

/**
 * Servlet implementation class ServerletAdminPregunta
 */
@WebServlet("/ServerletAdminPregunta")
public class ServerletAdminPregunta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerletAdminPregunta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//System.out.println("serverlet admin pregunta");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		HttpSession sesion= request.getSession(true);
		Conexion ce=(Conexion)sesion.getAttribute("conexion");
		String tipo=request.getParameter("tipo");
		switch (tipo) {
		case "confirmarmejor":
			try {
				ce.actualizardato("update respuestas SET mejorrespuesta = 1 WHERE idrespuesta="+request.getParameter("idrespuestamejor"));
				request.setAttribute("elimina", "validacion");
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "confirmarbaja":
			try {
				ce.actualizardato("delete from respuestas where idrespuesta="+request.getParameter("getres"));
				request.setAttribute("elimina", "eliminacion");
				request.setAttribute("borrar", 1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;


		default:
			break;
		}

		String nextJSP = "/Respuesta?idpregunta="+request.getParameter("idpregunta");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
		dispatcher.forward(request,response);
		
	}

}
