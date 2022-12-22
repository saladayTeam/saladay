package kr.co.saladay.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.saladay.member.model.service.MemberService;
import kr.co.saladay.member.model.vo.Member;

@SessionAttributes({"loginMember","cartPackage"})
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
	
	
	/**로그인
	 * @param member
	 * @param saveId
	 * @param referer
	 * @param resp
	 * @param model
	 * @param ra
	 * @return "redirect:" + path
	 */
	@PostMapping("/login")
	public String login(Member member, String saveId, @RequestHeader("referer") String referer, HttpServletResponse resp, Model model,
			RedirectAttributes ra) {
		String path = "";
		String message = "";
		System.out.println(member);
		System.out.println(referer);
		// 로그인 서비스 호출 후 반환
		Member loginMember = service.login(member);
		

		if(loginMember == null) {							// 로그인 실패 시 로그인 페이지로 리다이렉트
			path = referer;
			message = "회원 정보가 맞지 않습니다.";
			ra.addFlashAttribute("message", message);
		} else {											// 로그인 성공 시 
			
			Cookie cookie = new Cookie("saveId", loginMember.getMemberEmail());			// 쿠키 생성
			
			if(saveId != null) {							// 아이디 저장이 체크되었다면
				cookie.setMaxAge(60 * 60 * 24 * 365);									// 쿠키 생명주기 1년 지정
			} else {
				cookie.setMaxAge(0);													// 쿠기 삭제
			}
			cookie.setPath("/");		// setPath 설정을 하지 않으면 cookie를 생성했던 url범위에서만 쿠키 인식 -> /member 에서만 인식
			resp.addCookie(cookie);
			model.addAttribute("loginMember", loginMember);
			
			path = "/";
		}
		
		return "redirect:" + path;
	}
	
	/**로그아웃
	 * @param status
	 * @return "redirect:/"
	 */
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
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
		
		// 주소가 작성되지 않은 경우 ==> null
		if(member.getMemberAddress().equals(",,")) {
			member.setMemberAddress(null);
		}
				
		// 주소가 작성된 경우 ==> 주소,,주소,,주소
		else {
			member.setMemberAddress( String.join(",,", memberAddress) );
		}
				
		
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

	
	/**	이메일 중복 확인
	 * @param memberEmail
	 * @return result 
	 */
	@ResponseBody
	@GetMapping("/emailDupCheck")
	public int emailDupCheck(String memberEmail) {
		return service.emailDupCheck(memberEmail);
	}
	
	/** 이메일 아이디 찾기 페이지 이동
	 * @return member/findID 포워드
	 */
	@GetMapping("/findID")
	public String findID() {
		return "member/findID";
	}
	
	
	/** 이메일 아이디 찾기
	 * @param inputMember
	 * @param ra
	 * @param referer
	 * @return 결과창 리다이렉트
	 */
	@PostMapping("/findID")
	public String findID(Member member, RedirectAttributes ra, @RequestHeader("referer") String referer) {
		
		
		// service 호출
		Member findMember = service.findID(member);
		
		// 일치하는 정보 있으면 결과창
		if(findMember != null) {							
			ra.addFlashAttribute("result", findMember.getMemberEmail());
		}

		ra.addFlashAttribute("memberName", member.getMemberName());
		
		return "redirect:/member/find-result";
	}
	
	/** 결과 페이지 이동
	 * @return member/result 포워드
	 */
	@GetMapping("/find-result")
	public String findResult() {
		return "member/find-result";
	}
	
	/** 비밀번호 찾기 페이지 이동
	 * @return member/findPw
	 */
	@GetMapping("/findPw")
	public String findPw() {
		return "member/findPw";
	}
	
	/** 비밀번호 찾기
	 * @return 성공 시 비밀번호 변경페이지 리다이렉트, 실패 시 비밀번호 찾기 페이지 리다이렉트
	 */
	@PostMapping("/findPw")
	public String findPw(String memberEmail, RedirectAttributes ra, HttpSession session) {
		
		String path = "";
		// 파라미터로 받은 memberEmail로
		// service.findPw(memberEmail) 호출
		String result = service.findPw(memberEmail);
		
		if(result != null) {
			// 일치하는 회원 정보가 있으면
			// 회원정보 새션에 올리고
			session.setAttribute("tempMemberNo", result);
			session.setAttribute("referer", "findPw");
			// 비밀번호 변경 페이지로 리다이렉트
			path = "/member/changePw";
			
		
		} else {				// 일치하는 회원 정보가 없으면 
			// 메세지와 함께 리다이렉트
			
			ra.addFlashAttribute("message", "일치하는 회원정보가 존재하지않습니다.");
			path = "/member/findPw";
		}
		
		return "redirect:" + path;
	}
	
	/** 비밀번호 찾기 -> 비밀번호 변경 
	 * @return member/changePw 포워드
	 */
	@GetMapping("/changePw")
	public String changePw() {
		
		return "member/changePw";
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
	
	/* 서비스 이용약관
	 * @return TermsOfService.jsp 포워드
	 */
	@GetMapping("/TermsOfService")
	public String TermsOfServicePage() {
		return "common/footerDetail/TermsOfService";
	}
	
	/* 개인정보 처리방침
	 * @return privacyPolicy.jsp 포워드
	 */
	@GetMapping("/privacyPolicy")
	public String privacyPolicyPage() {
		return "common/footerDetail/privacyPolicy";
	}
	
	
}
