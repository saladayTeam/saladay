package kr.co.saladay.admin.model.service;

import java.util.List;

import kr.co.saladay.admin.model.vo.DeliveryManage;

public interface DeliveryService {
	
	// 배송현황 조회
	List<DeliveryManage> adminDelivery(int cp);

	// 배송상태 수정
	int updateDelivery(int deliveryNo);

	/** 배송일정 모달
	 * @param deliveryNo
	 * @return
	 */
	DeliveryManage selectDeliveryDetail(int deliveryNo);


}
