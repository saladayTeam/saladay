package kr.co.saladay.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.admin.model.vo.OrderManagePagination;
import kr.co.saladay.review.model.vo.Review;

@Repository
public class OrderManageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("orderManageMapper.getListCount");
	}

	public List<Review> selectOrderList(OrderManagePagination pagination) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("orderManageMapper.selectOrderList", null, rowBounds);
	}
}
