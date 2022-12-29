package kr.co.saladay.admin.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.saladay.admin.model.service.MenuManageService;
import kr.co.saladay.menu.model.vo.Menu;


@Controller
public class MenuManageController {
	
	
	@Autowired
	private MenuManageService service;
	
	// 메뉴 관리 
	@GetMapping("/admin/menuManage")
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
	@GetMapping("/admin/optionManage")
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
	
	
	// 메뉴 등록 팝업창
	@GetMapping("/admin/regist/menu")
	public String menuPopup() {
		return "/admin/menuManage/registMenuPopup";
	}
	
	
	// 새 메뉴 등록
	@PostMapping("/admin/regist/menu")
	public String registMenu(@RequestParam(value="inputMenuImg", required = false) MultipartFile inputMenuImg, // 업로드 된 메뉴 이미지
							Menu newMenu, // 메뉴
							RedirectAttributes ra, // 메세지 전달용
							HttpServletRequest req, // 저장할 서버 경로
							HttpServletResponse resp
							) throws Exception {
	
		
		// 업로드 된 파일의 서버 내부 경로 준비
		String webPath = "/resources/images/menu/salad/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		int result = service.registMenu(newMenu, inputMenuImg, webPath, folderPath);
		
		if (result > 0) {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>window.close(); opener.location.reload();</script>");
			out.flush(); 
		}

		return null;
	}
	
}
