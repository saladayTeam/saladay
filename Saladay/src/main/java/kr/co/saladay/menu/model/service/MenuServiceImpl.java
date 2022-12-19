package kr.co.saladay.menu.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return dao.selectMenuList();
	}


	// 메인 토핑 조회
	@Override
	public List<Option> selectMainTopping() {
		return dao.selectMainTopping();
	}

	// 서브 토핑 조회
	@Override
	public List<Option> selectSubTopping() {
		return dao.selectSubTopping();
	}

	
	// 소스 조회
	@Override
	public List<Option> selectSourceList() {
		return dao.selectSourceList();
	}
	
	
}
