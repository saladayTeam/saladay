package kr.co.saladay.admin.model.service;

import java.util.List;
import java.util.Map;

import kr.co.saladay.admin.model.vo.DeliveryManage;
import kr.co.saladay.admin.model.vo.OrderManage;

public interface OrderManageService {

	/** 전체 주문 목록 조회
	 * @param cp
	 * @param orderStatus 
	 * @return map
	 */
	Map<String, Object> selectOrderList(int cp, int orderStatus);

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

	/** 주문 취소
	 * @param orderNo
	 * @return result
	 */
	int withdrawOrder(int orderNo);

	/** 주문 취소 요청 철회
	 * @param orderNo
	 * @return
	 */
	int withdrawOrderCancle(int orderNo);

}
