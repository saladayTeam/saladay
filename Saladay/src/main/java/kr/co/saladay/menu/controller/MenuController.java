package kr.co.saladay.menu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import kr.co.saladay.menu.model.service.MenuService;
import kr.co.saladay.menu.model.vo.Option;
@Controller
public class MenuController {

	@Autowired
	private MenuService service;
	
	
	// 메뉴(샐러드) 조회 
	@GetMapping("/menu/menuList")
	public String menuList() {
		return "menu/menuList";
	}
	
	// 메인 토핑 조회
	@GetMapping("/menu/mainTopping")
	public String mainToppingList() {
		return "menu/mainToppingList";
	}
	
	// 서브 토핑 조회
	@GetMapping("/menu/subTopping")
	public String subToppingList() {
		return "menu/subToppingList";
	}
	
	// 소스 조회
	@GetMapping("/menu/sourceList")
	public String sourceList() {
		return "menu/sourceList";
	}
	
	// 메뉴(샐러드와 옵션) 선택 상세 페이지
	@GetMapping("/menu/selectMenu")
	public String selectMenu() {
		return "menu/selectMenu";
	}
	
	// 1week 버튼
	@GetMapping("/menu/packageList")
	public String packageList() {
		return "menu/packageList";
	}
	
	// 2week 버튼
	@GetMapping("/menu/packageList2")
	public String packageList2() {
		return "menu/packageList2";
	}
}
