package kr.co.saladay.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.saladay.admin.model.dao.MenuManageDAO;
import kr.co.saladay.admin.model.vo.OrderManagePagination;
import kr.co.saladay.admin.model.vo.Pagination;
import kr.co.saladay.menu.model.vo.Menu;
import kr.co.saladay.menu.model.vo.Option;
import kr.co.saladay.review.model.vo.Review;

@Service
public class MenuManageServiceImpl implements MenuManageService {

	@Autowired
	private MenuManageDAO dao;
	
	// 메뉴 조회
	@Override
	public Map<String, Object> selectMenuList(int cp) {
		
		int cnt = dao.getMenuCount();

		Pagination pagination = new Pagination(cnt, cp);
		
		List<Menu> menuList = dao.selectMenuList(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("menuList", menuList);
		
		return map;
	}
	
	
	// 메뉴 삭제
	@Transactional
	@Override
	public void menuDelete(int menuNo) {
		dao.menuDelete(menuNo);
	}
	
	
	//옵션 조회
	@Override
	public Map<String, Object> selectOptionList(int cp) {
		
		int cnt = dao.getOptionCount();
		
		Pagination pagination = new Pagination(cnt, cp);
		
		List<Option> optionList = dao.selectOptionList(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("optionList", optionList);
		
		return map;
	}
	
	
	// 옵션 삭제
	@Transactional
	@Override
	public void optionDelete(int optionNo) {
		dao.optionDelete(optionNo);
	}

}
