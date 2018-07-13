package com.amritha.polling.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amritha.polling.dao.PollCategoryDao;
import com.amritha.polling.dao.PollCountDao;
import com.amritha.polling.dao.PollQuestionsDao;
import com.amritha.polling.dao.UserDao;
import com.amritha.polling.model.PollCategory;
import com.amritha.polling.model.PollQuestions;
import com.amritha.polling.model.User;

@Controller
@RequestMapping("/pollmaster")
public class PollMasterController {
	
 @Autowired
 PollCategoryDao pcDao;
 
@Autowired
PollQuestionsDao pqDao;
@Autowired
UserDao userDao;
@Autowired
PollCountDao pollcountDao;


	@RequestMapping("/polls")
	public String pmpage(Principal user,Model model) {
		List<PollCategory> pc=pcDao.listcategories();
		List<PollCategory> pcactive=new ArrayList<PollCategory>();
		for(PollCategory cy:pc) {
			if(cy.isIsactive()==true)
				pcactive.add(cy);
		}
		
		List<PollCategory> categoriestolist=new ArrayList<PollCategory>();
       for(PollCategory category:pcactive ) {
    	   List<User> us=category.getPollmasters();
    	   for(User pm:us) {
   			if(pm.getUname().equals(user.getName())){
    		  categoriestolist.add(category); 
    	   }
       }
     	}
       model.addAttribute("categories", categoriestolist);
     		return "pmpolls";
     		

}
	
	
	@RequestMapping("/result")
	public String showresult(Model model,Principal user) {
	
User user1=userDao.getuserbyname(user.getName());
		
		List<PollCategory> pc1=user1.getPollcategory();
		
		List<PollCategory> pc=pcDao.listcategories();
		for(PollCategory p:pc) {
			List<User> u=p.getPollmasters();
			if(u.contains(user1)&&(!pc1.contains(p))) {
				pc1.add(p);
			}
		}
		
		model.addAttribute("categories", pc1);
		model.addAttribute("pollcount", pollcountDao.getallpollcounts());
		return "resultpolls";
		
	}
		
}