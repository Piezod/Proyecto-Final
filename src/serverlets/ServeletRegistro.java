package serverlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServeletRegistro
 */
@WebServlet("/ServeletRegistro")
public class ServeletRegistro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServeletRegistro() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession sesion= request.getSession(true);
		Conexion c=new Conexion();
		try {
			c.conectar();
			if(c.comprobar("select * from dbdamproject.usuarios where email like '"+request.getParameter("email")+"'")){
				sesion.setAttribute("Emailduplicado", "si");
				sesion.setAttribute("nombre", request.getParameter("nombre"));
				sesion.setAttribute("email", request.getParameter("email"));
				sesion.setAttribute("apellido1", request.getParameter("apellido1"));
				sesion.setAttribute("apellido2", request.getParameter("apellido2"));
				sesion.setAttribute("ciclo", request.getParameter("ciclo"));
				sesion.setAttribute("curso", request.getParameter("curso"));
				response.sendRedirect("GestionUsuarios/Registro/Registro.jsp");
				
			}else{
				c.InsertarRegistro( request.getParameter("nombre"), request.getParameter("apellido1"), request.getParameter("apellido2"), request.getParameter("email"), request.getParameter("curso"), request.getParameter("ciclo"));
				response.sendRedirect("GestionUsuarios/Login/Login.jsp");

			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
