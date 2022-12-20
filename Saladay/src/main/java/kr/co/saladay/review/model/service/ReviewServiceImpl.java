package kr.co.saladay.review.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saladay.review.model.dao.ReviewDAO;
import kr.co.saladay.review.model.vo.Pagination;
import kr.co.saladay.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO dao;

	// 리뷰 목록 조회
	@Override
	public Map<String, Object> selectReviewList(int cp) {
		
		int listCount = dao.getListCount();

		Pagination pagination = new Pagination(listCount, cp);
		
		List<Review> reviewList = dao.selectReviewList(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("reviewList", reviewList);
		
		return map;
	}
	

}
