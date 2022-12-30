package kr.co.saladay.admin.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.saladay.admin.model.service.FaqService;
import kr.co.saladay.admin.model.vo.FAQ;

@Controller
public class FaqController {

	
	@Autowired
	private FaqService service;
	
	
	/**FAQ 페이지
	 * @return FAQ.jsp 포워드
	 */
	@GetMapping("/FAQ")
	public String FAQPage(Model model) {
		
		// faq 조회
		List<FAQ> faqList = service.selectFaqList();
		model.addAttribute("faqList", faqList);
		
		return "FAQ/FAQ";
	}
	

}
