package serverlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		response.getWriter().append("Pepito grillo");
		
		System.out.println("prueba del doget, sumo1 o resto en manita");
		System.out.println("sumo es "+request.getParameter("sumo"));
		System.out.println("resto es "+request.getParameter("resto"));
		
		if (Integer.parseInt(request.getParameter("sumo"))==1)
		{
			System.out.println("Añado un voto a la respuesta "+request.getParameter("idrespuesta"));
			Conexion c1=new Conexion();
			try {
				c1.conectar();
				c1.SumarVotoPositivo(Integer.parseInt(request.getParameter("idrespuesta")));
				
			} catch (NumberFormatException | SQLException | ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if (Integer.parseInt(request.getParameter("resto"))==1)
		{
			System.out.println("Resto un voto a la respuesta "+request.getParameter("idpregunta"));
		}
		
		response.sendRedirect("respuesta");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		System.out.println(request.getParameter("respuesta"));
		
		
		try {
			
			
			Conexion ce=new Conexion();
			ce.conectar();
			ce.InsertarRespuestas(request.getParameter("respuesta"),Integer.parseInt(request.getParameter("idpregunta")), request.getParameter("idusuario"));
			ce.cerrarconexion();
			response.sendRedirect("respuesta");
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
