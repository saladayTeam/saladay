package kr.co.saladay.admin.model.service;

import java.io.File;
import java.util.HashMap;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import kr.co.saladay.admin.model.dao.MenuManageDAO;
import kr.co.saladay.admin.model.vo.OrderManagePagination;
import kr.co.saladay.common.Util;
import kr.co.saladay.menu.model.vo.Menu;
import kr.co.saladay.menu.model.vo.Option;

@Service
public class MenuManageServiceImpl implements MenuManageService {

	@Autowired
	private MenuManageDAO dao;
	
	// 메뉴 조회
	@Override
	public Map<String, Object> selectMenuList(int cp) {
		
		int cnt = dao.getMenuCount();

		OrderManagePagination pagination = new OrderManagePagination(cnt, cp);
		
		List<Menu> menuList = dao.selectMenuList(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("menuList", menuList);
		
		return map;
	}
	
	
	// 메뉴 삭제
	@Transactional
	@Override
	public void menuDelete(int menuNo) {
		dao.menuDelete(menuNo);
	}
	
	
	//옵션 조회
	@Override
	public Map<String, Object> selectOptionList(int cp) {
		
		int cnt = dao.getOptionCount();
		
		OrderManagePagination pagination = new OrderManagePagination(cnt, cp);
		
		List<Option> optionList = dao.selectOptionList(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("optionList", optionList);
		
		return map;
	}
	
	
	// 옵션 삭제
	@Transactional
	@Override
	public void optionDelete(int optionNo) {
		dao.optionDelete(optionNo);
	}
	
	
	// 새 메뉴 등록
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int registMenu(Menu newMenu, MultipartFile inputMenuImg, String webPath, String folderPath) throws Exception {
		
		// XSS(크로스 사이트 스크립트 공격) 방지 
		newMenu.setMenuName(Util.XSSHandling(newMenu.getMenuName()));
		newMenu.setMenuContent(Util.XSSHandling(newMenu.getMenuContent()));
		
		// 개행 문자 처리(반드시 XSS방지 처리 먼저 수행)
		newMenu.setMenuContent(Util.newLineHandling(newMenu.getMenuContent()));
		
		// 메뉴이미지명 변경
		String rename = null;
		if(inputMenuImg.getSize() == 0) { // 업로드 된 이미지 파일이 없는 경우 
			newMenu.setMenuImage(null);
		
		} else { // 업로드 된 파일이 있는 경우
			rename = Util.fileRename(inputMenuImg.getOriginalFilename());
			newMenu.setMenuImage(webPath+rename);
		}
		
		// System.out.println(newMenu);
		
		
		int result = dao.registMenu(newMenu);
		
		if(result > 0) { // 이미지 등록 성공 시 실제로 서버에 저장
			if(rename!=null) {
				inputMenuImg.transferTo(new File(folderPath + rename));
			}
		} else {
			throw new Exception("파일 업로드 실패"); // 예외 강제 발생
		}
		
		return result;
	}

}
