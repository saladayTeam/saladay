package kr.co.saladay.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saladay.admin.model.dao.DeliveryDAO;
import kr.co.saladay.admin.model.vo.Delivery;

@Service
public class DeliveryServiceImpl implements DeliveryService{
	
	@Autowired
	private DeliveryDAO dao;

	// 배송현황 조회
	@Override
	public List<Delivery> adminDelivery() {
		return dao.adminDelivery();
	}
	
	
	
	

}
