package com.amritha.polling.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
//import org.hibernate.validator.constraints.NotEmpty;
import javax.validation.constraints.NotEmpty;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.ApplicationScope;

import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name="User")
@Component
@ApplicationScope
public class User implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    private int id;
	@NotEmpty(message = "user name taken or empty.")
	private String uname;
	@Size(min=6,message="password invalid")
	private String pwd;
	private String role;
	private String enabled;
	
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JsonIgnore
	private List<PollCategory> pollcategory;
	
	/*@ManyToMany(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinColumn(name ="notattendedpollid",nullable=true)
	private List<PollCategory> notattended;
	
	
	
	
		public List<PollCategory> getNotattended() {
		return notattended;
	}
	public void setNotattended(List<PollCategory> notattended) {
		this.notattended = notattended;
	}*/
		public int getId() {
		return id;
	}
	/*
	public void setId(int id) {
		this.id = id;
	}*/
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	
	
	public List<PollCategory> getPollcategory() {
		return pollcategory;
	}
	public void setPollcategory(List<PollCategory> pollcategory) {
		this.pollcategory = pollcategory;
	}

	
	public boolean equals(Object obj) {
	    if (obj == null) return false;
	    if (obj == this) return true;
	    if (!(obj instanceof User)) return false;
	    User o = (User) obj;
	    return o.id== this.id && o.getUname()==this.uname && o.pwd==this.pwd &&o.role==this.role && o.enabled==this.enabled;
	}
	
}

