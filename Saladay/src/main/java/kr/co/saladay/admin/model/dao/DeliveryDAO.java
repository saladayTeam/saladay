package kr.co.saladay.admin.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

	public int updateDelivery(Map<String, Object> map) {
		return sqlSession.update("deliveryManageMapper.updateDelivery", map);
	}

	/**
	 * 배송일정 상세조회
	 * @param deliveryNo
	 * @return
	 */
//	public List<Object> selectDeliveryDetail(int deliveryNo) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList("deliveryManageMapper.selectDeliveryDetail", deliveryNo);
//	}

	/**
	 * 배송일정 상세조회 모달
	 * @param map
	 * @return
	 */
	public List<DeliveryManage> selectDeliveryDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("deliveryManageMapper.selectDeliveryDetail", map);
	}

	/**
	 * 캘린더 배송상태 수정
	 * @param deliveryNo
	 * @param deliveryCode
	 * @return
	 */
	public int updateCalendar(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("deliveryManageMapper.updateCalendar", map);
	}

	

}
