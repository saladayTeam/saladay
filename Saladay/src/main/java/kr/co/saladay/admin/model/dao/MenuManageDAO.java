package kr.co.saladay.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.admin.model.vo.OrderManagePagination;
import kr.co.saladay.admin.model.vo.Pagination;
import kr.co.saladay.menu.model.vo.Menu;
import kr.co.saladay.menu.model.vo.Option;
import kr.co.saladay.review.model.vo.Review;

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
	public List<Menu> selectMenuList(Pagination pagination) {
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
	public List<Option> selectOptionList(Pagination pagination) {
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



}
