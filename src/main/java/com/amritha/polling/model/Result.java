package com.amritha.polling.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.ApplicationScope;

@Entity
@Table(name="Result")
@Component
@ApplicationScope
public class Result implements Serializable{
	
	@Id
	@OneToOne(fetch=FetchType.EAGER)
	private PollQuestions pollquestion;
	private int op1cnt;
	private int op2cnt;
	private int op3cnt;
	private int cid;
	public PollQuestions getPollquestion() {
		return pollquestion;
	}
	public void setPollquestion(PollQuestions pollquestion) {
		this.pollquestion = pollquestion;
	}
	/*public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}*/
	public int getOp1cnt() {
		return op1cnt;
	}
	public void setOp1cnt(int op1cnt) {
		this.op1cnt = op1cnt;
	}
	public int getOp2cnt() {
		return op2cnt;
	}
	public void setOp2cnt(int op2cnt) {
		this.op2cnt = op2cnt;
	}
	public int getOp3cnt() {
		return op3cnt;
	}
	public void setOp3cnt(int op3cnt) {
		this.op3cnt = op3cnt;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	

}
