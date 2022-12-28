package kr.co.saladay.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.admin.model.vo.Delivery;

@Repository
public class DeliveryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 배송현황 조회
	public List<Delivery> adminDelivery() {
		
		return sqlSession.selectList("deliveryMapper.selectDelList");
	}
	
	

}
