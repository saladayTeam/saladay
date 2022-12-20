package kr.co.saladay.email.model.service;

public interface EmailService {

	
	/** 인증번호 보내기
	 * @param email
	 * @return 
	 */
	String signUp(String email);

	/** 인증번호 생성
	 * @return 인증번호
	 */
	String createAuthKey();
	
	
}
