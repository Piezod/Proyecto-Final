package serverlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.CommunicationException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class ServerletLogin
 */

@WebServlet("/ServerletLogin")



public class ServerletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerletLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String usuarios= request.getParameter("usuario");
		String pass=request.getParameter("pass");
		System.out.println("serverlet");
		Conexion c=new Conexion();
		
		try {
			c.conectar();
			if (c.comprobarlogin(usuarios, pass))
			{
				HttpSession sesion= request.getSession(true); // variable de sesion donde metemos datos para todos los jsp
				
				System.out.println("login correcto");
				//request.setAttribute("usuariologueado", usuarios+" "+pass); // le enviamos a nuestro jsp por atributo los datos recogidos en este servlet				
				sesion.setAttribute("usuario", usuarios);
				//request.setAttribute("usuario", vo); // le paso un objeto con todos sus datos
				request.getRequestDispatcher("welcome.jsp").forward(request, response); //aqui llamamos a un jsp desde el servlet
			
			}else {
				
				//request.setAttribute("usuariologueado","mal");
				response.sendRedirect("login.html"); //si se confunde le redireccionamos a otro sitio  si ponemos / nos envia al raiz, pero si enviar datos
				//request.getRequestDispatcher("welcome.jsp").forward(request, response); //aqui llamamos a un jsp desde el servlet, pero mostrando otros datos erroneos
				
				
}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
