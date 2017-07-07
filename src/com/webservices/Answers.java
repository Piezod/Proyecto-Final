package com.webservices;

import javax.xml.bind.annotation.XmlElement;

public class Answers {
	private int id,idpregunta;
	private String contenido;
	private String autor;
	private int positivos,negativos,count,valid;
	
	public Answers(){
		
	}
	
	public Answers(int idpregunta, String contenido, String autor) {
		super();
		this.idpregunta = idpregunta;
		this.contenido = contenido;
		this.autor = autor;
	}


	public Answers(int id, String contenido, String autor,int positivos,int negativos,int valid,int idpregunta) {
		this.id=id;
		this.contenido = contenido;
		this.autor = autor;
		this.positivos=positivos;
		this.negativos=negativos;
		this.valid=valid;
		this.idpregunta=idpregunta;
	}
	
	
	@XmlElement
	public int getIdpregunta() {
		return idpregunta;
	}



	public void setIdpregunta(int idpregunta) {
		this.idpregunta = idpregunta;
	}



	@XmlElement
	public int getValid() {
		return valid;
	}



	public void setValid(int valid) {
		this.valid = valid;
	}



	@XmlElement
	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	@XmlElement
	public int getPositivos() {
		return positivos;
	}


	public void setPositivos(int positivos) {
		this.positivos = positivos;
	}


	@XmlElement
	public int getNegativos() {
		return negativos;
	}


	public void setNegativos(int negativos) {
		this.negativos = negativos;
	}


	@XmlElement
	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	
	@XmlElement
	public String getContenido() {
		return contenido;
	}
	public void setContenido(String contenido) {
		this.contenido = contenido;
	}
	   @XmlElement
   public String getAutor() {
		return autor;
	}
	public void setAutor(String autor) {
		this.autor = autor;
	}
	

}
