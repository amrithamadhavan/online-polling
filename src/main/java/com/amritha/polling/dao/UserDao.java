package com.amritha.polling.dao;

import java.util.List;

import com.amritha.polling.model.User;

public interface UserDao {

	User saveUser(User user);

	List<User> listusers();
	
	void setrole(int id);

	List<User> getPollMasters();

	User getUserById(int pmid);
	User getuserbyname(String uname);
	
	public boolean checkuser(String name);
	
	public void saveondelete(User user);
	
	public void saveonpwdencrypt(User user);
	public void create(User user,int id);
}

