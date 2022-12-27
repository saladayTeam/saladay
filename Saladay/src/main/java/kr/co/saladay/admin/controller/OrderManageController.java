package kr.co.saladay.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.saladay.admin.model.service.OrderManageService;

@Controller
public class OrderManageController {
	
	@Autowired
	private OrderManageService service;
	
	// 전체 주문 목록 조회
	@GetMapping("/admin/orderManage")
	public String selectOrderList() {
		
		return "/admin/orderManage/orderManageList";
	}
	
	

}
