package com.webservices;

import java.io.Serializable;  
import javax.xml.bind.annotation.XmlElement; 
import javax.xml.bind.annotation.XmlRootElement; 
@XmlRootElement(name = "user") 

public class User implements Serializable {  
   private static final long serialVersionUID = 1L; 
   private String user; 
   private String password;
   private String email;
   private boolean valid;  
   public User(){} 
    
   public User(String user, String password){  
      this.user = user; 
      this.password = password; 
      this.valid = false; 
   }  
   
   @XmlElement
	public String getUser() {
		return user;
	}
	
	public void setUser(String user) {
		this.user = user;
	}
	@XmlElement
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	@XmlElement
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@XmlElement
	public boolean isValid() {
		return valid;
	}
	
	public void setValid(boolean valid) {
		this.valid = valid;
	}  
    
  
} 

