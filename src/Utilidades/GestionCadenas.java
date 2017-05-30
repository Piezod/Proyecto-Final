package Utilidades;

/**
 * @author Juankar
 * Clase de java que me funcionara para gestionar cadenas. Se le pasara la cadena que ha de ser modificada y se llamara al metodo
 * correspondiente.
 */
public class GestionCadenas {
	
	private String cadena;
	
	public GestionCadenas(String cadena) {
		// TODO Auto-generated constructor stub
	this.cadena=cadena;
	
	}
	

	/** Metodo para recortar la cadena y devolvera con puntos suspensivos al final
	 * @param longitud Caracteres que quiero que tenga la cadena
	 * @return devuelve la cadena modificada y tratada lista para usar
	 */
	public String recortarcadena(int longitud)
	{
		String cadenaaux="";
		if (cadena.length()>=longitud)
		{
			cadenaaux=cadena.substring(0, longitud)+" ... ";
		}else
		{
			cadenaaux=cadena;
		}
		
		return cadenaaux;
	}
	
	public void quitarpreybr(){
		cadena=cadena.replaceAll("<pre>", "").replaceAll("</pre>", "");
		cadena=cadena.replaceAll("<br>", "");
	}
	
		

	public String getCadena() {
		return cadena;
	}

	public void setCadena(String cadena) {
		this.cadena = cadena;
	}


	
	

}
