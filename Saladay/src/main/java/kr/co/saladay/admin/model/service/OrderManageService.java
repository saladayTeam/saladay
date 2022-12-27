package kr.co.saladay.admin.model.service;

import java.util.Map;

public interface OrderManageService {

	/** 전체 주문 목록 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectOrderList(int cp);

}
