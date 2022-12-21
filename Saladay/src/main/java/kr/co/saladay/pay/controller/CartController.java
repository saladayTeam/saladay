package kr.co.saladay.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.saladay.member.model.vo.Member;
import kr.co.saladay.pay.model.service.CartService;
import kr.co.saladay.pay.model.vo.PayPackage;

@Controller
@SessionAttributes("cartPackage")
public class CartController {
	
	@Autowired
	private CartService service;
	
	@GetMapping("/cart")
	public String cart(@SessionAttribute(value="loginMember",required=true) Member loginMember,
			Model model) {
		
		int memberNo=loginMember.getMemberNo();
		
		PayPackage cartPackage=service.selectCartPackage(memberNo);
				
		model.addAttribute("cartPackage", cartPackage);
		
		return "cart/cart";
	
	}
}
