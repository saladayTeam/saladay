package kr.co.saladay.pay.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.co.saladay.pay.model.vo.Cart;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
}
