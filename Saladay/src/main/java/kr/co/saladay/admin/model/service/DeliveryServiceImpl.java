package kr.co.saladay.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.saladay.admin.model.dao.DeliveryDAO;
import kr.co.saladay.admin.model.vo.DeliveryManage;
import kr.co.saladay.admin.model.vo.OrderManagePagination;
import kr.co.saladay.review.model.vo.Review;

@Service
public class DeliveryServiceImpl implements DeliveryService{
	
	@Autowired
	private DeliveryDAO dao;
	
	// 배송 현황 목록 조회
	@Override
	public Map<String, Object> selectAdminDelivery(int cp) {
		int deliveryCount = dao.getDeliveryCount();
		
		OrderManagePagination pagination = new OrderManagePagination(deliveryCount, cp);
		
		List<DeliveryManage> deliveryList = dao.adminDelivery(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("deliveryList", deliveryList);
		
		return map;
	}

	// 배송현황 조회
	@Override
	public List<DeliveryManage> adminDelivery(int cp) {
		
		List<DeliveryManage> deliveryList = dao.adminDelivery();
		
		return deliveryList;
		
	}

	// 배송상태 수정
	@Transactional
	@Override
	public int updateDelivery(int deliveryNo) {
		
		return dao.updateDelivery(deliveryNo);
	}

//	/**
//	 * 배송일정 모달
//	 */
//	@Override
//	public List<Object> selectDeliveryDetail(int deliveryNo) {
//		return dao.selectDeliveryDetail(deliveryNo);
//	}


	/**
	 * 배송일정 조회 모달
	 */
	@Override
	public List<DeliveryManage> selectDeliveryDetail(Map<String, Object> map) {
		return dao.selectDeliveryDetail(map);
	}

	/**
	 * 캘린더 일정 수정
	 */
//	@Override
//	public int updateCalendar(int deliveryNo, String deliveryCode) {
//		// TODO Auto-generated method stub
//		return dao.updateCalendar(deliveryNo, deliveryCode);
//		
//		
//	}

	@Override
	public int updateCalendar(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.updateCalendar(map);
	}
	
	
	
	
	


	
	

	
	
	
	

}
