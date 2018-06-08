package com.amritha.polling.dao;

import com.amritha.polling.model.PollCount;

public interface PollCountDao {
	
	public void savepollcount(PollCount pollcount);

	public PollCount getpollcountbypid(int id);

}
