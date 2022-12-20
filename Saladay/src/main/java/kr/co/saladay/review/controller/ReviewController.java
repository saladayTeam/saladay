package kr.co.saladay.review.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.saladay.review.model.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	//리뷰 목록 조회
	@GetMapping("/review")
	public String selectReviewList(Model model,
			@RequestParam(value="cp", required=false, defaultValue = "1") int cp){
		
		Map<String, Object> map = service.selectReviewList(cp);
		model.addAttribute("map", map);
		
		return "/review/reviewList";
	}

}
