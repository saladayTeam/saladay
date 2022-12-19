package kr.co.saladay.menu.model.service;

import java.util.List;
import kr.co.saladay.menu.model.vo.Menu;
import kr.co.saladay.menu.model.vo.Option;

public interface MenuService {

	
	// 메뉴(샐러드) 조회 
	List<Menu> selectMenuList();

	// 메인 토핑 조회
	List<Option> selectMainTopping();

	// 서브 토핑 조회
	List<Option> selectSubTopping();

	// 소스 조회
	List<Option> selectSourceList(); 

}
