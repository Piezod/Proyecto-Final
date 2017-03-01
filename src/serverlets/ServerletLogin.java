package serverlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.CommunicationException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class ServerletLogin
 */

@WebServlet("/ServeletLogin")



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
		String pass=request.getParameter("password");
		Conexion c=new Conexion();
		
		//System.out.println("valor del check "+request.getParameter("check"));
		
		if (request.getParameter("check")!=null)
		{
			if (request.getParameter("check").equals("on"))
			{
		          System.out.println("remember : " + usuarios);
		          Cookie cUserName = new Cookie("cookuser", usuarios.trim());
		          Cookie cPassword = new Cookie("cookpass", pass.trim());
		          cUserName.setMaxAge(60 * 60 * 24 * 15);//15 days
		          cPassword.setMaxAge(60 * 60 * 24 * 15);
		          response.addCookie(cUserName);
		          response.addCookie(cPassword);
			}
		}
		
		try {
			c.conectar();
			HttpSession sesion= request.getSession(true);
			if (c.comprobarlogin(usuarios, pass))
			{ // variable de sesion donde metemos datos para todos los jsp
				
				System.out.println("login correcto");
				//request.setAttribute("usuariologueado", usuarios+" "+pass); // le enviamos a nuestro jsp por atributo los datos recogidos en este servlet				
				sesion.setAttribute("usuario", usuarios);
				//request.setAttribute("usuario", vo); // le paso un objeto con todos sus datos
				request.getRequestDispatcher("inicio.jsp").forward(request, response); //aqui llamamos a un jsp desde el servlet
			
			}else {
				
				sesion.setAttribute("fallo", "loginerroneo");
				//request.setAttribute("usuariologueado","mal");
				
				response.sendRedirect("GestionUsuarios/Login/Login.jsp"); //si se confunde le redireccionamos a otro sitio  si ponemos / nos envia al raiz, pero si enviar datos
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
