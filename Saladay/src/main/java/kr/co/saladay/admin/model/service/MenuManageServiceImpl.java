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
	public int registMenu(Menu newMenu, MultipartFile inputMenuImg, String webPath, String filePath) throws Exception {
		
		// XSS(크로스 사이트 스크립트 공격) 방지 
		newMenu.setMenuName(Util.XSSHandling(newMenu.getMenuName()));
		newMenu.setMenuContent(Util.XSSHandling(newMenu.getMenuContent()));
		
		// 개행 문자 처리(반드시 XSS방지 처리 먼저 수행)
		newMenu.setMenuContent(Util.newLineHandling(newMenu.getMenuContent()));
		
		// #{menuImage} == "/resources/images/menu/salad/메뉴명";
		String menuImg = null;
		if(inputMenuImg.getSize() == 0) { // 업로드 된 이미지 파일이 없는 경우 
			newMenu.setMenuImage(null);
		
		} else { // 업로드 된 파일이 있는 경우
			menuImg = inputMenuImg.getOriginalFilename();
			newMenu.setMenuImage(webPath+menuImg);
		}
		
		// 새 메뉴 등록 
		int result = dao.registMenu(newMenu);
		
		if(result > 0) { // 이미지 등록 성공 시 실제로 서버에 저장
			if(menuImg!=null) {
				inputMenuImg.transferTo(new File(filePath + menuImg));
			}
		} else {
			throw new Exception("파일 업로드 실패"); // 예외 강제 발생
		}
		
		return result;
	}
	
	
	// 새 옵션 등록
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int registOption(Option newOption, MultipartFile inputOptionImg, String webPath, String filePath) throws Exception{
		
		
		String optionImg = null;
		if(inputOptionImg.getSize() == 0) { // 업로드 된 이미지 파일이 없는 경우 
			newOption.setOptionImage(null);
		
		} else { // 업로드 된 파일이 있는 경우
			optionImg = inputOptionImg.getOriginalFilename();
			newOption.setOptionImage(webPath+optionImg);
		}
		
		// 새 옵션 등록 
		int result = dao.registOption(newOption);
		
		if(result > 0) { // 이미지 등록 성공 시 실제로 서버에 저장
			if(optionImg!=null) {
				inputOptionImg.transferTo(new File(filePath + optionImg));
			}
		} else {
			throw new Exception("파일 업로드 실패"); // 예외 강제 발생
		}
		
		return result;
	}
	
	
	// 특정 메뉴 조회
	@Override
	public Menu selectMenu(int menuNo) {
		return dao.selectMenu(menuNo);
	}
	
	
	// 메뉴 수정
	@Transactional
	@Override
	public int updateMenu(Menu newMenu, MultipartFile inputMenuImg, String webPath, String filePath) throws Exception{
		
		// XSS(크로스 사이트 스크립트 공격) 방지 
		newMenu.setMenuName(Util.XSSHandling(newMenu.getMenuName()));
		newMenu.setMenuContent(Util.XSSHandling(newMenu.getMenuContent()));
		
		// 개행 문자 처리(반드시 XSS방지 처리 먼저 수행)
		newMenu.setMenuContent(Util.newLineHandling(newMenu.getMenuContent()));
		
		
		// 메뉴 내용 수정 
		int result = dao.updateMenu(newMenu);
		
		// 메뉴 내용 수정 후 이미지 수정
		if(result > 0) {
			if(inputMenuImg.getSize() > 0) { // 업로드 된 파일이 있는 경우 

				String menuImg = inputMenuImg.getOriginalFilename();
				newMenu.setMenuImage(webPath+menuImg);
				
				// 이미지 수정
				result = dao.updateMenuImg(newMenu);
			
				if(result > 0) { // 이미지 등록 성공 시 실제로 서버에 저장
					inputMenuImg.transferTo(new File(filePath + menuImg));
				} else {
					throw new Exception("파일 업로드 실패"); // 예외 강제 발생
				}
			}
		}

		return result;
	}

		
	// 특정 옵션 조회
	@Override
	public Option selectOption(int optionNo) {
		return dao.selectOption(optionNo);
	}
	
	
	// 옵션 수정
	@Transactional
	@Override
	public int updateOption(Option newOption, MultipartFile inputOptionImg, String webPath, String filePath) throws Exception {
		
		if(inputOptionImg.getSize() > 0) { // 새로 업로드 된 파일이 있는 경우 
			newOption.setOptionImage(webPath+inputOptionImg.getOriginalFilename());
		}
		
		// 옵션 내용 수정 
		int result = dao.updateOption(newOption);
	
		// 옵션 내용 수정 후 이미지 수정
		if(result > 0) { 
			if(inputOptionImg.getSize() > 0) { // 업로드 된 파일이 있는 경우 
				String optionImg = inputOptionImg.getOriginalFilename();
				newOption.setOptionImage(webPath+optionImg);
				
				// 이미지 수정
				result = dao.updateOptionImg(newOption);
			
				if(result > 0) { // 이미지 등록 성공 시 실제로 서버에 저장
					inputOptionImg.transferTo(new File(filePath + optionImg));
				} else {
					throw new Exception("파일 업로드 실패"); // 예외 강제 발생
				}
			}
		}

		return result;
	}
}
