package kr.co.saladay.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.admin.model.vo.OrderManagePagination;
import kr.co.saladay.member.model.vo.Member;

@Repository
public class MemberManageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 전체 회원 수 조회
	 * @return cnt
	 */
	public int getMemberCount() {
		return sqlSession.selectOne("memberManageMapper.getMemberCount");
	}

	/** 전체 회원 조회 
	 * @param pagination
	 * @return
	 */
	public List<Member> selectMemberList(OrderManagePagination pagination) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("memberManageMapper.selectMemberList", null, rowBounds);
	}
	
}
