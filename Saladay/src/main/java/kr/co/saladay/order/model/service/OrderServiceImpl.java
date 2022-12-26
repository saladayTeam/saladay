package kr.co.saladay.order.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saladay.order.model.dao.OrderDAO;
import kr.co.saladay.order.model.vo.Order;



@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAO dao;
	
	@Override
	public int insertOrder(Order order) {
		
		int orderNo=dao.insertOrderNo(order);
		
		
		
		return 0;
	}


}
