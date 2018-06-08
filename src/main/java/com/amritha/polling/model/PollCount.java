package com.amritha.polling.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.ApplicationScope;

@Entity
@Table(name="PollCount")
@Component
@ApplicationScope
public class PollCount {
	
	@Id
	private int pcid;
	private int count;
	public int getPcid() {
		return pcid;
	}
	public void setPcid(int pcid) {
		this.pcid = pcid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	

}
