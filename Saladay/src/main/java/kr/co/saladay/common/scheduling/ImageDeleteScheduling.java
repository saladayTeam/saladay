package kr.co.saladay.common.scheduling;
import java.io.File;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.saladay.menu.model.service.MenuService;


@Component
public class ImageDeleteScheduling {
   /*
    * @Scheduled
    * 
    * * Spring에서 제공하는 스케줄러 - 스케줄러 : 시간에 따른 특정 작업(Job)의 순서를 지정하는 방법.
    * 
    * 설정 방법 
    * 1) servlet-context.xml -> Namespaces 탭 -> task 체크 후 저장
    * 2) servlet-context.xml -> Source 탭 -> <task:annotation-driven/> 추가
    * 
    */
	
	@Autowired
	private MenuService service;
	
	@Autowired
	private ServletContext application; 
	
	
	// 로그를 출력하는 객체 얻어오기
	// org.slf4j.Logger 
	private Logger logger = LoggerFactory.getLogger(ImageDeleteScheduling.class);
								// 이 클래스에서 사용하는 로거
	
	
	
	// @Scheduled(cron = "0 * * * * *") // 매 분 0초마다
	@Scheduled(cron = "0 0 6 ? * 1") // 매주 월요일 6시에 실행
	public void deleteImageFile() {

		logger.info("이미지 스케줄링 실행");
		
		// *********************** 메뉴 이미지 삭제 *************************
		// DB에서 Menu테이블의 모든 이미지명 조회
		List<String> menuImageList = service.selectMenuImageList();
		
		// Server에 저장된 이미지 파일 모두 조회
		String menuPath = application.getRealPath("/resources/images/menu/salad");
		// 지정된 경로에 존재하는 파일 목록을 배열로 반환
		File[] arr1 = new File(menuPath).listFiles();
		// 배열 -> List로 반환
		List<File> fileList1 = Arrays.asList(arr1);
		
		// 서버와 DB를 비교해서 DB에 없는 이미지를 삭제
		if(!fileList1.isEmpty()) { // 서버에 파일이 있다면
			for(File file : fileList1) {
				
				String menuImg = file.getName(); // 서버의 이미지명
				
				// DB와 서버를 비교해서 일치하는 파일명이 없다면 서버에는 있는데 DB에 없는 파일
				if(menuImageList.indexOf("/resources/images/menu/salad/"+menuImg) == -1) {
					logger.info(menuImg + "삭제");
					file.delete(); // 서버 파일 삭제
				}
			}	
		}	
			
		
		// *********************** 옵션 이미지 삭제 *************************
		// DB에서 Option테이블의 모든 이미지명 조회
		List<String> optionImageList = service.selectOptionImageList();
		
		
		// Server에 저장된 옵션 이미지 파일 모두 조회
		String optionPath = application.getRealPath("/resources/images/menu/topping");
		// 지정된 경로에 존재하는 이미지 파일 목록을 배열로 반환
		File[] arr2 = new File(optionPath).listFiles();
		// 배열 -> List로 반환
		List<File> fileList2 = Arrays.asList(arr2);
		
		// 서버와 DB를 비교해서 DB에 없는 이미지를 삭제
		if(!fileList2.isEmpty()) { // 서버에 파일이 있다면
			for(File file : fileList2) {
				
				String optionImg = file.getName(); // 서버의 이미지명
				
				// DB와 서버를 비교해서 일치하는 파일명이 없다면 서버에는 있는데 DB에 없는 파일
				if(optionImageList.indexOf("/resources/images/menu/topping/"+optionImg) == -1) {
					logger.info(optionImg + "삭제");
					file.delete(); // 서버 파일 삭제
				}
			}	
		}
		
	}
}
