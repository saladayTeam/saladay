package kr.co.saladay.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.saladay.member.model.service.MemberService;

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
