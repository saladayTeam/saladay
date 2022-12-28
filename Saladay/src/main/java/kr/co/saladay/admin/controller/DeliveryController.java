package kr.co.saladay.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.saladay.admin.model.service.DeliveryService;
import kr.co.saladay.admin.model.vo.Delivery;

@Controller
public class DeliveryController {
	
	@Autowired
	private DeliveryService service;
	
	@GetMapping("/admin/delivery")
	public String adminDelivery() {
		
		                                             List<Delivery> map = service.adminDelivery();
//		model.addAttribute("map", map);
		
		
		
		return "/admin/delivery/delivery";
		
	}
	
	

}
