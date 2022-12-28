package kr.co.saladay.admin.model.service;

import java.util.Map;

public interface MenuManageService {

	/** 메뉴 목록 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectMenuList(int cp);

	
	
	/** 메뉴 삭제
	 * @param menuNo
	 */
	void menuDelete(int menuNo);



	/** 옵션 목록 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectOptionList(int cp);



	/** 옵션 삭제
	 * @param optionNo
	 */
	void optionDelete(int optionNo);



}
