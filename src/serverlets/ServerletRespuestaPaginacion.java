package serverlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServerletRespuestaPaginacion
 */
@WebServlet("/ServerletRespuestaPaginacion")
public class ServerletRespuestaPaginacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerletRespuestaPaginacion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*
		 * Serverlet de metodo get, recogera los parametros de los pie de pagina
		 * 
		 */
		HttpSession sesion= request.getSession(true);

		/*
		 * 
		 *  Enviamos a traves de get los parametros correspondientes para poder rellenar los pies de pagina, la pagina pulsada para que se actualice y se remarque la nueva
		 *  el inicio de la consulta es decir desde la que tenemos que buscar, fin es el parametro de la cantidad que suele ser 10 , se modifican en los jsp correspondientes
		 *  y luego el parametro pag es a traves del cual nos redireccionara la pagina.
		 */
		if (request.getParameter("pagpulsada")!=null)
		{
				sesion.setAttribute("pagpulsada", Integer.parseInt(request.getParameter("pagpulsada"))); // Nos dice la pagina que ha sido pulsada para que esa sea pulsada y cambie el formato
				sesion.setAttribute("iniciores", Integer.parseInt(request.getParameter("inicio"))); // Nos dice el valor inicial de la busqueda en la query
				sesion.setAttribute("finres", Integer.parseInt(request.getParameter("fin"))); //este dato suele ser 10, es el que nos dice cuantos mostraremos en pantalla
				System.out.println("Pagina pulsada es diferente a null"+request.getParameter("pagpulsada"));
				System.out.println("Pagina"+request.getParameter("pag"));
				/*
				 * Recogemos en la url una variable nombre pag que contendra un valor que sera la redireccion de la pagina
				 */
				
				switch (request.getParameter("pag")) {
				case "respuesta":
					response.sendRedirect("respuesta");
					break;
				case "busqueda":
					response.sendRedirect("search1");
					break;
				case "usuarios":
					System.out.println("Envio a paginausuarios");
					response.sendRedirect("pagiusuarios");
					break;
				default:
					break;
				}
		}
		
		/*
		 * 
		 * Valido que no este null y si no esta null que compruebe el valor, son valores iniciales para empezar las paginaciones, 
		 * tengo la duda y hay que verificar, que aunque se realice el redirect, se ejecuta entero el metodo doget antes de realizar el redirect, y una vez
		 * termine todo el doget se hace el redirect.
		 */
		if (request.getParameter("iniciopagina")!=null && Integer.parseInt(request.getParameter("iniciopagina"))==1)
		{
			sesion.setAttribute("pagpulsada", 1); // Nos dice la pagina que ha sido pulsada para que esa sea pulsada y cambie el formato
			sesion.setAttribute("iniciores",0); // Nos dice el valor inicial de la busqueda en la query
			sesion.setAttribute("finres", 10); //este dato suele ser 10, es el que nos dice cuantos mostraremos en pantalla
			System.out.println("Entro por primera vez aqui");
			
		}
		//System.out.println("Serverletrespuestapaginacion valores pagpulsada,inicio,fin"+Integer.parseInt(request.getParameter("pagpulsada"))+Integer.parseInt(request.getParameter("inicio"))+Integer.parseInt(request.getParameter("fin")));
		
		//response.getWriter().append("Served at: dogetdelserverlet respuesta paginacion ").append(request.getContextPath());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
