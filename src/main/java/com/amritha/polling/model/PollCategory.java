package com.amritha.polling.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.ApplicationScope;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="PollCategory")
@Component
@ApplicationScope
public class PollCategory implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    private int id;
	@NotEmpty
	private String pollcategory;
	@OneToMany(fetch=FetchType.LAZY,orphanRemoval=true,mappedBy="pollcategory",cascade=CascadeType.ALL)
	
	private List<PollQuestions> questions;
	
	@ManyToMany(fetch=FetchType.LAZY)
	private List<User> pollmasters;
	
	
	
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPollcategory() {
		return pollcategory;
	}
	public void setPollcategory(String pollcategory) {
		this.pollcategory = pollcategory;
	}
	public List<PollQuestions> getQuestions() {
		return questions;
	}
	public void setQuestions(List<PollQuestions> questions) {
		this.questions = questions;
	}
	public List<User> getPollmasters() {
		return pollmasters;
	}
	public void setPollmasters(List<User> pollmasters) {
		this.pollmasters = pollmasters;
	}
	
	public boolean equals(Object obj) {
	    if (obj == null) return false;
	    if (obj == this) return true;
	    if (!(obj instanceof PollCategory)) return false;
	    PollCategory o = (PollCategory) obj;
	    return o.id== this.id && o.getPollcategory()==this.getPollcategory();
	}

	
}
