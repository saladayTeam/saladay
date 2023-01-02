package kr.co.saladay.member.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.saladay.cart.model.service.CartService;
import kr.co.saladay.cart.model.vo.Cart;
import kr.co.saladay.member.model.service.MemberService;
import kr.co.saladay.member.model.vo.Delivery;
import kr.co.saladay.member.model.vo.Member;
import kr.co.saladay.member.model.vo.MyReview;
import kr.co.saladay.member.model.vo.MyReviewOrder;
import kr.co.saladay.member.model.vo.ReviewCheck;
import kr.co.saladay.order.model.vo.Order;
import kr.co.saladay.review.model.vo.Review;

@SessionAttributes({"loginMember","cart", "checkCart"})
@RequestMapping("/member")
@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private CartService cartService;
	
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
			
			// 장바구니 내역 조회
			int checkCart = cartService.checkCart(loginMember.getMemberNo());
			model.addAttribute("checkCart", checkCart);
			
			Cookie cookie = new Cookie("saveId", loginMember.getMemberEmail());			// 쿠키 생성
			
			if(saveId != null) {							// 아이디 저장이 체크되었다면
				cookie.setMaxAge(60 * 60 * 24 * 14);									// 쿠키 생명주기 14일 지정
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
	
	
	/** 닉네임 중복확인
	 * @param memberNickname
	 * @return
	 */
	@ResponseBody 
	@GetMapping("/nicknameDupCheck")
	public int nicknameDupCheck(String memberNickname) {
		int result = service.nicknameDupCheck(memberNickname);
		return result;
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
	

	/** 비밀번호 변경
	 * @param tempMemberNo 비로그인 요청 시
	 * @param loginMember  로그인 요청 시
	 * @param status       로그아웃을 위한 객체
	 * @param inputMember  사용자 입력
	 * @param session      비로그인 요청 시 올려진 세션값 무효화
	 * @param ra           메세지 응답시 필요
	 * @return path 경로로 리다이렉트
	 */
	@PostMapping("/changePw")
	public String changePw(@SessionAttribute(value="tempMemberNo", required=false) String tempMemberNo,
						   @SessionAttribute(value="loginMember", required = false) Member loginMember,
			SessionStatus status, Member member, HttpSession session, RedirectAttributes ra) {
		
		// 로그인 멤버의 회원번호로 먼저 검사
		if(loginMember != null) {									// 로그인 상태에서 요청했을 때 
			member.setMemberNo(loginMember.getMemberNo());
			System.out.println("로그인 요청");
		} else {													// 비로그인 상태에서 요청했을 때 (비밀번호 찾기 후 자동 요청)
			member.setMemberNo(Integer.parseInt(tempMemberNo));
			System.out.println("비로그인 요청");
		}
		
		// 비밀번호 변경 요청 후 결과 반환
		int result = service.changePw(member);
		
		String message = "";
		String path = "";
		if(result > 0) {			// 비밀번호 변경 성공 시 성공 메세지와 함께 로그아웃 후 메인페이지 리다이렉트 
			message = "비밀번호가 변경되었습니다.";
			path = "/";
			status.setComplete();
			session.invalidate();	// 세션 무효화
			
		} else {				// 비밀번호 변경 실패 시 실패 메세지와 함께 비밀번호 변경 페이지 리다이렉트
			message = "비밀번호 변경에 실패하였습니다.";
			path = "/member/changePw";
		}
		ra.addFlashAttribute("message", message);
		return "redirect:" + path;
	}

	
	
	//*****************************************************************************************************************************************************************************
	
	/**마이페이지-내 정보
	 * @return myPage-info.jsp 포워드
	 */
	@GetMapping("/myPage//info")
	public String myInfo() {
		return "member/myPage/myPage-info";
	}
	
	
	/** 회원 정보 수정
	 * @param ra            메세지 출력을 위한 변수
	 * @param inputMember   입력받은 데이터
	 * @param memberAddress 주소 데이터가공을 위한 배열
	 * @param loginMember   현재 로그인중인 회원번호를 얻기위한 변수
	 * @param referer       이전 요청 주소를 얻기위한 변수
	 * @return              성공여부에 따른 메세지와함께 이전요청으로 리다이렉트
	 */
	@PostMapping("/updateInfo")
	public String updateInfo(RedirectAttributes ra, Member inputMember, String[] memberAddress, @SessionAttribute("loginMember") Member loginMember
			, @RequestHeader("referer") String referer) {
		
		String message = "";
		
		// 1. 로그인된 회원 정보에서 회원 번호를 얻어와 inputMember에 저장
		inputMember.setMemberNo(loginMember.getMemberNo());
				
		// 2. inputMember.memberAddress의 값에 따라 변경
		if(inputMember.getMemberAddress().equals(",,")) {
			//주소 미작성
			inputMember.setMemberAddress(null);
		}else {
			String address = String.join(",,", memberAddress);
			inputMember.setMemberAddress(address);
		}
		
		int result = service.updateInfo(inputMember);
		
		if(result > 0) {			// 정보 수정에 성공했으면
			message = "회원 정보가 수정되었습니다.";
			// 현재 로그인멤버에 수정한 회원 정보 동기화
			loginMember.setMemberNickname(inputMember.getMemberNickname());
			loginMember.setMemberTel(inputMember.getMemberTel());
			loginMember.setMemberAddress(inputMember.getMemberAddress());
			
		} else {
			message = "회원 정보 수정에 실패했습니다.";
		}
		
		ra.addFlashAttribute("message", message);
		return "redirect:" + referer;
	}
	
	
	/**마이페이지-회원탈퇴
	 * @return myPage-secession.jsp 포워드
	 */
	@GetMapping("myPage/secession")
	public String secession() {
		return "member/myPage/myPage-secession";
	}
	

	/** 회원 탈퇴
	 * @param loginMember
	 * @param referer
	 * @param ra
	 * @param status
	 * @return 성공시 메인페이지, 실패시 이전페이지 리다이렉트
	 */
	@PostMapping("/secession")
	public String secession(@SessionAttribute Member loginMember, @RequestHeader("referer") String referer,
			RedirectAttributes ra, SessionStatus status) {
		
		String path = "";
		String message = "";
		
		int result = service.secession(loginMember.getMemberNo());
		
		if(result > 0) {		// 회원 탈퇴 성공 시
			// 메인페이지로 리다이렉트
			path = "/";	
			message = "성공적으로 탈퇴되었습니다.";
			status.setComplete();
			
		} else {				// 회원 탈퇴 실패 시
			path = referer;
			message = "관리자는 회원 탈퇴 할 수 없습니다.";
		}
		ra.addFlashAttribute("message", message);
		return "redirect:" + path;
	}
	
	
	
	
	
	/**마이페이지-비밀번호 변경
	 * @return myPage-changePw.jsp 포워드
	 */
	@GetMapping("myPage/myPageChangePw")
	public String myPagePw() {
		return "member/myPage/myPage-changePw";
	}
	
	/** 현재 비밀번호 확인(마이페이지)
	 * @param currentMemberPw
	 * @return 일치:true, 불일치:false
	 */
	@ResponseBody
	@PostMapping("/checkMemberPw")
	public boolean checkMemberPw(String currentMemberPw, @SessionAttribute("loginMember") Member loginMember) {		
		return service.checkMemberPw(currentMemberPw, loginMember.getMemberNo());
	}
	
	
	
	
	/**마이페이지-나의 주문
	 * @return myPage-order.jsp 포워드
	 */
	@GetMapping("myPage/myOrder")
	public String myOrder() {
		return "member/myPage/myPage-myOrder";
	}
	
	
	/** 주문내역 조회
	 * @param loginMember
	 * @param model
	 * @return
	 */
	@GetMapping("myPage/selectMyOrder")
	public String selectMyOrder(@SessionAttribute(value="loginMember",required=true) Member loginMember,
			Model model, @RequestParam(value="cp",required=false, defaultValue="1")int cp) {
		
		int memberNo=loginMember.getMemberNo();
		
		//ArrayList<Order> myOrder= service.selectMyOrder(memberNo);
		
		Map<String,Object>map=service.selectMyOrder(memberNo, cp);
		
		List<Delivery> myDelivery = service.selectMyDelivery(memberNo);
		
		map.put("myDelvery", myDelivery);
		
		model.addAttribute("map",map);
		
		return "member/myPage/myPage-myOrder";
	
	}
	

	
	/**내 주문 취소
	 * @param reviewNo
	 * @return
	 */
	@ResponseBody
	@GetMapping("/myPage/cancelMyOrder")
	public int cancelMyOrder(int orderNo) {
		return service.cancelMyOrder(orderNo);
	}
	
	
	
	
	
	
	
	/**마이페이지-나의 리뷰
	 * @return myPage-review.jsp 포워드
	 */
	@GetMapping("myPage/myReview")
	public String myReview() {
		return "member/myPage/myPage-myReview";
	}
	
	
	/**마이페이지- 내 리뷰 조회
	 * @param loginMember
	 * @return
	 */
	@GetMapping("myPage/selectMyReview")
	public String selectMyReview(@SessionAttribute("loginMember")Member loginMember,
			Model model){
		
		List<MyReview>reviewList = null;	
		List<MyReviewOrder>reviewOrder = null;
		
		try {
			
			reviewList = service.selectMyReview(loginMember.getMemberNo());
			
			reviewOrder = service.selectReviewOrder(loginMember.getMemberNo());
			
			model.addAttribute("reviewList",reviewList);
			model.addAttribute("reviewOrder",reviewOrder);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return "member/myPage/myPage-myReview";
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
