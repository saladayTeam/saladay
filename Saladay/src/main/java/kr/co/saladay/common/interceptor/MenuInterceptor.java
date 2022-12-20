package kr.co.saladay.common.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.co.saladay.menu.model.service.MenuService;
import kr.co.saladay.menu.model.vo.Menu;
import kr.co.saladay.menu.model.vo.Option;

public class MenuInterceptor implements HandlerInterceptor {

	@Autowired
	private MenuService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 전처리 : 컨트롤러 호출 전에 수행
		// application scope에 찾으려는 값이 확인하고 없는 경우 DB에서 조회하여 세팅
		
		ServletContext application = request.getSession().getServletContext();
		
		// 메뉴(샐러드) 조회 
		if( application.getAttribute("menuList") == null) {
			List<Menu> menuList = service.selectMenuList();
			// applicatin scope에 세팅
			application.setAttribute("menuList", menuList);
		}
		
		
		// 메인 토핑 조회
		if( application.getAttribute("mainTopping") == null) {
			List<Option> mainTopping = service.selectMainTopping();
			application.setAttribute("mainTopping", mainTopping);
		}
		
		// 서브 토핑 조회
		if( application.getAttribute("subTopping") == null) {
			List<Option> subTopping = service.selectSubTopping();
			application.setAttribute("subTopping", subTopping);
		}
		
		// 소스 조회
		if( application.getAttribute("sourceList") == null) {
			List<Option> sourceList = service.selectSourceList();
			application.setAttribute("sourceList", sourceList);
		}
		
		// 패키지 조회
		if( application.getAttribute("packageList") == null) {
			List<Map<String, Object>> packageList = service.selectPackageList();
			application.setAttribute("packageList", packageList);
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		// postHandle(후 처리) : 컨트롤러의 리턴값을 반환 받고 수행
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable Exception ex) throws Exception {
		// afterCompletion(뷰 처리 후) 
		// - 모든 뷰에서 최종 결과를 생성하는 일을 포함한 모든 작업이 완료된 후 수행
		// 	 (forward를 통해 응답화면 생성 완료된 후 수행)
		// - 요청 처리 중에 사용한 자원을 반환(.close())하는데 많이 사용
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

	
}
