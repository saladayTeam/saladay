package kr.co.saladay.pay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.saladay.member.model.vo.Member;

@Controller
public class OrderController {

	@GetMapping("/order")
	public String orderPage(@SessionAttribute("loginMember") Member loginMember
							, Model model) {
		
		// 회원의 정보 조회
		
		// 장바구니에 담긴 내용 조회
		
		return "order/order";
	}
}
