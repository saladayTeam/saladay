package kr.co.saladay.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.member.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**회원가입 DAO
	 * @param member
	 * @return result
	 */
	public int signUp(Member member) {
		
		return sqlSession.insert("memberMapper.signUp", member);
	}

	public int emailDupCheck(String memberEmail) {
		
		return sqlSession.selectOne("memberMapper.emailDupCheck", memberEmail);
	}


		
	
}
