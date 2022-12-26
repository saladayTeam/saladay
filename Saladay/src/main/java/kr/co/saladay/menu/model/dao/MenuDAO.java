package kr.co.saladay.menu.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.menu.model.vo.Menu;
import kr.co.saladay.menu.model.vo.Option;

@Repository
public class MenuDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//  메뉴(샐러드) 조회 
	public List<Menu> selectMenuList() {
		return sqlSession.selectList("menuMapper.selectMenuList");
	}

	// 메인 토핑 조회
	public List<Option> selectMainTopping() {
		return sqlSession.selectList("menuMapper.selectMainTopping");
	}

	// 서브 토핑 조회
	public List<Option> selectSubTopping() {
		return sqlSession.selectList("menuMapper.selectSubTopping");
	}
	
	// 소스 조회
	public List<Option> selectSourceList() {
		return sqlSession.selectList("menuMapper.selectSourceList");
	}

	// 패키지 목록 조회
	public List<Map<String, Object>> selectPackageList() {
		return sqlSession.selectList("menuMapper.selectPackageList");
	}

	// 옵션 조회
	public List<Option> selectOptionList() {
		return sqlSession.selectList("menuMapper.selectOptionList");
	}

}
