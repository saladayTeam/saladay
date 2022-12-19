package kr.co.saladay.review.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
