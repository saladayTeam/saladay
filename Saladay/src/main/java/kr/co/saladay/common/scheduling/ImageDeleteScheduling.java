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
  
    *
    * @Scheduled 속성
    *  - fixedDelay : 이전 작업이 끝난 시점으로 부터 고정된 시간(ms)을 설정.
    *  - fixedRate : 이전 작업이 수행되기 시작한 시점으로 부터 고정된 시간(ms)을 설정.
    *  
    *  - cron : UNIX계열 잡 스케쥴러 표현식으로 작성 - cron="초 분 시 일 월 요일 [년도]" - 요일 : 1(SUN) ~ 7(SAT) 
    * ex) 2019년 9월 16일 월요일 10시 30분 20초 cron="20 30 10 16 9 2" // 연도 생략 가능
    * 
    * - 특수문자 * : 모든 수. 
    * - : 두 수 사이의 값. ex) 10-15 -> 10이상 15이하 
    * , : 특정 값 지정. ex) 3,4,7 -> 3,4,7 지정 
    * / : 값의 증가. ex) 0/5 -> 0부터 시작하여 5마다 
    * ? : 특별한 값이 없음. (월, 요일만 해당) 
    * L : 마지막. (월, 요일만 해당)
    * 
    * * 주의사항 - @Scheduled 어노테이션은 매개변수가 없는 메소드에만 적용 가능.
    * 				매개변수 작성 XXXXXXXXXXXXX
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
	
	
	
	// @Scheduled(cron = "0 0 12 * * ?") // 매주 월요일 12시에 실행
	@Scheduled(cron = "0 * * * * *") // 매 분 0초마다
	public void deleteImageFile() {

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
				if(menuImageList.indexOf("/resources/images/menu/topping/"+optionImg) == -1) {
					logger.info(optionImg + "삭제");
					file.delete(); // 서버 파일 삭제
				}
			}	
		}
	
		
	}
}
