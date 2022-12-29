package kr.co.saladay.admin.model.service;

import java.util.List;

public interface salesManageService {

	// 월별 주문 개수
	List<Integer> monthOrderCount();

	// 월별 매출액
	List<Integer> monthOrerPrice();

	// 주문한 패키지 별 개수
	List<Integer> packageCount();

	// 주문한 메뉴별 개수
	List<Integer> menuCount();

}
