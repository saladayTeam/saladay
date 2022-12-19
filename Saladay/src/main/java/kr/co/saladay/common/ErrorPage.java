package kr.co.saladay.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

//web.xml에서 errorpage 추가

@Controller
public class ErrorPage {

	@GetMapping("/error/404")
	public String error404(){
		
		return "common/errorPage/404";
	}
	
	@GetMapping("/error/500")
	public String error500(){
		
		return "common/errorPage500";
	}
	
}
