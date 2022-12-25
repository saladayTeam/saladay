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

	// 특정 메뉴 리뷰 목록 조회
	@Override
	public Map<String, Object> selectMenuReviewList(int cp, int menuNo) {
		
		int menuReviewListCount = dao.getMenuReviewListCount(menuNo);

		Pagination pagination = new Pagination(menuReviewListCount, cp);
		
		List<Review> menuReviewList = dao.selectMenuReviewList(pagination, menuNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("menuReviewList", menuReviewList);
		
		return map;
	}

	// 리뷰 상세조회
	
	@Override
	public List<Review> selectReviewDetail(Map<String, Object> map) {
		return dao.selectReviewDetail(map);
	}
	
	// 좋아요 여부 체크
	@Override
	public int reviewLikeCheck(Map<String, Object> map) {
		return dao.reviewLikeCheck(map);
	}

	// 좋아요 수 증가
	@Override
	public int reviewLikeUp(Map<String, Object> paramMap) {
		return dao.reviewLikeUp(paramMap);
	}

	// 좋아요 수 감소
	@Override
	public int reviewLikeDown(Map<String, Object> paramMap) {
		return dao.reviewLikeDown(paramMap);
	}

	// 리뷰 삭제
	@Override
	public int deleteReview(int reviewNo) {
		return dao.deleteReview(reviewNo);
	}


	
	

}
