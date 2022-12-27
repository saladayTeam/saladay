package kr.co.saladay.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.saladay.admin.model.service.OrderManageService;

@Controller
public class OrderManageController {
	
	@Autowired
	private OrderManageService service;
	
	// 전체 주문 목록 조회
	@GetMapping("/admin/orderManage")
	public String selectOrderList(Model model,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {
		
		Map<String, Object> map = service.selectOrderList(cp);
		model.addAttribute("map", map);
		
		return "/admin/orderManage/orderManageList";
	}
	
	

}
