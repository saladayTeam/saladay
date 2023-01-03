package kr.co.saladay.admin.model.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.co.saladay.menu.model.vo.Menu;
import kr.co.saladay.menu.model.vo.Option;

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
	 * @param filePath
	 * @throws Exception 
	 */
	int registMenu(Menu newMenu, MultipartFile inputMenuImg, String webPath, String filePath) throws Exception;



	/** 새 옵션 등록
	 * @param newOption
	 * @param inputOptionImg
	 * @param webPath
	 * @param filePath
	 * @return
	 */
	int registOption(Option newOption, MultipartFile inputOptionImg, String webPath, String filePath) throws Exception;



	/** 특정 메뉴 조회
	 * @param menuNo
	 * @return menu
	 */
	Menu selectMenu(int menuNo);



	/** 메뉴 수정
	 * @param newMenu
	 * @param inputMenuImg
	 * @param webPath
	 * @param filePath
	 * @return
	 */
	int updateMenu(Menu newMenu, MultipartFile inputMenuImg, String webPath, String filePath) throws Exception;



	/** 특정 옵션 조회
	 * @param optionNo
	 * @return option
	 */
	Option selectOption(int optionNo);



}
