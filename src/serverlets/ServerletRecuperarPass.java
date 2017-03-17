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
import Utilidades.Correo;

/**
 * Servlet implementation class ServerletRecuperarPass
 */
@WebServlet("/ServerletRecuperarPass")
public class ServerletRecuperarPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerletRecuperarPass() {
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
		if(request.getParameter("caso").equals("email")){
			Conexion c=new Conexion();
			try {
				c.conectar();
				HttpSession sesion= request.getSession(true);
				if(c.comprobar("select * from dbdamproject.usuarios where email like '"+request.getParameter("email").replaceAll("\'\"\\@\\$\\%", "")+"'")){
				String validacion=Long.toHexString(Double.doubleToLongBits(Math.random()));
				c.nuevacomprobacion(validacion, request.getParameter("email").toString());
				String ruta="http://localhost:8080/Proyectoprueba/recuperarpass";
				Correo correo=new Correo("<h1>Parece que ha perdido su contraseña</h1>Acceda a <a href="+'"'+ruta+"?cod="+validacion+'"'+">este link</a> para reestablecer su contraseña<br><strong>Si usted no ha solicitado este cambio ignore este correo</strong>", request.getParameter("email"), "Recuperacion de contraseña estudiantes conectados");
				correo.SendMail();
				
				sesion.setAttribute("error", "correcto");
				}else{
					sesion.setAttribute("error", "incorrecto");
				}
				c.cerrarconexion();
				response.sendRedirect("recuperarpass");

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(request.getParameter("caso").equals("pass")){
			Conexion c=new Conexion();
			try {
				c.conectar();
				if(c.comprobar("select * from dbdamproject.usuarios where validacion like '"+request.getParameter("cod").replaceAll("\'\"\\@\\$\\%", "")+"'")){
					c.actualizarpass(request.getParameter("pass"),request.getParameter("cod"));
					c.cerrarconexion();
					response.sendRedirect("login");
				}
				else{
					HttpSession sesion=request.getSession(true);
					sesion.setAttribute("codigoinvalido", "si");
					c.cerrarconexion();
					response.sendRedirect("recuperarpass?cod="+request.getParameter("cod"));
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

}
