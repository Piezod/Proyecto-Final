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
 * Servlet implementation class AltaPregunta
 */
@WebServlet("/ServerletAltaPregunta")
public class ServerletAltaPregunta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerletAltaPregunta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//System.out.println("Se ejecuta el doget valor de inicio"+request.getParameter("inicio")+request.getParameter("fin")+request.getParameter("pagpulsada"));
		
		/*
		 * Ponemos el valor del href en la sesion de inicopag y finpag para que nos recargue la query en funcion de lo que hemos pulsado. 
		 * 
		 */
		HttpSession sesion= request.getSession(true);
		
		if (request.getParameter("pagpulsada")!=null)
		{
		sesion.setAttribute("pagpulsada", Integer.parseInt(request.getParameter("pagpulsada")));
		sesion.setAttribute("inipag", Integer.parseInt(request.getParameter("inicio")));
		sesion.setAttribute("finpag", Integer.parseInt(request.getParameter("fin")));
		
		response.sendRedirect("Inicio?pagpulsada="+Integer.parseInt(request.getParameter("pagpulsada")));
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		
	HttpSession sesion= request.getSession(true);
		
		/*
		 * Sacamos el usuario que ha realizado la pregunta para ingresarlo en la base de datos
		 */
		request.getAttribute("titulo");
		String titulo= request.getParameter("titulo");
		/*
		 * Recogemos el valor del textarea y hacemos un replace \n por el <br> para guardar el salto de linea y el formato que nos ha introducido el 
		 * usuario
		 */
		String mensaje=request.getParameter("mensajeoculto");
		
		Conexion c=(Conexion)sesion.getAttribute("conexion");
		
		
		int idpregunta=c.InsertarPregunta(titulo, mensaje, (String)sesion.getAttribute("usuario"));
		if(idpregunta!=-1){
		sesion.setAttribute("idpregunta", idpregunta);
		//c.cerrarconexion();
		/*
		 *  Pongo por defecto los valores al pie de pagina, y luego se iran actualizando en funcion de lo que pulsemos
		 */
		sesion.setAttribute("pagpulsada",1); // la pagina que saldra indicada por defecto marcada
		sesion.setAttribute("iniciores", 0); // el numero desde el que se buscara es decir desde el 0 hasta el ..
		sesion.setAttribute("finres", 10); // el numero de resultados que mostrara por pagina
		response.sendRedirect("respuesta?idpregunta="+idpregunta);
		}
		else{
			
			response.sendRedirect(request.getRequestURL().toString()+"?error=ErrorInterno");
		}
	}

}
