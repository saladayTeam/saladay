package kr.co.saladay.member.model.service;

import kr.co.saladay.member.model.vo.Member;

public interface MemberService {

	/** 회원가입 서비스
	 * @param member
	 * @return result (result > 0) 성공
	 */
	int signUp(Member member);


}
