package kr.co.saladay.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import kr.co.saladay.pay.model.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;

	
	// 주문/결제하기 페이지
	@GetMapping("/order")
	public String orderPage() {

		return "order/order";
	}
}
