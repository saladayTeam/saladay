package kr.co.saladay.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.review.model.vo.Pagination;
import kr.co.saladay.review.model.vo.Review;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 전체 리뷰 수 조회
	 * @return
	 */
	public int getListCount() {
		return sqlSession.selectOne("reviewMapper.getListCount");
	}

	/** 전체 리뷰 목록 조회
	 * @param pagination
	 * @return
	 */
	public List<Review> selectReviewList(Pagination pagination) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("reviewMapper.selectReviewList", null, rowBounds);
	}

}
