package com.amritha.polling.controller;

import java.lang.reflect.Type;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.amritha.polling.model.PartialSub;
import com.amritha.polling.model.PollCategory;
import com.amritha.polling.model.PollCount;
import com.amritha.polling.model.PollQuestions;

import com.amritha.polling.model.User;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.amritha.polling.dao.PollCategoryDao;
import com.amritha.polling.dao.PollCountDao;
import com.amritha.polling.dao.PollQuestionsDao;

import com.amritha.polling.dao.UserDao;
@Controller
@RequestMapping("/user")
public class UserController {
@Autowired
PollCategoryDao pcDao;
@Autowired
PollQuestionsDao pqDao;

@Autowired
PollCountDao pollcountDao;
@Autowired
UserDao userDao;


	@RequestMapping("/polls")
	public String categorydetails(Model model,Principal user) {
		//session.removeAttribute("sess");
		User user1=userDao.getuserbyname(user.getName());
		List<PollCategory> pc=user1.getPollcategory();
		List<PollCategory> c=pcDao.listcategories();
		List<PollCategory> copy=new ArrayList<PollCategory>(c);
		for(PollCategory p:c)
			for(PollCategory x:pc) {
				if(p.getId()==x.getId()) {
					copy.remove(x);
				}
			}
		
		if(copy.isEmpty()) {
			System.out.println(copy);
			model.addAttribute("tes", 0);
		}
			//System.out.println("empty list");
		model.addAttribute("categories", copy);
		
		
		return "userpolls";
	}
	
	@RequestMapping("/result")
	public String showresult(Model model,Principal user) {
	
		
		User user1=userDao.getuserbyname(user.getName());
		
		List<PollCategory> pc=user1.getPollcategory();
		model.addAttribute("categories", pc);
		model.addAttribute("pollcount", pollcountDao.getallpollcounts());
		return "resultpolls";
		
	}
	@RequestMapping("/listquestions/{id}")
	public ModelAndView listques(@PathVariable("id") int id, Model model,Principal user) {
		Gson gsonObj = new Gson();
		Type type = new TypeToken<Map<String, Map<String,Integer>>>(){}.getType();
		User user1=userDao.getuserbyname(user.getName());
		int uid=user1.getId();
		Map<String,Map<String,Integer>> hm = null;
		Map<String,Map<String,Integer>> hm1 = null;
		PartialSub qs;
		qs=pqDao.getquestionbycidanduid(id,uid);
		if(qs!=null) {
			String s1=qs.getQuestion();
			hm1=gsonObj.fromJson(s1, (java.lang.reflect.Type) type);
		}
		
		
		
		PollQuestions pollquestion;
		pollquestion=pqDao.getquestionbycid(id);
		if(pollquestion==null) {
			hm=new HashMap<String,Map<String,Integer>>();
			pollquestion=new PollQuestions();
			System.out.println("hi");
			PollCategory pc=pcDao.getcategorybyid(id);
			pollquestion.setPollcategory(pc);
		}
		else {
		
		 System.out.println("hello");
			String s=pollquestion.getQuestion();
			hm=gsonObj.fromJson(s, (java.lang.reflect.Type) type);
			
			
		}
		
		ModelAndView mav = new ModelAndView("questions");
		mav.addObject("hm", hm);
        mav.addObject("id", id);
        mav.addObject("hm1", hm1);
	return mav;
		
		
	}
	

