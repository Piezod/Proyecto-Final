package com.webservices;

import javax.xml.bind.annotation.XmlElement;

public class Questions {
	private int id;
	private String titulo; 
	private String contenido;
	private String autor;
	
	
	
	public Questions(int id,String titulo, String contenido, String autor) {
		this.id=id;
		this.titulo = titulo;
		this.contenido = contenido;
		this.autor = autor;
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
