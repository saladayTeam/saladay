package kr.co.saladay.review.model.service;

import java.util.List;
import java.util.Map;

import kr.co.saladay.review.model.vo.Review;

public interface ReviewService {

	/** 리뷰 목록 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectReviewList(int cp);

	/** 특정 메뉴 리뷰 목록 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectMenuReviewList(int cp, int menuNo);

	/** 리뷰 상세 조회
	 * @param reviewNo
	 * @return
	 */
	List<Review> selectReviewDetail(int reviewNo);

}
