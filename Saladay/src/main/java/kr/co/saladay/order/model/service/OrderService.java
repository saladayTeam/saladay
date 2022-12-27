package kr.co.saladay.order.model.service;

import java.util.Map;

import kr.co.saladay.order.model.vo.Order;

public interface OrderService {

	// 주문 생성
	int insertOrder(Order order);

	// 배송 생성
	int insertDelivery(Map<String, Object> paramMap);


}
