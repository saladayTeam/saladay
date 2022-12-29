package kr.co.saladay.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saladay.admin.model.dao.salesManageDAO;

@Service
public class salesManageServiceImpl implements salesManageService {

	@Autowired
	salesManageDAO dao;
	
	// 월별 주문 개수
	@Override
	public List<Integer> monthOrderCount() {
		return dao.monthOrderCount();
	}
	
	// 월별 매출액
	@Override
	public List<Integer> monthOrerPrice() {
		return dao.monthOrderPrice();
	}
	
	// 주무한 패키지 별 개수
	@Override
	public List<Integer> packageOrderCount() {
		return dao.packageOrderCount();
	}
	
	
	// 주문한 메뉴 별 개수
	@Override
	public List<Integer> menuOrderCount() {
		return dao.menuOrderCount();
	}
	
	//월
	@Override
	public List<String> month() {
		return dao.month();
	}
	
	// 패키지 목록
	@Override
	public List<String> packageNameList() {
		return dao.packageNameList();
	}
	
	// 메뉴 목록
	@Override
	public List<String> menuNameList() {
		return dao.menuNameList();
	}
}
