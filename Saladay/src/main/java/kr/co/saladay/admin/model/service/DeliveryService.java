package kr.co.saladay.admin.model.service;

import java.util.List;

import kr.co.saladay.admin.model.vo.DeliveryManage;

public interface DeliveryService {
	
	// 배송현황 조회
	List<DeliveryManage> adminDelivery(int cp);

}
