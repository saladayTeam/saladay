package kr.co.saladay.review.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.co.saladay.review.model.vo.Review;

public interface ReviewService {

	/** 리뷰 목록 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectReviewList(int cp, int reviewRating);

	/** 특정 메뉴 리뷰 목록 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectMenuReviewList(int cp, int menuNo);

	/** 리뷰 상세 조회
	 * @param reviewNo
	 * @return
	 */
	List<Review> selectReviewDetail(Map<String, Object> map);

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

	/** 리뷰 이미지 삭제
	 * @param reviewNo
	 * @return
	 */
	int deleteReviewImg(int reviewNo);

	/** 리뷰 작성시 보여줄 기본 정보
	 * @param orderMenuNo
	 * @return
	 */
	Review reviewWriteInfo(int orderMenuNo);

	/** 리뷰 작성
	 * @param review
	 * @param imageList
	 * @param webPath
	 * @param folderPath
	 * @return
	 */
	int reviewWrite(Review review, List<MultipartFile> imageList, String webPath, String folderPath) throws IOException;

	/** 특정 회원 리뷰 목록 조회
	 * @param cp
	 * @param memberNo
	 * @return
	 */
	Map<String, Object> selectMemberReviewList(int cp, String memberNickname);

}
