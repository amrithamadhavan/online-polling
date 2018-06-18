package com.amritha.polling.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityGraph;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.FlushModeType;
import javax.persistence.LockModeType;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.metamodel.Metamodel;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.amritha.polling.model.PollCategory;
import com.amritha.polling.model.PollQuestions;
import com.amritha.polling.model.Result;
import com.amritha.polling.model.User;


@Repository("pcDao")
public class PollCategoryDaoImpl implements PollCategoryDao{
	
	
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	UserDao userDao;

	public PollCategoryDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;}
	
	@Transactional
	public List<PollCategory> listcategories(){
		List<PollCategory> listcategory = (List<PollCategory>) sessionFactory.getCurrentSession().createCriteria(PollCategory.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		//System.out.println(listProduct);
		return listcategory;
		
	}
	@Transactional
	public void savecategory(PollCategory pollcategory) {
	
	Session session = sessionFactory.getCurrentSession();
	session.saveOrUpdate(pollcategory);
	
}
	@Transactional
	public Boolean deletecategory(int id,User user) {
		
		Session session = sessionFactory.getCurrentSession();
		PollCategory pollcategory=new PollCategory();
				pollcategory=(PollCategory)sessionFactory.getCurrentSession().get(pollcategory.getClass(),id);
				
				

				List<User> userlist=userDao.listusers();	
				for(User u:userlist) {
					List<PollCategory> p=u.getPollcategory();
					List<PollCategory> a=new ArrayList<PollCategory>(p);
					for(PollCategory m:a) {
					if(m.equals(pollcategory)) {
						p.remove(pollcategory);
					}
				}
					u.setPollcategory(p);
					userDao.saveondelete(u);
				}
				
				List<PollQuestions> pq=pollcategory.getQuestions();
				
				
		for(PollQuestions pollque:pq)
		{	
		/*PollQuestions que=new PollQuestions();
		que.setId(pollque.getId());*/
			Result result=new Result();
			result.setPollquestion(pollque);
			sessionFactory.getCurrentSession().delete(result);
			session.delete(pollque);
				System.out.println("hello1");}
		
		
		
		
		
		
		session.delete(pollcategory);
		System.out.println("hello2");
	return true;	
	}
	
	@Transactional
	public PollCategory getcategorybyid(int id) {
		PollCategory pc=sessionFactory.getCurrentSession().get(PollCategory.class,id);
		return pc;
	}
	
	
}

