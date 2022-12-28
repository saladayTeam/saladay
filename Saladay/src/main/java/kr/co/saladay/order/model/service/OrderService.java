package kr.co.saladay.order.model.service;

import java.util.Map;

import kr.co.saladay.order.model.vo.Order;
import kr.co.saladay.order.model.vo.OrderDelivery;

public interface OrderService {

	// 주문 생성
	int insertOrder(Order order);

	// 배송 생성
	int insertDelivery(Order order, OrderDelivery delivery);


}
