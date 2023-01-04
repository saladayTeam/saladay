package kr.co.saladay.admin.model.dao;

import java.util.List;



import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import kr.co.saladay.admin.model.vo.OrderManagePagination;
import kr.co.saladay.menu.model.vo.Menu;
import kr.co.saladay.menu.model.vo.Option;

@Repository
public class MenuManageDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	/** 메뉴 개수 조회
	 * @return int
	 */
	public int getMenuCount() {
		return sqlSession.selectOne("menuManageMapper.getMenuCount");
	}

	
	/** 메뉴 목록 조회
	 * @param pagination
	 * @return
	 */
	public List<Menu> selectMenuList(OrderManagePagination pagination) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("menuManageMapper.selectMenuList", null, rowBounds);
	}
	
	
	/** 메뉴 삭제
	 * @param menuNo
	 */
	public void menuDelete(int menuNo) {
		sqlSession.update("menuManageMapper.menuDelete", menuNo);
	}


	/** 옵션 개수 조회
	 * @return int
	 */
	public int getOptionCount() {
		return sqlSession.selectOne("menuManageMapper.getOptionCount");
	}


	/** 옵션 목록 조회
	 * @param pagination
	 * @return
	 */
	public List<Option> selectOptionList(OrderManagePagination pagination) {
		int offset = (pagination.getCurrentPage()-1)*pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("menuManageMapper.selectOptionList", null, rowBounds);
	}


	/** 옵션 삭제
	 * @param optionNo
	 */
	public void optionDelete(int optionNo) {
		sqlSession.update("menuManageMapper.optionDelete", optionNo);
	}


	/** 새 메뉴 등록
	 * @param newMenu
	 * @return
	 */
	public int registMenu(Menu newMenu) {
		return sqlSession.insert("menuManageMapper.registMenu", newMenu);
	}


	/** 새 옵션 등록
	 * @param newOption
	 * @return
	 */
	public int registOption(Option newOption) {
		return sqlSession.insert("menuManageMapper.registOption", newOption);
	}


	/** 특정 메뉴 조회
	 * @param menuNo
	 * @return menu
	 */
	public Menu selectMenu(int menuNo) {
		return sqlSession.selectOne("menuManageMapper.selectMenu", menuNo);
	}


	/** 메뉴 수정
	 * @param newMenu
	 * @return result
	 */
	public int updateMenu(Menu newMenu) {
		return sqlSession.update("menuManageMapper.updateMenu", newMenu);
	}
	
	
	/** 메뉴 이미지 수정
	 * @param newMenu
	 * @return result
	 */
	public int updateMenuImg(Menu newMenu) {
		return sqlSession.update("menuManageMapper.updateMenuImg", newMenu);
	}


	
	/** 특정 옵션 조회
	 * @param optionNo
	 * @return option
	 */
	public Option selectOption(int optionNo) {
		return sqlSession.selectOne("menuManageMapper.selectOption", optionNo);
	}


	/** 옵션 수정
	 * @param newOption
	 * @return result
	 */
	public int updateOption(Option newOption) {
		return sqlSession.update("menuManageMapper.updateOption", newOption);
	}


	/** 옵션 이미지 수정
	 * @param newOption
	 * @return result
	 */
	public int updateOptionImg(Option newOption) {
		return sqlSession.update("menuManageMapper.updateOptionImg", newOption);
	}


	






}
