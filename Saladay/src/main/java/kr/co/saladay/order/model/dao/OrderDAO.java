package kr.co.saladay.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.order.model.vo.Order;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
}
