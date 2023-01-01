package kr.co.saladay.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.admin.model.vo.DeliveryManage;
import kr.co.saladay.admin.model.vo.OrderManage;
import kr.co.saladay.admin.model.vo.OrderManagePagination;
import kr.co.saladay.review.model.vo.Review;

@Repository
public class OrderManageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	// 전체 주문 수 조회
	public int getListCount(int orderStatus) {
		return sqlSession.selectOne("orderManageMapper.getListCount", orderStatus);
	}

	// 전체 주문 목록 조회
	public List<Review> selectOrderList(int orderStatus, OrderManagePagination pagination) {
		
		//orderStatus 0 == 전체, 1 == 정상, 2 == 취소요청, 3 == 주문취소
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("orderManageMapper.selectOrderList", orderStatus, rowBounds);
	}

	// 주문 상세 조회
	public OrderManage selectOrderDetail(int orderNo) {
		return sqlSession.selectOne("orderManageMapper.selectOrderDetail", orderNo);
	}

	// 주문별 배송정보 조회
	public List<DeliveryManage> selectOrderDetailDelivery(int orderNo) {
		return sqlSession.selectList("orderManageMapper.selectOrderDetailDelivery", orderNo);
	}

	// 주문 취소
	public int withdrawOrder(int orderNo) {
		return sqlSession.update("orderManageMapper.withdrawOrder",orderNo);
	}

	// 주문 취소 요청 철회
	public int withdrawOrderCancle(int orderNo) {
		return sqlSession.update("orderManageMapper.withdrawOrderCancle",orderNo);
	}
}
