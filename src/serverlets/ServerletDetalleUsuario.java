package serverlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Utilidades.*;
/**
 * Servlet implementation class ServerletDetalleUsuario
 */
@WebServlet("/ServerletDetalleUsuario")
public class ServerletDetalleUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerletDetalleUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//System.out.println("doget del serveltdetalleusuario");
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/*
	 * Este metodo dopost sera el encargado de enviarnos la informacion de las preguntas y las respuestas que veremos en el detalle del usuario,
	 * para ello recogeremos el objeto de devolver lista de la clase java devolver listas, a la cual le enviaremos el parametro de usuarioq ue recogemos al realizar
	 * la peticion.
	 * Llenamos el hasmap con el objeto de la clase mencionada y lo enviamos de vuelta al jsp para pintarlo.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	//	System.out.println("entro al dopost");
		DevolverListas list=new DevolverListas((String)request.getParameter("usuario"));
		try {
			
		//	ArrayList<String> l=list.infousuario();
		//	HashMap<String, String> hm=list.preguntasusuariohm1();
			HashMap<String, ArrayList> hml=list.preguntasusuariohm2();
		//	request.setAttribute("listausuario",l);
		//	request.setAttribute("hm", hm);
			request.setAttribute("hml", hml);
			request.setAttribute("usuario", request.getParameter("usuario"));
			String nextJSP = "/detalleusuario";
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
			dispatcher.forward(request,response);
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
