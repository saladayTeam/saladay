package kr.co.saladay.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.saladay.cart.model.vo.Cart;
import kr.co.saladay.member.model.vo.Member;
import kr.co.saladay.order.model.service.OrderService;
import kr.co.saladay.order.model.vo.Order;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;

	// 주문/결제하기 페이지
	@GetMapping("/order")
	public String order() {

		return "order/order";
	}
	
	@GetMapping("/orderView")
	public String orderView() {
		return "order/orderView";
	}
	
	@PostMapping("/orderView")
	public String orderView(Order order,
			@SessionAttribute("loginMember") Member loginMember,
			@SessionAttribute("cart") Cart cart,
			@RequestHeader("referer") String referer) {
		
		order.setCart(cart);
		order.setMemberNo(loginMember.getMemberNo());
		order.setPackageNo(cart.getPackageNo());
		
		String path="";
		
		int orderNo=service.insertOrder(order);
		
//		if(orderNo>0) {
//			path="";
//		} else {
//			path=referer;
//		}
		
		return "redirect:" + path;
	}
	
}
