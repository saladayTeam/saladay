package kr.co.saladay.pay.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.saladay.pay.model.dao.CartDAO;
import kr.co.saladay.pay.model.vo.PayMenu;
import kr.co.saladay.pay.model.vo.PayPackage;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO dao;
	
	// 장바구니에 담은 패키지 조회(패키지에 담은 메뉴별 옵션 모두 포함)
	@Override
	public PayPackage selectCartPackage(int memberNo) {
		
		PayPackage cartPackage=dao.selectCartPackage(memberNo);
				
		return cartPackage;
	}
	
	// 장바구니 삭제
	@Transactional
	@Override
	public int deleteCart(int memberNo) {
		return dao.deleteCart(memberNo);
	}
}
