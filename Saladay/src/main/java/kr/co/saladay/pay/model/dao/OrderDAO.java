package kr.co.saladay.pay.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.co.saladay.pay.model.vo.Cart;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 장바구니 담기
	public int insertCart(Cart cart) {
		return sqlSession.insert("orderMapper.insertCart", cart);
	}
	
	
}
