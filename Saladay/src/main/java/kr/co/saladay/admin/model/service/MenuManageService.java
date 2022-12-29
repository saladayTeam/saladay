package kr.co.saladay.admin.model.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.co.saladay.menu.model.vo.Menu;

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



	/** 새 메뉴 등록
	 * @param newMenu
	 * @param inputMenuImg
	 * @param webPath
	 * @param folderPath
	 * @throws Exception 
	 */
	int registMenu(Menu newMenu, MultipartFile inputMenuImg, String webPath, String folderPath) throws Exception;



}
