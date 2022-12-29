package kr.co.saladay.admin.model.service;

import java.util.List;

public interface salesManageService {

	// 월별 주문 개수
	List<Integer> monthOrderCount();

	// 월별 매출액
	List<Integer> monthOrerPrice();

	// 주문한 패키지 별 개수
	List<Integer> packageOrderCount();

	// 주문한 메뉴별 개수
	List<Integer> menuOrderCount();

	// 월
	List<String> month();
	
	// 패키지 목록 배열
	List<String> packageNameList();
	
	// 메뉴 목록 배열
	List<String> menuNameList();


}
