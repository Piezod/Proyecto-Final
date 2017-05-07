package serverlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utilidades.Conexion;

/**
 * Servlet implementation class ServletCambioPass
 */
@WebServlet("/ServletCambioPass")
public class ServletCambioPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCambioPass() {
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
		if(c!=null){
			if(c.cambiopass(request.getParameter("id"), sesion.getAttribute("usuario").toString())!=-1){
				response.getWriter().append("<div class='alert alert-success'>Contrase&#241;a cambiada correctamente</div>");

			}
			else{
				response.getWriter().append("<div class='alert alert-danger'>ha ocurrido algun error durante el cambio de contrase&#241; intentelo de nuevo mas tarde</div>");

			}
			
		}
		else{
			response.getWriter().append("<div class='alert alert-danger'>ha ocurrido algun error durante el cambio de contrase&#241; intentelo de nuevo mas tarde</div>");

		}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
