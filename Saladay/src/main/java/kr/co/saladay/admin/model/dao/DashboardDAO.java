package kr.co.saladay.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.admin.model.vo.SalesMenu;

@Repository
public class DashboardDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	// 월별 주문 개수 조회
	public List<Integer> monthOrderCount() {
		return sqlSession.selectList("dashboardMapper.monthOrderCount");
	}

	// 월별 매출액 조회
	public List<Integer> monthOrderPrice() {
		return sqlSession.selectList("dashboardMapper.monthOrderPrice");
	}

	// 패키지 별 판매 개수 조회
	public List<Integer> packageOrderCount() {
		return sqlSession.selectList("dashboardMapper.packageOrderCount");
	}

	// 메뉴 별 판매 개수 조회
	public List<Integer> menuOrderCount() {
		return sqlSession.selectList("dashboardMapper.menuOrderCount");
	}

	// 주문이 발생한 월(month) 목록 조회
	public List<String> month() {
		return sqlSession.selectList("dashboardMapper.month");
	}

	// 판매중인 패키지 목록
	public List<String> packageNameList() {
		return sqlSession.selectList("dashboardMapper.packageNameList");
	}

	// 판매중인 메뉴 목록
	public List<String> menuNameList() {
		return sqlSession.selectList("dashboardMapper.menuNameList");
	}

	// 메뉴 테이블 조회(메뉴별 전월/당월 판매량 및 판매금액)
	public List<SalesMenu> salesMenuList() {
		return sqlSession.selectList("dashboardMapper.salesMenuList");
	}

	// 메뉴 전월 총 판매금액 조회
	public int selectPreMonthMenuSales() {
		return sqlSession.selectOne("dashboardMapper.selectPreMonthMenuSales");
	}

	// 메뉴 당월 총 판매금액 조회
	public int selectCurrentMonthMenuSales() {
		return sqlSession.selectOne("dashboardMapper.selectCurrentMonthMenuSales");
	}
}
