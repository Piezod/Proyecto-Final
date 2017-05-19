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
 * Servlet implementation class ServeletRespuesta
 */
@WebServlet("/ServerletRespuesta")
public class ServerletRespuesta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerletRespuesta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.getWriter().append("Served at: de respuesta").append(request.getContextPath());
		
		/*
		 * Se ha creado una tabla auxiliar donde almacenar si la respuesta ha recibido ya un voto, si existe en esa tabla no se podra realizar la suma 
		 * del voto, por el contrario, si aun no ha existido una votacion, se realizara la suma del voto y el insert en la tabla auxiliar para que
		 * quede constancia y en futuras votaciones a la misma pregunta no se le sume.
		 */
		Conexion c1=(Conexion)request.getSession().getAttribute("conexion");
		try {

			c1.conectar();
		}
		 catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
		 }
		String usuario=(String)request.getSession().getAttribute("usuario");
		
		int idrespuesta=Integer.parseInt((String)request.getParameter("idrespuesta"));
		//System.out.println(request.getParameter("tipo")+"es el tipo");
		//System.out.println(usuario);
		//System.out.println(idrespuesta);
		
		if (!c1.comprobar("select * from Votorespuesta where idrespuesta="+idrespuesta+" and idusuario like '"+usuario+"'"))
		{
		      //System.out.println("no existe, se haria el insert");
				/*
				 * Recogo los valores que me envian desde respuesta por variable, tengo si sumo o resto, en funcion de lo que recoja realizo una u otra operacion
				 * en la id de pregunta que se recoge por el get.
				 */
				if (request.getParameter("sumo")!=null ||request.getParameter("resto")!=null)
					{
				
					}
					if (request.getParameter("sumo")!=null && Integer.parseInt(request.getParameter("sumo"))==1)
					{
							try {
								c1.SumarVoto(Integer.parseInt(request.getParameter("idrespuesta")),"votospositivos");
							} catch (NumberFormatException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
					}
					else if (request.getParameter("resto")!=null && Integer.parseInt(request.getParameter("resto"))==1)
					{
						
						try {
							c1.SumarVoto(Integer.parseInt(request.getParameter("idrespuesta")),"votosnegativos");
						} catch (NumberFormatException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					try {
						c1.actualizardato("insert into Votorespuesta values ("+idrespuesta+",'"+usuario+"','"+request.getParameter("tipo")+"')");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
		else
		{
			//System.out.println("Existe, no se puede hacer el insert");
		}
		
			response.sendRedirect("Respuesta?idpregunta="+request.getParameter("idpregunta"));
		}
		


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		HttpSession sesion= request.getSession(true);
		
		Conexion ce=(Conexion)sesion.getAttribute("conexion");
		//ce.conectar();
		ce.InsertarRespuestas(request.getParameter("mensajeoculto"),Integer.parseInt(request.getParameter("idpregunta")), request.getParameter("idusuario"),request.getRemoteAddr());
		//ce.cerrarconexion();
		sesion.setAttribute("pagpulsada",1); // la pagina que saldra indicada por defecto marcada
		sesion.setAttribute("iniciores", 0); // el numero desde el que se buscara es decir desde el 0 hasta el ..
		sesion.setAttribute("finres", 10); // el numero de resultados que mostrara por pagina
		response.sendRedirect("Respuesta?idpregunta="+request.getParameter("idpregunta"));
		
		
		
	}

}
