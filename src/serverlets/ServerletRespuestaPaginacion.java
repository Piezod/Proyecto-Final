package serverlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServerletRespuestaPaginacion
 */
@WebServlet("/ServerletRespuestaPaginacion")
public class ServerletRespuestaPaginacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerletRespuestaPaginacion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: dogetdelserverlet respuesta paginacion ").append(request.getContextPath());
		
		HttpSession sesion= request.getSession(true);
		
		System.out.println("Serverletrespuestapaginacion valores pagpulsada,inicio,fin"+Integer.parseInt(request.getParameter("pagpulsada"))+Integer.parseInt(request.getParameter("inicio"))+Integer.parseInt(request.getParameter("fin")));
		
		sesion.setAttribute("pagpulsada", Integer.parseInt(request.getParameter("pagpulsada")));
		sesion.setAttribute("iniciores", Integer.parseInt(request.getParameter("inicio")));
		sesion.setAttribute("finres", Integer.parseInt(request.getParameter("fin")));
		response.sendRedirect("respuesta");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
