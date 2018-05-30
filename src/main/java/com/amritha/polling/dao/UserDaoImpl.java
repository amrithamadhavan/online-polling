package com.amritha.polling.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	

}
