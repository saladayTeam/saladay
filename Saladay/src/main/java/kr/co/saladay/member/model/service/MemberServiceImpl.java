package kr.co.saladay.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.saladay.member.model.dao.MemberDAO;
import kr.co.saladay.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	BCryptPasswordEncoder bcrypt;

	//로그인
	@Override
	public Member login(Member member) {
		
		Member loginMember = dao.login(member.getMemberEmail());
		
		// 로그인 정보가 없으면 리턴 null
		if(loginMember != null) {		
			// ** 암호화 코드 **
				// 입력된 평문과 저장되어있던 암호문 비교 후
			if(bcrypt.matches(member.getMemberPw(), loginMember.getMemberPw())) { // true시 loginMember 리턴
				// 보안을 위해 비밀번호 null로 변경
				loginMember.setMemberPw(null);								
			} else {															  // false시 loginMember = null 후 리턴
				loginMember = null;
			}
		}
	
		return loginMember;
	}
	
	
	//회원가입
	@Transactional
	@Override
	public int signUp(Member member) {
		
		// 비밀번호 암호화
		member.setMemberPw(bcrypt.encode(member.getMemberPw()));
		
		return dao.signUp(member);
	}


	//이메일 중복체크
	@Override
	public int emailDupCheck(String memberEmail) {
		
		return dao.emailDupCheck(memberEmail);
	}

	//이메일 아이디 찾기
	@Override
	public Member findID(Member member) {
		
		return dao.findID(member);
	}
	
	
	
}
