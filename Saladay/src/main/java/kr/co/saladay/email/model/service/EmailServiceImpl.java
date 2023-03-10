package kr.co.saladay.email.model.service;

import javax.mail.Message;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService{

	@Autowired
	private JavaMailSender mailSender;
	
	private String fromEmail = "dldydgk0002@gmail.com";
    private String fromUsername = "Saladay";
	
	
	@Override
	public String signUp(String email) {
		//6자리 난수 인증번호 생성
		String authKey = createAuthKey();
		try {
			
			//인증메일 보내기
			MimeMessage mail = mailSender.createMimeMessage();
			
			// 제목
			String subject = "Saladay 회원가입 인증번호";
			
			// 문자 인코딩
			String charset = "UTF-8";
			
			// 메일 내용
			String mailContent 
			= "<p>샐러데이 인증번호 입니다.</p>"
					+ "<h2 style='color:#17633D'>" + authKey + "</h3>";
			
			
			
			// 송신자(보내는 사람) 지정
			mail.setFrom(new InternetAddress(fromEmail, fromUsername));
			// 수신자(받는사람) 지정
			mail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			
			
			// 이메일 제목 세팅
			mail.setSubject(subject, charset);
			
			// 내용 세팅
			mail.setText(mailContent, charset, "html"); //"html" 추가 시 HTML 태그가 해석됨
			
			mailSender.send(mail);	// 메일 발송
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return authKey;
	}

	//인증번호 생성
	@Override
	public String createAuthKey() {
		String key = "";
		for(int i=0 ; i< 6 ; i++) {
			
			int sel1 = (int)(Math.random() * 3); // 0:숫자 / 1,2:영어
			
			if(sel1 == 0) {
				
				int num = (int)(Math.random() * 10); // 0~9
				key += num;
				
			}else {
				
				char ch = (char)(Math.random() * 26 + 65); // A~Z
				
				int sel2 = (int)(Math.random() * 2); // 0:소문자 / 1:대문자
				
				if(sel2 == 0) {
					ch = (char)(ch + ('a' - 'A')); // 대문자로 변경
				}
				
				key += ch;
			}
		}
		return key;
	}

}
