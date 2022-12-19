package kr.co.saladay.menu.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.menu.model.vo.Menu;

@Repository
public class MenuDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 메뉴 목록 조회 화면
	public List<Menu> selectMenuList() {
		return sqlSession.selectList("menuMapper.selectMenuList");
	}

}
