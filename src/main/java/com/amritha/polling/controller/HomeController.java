package com.amritha.polling.controller;

import java.lang.reflect.Type;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.amritha.polling.dao.PollCategoryDao;
import com.amritha.polling.dao.PollCountDao;
import com.amritha.polling.dao.PollQuestionsDao;

import com.amritha.polling.dao.UserDao;
import com.amritha.polling.model.PollCategory;
import com.amritha.polling.model.PollQuestions;
import com.amritha.polling.model.User;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
public class HomeController {

	@Autowired
	PollCategoryDao pcDao;
	@Autowired
	PollQuestionsDao pqDao;
	@Autowired
	private UserDao userDao;
	
	@Autowired
	PollCountDao pollcountDao;
	@RequestMapping("/")
	public String setUpForm(Map<String, Object> map) {

		
		
		return "index";
	}
	
	/*@RequestMapping(value = "/", method = RequestMethod.GET)
    public String logout(ModelMap model, HttpServletRequest request) {

    SecurityContextHolder.clearContext();
    request.getSession().invalidate();
return "/";

   // return Constants.LOGOUT;

    }*/
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
		 if (bindingResult.hasErrors()||(userDao.checkuser(uDemo.getUname()))) {
				model.addAttribute("tes", 0);
	         return "register";
	      }
		uDemo=userDao.saveUser(uDemo);
		return "index";
	
}
	
	
	@RequestMapping(value="/forgotPassword")
	public String forgotpassword(Model model)
	{
	       model.addAttribute("user",new User());
	    return "forgetpassword";
	}
	@RequestMapping(value="/changepassword")
	public String changepassword(@ModelAttribute("User") User user,Model model) {
	      User user1;
	     /* List<User> userslist=userDao.listusers();
	       for(User u:userslist) {
	       
	              if(u.getUname().equals(user.getUname()))
	                     {user.setPwd(user.getPwd());
	                     
	                     
	                     return "redirect:/";}
	       }*/
	       if((user1=userDao.getuserbyname(user.getUname()))==null) {
	    	   model.addAttribute("uDemo",new User());          
	    	   return "/register";}
	       user1.setPwd(user.getPwd());
	       userDao.saveonpwdencrypt(user1);
	       return "index";
	}
	
	
	
	@RequestMapping("/listquestions/{id}")
	public String listques(@PathVariable("id") int id, Model model) {
		model.addAttribute("pq", pqDao.listquestions(id));
		model.addAttribute("que",new PollQuestions());
		
		model.addAttribute("id", id);
		return "questions";
}
	
	
	
	
	
	@RequestMapping("/viewcount/{id}")
	public String countdisplay(@PathVariable("id") int id,Model model) {
		
		Map<String,Map<String,Integer>> hm = null;
		Gson gsonObj = new Gson();
		
		Type type = new TypeToken<Map<String, Map<String,Integer>>>(){}.getType();
		PollQuestions pollquestion;
		pollquestion=pqDao.getquestionbycid(id);
		String s=pollquestion.getQuestion();
		hm=gsonObj.fromJson(s, (java.lang.reflect.Type) type);
		model.addAttribute("hm", hm);
		
		return "count";
		
	}
}

