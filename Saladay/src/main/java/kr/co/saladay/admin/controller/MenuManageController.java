package kr.co.saladay.admin.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.saladay.admin.model.service.MenuManageService;
import kr.co.saladay.common.Util;
import kr.co.saladay.menu.model.service.MenuService;
import kr.co.saladay.menu.model.vo.Menu;
import kr.co.saladay.menu.model.vo.Option;


@Controller
public class MenuManageController {
	
	
	@Autowired
	private MenuManageService service;
	
	@Autowired
	private MenuService menuService;
	
	// 메뉴 관리 
	@GetMapping("/admin/menuManage")
	public String menuManage(@RequestParam(value="cp", required=false, defaultValue="1") int cp, Model model) {
		
		Map<String, Object> map = service.selectMenuList(cp);
		model.addAttribute("map", map);
		
		return "admin/menuManage/updateMenu";
	}
	
	
	// 메뉴 삭제
	@PostMapping("/admin/deleteMenu")
	public String menuDelete(@RequestParam(value="valueArr[]") String[] valueArr, HttpServletRequest req ) {
		// System.out.println(valueArr);
		
		ServletContext application = req.getSession().getServletContext();
		
		for(int i=0; i < valueArr.length; i++) {
			int menuNo = Integer.parseInt(valueArr[i]);
			service.menuDelete(menuNo);
		}
		
		List<Menu> menuList = menuService.selectMenuList();
		application.setAttribute("menuList", menuList);
		
		return "redirect:/admin/menuManage";
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
	public String optionDelete(@RequestParam(value="valueArr[]") String[] valueArr, HttpServletRequest req) {
		// System.out.println(valueArr);
		
		ServletContext application = req.getSession().getServletContext();
		
		for(int i=0; i < valueArr.length; i++) {
			int optionNo = Integer.parseInt(valueArr[i]);
			service.optionDelete(optionNo);
		}
		
		List<Option> optionList = menuService.selectOptionList();
		application.setAttribute("optionList", optionList);

		return "redirect:/admin/optionManage";
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
	
		
		ServletContext application = req.getSession().getServletContext();

		// 업로드 된 파일의 서버 내부 경로 준비
		String webPath = "/resources/images/menu/salad/";
		String filePath = application.getRealPath(webPath);
		
		int result = service.registMenu(newMenu, inputMenuImg, webPath, filePath);
		
		if (result > 0) {
			
			// application scope에 추가
			List<Menu> menuList = (List<Menu>)application.getAttribute("menuList");
			menuList.add(newMenu);
			
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script> alert('메뉴가 정상적으로 등록되었습니다.'); window.close(); opener.location.reload(); </script>");
			out.flush(); 
		}

		return null;
	}
	
	
	// 옵션 등록 팝업창
	@GetMapping("/admin/regist/option")
	public String optionPopup() {
		return "/admin/menuManage/registOptionPopup";
	}
	
	
	// 새 옵션 등록
	@PostMapping("/admin/regist/option")
	public String registOption(@RequestParam(value="inputOptionImg", required = false) MultipartFile inputOptionImg, // 업로드 된 옵션 이미지
							Option newOption, // 옵션
							RedirectAttributes ra, // 메세지 전달용
							HttpServletRequest req, // 저장할 서버 경로
							HttpServletResponse resp
							) throws Exception {
	
		
		ServletContext application = req.getSession().getServletContext();

		// 업로드 된 파일의 서버 내부 경로 준비
		String webPath = "/resources/images/menu/topping/";
		String filePath = application.getRealPath(webPath);
		
		int result = service.registOption(newOption, inputOptionImg, webPath, filePath);
		
		if (result > 0) {
			
			// application scope에 추가
			List<Option> optionList = (List<Option>)application.getAttribute("optionList");
			optionList.add(newOption);
			
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script> alert('옵션이 정상적으로 추가되었습니다.'); window.close(); opener.location.reload(); </script>");
			out.flush(); 
		}

		return null;
	}
	
	
	// 메뉴 수정 
	@GetMapping("/admin/menu/update")
	public String updateMenu(@RequestParam(value="menuNo", required=false) int menuNo, Model model) {
		
		// System.out.println(menuNo);
		
		// 특정 메뉴 조회
		Menu menu = service.selectMenu(menuNo);
		
		// 개행 문자 처리 해제
		menu.setMenuContent(Util.newLineClear(menu.getMenuContent()));
		model.addAttribute("menu", menu);
		
		return "/admin/menuManage/updateMenuPopup";
	}
	
	
	// 메뉴 수정하기
	@PostMapping("/admin/menu/update")
	public String updateMenu(
							@RequestParam(value="inputMenuImg", required = false) MultipartFile inputMenuImg, // 업로드 된 메뉴 이미지
							Menu newMenu, // 메뉴
							RedirectAttributes ra, // 메세지 전달용
							HttpServletRequest req, // 저장할 서버 경로
							HttpServletResponse resp) throws Exception {


		
		newMenu.setMenuNo(newMenu.getMenuNo());
		// System.out.println(newMenu);
		
		ServletContext application = req.getSession().getServletContext();
		
		// 업로드 된 파일의 서버 내부 경로 준비
		String webPath = "/resources/images/menu/salad/";
		String filePath = application.getRealPath(webPath);
		
		// 메뉴 수정하기
		int result = service.updateMenu(newMenu, inputMenuImg, webPath, filePath);
		
		if (result > 0) {
		
			List<Menu> menuList = menuService.selectMenuList();
			application.setAttribute("menuList", menuList);
			
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script> alert('메뉴가 정상적으로 수정되었습니다.'); window.close(); opener.location.reload(); </script>");
			out.flush(); 
			}
			
			return null;
		}
	
	
}
