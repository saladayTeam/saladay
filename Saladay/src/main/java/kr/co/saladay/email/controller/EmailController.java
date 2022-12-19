package kr.co.saladay.email.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.saladay.email.model.service.EmailService;



@Controller
@RequestMapping("/sendEmail")
@SessionAttributes("authKey")
public class EmailController {

	@Autowired
    private EmailService service;
	
	
	/**회원가입 이메일 인증 메일 전송
	 * @param email
	 * @param model
	 * @return 1,0
	 */
	@GetMapping("/signUp")
    @ResponseBody
    public int signUp(String email, Model model) {

        String authKey = service.signUp(email);

        if(authKey != null) {
            model.addAttribute("authKey", authKey);

            return 1;
        }else {
            return 0;
        }
    }
	
    /**인증번호 체크
     * @param inputKey
     * @param authKey
     * @param status
     * @return 1,0
     */
    @GetMapping("/checkAuthKey")
    @ResponseBody
    public int checkAuthKey(String inputKey, @SessionAttribute("authKey") String authKey, 
            SessionStatus status){

        if(inputKey.equals(authKey)) {
            status.setComplete();
            return 1;
        }

        return 0;
    }
	
	
}
