package kr.co.saladay.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//해당 클래스를 필터로 등록 + 필터링 할 내용 작성(매핑) 
@WebFilter(filterName = "loginFilter", // 필터명, 필터가 여러개 존재할 때 순서 지정 시 사용
			urlPatterns= {"/member/myPage/*",  "/order", "/admin/*"}) // 필터링한 요청 주소(패턴 가능)

public class LoginFilter implements Filter {

	public void init(FilterConfig fConfig) throws ServletException {
		// init() : 필터 생성 시 수행
		System.out.println("로그인 필터 생성");
	}

	public void destroy() {
		// destroy() : 서버 실행 중 필터 내용 변경 시 수행 후 init()다시 수행
		System.out.println("로그인 필터 파괴");
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
		// 클라이언트 요청이 되자마자 or 응답이 되기 직전 수행될 필터링
		
		// ServletRequest, ServletResponse은 부모
		// -> 다운캐스팅
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		
		// 로그인 여부 확인 (session내 loginMember 존재 여부)
		HttpSession session = req.getSession();
		if(session.getAttribute("loginMember") == null ) { // 로그인 X
			resp.sendRedirect("/"); // 메인 페이지로 재요청
		
		} else { // 로그인 O
			chain.doFilter(request, response); 
			// chain.doFilter() 연결된 다음 필터로 이동, 없으면 Servlet/JSP로 이동
		}		
	}
}

