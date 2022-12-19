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

	
	
	//회원가입
	@Transactional
	@Override
	public int signUp(Member member) {
		
		// 비밀번호 암호화
		member.setMemberPw(bcrypt.encode(member.getMemberPw()));
		
		return dao.signUp(member);
	}
	
	
	
}
