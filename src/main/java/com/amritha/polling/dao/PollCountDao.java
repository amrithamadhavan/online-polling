package com.amritha.polling.dao;

import java.util.List;

import com.amritha.polling.model.PollCount;

public interface PollCountDao {
	
	public void savepollcount(PollCount pollcount);

	public PollCount getpollcountbypid(int id);
	
	public List<PollCount> getallpollcounts();

}
