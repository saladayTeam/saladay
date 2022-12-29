package kr.co.saladay.common;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

// 스프링이 만들어 관리하는 예외 처리용 컨트롤러 객체
@ControllerAdvice  
public class ExceptionController {
	
	// 프로젝트 내부에서 발생하는 모든 예외를 처리
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model model) {
		
		// Exception e : 발생한 예외를 전달 받는 매개변수
		e.printStackTrace();
		
		model.addAttribute("errorMessage","서비스 이용 중 문제가 발생했습니다.");
		model.addAttribute("e", e);
		
		return "common/error";
	}

}
