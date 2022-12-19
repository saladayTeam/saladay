package kr.co.saladay.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.saladay.member.model.service.MemberService;
import kr.co.saladay.member.model.vo.Member;

@RequestMapping("/member")
@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	/**로그인 페이지
	 * @return login.jsp 포워드
	 */
	@GetMapping("/login")
	public String loginPage() {
		return "member/login";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**회원 가입 페이지
	 * @return signUp.jsp 포워드
	 */
	@GetMapping("/signUp")
	public String signUpPage() {
		return "member/signUp";
	}
	

	/** 회원가입
	 * @return / 메인페이지 리다이렉트
	 */
	@PostMapping("/signUp")
	public String signUp(Member member, String[] memberAddress, 
		RedirectAttributes ra, @RequestHeader("referer") String referer) {
			
		String path = "";
		String message = "";
		
		String combineMemberAddress = String.join(",," ,memberAddress);
		
		member.setMemberAddress(combineMemberAddress);
		
		int result = service.signUp(member);
		
		if(result > 0) {				// 회원 가입 성공 시 메인페이지 리다이렉트
			path = "/";
			message = "회원가입 성공";
		} else {
			path = referer;
			message = "회원가입 실패";
		}
		
		// 회원 가입 실패 시 현재 페이지 리다이렉트
		ra.addFlashAttribute("message", message);
		return "redirect:" + path;
	}

	
	
	
	
	
	
	
	
	
	
	/**마이페이지-내 정보
	 * @return myPage-info.jsp 포워드
	 */
	@GetMapping("/info")
	public String myInfo() {
		return "member/myPage-info";
	}
	
	
	/**마이페이지-회원탈퇴
	 * @return myPage-secession.jsp 포워드
	 */
	@GetMapping("/secession")
	public String secession() {
		return "member/myPage-secession";
	}
	
	
	
}
