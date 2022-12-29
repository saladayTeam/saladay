package kr.co.saladay.member.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.saladay.member.model.dao.MemberDAO;
import kr.co.saladay.member.model.vo.Delivery;
import kr.co.saladay.member.model.vo.Member;
import kr.co.saladay.order.model.vo.Order;
import kr.co.saladay.review.model.vo.Review;

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

	//닉네임 중복 체크
	@Override
	public int nicknameDupCheck(String memberNickname) {
		
		return dao.nicknameDupCheck(memberNickname);
	}
	
	//이메일 아이디 찾기
	@Override
	public Member findID(Member member) {
		
		return dao.findID(member);
	}

	//비밀번호 찾기
	@Override
	public String findPw(String memberEmail) {
		
		return dao.findPw(memberEmail);
	}

	//비밀번호 재설정
	@Transactional
	@Override
	public int changePw(Member member) {
		
		member.setMemberPw(bcrypt.encode(member.getMemberPw()));
		return dao.changePw(member);
	}

	//현재 비밀번호 확인
	@Override
	public boolean checkMemberPw(String inputMemberPw, int memberNo) {
		
		// 로그인 회원의 암호화된 비밀번호 가져오기
		String loginMemberPw = dao.getMemberPw(memberNo);
		return bcrypt.matches(inputMemberPw, loginMemberPw);
	}

	
	//회원정보 수정
	@Override
	public int updateInfo(Member inputMember) {
		
		return dao.updateInfo(inputMember);
	}

	//회원 탈퇴
	@Transactional
	@Override
	public int secession(int memberNo) {
		return dao.secession(memberNo);
	}


	//내 리뷰 조회
	@Override
	public List<Review> selectMyReview(int memberNo) {
		
		return dao.selectMyReview(memberNo);
	}


	
	//내 주문 조회
	@Override
	public List<Order> selectMyOrder(int memberNo) {
		
		List<Order> orderPackage =  dao.selectMyOrder(memberNo);
		
		return orderPackage;
	}

	//내 주문 조회 시 배송조회
	@Override
	public List<Delivery> selectMyDelivery(int memberNo) {
		
		return dao.selectMyDelivery(memberNo);
	}
	
}
