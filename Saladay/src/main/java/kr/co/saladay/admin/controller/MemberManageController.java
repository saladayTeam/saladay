package kr.co.saladay.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.saladay.admin.model.service.MemberManageService;

@Controller
public class MemberManageController {

	@Autowired
	private MemberManageService service;
	
	// 회원 관리 페이지
	@GetMapping("/admin/memberManage")
	public String memberManage(@RequestParam(value="cp", required=false, defaultValue="1") int cp, Model model) {
		
		Map<String, Object> map = service.selectMemberList(cp);
		model.addAttribute("map", map);
		
		return "admin/memberManage/memberManage";
	}
	
}
