package serverlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AltaPregunta
 */
@WebServlet("/ServerletContenido")
public class ServerletContenido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerletContenido() {
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
		/*
		 * Recoj por el metodo post el valor del boton que me han pulsado
		 */
		HttpSession sesion= request.getSession(true);
		
		/*
		 * tenemos la variable de sesion contenido que lo que nos realizara sera rellenar el valor de la variable en funcion del boton que nos ha sido pulsado
		 * Segun sea el boton pulsado cargaremos un jsp u otro diferente
		 */
		sesion.setAttribute("contenido", request.getParameter("contenido"));
		
		/*
		 * Redireccionamos a nuestra pagina inicial , en la cual mantendremos el navegador superior y recargaremos la parte central
		 */
		response.sendRedirect("ContenidoPrincipal/Inicio.jsp");
		
		
	}

}
