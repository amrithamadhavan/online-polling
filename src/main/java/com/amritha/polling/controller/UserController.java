package com.amritha.polling.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amritha.polling.model.PollCategory;
import com.amritha.polling.model.PollQuestions;
import com.amritha.polling.dao.PollCategoryDao;
import com.amritha.polling.dao.PollQuestionsDao;
@Controller
@RequestMapping("/user")
public class UserController {
@Autowired
PollCategoryDao pcDao;
@Autowired
PollQuestionsDao pqDao;
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
	@RequestMapping("/submit")
	public String aftersubmit(@ModelAttribute("que") PollQuestions que,Model model,@RequestParam(required=false,name="radioname") String option) {
		System.out.println(option);
		
		return "questions";
}
}

