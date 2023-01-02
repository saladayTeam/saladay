package kr.co.saladay.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.admin.model.vo.DeliveryManage;
import kr.co.saladay.admin.model.vo.OrderManagePagination;

@Repository
public class DeliveryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 전체 배송현황 수 조회
	public int getDeliveryCount() {
		return sqlSession.selectOne("deliveryManageMapper.getDeliveryCount");
	}
	
	// 배송 현황 목록 조회
	public List<DeliveryManage> adminDelivery(OrderManagePagination pagination) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("deliveryManageMapper.selectDelList", null, rowBounds);
	}

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
