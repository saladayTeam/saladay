package kr.co.saladay.review.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.review.model.vo.Pagination;
import kr.co.saladay.review.model.vo.Review;
import kr.co.saladay.review.model.vo.ReviewImage;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 전체 리뷰 수 조회
	 * @return
	 */
	public int getListCount(int reviewRating) {
		return sqlSession.selectOne("reviewMapper.getListCount", reviewRating);
	}

	/** 전체 리뷰 목록 조회
	 * @param pagination
	 * @return
	 */
	public List<Review> selectReviewList(int reviewRating, Pagination pagination) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("reviewMapper.selectReviewList", reviewRating, rowBounds);
	}

	/** 특정 메뉴 리뷰 수 조회
	 * @param menuNo
	 * @return
	 */
	public int getMenuReviewListCount(int menuNo) {
	
		return sqlSession.selectOne("reviewMapper.getMenuReviewListCount", menuNo);
	}

	/** 특정 메뉴 리뷰 목록 조회
	 * @param pagination
	 * @param menuNo
	 * @return
	 */
	public List<Review> selectMenuReviewList(Pagination pagination, int menuNo) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
	
		return sqlSession.selectList("reviewMapper.selectMenuReviewList", menuNo, rowBounds);
	}
	
	/** 특정 회원 리뷰 수 조회
	 * @param memberNo
	 * @return
	 */
	public int getMemberReviewListCount(String memberNickname) {
		return sqlSession.selectOne("reviewMapper.getMemberReviewListCount", memberNickname);
	}

	/** 특정 회원 리뷰 목록 조회
	 * @param pagination
	 * @param memberNo
	 * @return
	 */
	public List<Review> selectMemberReviewList(Pagination pagination, String memberNickname) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
	
		return sqlSession.selectList("reviewMapper.selectMemberReviewList", memberNickname, rowBounds);
	}

	/** 리뷰 상세 조회
	 * @param reviewNo
	 * @return
	 */
	public List<Review> selectReviewDetail(Map<String, Object> map) {
		return sqlSession.selectList("reviewMapper.selectReviewDetail", map);
	}

	/** 좋아요 여부 체크
	 * @param map
	 * @return
	 */
	public int reviewLikeCheck(Map<String, Object> map) {
		return sqlSession.selectOne("reviewMapper.reviewLikeCheck", map);
	}

	/** 좋아요 수 증가
	 * @param paramMap
	 * @return
	 */
	public int reviewLikeUp(Map<String, Object> paramMap) {
		return sqlSession.update("reviewMapper.reviewLikeUp", paramMap);
	}

	/** 좋아요 수 감소
	 * @param paramMap
	 * @return
	 */
	public int reviewLikeDown(Map<String, Object> paramMap) {
		return sqlSession.delete("reviewMapper.reviewLikeDown", paramMap);
	}

	/** 리뷰 삭제
	 * @param reviewNo
	 * @return
	 */
	public int deleteReview(int reviewNo) {
		return sqlSession.update("reviewMapper.deleteReview", reviewNo);
	}

	/** 리뷰 이미지 삭제
	 * @param reviewNo
	 * @return 
	 */
	public int deleteReviewImg(int reviewNo) {
		return sqlSession.delete("reviewMapper.deleteReviewImg", reviewNo);
	}

	/** 리뷰 작성시 보여줄 기본 정보
	 * @param orderMenuNo
	 * @return
	 */
	public Review reviewWriteInfo(int orderMenuNo) {
		return sqlSession.selectOne("reviewMapper.reviewWriteInfo", orderMenuNo);
	}

	/** 리뷰 작성
	 * @param review
	 * @return reviewNo
	 */
	public int reviewWrite(Review review) {
		int result = sqlSession.insert("reviewMapper.reviewWrite", review);
		
		if(result>0) result = review.getReviewNo();
		
		return result;
	}

	
	/** 리뷰 첨부 이미지 삽입(리스트)
	 * @param reviewImageList
	 * @return result
	 */
	public int insertReviewImageList(List<ReviewImage> reviewImageList) {
		return sqlSession.insert("reviewMapper.insertReviewImageList", reviewImageList);
	}

}
