package com.amritha.polling.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amritha.polling.model.PollCategory;
import com.amritha.polling.model.PollCount;
import com.amritha.polling.model.PollQuestions;
import com.amritha.polling.model.Result;
import com.amritha.polling.dao.PollCategoryDao;
import com.amritha.polling.dao.PollCountDao;
import com.amritha.polling.dao.PollQuestionsDao;
import com.amritha.polling.dao.ResultDao;
@Controller
@RequestMapping("/user")
public class UserController {
@Autowired
PollCategoryDao pcDao;
@Autowired
PollQuestionsDao pqDao;
@Autowired
ResultDao resultDao;
@Autowired
PollCountDao pollcountDao;
	@RequestMapping("/polls")
	public String categorydetails(Model model) {
		
		List<PollCategory> pc=pcDao.listcategories();
		model.addAttribute("categories", pc);
		return "userpolls";
	}
	@RequestMapping("/listquestions/{id}")
	public String listques(@PathVariable("id") int id, Model model) {
		model.addAttribute("pq", pqDao.listquestions(id));
		model.addAttribute("que",new PollQuestions());
		
		model.addAttribute("id", id);
		return "questions";
		
	}
	@RequestMapping("/submit/{id}")
	public String aftersubmit(@PathVariable("id") int id,@ModelAttribute("que") PollQuestions que,Model model,@RequestParam Map<String,String> requestparams) {
		int i,qid=0;
		System.out.println(requestparams.size());
		Result result;
		PollCount pc;
		for(i=0;i<(requestparams.size()/2);i++) {
			String op=requestparams.get("radioname["+i+"]");
System.out.println(op);
 qid=Integer.parseInt(requestparams.get("qid["+i+"]"));

		System.out.println(qid);
		result=resultDao.getresultbyqid(qid);
		if(result==null) {
			result=new Result();
			result.setQid(qid);
		}
		
		PollQuestions question=pqDao.getquestionbyid(qid);
		
		if(op.equals(question.getOp1()))
			{
			result.setOp1cnt(result.getOp1cnt()+1);
			}
		else if(op.equals(question.getOp2()))
		{
			result.setOp2cnt(result.getOp2cnt()+1);
		}
		else if(op.equals(question.getOp3()))
		{
			result.setOp3cnt(result.getOp3cnt()+1);
		}
			
	if(qid!=0) {
	
		resultDao.saveresult(result);
		}
		}
		pc=pollcountDao.getpollcountbypid(id);
		if(pc==null) {
			pc=new PollCount();
			pc.setPcid(id);
		}
		//System.out.println(requestparams.get("qid"));
		pc.setCount(pc.getCount()+1);
		pollcountDao.savepollcount(pc);
		List<PollCategory> c=pcDao.listcategories();
		model.addAttribute("categories", c);
		return "userpolls";
}
}

