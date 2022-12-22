package kr.co.saladay.review.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.saladay.review.model.service.ReviewService;
import kr.co.saladay.review.model.vo.Review;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService service;

	// 리뷰 목록 조회
	@GetMapping("/review")
	public String selectReviewList(Model model,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {

		Map<String, Object> map = service.selectReviewList(cp);
		model.addAttribute("map", map);

		return "/review/reviewList";
	}

	// 특정 메뉴 리뷰 목록 조회
	@GetMapping("/review/{menuNo}")
	public String selectMenuReviewList(Model model, @PathVariable("menuNo") int menuNo,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {

		Map<String, Object> map = service.selectMenuReviewList(cp, menuNo);
		model.addAttribute("map", map);

		return "/review/menuReviewList";
	}

	// 게시글 상세 조회(AJAX)
	@ResponseBody
	@GetMapping("/review/detail")
	public String selectReviewDetail(int reviewNo, Model model) {

		List<Review> rDetail = service.selectReviewDetail(reviewNo);
		return new Gson().toJson(rDetail);
	}

}
