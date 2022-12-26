package kr.co.saladay.admin.MenuManage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MenuManageController {
	
	// 메뉴 관리 
	@GetMapping("/admin/updateMenu")
	public String menuManage() {
		
		return "admin/menuManage/updateMenu";
	}
	
	
	// 옵션 관리
	@GetMapping("/admin/updateOption")
	public String optionManage() {
		
		return "admin/menuManage/updateOption";
	}
	
	
	
}
