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

	/** 좋아요 여부 체크
	 * @param map
	 * @return
	 */
	int reviewLikeCheck(Map<String, Object> map);

	/** 좋아요 수 증가
	 * @param paramMap
	 * @return
	 */
	int reviewLikeUp(Map<String, Object> paramMap);

	/** 좋아요 수 감소
	 * @param paramMap
	 * @return
	 */
	int reviewLikeDown(Map<String, Object> paramMap);

	/** 리뷰 삭제
	 * @param reviewNo
	 * @return
	 */
	int deleteReview(int reviewNo);

}
