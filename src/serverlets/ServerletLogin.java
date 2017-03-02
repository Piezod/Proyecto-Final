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
		/*
		 * Recogemos los valores del formulario por nombre usuario y password, importante recordar que se recogen por el nombre y no por la id.
		 * El formulario nos envia el action a este serverlet y el serverlet para poder ser llamado desde un jsp le ponemos el alias del webserverlet de arriba
		 */
		String usuarios= request.getParameter("usuario");
		String pass=request.getParameter("password");
		Conexion c=new Conexion();
		
		/* Comprobacion de si esta o no esta seleccionado el check de recordar contraseña
		en caso de que sea afirmativo creamos una cookie y le ponemos los datos, recordamos usuario y pass aunque solo cargaremos el usuario 
		en caso contrario si no esta clickeado borraremos el valor de la cookie y lo pondremos a null.
		*/
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
		else
		{
			Cookie cUserName = new Cookie("cookuser", null);
		    Cookie cPassword = new Cookie("cookpass", null);
		    cUserName.setMaxAge(0);
		    cPassword.setMaxAge(0);
		    response.addCookie(cUserName);
		    response.addCookie(cPassword);
		}
		
		try {
			c.conectar();
			
			/*
			 * Conectamos a la base de datos y comprobamos si esta o no esta el usuario y la pass en la base de datos, en caso afirmativo iremos a la pagina de inicio
			 * en caso contrario mandaremos mediante una variable de sesion de fallo la palabra loginerroneo la cual nos modificara el jsp para que aparezca una label
			 * en rojo diciendo que hay usuario o contraseña incorrecta.
			 */
			HttpSession sesion= request.getSession(true);
			if (c.comprobarlogin(usuarios, pass))
			{ // variable de sesion donde metemos datos para todos los jsp
				
				System.out.println("login correcto");
				//request.setAttribute("usuariologueado", usuarios+" "+pass); // le enviamos a nuestro jsp por atributo los datos recogidos en este servlet				
				sesion.setAttribute("usuario", usuarios);
				//request.setAttribute("usuario", vo); // le paso un objeto con todos sus datos
				request.getRequestDispatcher("ContenidoPrincipal/Inicio.jsp").forward(request, response); //aqui llamamos a un jsp desde el servlet
			
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
