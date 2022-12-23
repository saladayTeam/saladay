package kr.co.saladay.pay.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saladay.pay.model.dao.OrderDAO;



@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAO dao;


}
