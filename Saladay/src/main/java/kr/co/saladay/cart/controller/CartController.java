package kr.co.saladay.cart.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.saladay.cart.model.service.CartService;
import kr.co.saladay.cart.model.vo.Cart;
import kr.co.saladay.member.model.vo.Member;

@Controller
@RequestMapping("/cart")
@SessionAttributes({"cart", "message"}) 
public class CartController {
	
	@Autowired
	private CartService service;
	
	@GetMapping("")
	public String cart(@SessionAttribute(value="loginMember",required=true) Member loginMember,
			Model model) {
		
		int memberNo=loginMember.getMemberNo();
		
		Cart cart= service.selectCart(memberNo);
				
		model.addAttribute("cart", cart);
		
		return "cart/cart";
	
	}
	
	// 장바구니 내역 삭제
	@GetMapping("/delete")
	public String deleteCart(@SessionAttribute("loginMember") Member loginMember,
			RedirectAttributes ra, @RequestHeader("referer") String referer,
			SessionStatus status) {
		
		String path="";
		String message="";
		
		int result=service.deleteCart(loginMember.getMemberNo());
		
		if(result>0) {
			path="/cart";
			message="장바구니를 삭제했습니다";
		} else {
			path=referer;
			message="장바구니가 비어있습니다";
		}
		
		ra.addFlashAttribute("message", message);
		
		status.setComplete();
		
		return "redirect:"+path;
	}
	
	
	
	// 장바구니 담기
	@PostMapping("")
	public String insertCart(@SessionAttribute("loginMember") Member loginMember
							,Cart cart, 
							RedirectAttributes ra, 
							@RequestHeader("referer") String referer) { 		
		
		// 장바구니 내역 조회
		// int checkCart = service.checkCart(loginMember.getMemberNo());
		// int delete=service.deleteCart(loginMember.getMemberNo());
		
		String message = "";
		String path = "";


		cart.setMemberNo(loginMember.getMemberNo());
		int cartNo = service.insertCart(cart); 
		
	
		if(cartNo > 0) {
			message ="장바구니에 정상적으로 추가되었습니다.";
			path = "/cart";
		} else {
			message = "장바구니에 담은 내용을 다시 확인해주세요.";
			path = referer;
		}
		
		ra.addFlashAttribute("message", message);
	
		return "redirect: " + path;
		
	}
	
	
	
}
