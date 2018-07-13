package com.amritha.polling.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Type;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	PollCategoryDao pcDao;
	@Autowired
	HttpServletRequest request;

	@Autowired
	PollQuestionsDao pqDao;
	@Autowired
	UserDao userDao;
	@Autowired
	PollCountDao pollcountDao;
	
	@RequestMapping("/dispajax")
		public String categorydetails(Model model) {
			
			List<PollCategory> pc=pcDao.listcategories();
			model.addAttribute("categories", pc);
			model.addAttribute("pollcategory", new PollCategory());
			return "adminpolls";
	}
	
	@RequestMapping("/activatepoll/{id}")
	public String activatepolls(@PathVariable("id") int id,Model model)
	{
		
	PollCategory pollcategory=pcDao.getcategorybyid(id);
	if(pollcategory.isIsactive())
		pollcategory.setIsactive(false);
	else
	pollcategory.setIsactive(true);
	pcDao.savecategory(pollcategory);
	List<PollCategory> pc=pcDao.listcategories();
	model.addAttribute("categories", pc);
	model.addAttribute("pollcategory", new PollCategory());
	return "adminpolls";
	
	}
	
	@RequestMapping("/result")
	public String showresult(Model model) {
	
		
		
		List<PollCategory> pc=pcDao.listcategories();
		model.addAttribute("categories", pc);
		model.addAttribute("pollcount", pollcountDao.getallpollcounts());
		return "resultpolls";
		
	}
	
	@RequestMapping("/editusers")
	public String editusers() {
		return "listusers";
	}
	@RequestMapping("/setaspollmaster/{id}")
	public String setaspm(@PathVariable("id") int id)
	{
		userDao.setrole(id);
		return "listusers";
	}
	
	@RequestMapping("/pollmasters/{id}")
	public String pollmasters(@PathVariable("id") int id,Model model) {
		
		PollCategory pc=pcDao.getcategorybyid(id);
	List<User> pmforpc=pc.getPollmasters();
	if(pmforpc!=null) {
		model.addAttribute("pmforpc",pmforpc);
	}
	else
	{
model.addAttribute("pmforpc",new ArrayList<User>());		
	}
	model.addAttribute("id", id);
	List<User> pollmas=userDao.getPollMasters();
	model.addAttribute("pollmas", pollmas);
	return "pollmastersforpc";
}
	
	@RequestMapping("/addpmforpc/{id}/{pmid}")
     public String addpmforpc(@PathVariable("id") int id,@PathVariable("pmid") int pmid,Model model) {
		User user=userDao.getUserById(pmid);
		PollCategory pc=pcDao.getcategorybyid(id);
		List<User> pmforpc=pc.getPollmasters();
		//boolean is=pmforpc.contains(user);
		for(User pm:pmforpc) {
			if(pm.getId()==pmid) {
				System.out.println("element already present");
				model.addAttribute("pmforpc",pmforpc);
				model.addAttribute("id", id);
				List<User> pollmas=userDao.getPollMasters();
				model.addAttribute("pollmas", pollmas);
				return "pollmastersforpc";
		}}
		
		pmforpc.add(user);
		pc.setPollmasters(pmforpc);
		pcDao.savecategory(pc);
		
		
		model.addAttribute("pmforpc",pmforpc);
		model.addAttribute("id", id);
		List<User> pollmas=userDao.getPollMasters();
		model.addAttribute("pollmas", pollmas);
		return "pollmastersforpc";
		
	}
	

	@RequestMapping("/deletepmforpc/{id}/{pmid}")
    public String deletepmforpc(@PathVariable("id") int id,@PathVariable("pmid") int pmid,Model model) {
	System.out.println("happy deleting");
		User user=userDao.getUserById(pmid);
		PollCategory pc=pcDao.getcategorybyid(id);
		List<User> pmforpc=new ArrayList<User>();
		pmforpc=pc.getPollmasters();
		
		for(User pm:pmforpc) {
			if(pm.equals(user)) {
				System.out.println(pmforpc.remove(user));
				break;
			}
		}
		//System.out.println("index is"+pmforpc.indexOf(user));
		//System.out.println(pmforpc.remove(user));
		//pmforpc.remove(user);
		pc.setPollmasters(pmforpc);
		pcDao.savecategory(pc);
		
		
		
		model.addAttribute("pmforpc",pmforpc);
		model.addAttribute("id", id);
		List<User> pollmas=userDao.getPollMasters();
		model.addAttribute("pollmas", pollmas);
		return "pollmastersforpc";
		
	}
	@RequestMapping("/listusers")
	public @ResponseBody List<User> listusers(Model model)
	{
		List<User> userlist=userDao.listusers();
		List<User> newlist=new ArrayList<User>(userlist);
		//User user=userDao.getUserById(2);
		for(User u:newlist) {
			if(u.getRole().equals("ROLE_ADMIN")) {
				userlist.remove(u);
			}
		}
		
		//model.addAttribute("users",userlist);
		return userlist;
	}
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
	
	@RequestMapping("/addcategory")
	public String addcategory(Model model,HttpSession session) {
		model.addAttribute("pollcategory",new PollCategory());
		//session.setAttribute("session1", "abc");
		return "categoryadd";
	}
	@RequestMapping(value= {"/savecategory"},method= {RequestMethod.POST })
		public  String addcategory(@ModelAttribute("pollcategory") PollCategory pollcategory,BindingResult bindingresult, @RequestParam CommonsMultipartFile file,Model model,RedirectAttributes ra,HttpSession session) throws Exception {
		System.out.println("hello");
		 if (bindingresult.hasErrors()) {
			 System.out.println("hiihello");
			// return "redirect:/disajax";
			
	         return "categoryadd";
	      }
		if(pcDao.getcategorybyname(pollcategory.getPollcategory())!=null) {
			model.addAttribute("tes", 0);
			return "categoryadd";
		}
		pcDao.savecategory(pollcategory);
		
		
		
		request.getServletContext().setAttribute("pollcategory", pollcategory);
		
		
		pollcategory = (PollCategory) request.getServletContext().getAttribute("pollcategory");
		
		
		
		
		ServletContext context = session.getServletContext();
		String path = context.getRealPath("/resources/images");
		String filename = Integer.toString(pollcategory.getId());

		System.out.println(path + " " + filename);

		byte[] bytes = file.getBytes();
		BufferedOutputStream stream = new BufferedOutputStream(
				new FileOutputStream(new File(path + File.separator + filename + ".jpg")));
		stream.write(bytes);
		stream.flush();
		stream.close();
		
		
		
		
		
		List<PollCategory> pc=pcDao.listcategories();
		model.addAttribute("categories", pc);
		String msg="hello";
		model.addAttribute("pollcategory", new PollCategory());
		//status.setComplete();
		ra.addFlashAttribute("categories", pc);
		//return "redirect:/admin/successhandler";
	return "adminpolls";
	}
	
	
	
	@RequestMapping("/editcategory/{id}")
	public  String editcategory(@PathVariable("id") int id,Model model) {
	model.addAttribute("id", id);
	PollCategory pc=pcDao.getcategorybyid(id);
	model.addAttribute("pcname", pc.getPollcategory());
	
		return "categoryedit";
	}
	
	@RequestMapping("/editcatsave/{id}")
	public String editcatsave(@PathVariable("id") int id,Model model,@RequestParam String name) {
		
		
		if(pcDao.getcategorybyname(name)!=null) {
			model.addAttribute("tes", 0);
			return "categoryedit";
		}
		
		PollCategory pc=pcDao.getcategorybyid(id);
		pc.setPollcategory(name);
		pcDao.savecategory(pc);
		model.addAttribute("pollcategory", new PollCategory());
		List<PollCategory> p=pcDao.listcategories();
		model.addAttribute("categories", p);
		return "adminpolls";
		
	}
	
	/*@RequestMapping("/addquestions/{id}")
	public String addquestions(@PathVariable("id") int id,Model model) {
		model.addAttribute("cid",id);
		PollCategory pc=pcDao.getcategorybyid(id);
		model.addAttribute("pcname",pc.getPollcategory());
		model.addAttribute("pollcategorylist", pcDao.listcategories());
		model.addAttribute("question", new PollQuestions());
		return "questionadd";
	}
	
	@RequestMapping("/savequestion/{cid}")
	public String savequestion(@ModelAttribute("question") PollQuestions question,@PathVariable("cid") int cid,Model model) {
		//System.out.println("error.!");
		
		pqDao.savequestion(question);
		model.addAttribute("id", cid);
		model.addAttribute("pq", pqDao.listquestions(cid));
		return "listquestions";
	}
	@RequestMapping("/editquestion/{id}")
	public String editquestion(@PathVariable("id") int id,Model model) {
		PollQuestions pollquestion=pqDao.getquestionbyid(id);
		model.addAttribute("cid",pollquestion.getPollcategory().getId());
		model.addAttribute("que", pollquestion);
		List<PollCategory> pc=pcDao.listcategories();
		model.addAttribute("categories", pc);
		return "editquestion";
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
	@RequestMapping("/deletequestion/{id}")
	public String deletequestion(@ModelAttribute("question") PollQuestions question,@PathVariable("id") int id,Model model) {
	      
		PollQuestions pollquestion=pqDao.getquestionbyid(id);
		int cid=pollquestion.getPollcategory().getId();
		model.addAttribute("id",cid);
		pqDao.deletequestion(question,id);
		model.addAttribute("pq", pqDao.listquestions(cid));
		return "listquestions";
	}*/
		
		@RequestMapping("/deletecategory/{id}")
	public String deletecategory(@PathVariable("id") int id,Model model,Principal user) {
		User user1=userDao.getuserbyname(user.getName());
		Boolean b=pcDao.deletecategory(id,user1);
		List<PollCategory> pc=pcDao.listcategories();
		model.addAttribute("categories", pc);
		model.addAttribute("pollcategory", new PollCategory());
		return "adminpolls";
		
	}
}