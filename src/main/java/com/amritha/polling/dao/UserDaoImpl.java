package com.amritha.polling.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.exception.SQLGrammarException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.amritha.polling.model.PollCategory;
import com.amritha.polling.model.PollQuestions;
import com.amritha.polling.model.User;

@Repository("userDao")
@Transactional
public class UserDaoImpl implements UserDao{
	
	private Session session;
	
	@Autowired
	private SessionFactory sessionFactory;
	 @Autowired
	    private PasswordEncoder passwordEncoder;
	
	 public UserDaoImpl() {
		 
	 }
	 
	    
	  
	    public void create(User user,int id) {
	        Assert.notNull(user);
	        	            System.out.println("1");
	           
	            session.beginTransaction();
	            try {
	                session.save(user);
	                System.out.println(user.getUname());
	                session.getTransaction().commit();
	            } catch (SQLGrammarException e) {
	               session.getTransaction().rollback();
	               System.out.println("cannot create user");
	            } finally {
	                session.close();
	            }
	            
	            
	            
	            
	        } 
	    

	public UserDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public UserDaoImpl(Session session) {
        this.session = session;
    }
	
@Transactional
	
	public User saveUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		//Transaction transaction=session.beginTransaction();
		System.out.println(user.getPwd());
		System.out.println(user.getUname());
		user.setPwd(passwordEncoder.encode(user.getPwd()));
		user.setRole("ROLE_USER");
		user.setEnabled("TRUE");
		session.saveOrUpdate(user);
		//transaction.commit();
		return user;
	}

@Transactional
public void saveonpwdencrypt(User user) {
	Session session=sessionFactory.getCurrentSession();
	user.setPwd(passwordEncoder.encode(user.getPwd()));
	session.saveOrUpdate(user);
}
@Transactional
public void saveondelete(User user) {
	
	sessionFactory.getCurrentSession().saveOrUpdate(user);
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
if(user.getRole().equalsIgnoreCase("ROLE_USER")) {
user.setRole("ROLE_POLLMASTER");}
else if(user.getRole().equalsIgnoreCase("ROLE_POLLMASTER")) {
	user.setRole("ROLE_USER");
}
session.saveOrUpdate(user);
}
@Transactional
public User getUserById(int pmid) {
	return sessionFactory.getCurrentSession().get(User.class,pmid);
}
@Transactional
public User getuserbyname(String uname) {
	// TODO Auto-generated method stub
	User user=new User();
	/*//user=(User)sessionFactory.getCurrentSession().get(user.getClass(),);
	//System.out.println(user.getId());
	//int id=user.getId();
	return sessionFactory.getCurrentSession().createQuery("select id from User where uname='"+uname+"'");
	//query.setParameter("uname", uname);
	/*int id=user.getId();
	System.out.println(user.getId());
	return id;*/
// return id;*/
	Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
	user= (User) criteria.add(Restrictions.eq("uname", uname)) .uniqueResult();
	   
			int id=user.getId();                        
	System.out.println(id);
	return user;
}



@Transactional
public boolean checkuser(String name){
                List<User> abc=new ArrayList<User>();
                abc=sessionFactory.getCurrentSession().createQuery("from User where UNAME='"+name+"'",User.class).getResultList();
                                if(abc.isEmpty())
                                                return false;
                                else
                                                return true;
}


}
