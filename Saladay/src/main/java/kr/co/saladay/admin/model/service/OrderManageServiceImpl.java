package kr.co.saladay.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saladay.admin.model.dao.OrderManageDAO;
import kr.co.saladay.admin.model.vo.OrderManagePagination;
import kr.co.saladay.review.model.vo.Pagination;
import kr.co.saladay.review.model.vo.Review;

@Service
public class OrderManageServiceImpl implements OrderManageService{
	
	@Autowired
	private OrderManageDAO dao;

	// 전체 주문 목록 조회
	@Override
	public Map<String, Object> selectOrderList(int cp) {
		
		int listCount = dao.getListCount();

		OrderManagePagination pagination = new OrderManagePagination(listCount, cp);
		
		List<Review> orderList = dao.selectOrderList(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("orderList", orderList);
		
		return map;
	}

}
