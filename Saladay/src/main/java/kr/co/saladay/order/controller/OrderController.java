package kr.co.saladay.order.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.saladay.cart.model.service.CartService;
import kr.co.saladay.cart.model.vo.Cart;
import kr.co.saladay.member.model.vo.Member;
import kr.co.saladay.order.model.service.OrderService;
import kr.co.saladay.order.model.vo.Order;

@SessionAttributes("cart")
@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	@Autowired
	private CartService cartService;

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
			@RequestHeader("referer") String referer,
			@RequestParam Map<String, Object> paramMap,
			Model model,
			SessionStatus status) {
		
		System.out.println(paramMap);
		
		order.setCart(cart);
		order.setMemberNo(loginMember.getMemberNo());
		order.setPackageNo(cart.getPackageNo());
		order.setOrderName(loginMember.getMemberName());
		order.setOrderTel(loginMember.getMemberTel());
		order.setOrderAddress(loginMember.getMemberAddress());
		
		String path="";
		String message="";
		
		int orderNo=service.insertOrder(order);
		
		if(orderNo>0) {
			path="/orderView";
		} else {
			path=referer;
			message="결제를 취소했습니다";
		}
		
		model.addAttribute("order", order);
		
		cartService.deleteCart(loginMember.getMemberNo());
		
		status.setComplete();
		
		return "redirect:" + path;
	}
	
}
