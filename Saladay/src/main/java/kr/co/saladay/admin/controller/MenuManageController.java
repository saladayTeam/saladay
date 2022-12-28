package kr.co.saladay.admin.controller;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.saladay.admin.model.service.MenuManageService;


@Controller
public class MenuManageController {
	
	
	@Autowired
	private MenuManageService service;
	
	// 메뉴 관리 
	@GetMapping("/admin/updateMenu")
	public String menuManage(@RequestParam(value="cp", required=false, defaultValue="1") int cp, Model model) {
		
		Map<String, Object> map = service.selectMenuList(cp);
		model.addAttribute("map", map);
		
		return "admin/menuManage/updateMenu";
	}
	
	
	// 메뉴 삭제
	@PostMapping("/admin/deleteMenu")
	public String menuDelete(@RequestParam(value="valueArr[]") String[] valueArr) {
		// System.out.println(valueArr);

		for(int i=0; i < valueArr.length; i++) {
			int menuNo = Integer.parseInt(valueArr[i]);
			service.menuDelete(menuNo);
		}
		
		return "redirect:/admin/updateMenu";
	}
	
	
	
	// 옵션 관리
	@GetMapping("/admin/updateOption")
	public String optionManage(@RequestParam(value="cp", required=false, defaultValue="1") int cp, Model model) {
		
		Map<String, Object> map = service.selectOptionList(cp);
		model.addAttribute("map", map);
		
		return "admin/menuManage/updateOption";
	}
	
	
	// 옵션 삭제
	@PostMapping("/admin/deleteOption")
	public String optionDelete(@RequestParam(value="valueArr[]") String[] valueArr) {
		// System.out.println(valueArr);

		for(int i=0; i < valueArr.length; i++) {
			int optionNo = Integer.parseInt(valueArr[i]);
			service.optionDelete(optionNo);
		}
		
		return "redirect:/admin/updateOption";
	}
	
	
	@GetMapping("/registMenuPopup")
	public String menuPopup() {
		return "/admin/menuManage/registMenuPopup";
	}
	
}
