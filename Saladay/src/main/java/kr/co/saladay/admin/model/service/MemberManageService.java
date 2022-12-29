package kr.co.saladay.admin.model.service;

import java.util.Map;

public interface MemberManageService {

	/** 회원 관리 페이지
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectMemberList(int cp);

	/** 강제탈퇴처리
	 * @param memberNo
	 */
	void memberSecession(int memberNo);

}
