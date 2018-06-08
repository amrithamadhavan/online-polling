package com.amritha.polling.dao;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.amritha.polling.model.PollCount;
import com.amritha.polling.model.Result;
@Repository("pollcountDao")
public class PollCountDaoImpl implements PollCountDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	public PollCountDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;}
	
	@Transactional
	public void savepollcount(PollCount pollcount)
	{
	sessionFactory.getCurrentSession().saveOrUpdate(pollcount);	
	}
	@Transactional
	public PollCount getpollcountbypid(int id) {
		
		
		try {
			return sessionFactory.getCurrentSession().get(PollCount.class, id);}
			catch(Exception e) {
			return null;
		}
	}

}
