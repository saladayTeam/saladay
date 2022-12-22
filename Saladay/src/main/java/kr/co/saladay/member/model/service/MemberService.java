package kr.co.saladay.member.model.service;

import java.util.List;

import kr.co.saladay.member.model.vo.Member;
import kr.co.saladay.review.model.vo.Review;

public interface MemberService {

	/** 로그인 서비스
	 * @param member
	 * @return loginMember
	 */
	public Member login(Member member);

	
	/** 회원가입 서비스
	 * @param member
	 * @return result (result > 0) 성공
	 */
	int signUp(Member member);

	
	/**	이메일 중복 체크 서비스
	 * @param memberEmail
	 * @return result (중복아니면 0)
	 */
	int emailDupCheck(String memberEmail);


	
	/**이메일 아이디 찾기
	 * @param member
	 * @return findMember (이름, 이메일)
	 */
	public Member findID(Member member);


	/**비밀번호 찾기
	 * @param memberEmail
	 * @return result
	 */
	public String findPw(String memberEmail);


	/**비밀번호 변경(암호화)
	 * @param member
	 * @return result
	 */
	public int changePw(Member member);


	/**회원 정보 수정 (닉네임, 전화번호, 주소)
	 * @param inputMember
	 * @return
	 */
	public int updateInfo(Member inputMember);

	/** 회원 탈퇴 서비스
	 * @param memberNo 회원탈퇴 진행할 회원 번호
	 * @return result
	 */
	public int secession(int memberNo);


	/** 현재 비밀번호 확인 
	 * @param currentMemberPw 비교할 비밀번호 평문
	 * @param memberNo 로그인한 회원의 암호화된 비밀번호를 가져오기위한 파라미터
	 * @return 일치:true, 불일치:false
	 */
	public boolean checkMemberPw(String inputMemberPw, int memberNo);

	
	/**내 리뷰 조회
	 * @param memberNo 
	 * @return List<Review>
	 */
	public List<Review> selectMyReview(int memberNo);


}
