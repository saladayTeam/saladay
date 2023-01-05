package kr.co.saladay.cart.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.saladay.cart.model.service.CartService;
import kr.co.saladay.cart.model.vo.Cart;
import kr.co.saladay.member.model.vo.Member;

@Controller
@SessionAttributes({"message"}) 
public class CartController {
	
	@Autowired
	private CartService service;
	
	// 장바구니 조회
	@GetMapping("/cart")
	public String cart(@SessionAttribute(value="loginMember",required=true) Member loginMember,
			Model model, HttpSession session) {
		
		int memberNo=loginMember.getMemberNo();
		// 장바구니 조회
		Cart cart= service.selectCart(memberNo);
		// 조회한 장바구니(cart)를 session에 올리기	
		session.setAttribute("cart", cart);
		
		return "cart/cart";
	}
	
	
	// 장바구니 내역 삭제
	@GetMapping("/cart/delete")
	public String deleteCart(@SessionAttribute("loginMember") Member loginMember,
							RedirectAttributes ra,
							@RequestHeader("referer") String referer,
							HttpSession session) {
		
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
		session.removeAttribute("cart");
		
		
		return "redirect:"+path;
	}
	
	
	
	// 장바구니 담기
	@PostMapping("/cart")
	public String insertCart(@SessionAttribute("loginMember") Member loginMember
							,Cart cart, 
							RedirectAttributes ra, 
							@RequestHeader("referer") String referer,
							SessionStatus status) { 		
		
		// 장바구니 내역 조회
		int checkCart = service.checkCart(loginMember.getMemberNo());
		
		if(checkCart > 0 ) { // 회원의 이전 장바구니 내역이 존재하면 장바구니 내역 삭제
			service.deleteCart(loginMember.getMemberNo());
			status.setComplete();
		} 
		
		cart.setMemberNo(loginMember.getMemberNo());
		
		int cartNo = service.insertCart(cart); 
		
		String message = "";
		String path = "";
	
		
		if(cartNo > 0) {
			message ="장바구니에 정상적으로 추가되었습니다.";
			path = "/cart";
		
		} else {
			message = "장바구니에 담은 내용을 다시 확인해주세요.";
			path = referer;
		}
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:"+path;
	}
	
	
	// 주문하기 버튼
	@PostMapping("/order")
	public String order(@SessionAttribute("loginMember") Member loginMember,
						Cart newCart,
						HttpSession session) { 		

		int memberNo = loginMember.getMemberNo();
		
		// 장바구니 내역 조회
		int checkCart = service.checkCart(loginMember.getMemberNo());
		
		if(checkCart > 0 ) { // 회원의 이전 장바구니 내역이 존재하면 장바구니 내역 삭제
			service.deleteCart(memberNo);

		} 
		
		
		// 새로 장바구니에 담기
		newCart.setMemberNo(memberNo);
		int cartNo = service.insertCart(newCart);
		
		//System.out.println(cartNo);
		newCart.setCartNo(cartNo);
		
		newCart = service.selectCart(memberNo);
		session.setAttribute("cart",newCart);
		
		return "redirect:/order";
		
	}
	
}
