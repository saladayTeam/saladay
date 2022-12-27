package kr.co.saladay.order.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.cart.model.vo.CartMenu;
import kr.co.saladay.cart.model.vo.CartOption;
import kr.co.saladay.order.model.vo.Order;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 주문번호 생성 및 주문 생성
	public int insertOrderNo(Order order) {
		return sqlSession.insert("orderMapper.insertOrderNo", order);
		
	}

	// 주문 별 메뉴 담기
	public int insertOrderMenuNo(CartMenu orderMenu) {
		return sqlSession.insert("orderMapper.insertOrderMenuNo", orderMenu);
	}

	// 주문한 메뉴별 옵션 담기
	public int insertorderMenuOption(CartOption orderOption) {
		return sqlSession.insert("orderMapper.insertOrderMenuOption", orderOption);
	}

	public int insertDelivery(Map<String, Object> paramMap) {
		return sqlSession.insert("orderMapper.insertDelivery", paramMap);
	}

	
	
}
