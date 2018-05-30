package com.amritha.polling.dao;

import java.util.List;

import com.amritha.polling.model.PollQuestions;

public interface PollQuestionsDao {
	public List<PollQuestions> listquestions(int id);
}
