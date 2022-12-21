package kr.co.saladay.review.model.service;

import java.util.Map;

public interface ReviewService {

	/** 리뷰 목록 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectReviewList(int cp);

}
