package kr.co.saladay.pay.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.pay.model.vo.PayMenu;
import kr.co.saladay.pay.model.vo.PayPackage;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public PayPackage selectCartPackage(int memberNo) {
		return sqlSession.selectOne("cartMapper.selectCartPackage", memberNo);
	}
	
}
