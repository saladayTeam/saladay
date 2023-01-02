package kr.co.saladay.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.saladay.admin.model.dao.DeliveryDAO;
import kr.co.saladay.admin.model.vo.DeliveryManage;
import kr.co.saladay.review.model.vo.Review;

@Service
public class DeliveryServiceImpl implements DeliveryService{
	
	@Autowired
	private DeliveryDAO dao;

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

	/**
	 * 배송일정 모달
	 */
	@Override
	public DeliveryManage selectDeliveryDetail(int deliveryNo) {
		return dao.selectDeliveryDetail(deliveryNo);
	}
	
	

	
	
	
	

}
