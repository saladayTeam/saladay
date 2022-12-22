package kr.co.saladay.pay.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import kr.co.saladay.member.model.vo.Member;
import kr.co.saladay.pay.model.service.CartService;
import kr.co.saladay.pay.model.service.OrderService;
import kr.co.saladay.pay.model.vo.PayMenu;
import kr.co.saladay.pay.model.vo.PayOption;
import kr.co.saladay.pay.model.vo.PayPackage;

@SessionAttributes({"loginMember", "message"})
@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	@Autowired
	private CartService cartService;
	
	// 메뉴(샐러드와 옵션) 선택 상세 페이지
	@GetMapping("/menu/selectMenu")
	public String selectMenu() {
		return "menu/selectMenu";
	}
	// @GetMapping("/menu/selectMenu/{packageNo}")
	// public String selectMenu(@PathVariable("packageNo") int packageNo,) {
	//		return "menu/selectMenu";
	// }
	
	
	// 장바구니에 메뉴 넣기
	@PostMapping("/cart")
	public String insertCart(@SessionAttribute("loginMember") Member loginMember,
			Model model, 
			PayPackage cart,
			int packageNo,
			PayMenu cartMenu,
			PayOption cartOption){ 		
	
		
		// 장바구니 번호 생성
		cart.setMemberNo(loginMember.getMemberNo());
		cart.setPackageNo(packageNo);
		// System.out.println(cart);
	
		int cartNo = service.insertCart(cart); // 장바구니에 선택한 패키지 저장
		

		// 생성된 장바구니 번호에 메뉴와 옵션 담기
		if(cartNo > 0 ) {
			cartMenu.setCartNo(cartNo);
			
//			int cartMenuNo = service.insertMenu(cartMenu);
			System.out.println(cartMenu);

		}
		
//		model.addAttribute("cartNo", cartNo);
		
		return "cart/cart";
	}
	

	
	// 주문/결제하기 페이지
	@GetMapping("/order")
	public String orderPage(Member loginMember, Model model) {

		// 로그인 멤버정보를 그대로 객체에 담아야돼.............
		Member orderer;
		
		// 1. 장바구니에 담긴 내용들을 조회해서 주문(order) 테이블에 담기
		int memberNo=loginMember.getMemberNo();
		
		System.out.println(loginMember);
		
		PayPackage cartPackage=cartService.selectCartPackage(memberNo);
					
		model.addAttribute("cartPackage", cartPackage);
			
		return "order/order";
	}
}
