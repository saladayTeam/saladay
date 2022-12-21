package kr.co.saladay.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.saladay.member.model.vo.Member;
import kr.co.saladay.pay.model.service.CartService;
import kr.co.saladay.pay.model.vo.PayPackage;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;
	
	@GetMapping("/cart")
	public String cart(@SessionAttribute int cartNo,
			@SessionAttribute(value="loginMember",required=false) Member loginMember) {
		
		// PayPackage cartPackage=service.selectCartPackage(cartNo);
		
		return "cart/cart";
	}
}
