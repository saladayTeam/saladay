package kr.co.saladay.nutrition.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NutritionController {

	/**영양정보 페이지
	 * @return nutrition.jsp 포워드
	 */
	@GetMapping("/nutrition")
	public String nutritionPage() {
		return "nutrition/nutrition";
	}
	
	/**FAQ 페이지
	 * @return FAQ.jsp 포워드
	 */
	@GetMapping("/FAQ")
	public String FAQPage() {
		return "FAQ/FAQ";
	}
	
	/* 서비스 이용약관
	 * @return TermsOfService.jsp 포워드
	 */
	@GetMapping("/TermsOfService")
	public String TermsOfServicePage() {
		return "common/footerDetail/TermsOfService";
	}
	
	/* 개인정보 처리방침
	 * @return privacyPolicy.jsp 포워드
	 */
	@GetMapping("/privacyPolicy")
	public String privacyPolicyPage() {
		return "common/footerDetail/privacyPolicy";
	}
}
