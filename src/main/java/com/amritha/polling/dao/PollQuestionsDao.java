package com.amritha.polling.dao;

import java.util.List;

import com.amritha.polling.model.PollQuestions;

public interface PollQuestionsDao {
	public List<PollQuestions> listquestions(int id);

	public void savequestion(PollQuestions question);

	public PollQuestions getquestionbyid(int id);

	public void deletequestion(PollQuestions question, int id);
}
