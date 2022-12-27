package kr.co.saladay.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CallendarController {
	
	@GetMapping("admin/delivery")
	public String adminDelivery() {
		return "admin/delivery/calendar";
		
	}
	
	

}
