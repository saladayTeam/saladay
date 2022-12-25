package kr.co.saladay.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.saladay.member.model.vo.Member;
import kr.co.saladay.order.model.service.OrderService;

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
