package kr.co.saladay.menu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saladay.common.Util;
import kr.co.saladay.menu.model.dao.MenuDAO;
import kr.co.saladay.menu.model.vo.Menu;
import kr.co.saladay.menu.model.vo.Option;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDAO dao;

	
	// 메뉴(샐러드) 조회 
	@Override
	public List<Menu> selectMenuList() {
		
		// menuList 조회
		List<Menu> menuList = dao.selectMenuList();
		
		// 조회된 menuList내 메뉴 설명 개행 처리 
		for(Menu menu: menuList) {
			menu.setMenuContent(Util.newLineHandling(menu.getMenuContent()));
		}
		
		return menuList; 
	}


	// 메인 토핑 조회
//	@Override
//	public List<Option> selectMainTopping() {
//		return dao.selectMainTopping();
//	}

	// 서브 토핑 조회
//	@Override
//	public List<Option> selectSubTopping() {
//		return dao.selectSubTopping();
//	}

	
	// 소스 조회
//	@Override
//	public List<Option> selectSourceList() {
//		return dao.selectSourceList();
//	}

	// 패키지 목록 조회
	@Override
	public List<Map<String, Object>> selectPackageList() {
		return dao.selectPackageList();
	}
	
	// 옵션 전부 조회
	@Override
	public List<Option> selectOptionList() {
		return dao.selectOptionList();
	}
	
	// DB에서 Menu테이블의 모든 이미지명 조회
	@Override
	public List<String> selectMenuImageList() {
		return dao.selectMenuImageList();
	}
	
	// DB에서 Option테이블의 모든 이미지명 조회
	@Override
	public List<String> selectOptionImageList() {
		return dao.selectOptionImageList();
	}
	
	
	
}
