package com.amritha.polling.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.amritha.polling.model.PollCount;
import com.amritha.polling.model.Result;
import com.amritha.polling.model.User;
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
	
	@Transactional 
	public List<PollCount> getallpollcounts()
	{
		return sessionFactory.getCurrentSession().createCriteria(PollCount.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
	}

}
