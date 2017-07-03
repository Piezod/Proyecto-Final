package com.webservices;

import javax.xml.bind.annotation.XmlElement;

public class UserData {
	private String user,email,name;
	private int questions,answers,correctanswers;
	public UserData(String user, String email, String name, int questions, int answers, int correctanswers) {
		super();
		this.user = user;
		this.email = email;
		this.name = name;
		this.questions = questions;
		this.answers = answers;
		this.correctanswers = correctanswers;
	}
	@XmlElement
	public String getUser() {
		return user;
	}
	
	public void setUser(String user) {
		this.user = user;
	}
	@XmlElement
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@XmlElement
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@XmlElement
	public int getQuestions() {
		return questions;
	}
	public void setQuestions(int questions) {
		this.questions = questions;
	}
	@XmlElement
	public int getAnswers() {
		return answers;
	}
	public void setAnswers(int answers) {
		this.answers = answers;
	}
	@XmlElement
	public int getCorrectanswers() {
		return correctanswers;
	}
	public void setCorrectanswers(int correctanswers) {
		this.correctanswers = correctanswers;
	}
	
	
	
	    
	   
}
