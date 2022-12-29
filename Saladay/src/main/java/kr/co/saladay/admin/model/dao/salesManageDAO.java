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

	public List<Integer> packageCount() {
		return sqlSession.selectList("salesManageMapper.packageCount");
	}

	public List<Integer> menuCount() {
		return sqlSession.selectList("salesManageMapper.menuCount");
	}
}
