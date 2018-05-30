package com.amritha.polling.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.amritha.polling.model.PollCategory;
import com.amritha.polling.model.PollQuestions;

@Repository("pqDao")
public class PollQuestionsDaoImpl implements PollQuestionsDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	public PollQuestionsDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;}
	
	@Transactional
	public List<PollQuestions> listquestions(int id){
		return sessionFactory.getCurrentSession().createQuery("from PollQuestions where POLLCATEGORY_ID='"+id+"'",PollQuestions.class).getResultList();

}
}
