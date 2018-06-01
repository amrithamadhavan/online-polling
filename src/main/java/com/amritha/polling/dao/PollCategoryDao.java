package com.amritha.polling.dao;


import java.util.List;

import com.amritha.polling.model.PollCategory;

public interface PollCategoryDao {

	public List<PollCategory> listcategories();

	public void savecategory(PollCategory pollcategory);

	public Boolean deletecategory(int id);

	public PollCategory getcategorybyid(int id);

}
