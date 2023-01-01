package kr.co.saladay.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saladay.admin.model.dao.OrderManageDAO;
import kr.co.saladay.admin.model.vo.DeliveryManage;
import kr.co.saladay.admin.model.vo.OrderManage;
import kr.co.saladay.admin.model.vo.OrderManagePagination;
import kr.co.saladay.review.model.vo.Pagination;
import kr.co.saladay.review.model.vo.Review;

@Service
public class OrderManageServiceImpl implements OrderManageService{
	
	@Autowired
	private OrderManageDAO dao;

	// 전체 주문 목록 조회
	@Override
	public Map<String, Object> selectOrderList(int cp, int orderStatus) {
		
		int listCount = dao.getListCount(orderStatus);

		OrderManagePagination pagination = new OrderManagePagination(listCount, cp);
		
		List<Review> orderList = dao.selectOrderList(orderStatus, pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("orderList", orderList);
		
		return map;
	}

	// 주문 상세 조회
	@Override
	public OrderManage selectOrderDetail(int orderNo) {
		return dao.selectOrderDetail(orderNo);
	}

	// 주문별 배송정보 조회
	@Override
	public List<DeliveryManage> selectOrderDetailDelivery(int orderNo) {
		return dao.selectOrderDetailDelivery(orderNo);
	}

	// 주문 취소
	@Override
	public int withdrawOrder(int orderNo) {
		return dao.withdrawOrder(orderNo);
	}
	
	// 주문 취소 요청 철회
	@Override
	public int withdrawOrderCancle(int orderNo) {
		return dao.withdrawOrderCancle(orderNo);
	}

}
