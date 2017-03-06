package serverlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utilidades.Correo;

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
				response.sendRedirect("registro");
				
			}else{
				String usuario=c.generarusuario(request.getParameter("nombre"), request.getParameter("apellido1"), request.getParameter("apellido2"));
				String contraseña=UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10);
				String validacion=Long.toHexString(Double.doubleToLongBits(Math.random()));
				int res=c.InsertarRegistro(usuario,contraseña,validacion, request.getParameter("nombre"), request.getParameter("apellido1"), request.getParameter("apellido2"), request.getParameter("email"), request.getParameter("curso"), request.getParameter("ciclo"));
				if(res>0){
					String ruta="http://localhost:8080/Proyectoprueba/login";
					Correo correo=new Correo("Enhorabuena por acceder a estudiantas conectados<br>A continuación le otorgamos los datos del registro<br><strong>Usuario: </strong>"+usuario+"<br><strong>Contraseña: </strong>"+contraseña+"<br>Para acceder al login y validar tu usuario accede desde <a href="+'"'+ruta+"?validacion="+validacion+'"'+">este link</a>", request.getParameter("email"), "Registro en Estudiantes Conectados");
					correo.SendMail();
					sesion.setAttribute("Insercion", "correcta");
				}else{
					sesion.setAttribute("Insercion", "erronea");

				}
				response.sendRedirect("postregistro");

			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
