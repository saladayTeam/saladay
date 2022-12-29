package kr.co.saladay.common;

import java.text.SimpleDateFormat;


public class Util {
	   
	   // 파일명 변경 메소드 20221114123350_15134.png
	   public static String fileRename(String originFileName) {
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	      String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
	      // 현재 시간을 기준으로해서 파일명으로 설정

	      int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성

	      String str = "_" + String.format("%05d", ranNum);

	      String ext = originFileName.substring(originFileName.lastIndexOf("."));

	      return date + str + ext;
	   }
	   
	   
	   // 크로스 사이트 스크립트(XSS) 방지 처리
	   // : HTML에서 해석되는 문자를 단순 글자로 인식하도록 변경
	   public static String XSSHandling(String content) {
		   
		   if(content != null) {
			   content = content.replaceAll("&", "&aml;");
			   content = content.replaceAll("\"", "&quot;");
			   content = content.replaceAll("<", "&lt;");
			   content = content.replaceAll(">", "&gt;");
			   content = content.replaceAll("'", "&#039;");
			   content = content.replaceAll("\\(", "&#040;");
			   content = content.replaceAll("\\)", "&#041;");
			   content = content.replaceAll("/", "&#x2F;");		   
		   }
		   return content;
	   }
	   
	   
	   // 개행 문자 처리(\r\n , \n, \r, \n\r) -> <br>로 변경
	   public static String newLineHandling(String content) {
		   return content.replaceAll("(\r\n|\n|\r|\n\r)", "<br>");
	   }
	   
	   // 개행 문자 처리 해제 <br> -> \n 개행
	   public static String newLineClear(String content) {
		   return content.replaceAll("<br>", "\n");
	   }
	   
}
