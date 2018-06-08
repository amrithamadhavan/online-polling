package com.amritha.polling.dao;

import java.util.List;

import com.amritha.polling.model.User;

public interface UserDao {

	User saveUser(User user);

	List<User> listusers();
	
	void setrole(int id);

	List<User> getPollMasters();

	User getUserById(int pmid);
}

