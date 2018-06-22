package com.amritha.polling.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.amritha.polling.dao.PollCategoryDao;
import com.amritha.polling.dao.PollQuestionsDao;
import com.amritha.polling.dao.UserDao;
import com.amritha.polling.model.PartialSub;
import com.amritha.polling.model.PollCategory;
import com.amritha.polling.model.PollQuestions;
import java.lang.reflect.Type;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
@RequestMapping("/ap")
public class AdminPMController {

	
	@Autowired
	PollCategoryDao pcDao;
	@Autowired
	PollQuestionsDao pqDao;
	@Autowired
	UserDao userDao;

	
	@RequestMapping("/listquestions/{id}")
	public ModelAndView listques(@PathVariable("id") int id, Model model) {
		Map<String,Map<String,Integer>> hm = null;
		Gson gsonObj = new Gson();
		
		Type type = new TypeToken<Map<String, Map<String,Integer>>>(){}.getType();
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
		
		ModelAndView mav = new ModelAndView("listquestions");
		mav.addObject("hm", hm);
        mav.addObject("id", id);
	return mav;

}
	

	
	@RequestMapping("/editcategory/{id}")
	public  ModelAndView editcategory(@PathVariable("id") int id,Model model) {
		Map<String,Map<String,Integer>> hm = null;
		Gson gsonObj = new Gson();
		
		Type type = new TypeToken<Map<String, Map<String,Integer>>>(){}.getType();
		PollQuestions pollquestion;
		pollquestion=pqDao.getquestionbycid(id);
		String s=pollquestion.getQuestion();
		hm=gsonObj.fromJson(s, (java.lang.reflect.Type) type);
		
		ModelAndView mav = new ModelAndView("listquestions");
		mav.addObject("hm", hm);
        mav.addObject("id", id);
	return mav;
	}
	@RequestMapping("/addquestions/{id}")
	public String addquestions(@PathVariable("id") int id,Model model) {
		model.addAttribute("cid",id);
		PollCategory pc=pcDao.getcategorybyid(id);
		model.addAttribute("pcname",pc.getPollcategory());
		model.addAttribute("pollcategorylist", pcDao.listcategories());
		//model.addAttribute("question", new PollQuestions());
		return "questionadd";
	}
	
	@RequestMapping("/savequestion/{cid}")
	public ModelAndView savequestion(@PathVariable("cid") int cid,Model model,@RequestParam Map<String,String> requestparams) {
		//System.out.println("error.!");
		System.out.println(requestparams.get("question"));
		if(requestparams.get("question")=="") {
			ModelAndView mav=new ModelAndView("questionadd");
			mav.addObject("cid",cid);
			PollCategory pc=pcDao.getcategorybyid(cid);
			mav.addObject("pcname",pc.getPollcategory());
			mav.addObject("pollcategorylist", pcDao.listcategories());
			mav.addObject("tes", 0);
			//model.addAttribute("question", new PollQuestions());
			return mav;
			
		}
		int i;
		System.out.println("error1.!");
		Map<String,Map<String,Integer>> hm = null;
		
		System.out.println("error2.!");
		Gson gsonObj = new Gson();
	
		Type type = new TypeToken<Map<String, Map<String,Integer>>>(){}.getType();
		
		System.out.println("error3.!");
		PollQuestions pollquestion;
	
		pollquestion=pqDao.getquestionbycid(cid);
		
		if(pollquestion==null) {
			hm=new HashMap<String,Map<String,Integer>>();
			pollquestion=new PollQuestions();
			System.out.println("hi");
			PollCategory pc=pcDao.getcategorybyid(cid);
			pollquestion.setPollcategory(pc);
		}
		else {
		
		 System.out.println("hello");
			String s=pollquestion.getQuestion();
			hm=gsonObj.fromJson(s, (java.lang.reflect.Type) type);
			
		}
Map<String,Integer> m=new HashMap<String,Integer>();
		
	
		for(i=1;i<(requestparams.size());i++) {
		
			System.out.println(requestparams.get("option"+i));
			
			m.put(requestparams.get("option"+i),0);
			
			
		}
		hm.put(requestparams.get("question"), m);
		
		
		System.out.println(hm);
	
		String jsonStr = gsonObj.toJson(hm);
        System.out.println(jsonStr);
		
		pollquestion.setQuestion(jsonStr);
		
		
		pqDao.savequestion(pollquestion);
		//model.addAttribute("id", cid);
		System.out.println(hm);
		
		System.out.println(hm);
	
		ModelAndView mav = new ModelAndView("listquestions");
		mav.addObject("hm", hm);
        mav.addObject("id", cid);
	return mav;
		//return "listquestions";
	}
	@RequestMapping("/editquestion")
	public ModelAndView editquestion(@RequestParam("question") String question,@RequestParam("cid") int cid,Model model) {
		Map<String,Map<String,Integer>> hm = null;
		Gson gsonObj = new Gson();
		
		Type type = new TypeToken<Map<String, Map<String,Integer>>>(){}.getType();
		PollQuestions pollquestion;
		pollquestion=pqDao.getquestionbycid(cid);
		String s=pollquestion.getQuestion();
		hm=gsonObj.fromJson(s, (java.lang.reflect.Type) type);
		Map<String,Integer> m=hm.get(question);
		
		ModelAndView mav = new ModelAndView("editquestion");
		mav.addObject("m", m);
		mav.addObject("question", question);
		mav.addObject("cid", cid);
		
hm.remove(question);
		
		
		System.out.println(hm);
		
		String jsonStr = gsonObj.toJson(hm);
        System.out.println(jsonStr);
		
		pollquestion.setQuestion(jsonStr);
		
		
		pqDao.savequestion(pollquestion);
		PollCategory pollcategory=pcDao.getcategorybyid(cid);
		mav.addObject("pcname", pollcategory.getPollcategory());
		
		return mav;
	}
	@RequestMapping("/confeditque/{cid}")
	public String confirmeditque(@PathVariable("cid") int cid,@ModelAttribute("que") PollQuestions que,BindingResult bindingresult,Model model)
	{
		if (bindingresult.hasErrors()) {
			 System.out.println("hiihello");
			 System.out.println(bindingresult.getAllErrors());
	         return "editquestion";
	      }
		pqDao.savequestion(que);
		model.addAttribute("pq", pqDao.listquestions(cid));
		model.addAttribute("id",cid);
		return "listquestions";
		
	}
	@RequestMapping("/deletequestion")
	public ModelAndView deletequestion(@RequestParam("question") String question,@RequestParam("cid") int cid,Model model) {
		Map<String,Map<String,Integer>> hm = null;
		Gson gsonObj = new Gson();
		
		Type type = new TypeToken<Map<String, Map<String,Integer>>>(){}.getType();
		PollQuestions pollquestion;
		pollquestion=pqDao.getquestionbycid(cid);
		String s=pollquestion.getQuestion();
		hm=gsonObj.fromJson(s, (java.lang.reflect.Type) type);
		hm.remove(question);
		
		
		System.out.println(hm);
		
		String jsonStr = gsonObj.toJson(hm);
        System.out.println(jsonStr);
		
		pollquestion.setQuestion(jsonStr);
		
		
		pqDao.savequestion(pollquestion);
		
		ModelAndView mav = new ModelAndView("listquestions");
		mav.addObject("hm", hm);
        mav.addObject("id", cid);
	return mav;
		
	}
		
}
