package kr.co.saladay.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderManageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
