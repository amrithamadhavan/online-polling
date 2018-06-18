package com.amritha.polling.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	 @Autowired
	    private PasswordEncoder passwordEncoder;
	 


	public UserDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

@Transactional
	
	public User saveUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		//Transaction transaction=session.beginTransaction();
		System.out.println(user.getPwd());
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
