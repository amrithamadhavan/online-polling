package com.amritha.polling.dao;


import java.util.List;

import com.amritha.polling.model.PollCategory;
import com.amritha.polling.model.User;

public interface PollCategoryDao {

	public List<PollCategory> listcategories();

	public void savecategory(PollCategory pollcategory);

	public Boolean deletecategory(int id,User user);

	public PollCategory getcategorybyid(int id);
	
	public PollCategory getcategorybyname(String cname);

}
