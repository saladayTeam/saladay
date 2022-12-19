package kr.co.saladay.menu.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saladay.menu.model.dao.MenuDAO;
import kr.co.saladay.menu.model.vo.Menu;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDAO dao;

	
	// 메뉴 목록 화면
	@Override
	public List<Menu> selectMenuList() {
		return dao.selectMenuList();
	}
	
	
}
