package serverlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utilidades.Conexion;

/**
 * Servlet implementation class ServeletRespuesta
 */
@WebServlet("/ServerletRespuesta")
public class ServerletRespuesta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerletRespuesta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.getWriter().append("Served at: de respuesta").append(request.getContextPath());

		
		if (request.getParameter("sumo")!=null ||request.getParameter("resto")!=null)
			{
			Conexion c1=new Conexion();
			try {
				c1.conectar();
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			if (request.getParameter("sumo")!=null && Integer.parseInt(request.getParameter("sumo"))==1)
			{
					try {
						c1.SumarVoto(Integer.parseInt(request.getParameter("idrespuesta")),"votospositivos");
					} catch (NumberFormatException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
			}
			else if (request.getParameter("resto")!=null && Integer.parseInt(request.getParameter("resto"))==1)
			{
				
				try {
					c1.SumarVoto(Integer.parseInt(request.getParameter("idrespuesta")),"votosnegativos");
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		c1.cerrarconexion();
			response.sendRedirect("Respuesta");
			}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		HttpSession sesion= request.getSession(true);
		
		Conexion ce=(Conexion)sesion.getAttribute("conexion");
		//ce.conectar();
		ce.InsertarRespuestas(request.getParameter("mensajeoculto"),Integer.parseInt(request.getParameter("idpregunta")), request.getParameter("idusuario"));
		//ce.cerrarconexion();
		sesion.setAttribute("pagpulsada",1); // la pagina que saldra indicada por defecto marcada
		sesion.setAttribute("iniciores", 0); // el numero desde el que se buscara es decir desde el 0 hasta el ..
		sesion.setAttribute("finres", 10); // el numero de resultados que mostrara por pagina
		response.sendRedirect("Respuesta");
		
		
		
	}

}
