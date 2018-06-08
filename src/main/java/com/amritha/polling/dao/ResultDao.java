package com.amritha.polling.dao;

import com.amritha.polling.model.Result;

public interface ResultDao {
	public void saveresult(Result result);

	public Result getresultbyqid(int qid);

}
