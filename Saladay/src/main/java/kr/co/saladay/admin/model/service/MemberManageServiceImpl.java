package kr.co.saladay.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.saladay.admin.model.dao.MemberManageDAO;
import kr.co.saladay.admin.model.vo.OrderManagePagination;
import kr.co.saladay.member.model.vo.Member;

@Service
public class MemberManageServiceImpl implements MemberManageService{

	@Autowired
	private MemberManageDAO dao;
	
	// 회원 관리 페이지
	@Override
	public Map<String, Object> selectMemberList(int cp) {
		
		// 전체 회원 수 조회
		int cnt = dao.getMemberCount();

		OrderManagePagination pagination = new OrderManagePagination(cnt, cp);
		
		List<Member> memberList = dao.selectMemberList(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("memberList", memberList);
		
		return map;
	}
	
	// 강제탈퇴처리
	@Transactional
	@Override
	public void memberSecession(int memberNo) {
		dao.memberSecession(memberNo);
		
	}
}
