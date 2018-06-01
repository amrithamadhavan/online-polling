package com.amritha.polling.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.ApplicationScope;

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
	@OneToMany(fetch=FetchType.EAGER,orphanRemoval=true,mappedBy="pollcategory",cascade=CascadeType.ALL)
	
	private List<PollQuestions> questions;
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
	

	
}
