package kr.co.saladay.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.saladay.member.model.vo.Member;
import kr.co.saladay.pay.model.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	// 메뉴(샐러드와 옵션) 선택 상세 페이지
	@GetMapping("/menu/selectMenu")
	public String selectMenu() {
		return "menu/selectMenu";
	}
	

	@GetMapping("/order")
	public String orderPage(@SessionAttribute("loginMember") Member loginMember
							, Model model) {
		
		// 회원의 정보 조회
		
		// 장바구니에 담긴 내용 조회
		
		return "order/order";
	}
}
