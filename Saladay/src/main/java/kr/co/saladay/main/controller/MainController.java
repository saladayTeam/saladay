package kr.co.saladay.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	/** 메인 페이지
	 * @return main.jsp 포워드
	 */
	@GetMapping("/")
	public String main() {
		return "main";
	}
}
