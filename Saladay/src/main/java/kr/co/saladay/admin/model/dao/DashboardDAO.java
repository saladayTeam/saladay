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

	public List<Integer> monthOrderCount() {
		return sqlSession.selectList("dashboardMapper.monthOrderCount");
	}

	public List<Integer> monthOrderPrice() {
		return sqlSession.selectList("dashboardMapper.monthOrderPrice");
	}

	public List<Integer> packageOrderCount() {
		return sqlSession.selectList("dashboardMapper.packageOrderCount");
	}

	public List<Integer> menuOrderCount() {
		return sqlSession.selectList("dashboardMapper.menuOrderCount");
	}

	public List<String> month() {
		return sqlSession.selectList("dashboardMapper.month");
	}

	public List<String> packageNameList() {
		return sqlSession.selectList("dashboardMapper.packageNameList");
	}

	public List<String> menuNameList() {
		return sqlSession.selectList("dashboardMapper.menuNameList");
	}

	public List<SalesMenu> salesMenuList() {
		return sqlSession.selectList("dashboardMapper.salesMenuList");
	}

	public int selectPreMonthMenuSales() {
		return sqlSession.selectOne("dashboardMapper.selectPreMonthMenuSales");
	}

	public int selectCurrentMonthMenuSales() {
		return sqlSession.selectOne("dashboardMapper.selectCurrentMonthMenuSales");
	}
}
