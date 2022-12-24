package kr.co.saladay.order.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saladay.order.model.dao.OrderDAO;



@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAO dao;


}