	@RequestMapping(value="/save/{id}",method= {RequestMethod.POST})
	public String aftersave(@PathVariable("id") int id,Model model,@RequestParam Map<String,String> requestparams,Principal user) {
		
		
		
		User user1=userDao.getuserbyname(user.getName());
		int uid=user1.getId();
         int i;
		
		Map<String,Map<String,Integer>> hm = null;
		Gson gsonObj = new Gson();
		
		Type type = new TypeToken<Map<String, Map<String,Integer>>>(){}.getType();
		PartialSub qs;
		qs=pqDao.getquestionbycidanduid(id,uid);
		if(qs==null) {

			
			PollQuestions pollquestion;
			pollquestion=pqDao.getquestionbycid(id);
			String s=pollquestion.getQuestion();
			hm=gsonObj.fromJson(s, (java.lang.reflect.Type) type);
			
			for (Map.Entry<String,Map<String,Integer>> entry : hm.entrySet()) {
				for(Map.Entry<String,Integer> e:entry.getValue().entrySet()) {
					entry.getValue().put(e.getKey(), 0);
				}
			}
			qs=new PartialSub();
			//System.out.println("hi");
			PollCategory c=pcDao.getcategorybyid(id);
			qs.setPollcategory(c);
			qs.setUid(uid);
		}
		else {
		
		 //System.out.println("hello");
			String s=qs.getQuestion();
			hm=gsonObj.fromJson(s, (java.lang.reflect.Type) type);
			
		}
		
		System.out.println(requestparams.size());
	
		
		for(i=0;i<(requestparams.size()/2);i++) {
			try {
			String op=requestparams.get("radioname"+i);
System.out.println(op);
 String que=requestparams.get("qname"+i);
System.out.println(que);
//System.out.println("error1");
Map<String,Integer> m=hm.get(que);
for(Map.Entry<String,Integer> e:m.entrySet() ){
	m.put(e.getKey(), 0);
}
//System.out.println("error2");
m.put(op, 1);


//System.out.println("error3");
hm.put(que, m);
//System.out.println("error4");
System.out.println(hm);
String jsonStr = gsonObj.toJson(hm);
System.out.println(jsonStr);

qs.setQuestion(jsonStr);


pqDao.savepartialquestion(qs);

System.out.println("done no error");

		}
		catch(Exception e) {
			System.out.println("error in map");
		}
		
		}

		
	return "index";
	}
	
	
	
	
	@RequestMapping(value="/submit/{id}",method= {RequestMethod.POST})
	public RedirectView aftersubmit(@PathVariable("id") int id,Model model,@RequestParam Map<String,String> requestparams,Principal user) {
		int i;
		
		Map<String,Map<String,Integer>> hm = null;
		Gson gsonObj = new Gson();
		
		Type type = new TypeToken<Map<String, Map<String,Integer>>>(){}.getType();
		PollQuestions pollquestion;
		pollquestion=pqDao.getquestionbycid(id);
		if(pollquestion==null) {
			hm=new HashMap<String,Map<String,Integer>>();
			pollquestion=new PollQuestions();
			//System.out.println("hi");
			PollCategory c=pcDao.getcategorybyid(id);
			pollquestion.setPollcategory(c);
		}
		else {
		
		 //System.out.println("hello");
			String s=pollquestion.getQuestion();
			hm=gsonObj.fromJson(s, (java.lang.reflect.Type) type);
			
		}
		
		System.out.println(requestparams.size());
	
		PollCount pc;
		
		for(i=0;i<(requestparams.size()/2);i++) {
			try {
			String op=requestparams.get("radioname"+i);
System.out.println(op);
 String que=requestparams.get("qname"+i);
System.out.println(que);
//System.out.println("error1");
Map<String,Integer> m=hm.get(que);
//System.out.println("error2");
m.put(op, m.get(op)+1);
//System.out.println("error3");
hm.put(que, m);
//System.out.println("error4");
System.out.println(hm);
String jsonStr = gsonObj.toJson(hm);
System.out.println(jsonStr);

pollquestion.setQuestion(jsonStr);


pqDao.savequestion(pollquestion);



		}
		catch(Exception e) {
			System.out.println("error in map");
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
		User user1=userDao.getuserbyname(user.getName());
		List<PollCategory> attendedpolls=user1.getPollcategory();
		PollCategory e=pcDao.getcategorybyid(id);
		attendedpolls.add(e);
		user1.setPollcategory(attendedpolls);
		
		
		
		userDao.saveondelete(user1);
		List<PollCategory> pc1=user1.getPollcategory();
		List<PollCategory> c=pcDao.listcategories();
		List<PollCategory> copy=new ArrayList<PollCategory>(c);
		for(PollCategory p:c)
			for(PollCategory x:pc1) {
				if(p.equals(x)) {
					copy.remove(x);
				}
			}
		
		
		model.addAttribute("categories",copy);
		
		 RedirectView rv = new RedirectView();
	        rv.setContextRelative(true);
	        rv.setUrl("/viewcount/{id}");
	        return rv;
		
		//return "redirect:/user/polls";
		//return "userpolls";
}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

