package com.webservices;

import javax.xml.bind.annotation.XmlElement;

public class Answers {
	private int id;
	private String titulo; 
	private String contenido;
	private String autor;
	private int positivos,negativos,count;
	
	
	public Answers(int id, String contenido, String autor,int positivos,int negativos,int count) {
		this.id=id;
		this.contenido = contenido;
		this.autor = autor;
		this.positivos=positivos;
		this.negativos=negativos;
		this.count=count;
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
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
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
