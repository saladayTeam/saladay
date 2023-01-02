package kr.co.saladay.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.admin.model.vo.DeliveryManage;

@Repository
public class DeliveryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 배송현황 조회
	public List<DeliveryManage> adminDelivery() {
		
		return sqlSession.selectList("deliveryManageMapper.selectDelList");
	}

	public int updateDelivery(int deliveryNo) {
		return sqlSession.update("deliveryManageMapper.updateDelivery", deliveryNo);
	}

	/**
	 * 배송일정 상세조회
	 * @param deliveryNo
	 * @return
	 */
	public DeliveryManage selectDeliveryDetail(int deliveryNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("deliveryManageMapper.selectDeliveryDetail", deliveryNo);
	}
	
	

}
