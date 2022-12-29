package kr.co.saladay.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class salesManageDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<Integer> monthOrderCount() {
		return sqlSession.selectList("salesManageMapper.monthOrderCount");
	}

	public List<Integer> monthOrderPrice() {
		return sqlSession.selectList("salesManageMapper.monthOrderPrice");
	}

	public List<Integer> packageOrderCount() {
		return sqlSession.selectList("salesManageMapper.packageOrderCount");
	}

	public List<Integer> menuOrderCount() {
		return sqlSession.selectList("salesManageMapper.menuOrderCount");
	}

	public List<String> month() {
		return sqlSession.selectList("salesManageMapper.month");
	}

	public List<String> packageNameList() {
		return sqlSession.selectList("salesManageMapper.packageNameList");
	}

	public List<String> menuNameList() {
		return sqlSession.selectList("salesManageMapper.menuNameList");
	}
}
