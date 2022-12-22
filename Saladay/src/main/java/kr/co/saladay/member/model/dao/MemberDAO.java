package kr.co.saladay.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.member.model.vo.Member;
import kr.co.saladay.review.model.vo.Review;

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

	/**회원 정보 수정 DAO(닉네임, 전화번호, 주소)
	 * @param inputMember
	 * @return 
	 */
	public int updateInfo(Member inputMember) {
		
		return sqlSession.update("memberMapper.updateInfo", inputMember);
	}

	/**회원 탈퇴 DAO
	 * @param memberNo
	 * @return
	 */
	public int secession(int memberNo) {
		return sqlSession.update("memberMapper.secession", memberNo);
	}

	
	/**비밀번호 확인
	 * @param memberNo
	 * @return
	 */
	public String getMemberPw(int memberNo) {
		
		return sqlSession.selectOne("memberMapper.getMemberPw", memberNo);
	}

	
	/**내 리뷰 조회
	 * @param memberNo 
	 * @return
	 */
	public List<Review> selectMyReview(int memberNo) {
		
		return sqlSession.selectList("reviewMapper.selectMyReview",memberNo);
	}



		
	
}
