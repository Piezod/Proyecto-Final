package serverlets;


import java.io.IOException;
import java.sql.SQLException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utilidades.Conexion;

/**
 * Servlet implementation class BusquedaBarra
 */
@WebServlet("/ServeletBusqueda")
public class ServeletBusqueda extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServeletBusqueda() {
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
		 * Se recoge el valor de lo introducido en la busqueda en la barra de la cabecera y se realiza la query al metodo buscar header pasandole el valo ruq 
		 * queremos buscar, 
		 */
		String vb=(String)request.getParameter("valorbusqueda");
		//System.out.println("serverletbusquedabarra  valor de busqueda "+vb);
		
		HttpSession sesion= request.getSession(true);
			/*
			 * Enviamos al jsp el valor de la busqueda por parametro get y la variable search
			 * usaremos este valor para realizar una consulta  a la bd y que nos recargue los resultados en un objeto resulset,
			 * en funcion de las vueltas que de el resulset ira imprimiendo posibles soluciones a la pregunta.
			 */
			response.sendRedirect("search1?search="+(String)request.getParameter("valorbusqueda"));
			
		
		
	}

}
