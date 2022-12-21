package kr.co.saladay.pay.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import kr.co.saladay.pay.model.dao.OrderDAO;
import kr.co.saladay.pay.model.vo.PayPackage;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAO dao;

	@Override
	public int insertCart(PayPackage cart) {
		
		return dao.insertCart(cart);
	}

}
