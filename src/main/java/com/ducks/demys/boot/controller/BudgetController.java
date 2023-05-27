package com.ducks.demys.boot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ducks.demys.boot.service.BudgetService;
import com.ducks.demys.boot.service.Budget_DetailService;
import com.ducks.demys.boot.service.ProjectsService;
import com.ducks.demys.boot.vo.Budget_Detail;
import com.ducks.demys.boot.vo.Projects;

@Controller
public class BudgetController {
   Budget_DetailService budgetdetailService;
   ProjectsService projectsService;
   
   public BudgetController(BudgetService budgetService, ProjectsService projectsService, Budget_DetailService budgetdetailService) {
      this.budgetdetailService = budgetdetailService;
      this.projectsService = projectsService;
   }
   
   @RequestMapping("budget/budget_go")
   public String showBudgetMain(Model model, int PJ_NUM) {
	  Projects projects = projectsService.getPJByPJ_NUM(PJ_NUM);
	  
	//  List<Budget_Detail> budgetDetailList = budgetdetailService.getBuddtListByBUD_NUM(PJ_NUM);
	  Map<String, Object> map = budgetdetailService.getBuddtCal(PJ_NUM);

	  model.addAttribute("projects",projects);
	  
	  model.addAttribute("BUDDT_TOTAL",map.get("BUDDT_TOTAL"));
	  model.addAttribute("PLUS_COST",map.get("PLUS_COST"));
	  model.addAttribute("PLUS_COST_Per",map.get("PLUS_COST_Per"));
      
	  return "budget/list";
   }

   @RequestMapping("budget/list")
   public void showBudgetList() {}
   
   @RequestMapping("budget/detail_go")
   public String showBudgetDetail(Model model, int PJ_NUM) {
	   Projects projects = projectsService.getPJByPJ_NUM(PJ_NUM);
	  // Budget_Detail budgetDetail = budgetdetailService.getBuddtByBUDDT_NUM(PJ_NUM);
	   List<Budget_Detail> budgetDetailList = budgetdetailService.getBuddtListByBUD_NUM(PJ_NUM);
	   int budgetDetailListCount = budgetdetailService.getBuddtListByBUD_NUMCount(PJ_NUM);
	   Map<String, Object> map = budgetdetailService.getBuddtCal(PJ_NUM);
	   
	   model.addAttribute("projects",projects);
	   model.addAttribute("budgetDetailList",budgetDetailList);
	   model.addAttribute("budgetDetailListCount",budgetDetailListCount);
	   model.addAttribute("BUDDT_TOTAL",map.get("BUDDT_TOTAL"));
	   model.addAttribute("PLUS_COST",map.get("PLUS_COST"));
	   model.addAttribute("PLUS_COST_Per",map.get("PLUS_COST_Per"));
	   
	   return "budget/detail";
   }
   
   @RequestMapping("budget/regist")
   public void showBudgetRegist() {
      
   }
}