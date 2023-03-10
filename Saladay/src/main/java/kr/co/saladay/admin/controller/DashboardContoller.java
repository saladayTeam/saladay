package kr.co.saladay.admin.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.saladay.admin.model.service.DashboardService;
import kr.co.saladay.admin.model.vo.SalesMenu;
import kr.co.saladay.menu.model.vo.Menu;

@RequestMapping("/admin")
@Controller
public class DashboardContoller {
	
	@Autowired
	DashboardService service;

	@GetMapping("/dashboard")
	public String sales(Model model, HttpServletRequest req) {
		
		// 월별 주문 개수
		List<Integer> monthOrderCount=service.monthOrderCount();
		
		// 월별 매출액
		List<Integer> monthOrderPrice=service.monthOrerPrice();
		
		// 패키지 별 판매 개수
		List<Integer> packageOrderCount=service.packageOrderCount();
		
		// 메뉴 별 판매 개수
		List<Integer> menuOrderCount=service.menuOrderCount();
		
		// 주문이 발생한 월
		List<String> month=service.month();
		
		// 패키지 목록
		List<String> packageNameList=service.packageNameList();
		
		// 메뉴 목록
		List<String> menuNameList=service.menuNameList();
		
		// 대시보드 메뉴 테이블 조회
		List<SalesMenu> salesMenuList=service.salesMenuList();
		
		// 전월 메뉴 총 판매금액
		int preMonthMenuSales=service.selectPreMonthMenuSales();
		
		// 당월 메뉴 총 판매금액
		int currentMonthMenuSales=service.selectCurrentMonthMenuSales();
		
		
		for(SalesMenu salesMenu:salesMenuList) {
			salesMenu.setPreMonthMenuSales(preMonthMenuSales);
			salesMenu.setCurrentMonthMenuSales(currentMonthMenuSales);
			
			int preMonthSales=salesMenu.getPreMonthSales();
			int currentMonthSales=salesMenu.getCurrentMonthSales();
			
			// 분모가 0일때 예외 제거 -> 증감율 계산
			if(preMonthSales!=0) {
				double changeRate=((((double)currentMonthSales-(double)preMonthSales)/preMonthSales)*100);
				changeRate = Math.round(changeRate * 10.0)/ 10.0;
				salesMenu.setChangeRate(changeRate);				
			} else {
				salesMenu.setChangeRate(0);
			}

			// 분모가 0일때 예외 제거 -> 매출비중 계산
			if(currentMonthMenuSales!=0) {
				double percentageOfSales=(((double)salesMenu.getCurrentMonthSales()/currentMonthMenuSales)*100);
				percentageOfSales =  Math.round( percentageOfSales * 10.0 ) / 10.0;
				salesMenu.setPercentageOfSales(percentageOfSales);        		
			} else {
				salesMenu.setPercentageOfSales(0);
			}
			
		}
		
		// 조회한 List를 javaScript Array로 변환하기위해 JSON으로 변환해서 model로 전달 
		model.addAttribute("monthOrderCount", new Gson().toJson(monthOrderCount));
		
		model.addAttribute("monthOrderPrice", new Gson().toJson(monthOrderPrice));
		model.addAttribute("monthOrderPrice", monthOrderPrice);
		
		model.addAttribute("packageOrderCount", new Gson().toJson(packageOrderCount));
		model.addAttribute("menuOrderCount", new Gson().toJson(menuOrderCount));
		
		model.addAttribute("month", new Gson().toJson(month));
		model.addAttribute("packageNameList", new Gson().toJson(packageNameList));
		model.addAttribute("menuNameList", new Gson().toJson(menuNameList));
		
		model.addAttribute("salesMenuList", salesMenuList);
		
		return "/admin/dashboard/dashboard";
	}
	
}