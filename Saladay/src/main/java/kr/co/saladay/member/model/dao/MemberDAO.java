package kr.co.saladay.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.member.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 로그인 DAO
	 * @param memberEmail
	 * @return loginMember
	 */
	public Member login(String memberEmail) {
		return sqlSession.selectOne("memberMapper.login", memberEmail); 
				
	}	
	
	/**회원가입 DAO
	 * @param member
	 * @return result
	 */
	public int signUp(Member member) {
		
		return sqlSession.insert("memberMapper.signUp", member);
	}

	
	/**이메일 중복체크
	 * @param memberEmail
	 * @return result
	 */
	public int emailDupCheck(String memberEmail) {
		
		return sqlSession.selectOne("memberMapper.emailDupCheck", memberEmail);
	}

	
	/**이메일 아이디 찾기
	 * @param member
	 * @return
	 */
	public Member findID(Member member) {
		
		return sqlSession.selectOne("memberMapper.findID", member);
	}

	
	/**비밀번호 찾기
	 * @param memberEmail
	 * @return 
	 */
	public String findPw(String memberEmail) {
		
		return sqlSession.selectOne("memberMapper.findPw", memberEmail);
	}

	
	/**비밀번호 변경
	 * @param member
	 * @return 
	 */
	public int changePw(Member member) {
		
		return sqlSession.update("memberMapper.changePw", member);
	}


		
	
}
