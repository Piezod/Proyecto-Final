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
 * Servlet implementation class ServletAltaTag
 */
@WebServlet("/ServletAltaTag")
public class ServletAltaTag extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAltaTag() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sesion=request.getSession(true);
		Conexion c=(Conexion)sesion.getAttribute("conexion");
		try {
			c.actualizardato("insert into tags (Nombre,Descripcion) values ('"+request.getParameter("id").split(",")[0]+"','"+request.getParameter("id").split(",")[1]+"')");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.getOutputStream().println("<input type='button' class='btn btn-primary btn-block' value='siguiente' onclick='recargar()'>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
	}

}
