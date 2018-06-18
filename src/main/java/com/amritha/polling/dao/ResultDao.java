package com.amritha.polling.dao;

import java.util.List;

import com.amritha.polling.model.Result;

public interface ResultDao {
	public void saveresult(Result result);

	public Result getresultbyqid(int qid);
	
	public List<Result> listquestionsbycid(int id);

}
