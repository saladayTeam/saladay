package kr.co.saladay.admin.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.saladay.admin.model.service.FaqService;
import kr.co.saladay.admin.model.vo.FAQ;
import oracle.jdbc.proxy.annotation.Post;

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
	
	
	// FAQ 작성 화면(팝업)
	@GetMapping("/FAQ/reg")
	public String registFAQ() {
		
		return "/FAQ/registFAQ";
	}
	
	
	// FAQ 작성
	@PostMapping("/FAQ/reg")
	public String registFAQ(FAQ faq, HttpServletResponse resp) throws Exception {
		
		int result = service.registFAQ(faq);
		
		if(result > 0) {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();    
			out.println("<script> alert('작성하신 FAQ 내용이 등록되었습니다.'); window.close(); opener.location.reload(); </script>");
			out.flush(); 
		}
		
		return null;
	}
	
	
	// FAQ 선택 삭제
	@ResponseBody
	@PostMapping("/FAQ/delete")
	public int deleteFAQ(@RequestParam(value="faqNo") int faqNo) {
		return service.deleteFAQ(faqNo);
	}
	

}
