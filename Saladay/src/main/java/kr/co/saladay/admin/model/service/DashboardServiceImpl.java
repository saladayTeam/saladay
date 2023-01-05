package kr.co.saladay.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saladay.admin.model.dao.DashboardDAO;
import kr.co.saladay.admin.model.vo.SalesMenu;

@Service
public class DashboardServiceImpl implements DashboardService {

	@Autowired
	DashboardDAO dao;
	
	// 월별 주문 개수
	@Override
	public List<Integer> monthOrderCount() {
		return dao.monthOrderCount();
	}
	
	// 월별 매출액
	@Override
	public List<Integer> monthOrerPrice() {
		return dao.monthOrderPrice();
	}
	
	// 주무한 패키지 별 개수
	@Override
	public List<Integer> packageOrderCount() {
		return dao.packageOrderCount();
	}
	
	
	// 주문한 메뉴 별 개수
	@Override
	public List<Integer> menuOrderCount() {
		return dao.menuOrderCount();
	}
	
	// 주문이 발생한 월 목록(month)
	@Override
	public List<String> month() {
		return dao.month();
	}
	
	// 패키지 목록
	@Override
	public List<String> packageNameList() {
		return dao.packageNameList();
	}
	
	// 메뉴 목록
	@Override
	public List<String> menuNameList() {
		return dao.menuNameList();
	}
	
	// 메뉴 테이블 조회(메뉴별 전월/당월 판매량 및 판매금액)
	@Override
	public List<SalesMenu> salesMenuList() {
		return dao.salesMenuList();
	}
	
	// 메뉴 전월 총 판매금액
	@Override
	public int selectPreMonthMenuSales() {
		return dao.selectPreMonthMenuSales();
	}
	
	// 메뉴 당월 총 판매금액
	@Override
	public int selectCurrentMonthMenuSales() {
		return dao.selectCurrentMonthMenuSales();
	}
	
}
