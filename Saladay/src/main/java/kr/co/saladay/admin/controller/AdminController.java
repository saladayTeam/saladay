package kr.co.saladay.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	@GetMapping("/admin")
	public String admin() {
		return "/admin/admin";
	}
	
	@GetMapping("admin/delivery")
	public String adminDelivery() {
		return "admin/delivery/calendar";
		
	}
}
