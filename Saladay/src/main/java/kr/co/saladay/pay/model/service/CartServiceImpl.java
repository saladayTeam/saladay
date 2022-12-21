package kr.co.saladay.pay.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saladay.pay.model.dao.CartDAO;
import kr.co.saladay.pay.model.vo.PayMenu;
import kr.co.saladay.pay.model.vo.PayPackage;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO dao;
	
	@Override
	public PayPackage selectCartPackage(int memberNo) {
		
		PayPackage cartPackage=dao.selectCartPackage(memberNo);
				
		return cartPackage;
	}
}
