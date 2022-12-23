package kr.co.saladay.pay.controller;

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

import kr.co.saladay.member.model.vo.Member;
import kr.co.saladay.pay.model.service.CartService;
import kr.co.saladay.pay.model.vo.Cart;

@Controller
@RequestMapping("/cart")
@SessionAttributes("cartPackage")
public class CartController {
	
	@Autowired
	private CartService service;
	
	@GetMapping("")
	public String cart(@SessionAttribute(value="loginMember",required=true) Member loginMember,
			Model model) {
		
		int memberNo=loginMember.getMemberNo();
		
		Cart cartPackage=service.selectCartPackage(memberNo);
				
		model.addAttribute("cartPackage", cartPackage);
		
		return "cart/cart";
	
	}
	
	
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
	@PostMapping("/cart")
	public String insertCart(int packageNo, 
							Member loginMember, 
							Model model,
							Cart cart) { 		
		
		
		// 장바구니 번호 생성
		cart.setMemberNo(loginMember.getMemberNo());
		int cartNo = service.insertCart(cart); // 장바구니에 선택한 패키지 저장
		
		
		
		return "cart/cart";
	}
	
	
	
}
