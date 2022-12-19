package kr.co.saladay.menu.model.service;

import java.util.List;
import kr.co.saladay.menu.model.vo.Menu;

public interface MenuService {

	
	// 메뉴 목록 화면
	List<Menu> selectMenuList(); 

}
