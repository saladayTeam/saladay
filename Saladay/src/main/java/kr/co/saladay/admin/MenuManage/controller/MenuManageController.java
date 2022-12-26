package kr.co.saladay.admin.MenuManage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MenuManageController {
	
	@GetMapping("/admin/updateMenu")
	public String menuManage() {
		
		return "admin/menuManage/updateMenu";
	}
}
