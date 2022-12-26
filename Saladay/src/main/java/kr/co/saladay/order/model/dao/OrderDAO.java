package kr.co.saladay.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.order.model.vo.Order;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 주문번호 생성 및 주문 생성
	public int insertOrderNo(Order order) {
		return sqlSession.insert("orderMapper.insertOrderNo", order);
		
	}

	
}
