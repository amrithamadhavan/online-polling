package com.amritha.polling.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.amritha.polling.model.PollCategory;
import com.amritha.polling.model.PollQuestions;
import com.amritha.polling.model.User;

@Repository("userDao")
@Transactional
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	public UserDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

@Transactional
	
	public User saveUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		//Transaction transaction=session.beginTransaction();
		user.setRole("ROLE_USER");
		user.setEnabled("TRUE");
		session.persist(user);
		//transaction.commit();
		return user;
	}
@Transactional
public List<User> listusers(){

	List<User> listusers = (List<User>) sessionFactory.getCurrentSession().createCriteria(User.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
	
	return listusers;
	
}
@Transactional
public List<User> getPollMasters(){
	String role="ROLE_POLLMASTER";
	return sessionFactory.getCurrentSession().createQuery("from User where ROLE='"+role+"'",User.class).getResultList();
	
}
@Transactional
public void setrole(int id) {
	Session session = sessionFactory.getCurrentSession();
User user=new User();
user=(User)sessionFactory.getCurrentSession().get(user.getClass(),id);
user.setRole("ROLE_POLLMASTER");
session.saveOrUpdate(user);
}
@Transactional
public User getUserById(int pmid) {
	return sessionFactory.getCurrentSession().get(User.class,pmid);
}


}
