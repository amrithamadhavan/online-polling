package com.amritha.polling.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.amritha.polling.dao.PollCategoryDao;
import com.amritha.polling.dao.PollQuestionsDao;
import com.amritha.polling.dao.UserDao;
import com.amritha.polling.model.PollQuestions;
import com.amritha.polling.model.User;

@Controller
public class HomeController {

	@Autowired
	PollCategoryDao pcDao;
	@Autowired
	PollQuestionsDao pqDao;
	@Autowired
	private UserDao userDao;
	@RequestMapping("/")
	public String setUpForm(Map<String, Object> map) {

		return "index";
	}
	@RequestMapping(value= {"/login"},method= {RequestMethod.GET, RequestMethod.POST})
	public String login(Model model)
	{
		model.addAttribute("user", new User());
		return "login";
	}
	
	@RequestMapping("/logout")
	  public String logout()
	  {
		  return "/";
	  }
	
	@RequestMapping("/register")
	public String register(Model model)
	{
		model.addAttribute("uDemo", new User());
		return "register";
	}
	
	@RequestMapping("/registration")
	public String save(@ModelAttribute("uDemo") @Validated User uDemo,BindingResult bindingResult,Model model)
	{
		 if (bindingResult.hasErrors()) {
	         return "register";
	      }
		uDemo=userDao.saveUser(uDemo);
		return "index";
	
}
	@RequestMapping("/listquestions/{id}")
	public String listques(@PathVariable("id") int id, Model model) {
		model.addAttribute("pq", pqDao.listquestions(id));
		model.addAttribute("que",new PollQuestions());
		
		model.addAttribute("id", id);
		return "questions";
}
}

