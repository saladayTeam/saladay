package kr.co.saladay.admin.model.service;

import java.util.List;
import java.util.Map;

import kr.co.saladay.admin.model.vo.DeliveryManage;
import kr.co.saladay.admin.model.vo.OrderManage;

public interface OrderManageService {

	/** 전체 주문 목록 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectOrderList(int cp);

	/** 주문 상세 조회
	 * @param orderNo
	 * @return
	 */
	OrderManage selectOrderDetail(int orderNo);

	/** 주문별 배송정보 조회
	 * @param orderNo
	 * @return
	 */
	List<DeliveryManage> selectOrderDetailDelivery(int orderNo);

}
