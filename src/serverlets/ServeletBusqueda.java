package serverlets;


import java.io.IOException;
import java.sql.SQLException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BusquedaBarra
 */
@WebServlet("/ServeletBusqueda")
public class ServeletBusqueda extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServeletBusqueda() {
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
		
		System.out.println("serverletbusquedabarra  valor de busqueda "+(String)request.getParameter("valorbusqueda"));
		
		HttpSession sesion= request.getSession(true);
		Conexion c=(Conexion) sesion.getAttribute("conexion");
		
		try {
			
			c.busquedaheader((String)request.getAttribute("valorbusqueda"));
			response.sendRedirect("resultadosbusqueda");
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			System.out.println(" se hace el catch");
		}
		
		
	}

}
