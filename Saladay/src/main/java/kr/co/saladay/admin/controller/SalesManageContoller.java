package kr.co.saladay.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.saladay.admin.model.service.salesManageService;

@RequestMapping("/admin")
@Controller
public class SalesManageContoller {
	
	@Autowired
	salesManageService service;

	@GetMapping("/salesManage")
	public String sales(Model model) {
		
		List<Integer> monthOrderCount=service.monthOrderCount();
		
		List<Integer> monthOrderPrice=service.monthOrerPrice();
		
		List<Integer> packageCount=service.packageCount();
		
		List<Integer> menuCount=service.menuCount();
		
		model.addAttribute("monthOrderCount", new Gson().toJson(monthOrderCount));
		model.addAttribute("monthOrderPrice", new Gson().toJson(monthOrderPrice));
		model.addAttribute("packageCount", new Gson().toJson(packageCount));
		model.addAttribute("menuCount", new Gson().toJson(menuCount));
		
		return "/admin/salesManage/salesManage";
	}
	
}