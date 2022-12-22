package kr.co.saladay.pay.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import kr.co.saladay.pay.model.dao.OrderDAO;
import kr.co.saladay.pay.model.vo.CartMenu;
import kr.co.saladay.pay.model.vo.Cart;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAO dao;

	// 장바구니 넣기
	@Override
	public int insertCart(Cart cart) {
		
		
		int cartNo = dao.insertCart(cart);
		System.out.println(cart);
		return cartNo;
	}

//	@Override
//	public int insertMenu(PayMenu cartMenu) {
//		// TODO Auto-generated method stub
//		return 0;
//	}

}
