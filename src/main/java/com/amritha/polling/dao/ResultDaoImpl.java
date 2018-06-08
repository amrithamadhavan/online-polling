package com.amritha.polling.dao;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amritha.polling.model.PollQuestions;
import com.amritha.polling.model.Result;


@Repository("resultDao")
public class ResultDaoImpl implements ResultDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	public ResultDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;}
	
	@Transactional
	public void saveresult(Result result)
	{
	sessionFactory.getCurrentSession().saveOrUpdate(result);	
	}
	@Transactional
	public Result getresultbyqid(int qid) {
		try {
		return sessionFactory.getCurrentSession().get(Result.class, qid);}
		catch(Exception e) {
		return null;
	}

}
}
