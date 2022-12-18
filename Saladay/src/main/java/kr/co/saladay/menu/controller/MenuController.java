package kr.co.saladay.menu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MenuController {

	
	// 메뉴(샐러드와 옵션) 선택 상세 페이지
	@GetMapping("/menu/selectMenu")
	public String selectMenu() {
		return "menu/selectMenu";
	}
}
