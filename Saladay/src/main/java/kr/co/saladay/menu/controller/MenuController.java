package kr.co.saladay.menu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.saladay.menu.model.service.MenuService;
import kr.co.saladay.menu.model.vo.Menu;

@Controller
public class MenuController {

	@Autowired
	private MenuService service;
	
	// 메뉴 목록 화면
	@GetMapping("/menu/menuList")
	public String menuList(Model model) {
		List<Menu> menuList = service.selectMenuList();
		model.addAttribute("menuList", menuList);
		return "menu/menuList";
	}
	
	
	// 메뉴(샐러드와 옵션) 선택 상세 페이지
	@GetMapping("/menu/selectMenu")
	public String selectMenu() {
		return "menu/selectMenu";
	}
}
