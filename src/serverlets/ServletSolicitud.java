package serverlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utilidades.Conexion;

/**
 * Servlet implementation class ServletSolicitud
 */
@WebServlet("/ServletSolicitud")
public class ServletSolicitud extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSolicitud() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		response.getWriter().append("Estamos procesando tu solicitud por favor espere...");
		Conexion c=new Conexion();
		HttpSession sesion= request.getSession(true);

		try {
			c.conectar();
			String usuario=(String) sesion.getAttribute("usuario");
			if(!c.comprobar("select * from dbdamproject.solicitudes where usuario like '"+usuario+"' and pendiente like '1'"))
			c.insertarsolicitud(usuario,request.getParameter("gnombre"),request.getParameter("gapellido1"),request.getParameter("gapellido2"));
			
			c.cerrarconexion();

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("AreaUsuario");
	}

}
