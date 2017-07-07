package com.webservices;

import javax.xml.bind.annotation.XmlElement;

public class Test {
	String asignatura;
	double nota;
	String usuario,fecha,hora;
	int id;
	

	public Test(String asignatura, double nota, String usuario, int id,String fecha,String hora) {
		super();
		this.asignatura = asignatura;
		this.nota = nota;
		this.usuario = usuario;
		this.id = id;
		this.fecha=fecha;
		this.hora=hora;
	}
	public Test(double nota, int id) {
		super();
		this.nota = nota;
		this.id = id;
	}

	@XmlElement
	public String getAsignatura() {
		return asignatura;
	}

	public void setAsignatura(String asignatura) {
		this.asignatura = asignatura;
	}
	@XmlElement
	public double getNota() {
		return nota;
	}

	public void setNota(double nota) {
		this.nota = nota;
	}
	@XmlElement
	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	@XmlElement
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	@XmlElement
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	@XmlElement
	public String getHora() {
		return hora;
	}
	public void setHora(String hora) {
		this.hora = hora;
	}
	
	
}
