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
	
	
}
