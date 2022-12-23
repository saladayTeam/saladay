package kr.co.saladay.review.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;

import kr.co.saladay.member.model.vo.Member;
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
	public String selectReviewDetail(int reviewNo, Model model, 
			@SessionAttribute(value = "loginMember", required = false) Member loginMember) {

		List<Review> rDetail = service.selectReviewDetail(reviewNo);
		
		// 좋아요 기능
		if(rDetail !=null) { // 게시글 상세조회 성공 시

			if(loginMember !=null) { // 로그인 상태인 경우
				Map<String, Object> map= new HashMap<String, Object>();
				map.put("reviewNo", reviewNo);
				map.put("memberNo", loginMember.getMemberNo());
				
				// BOARD_LIKE 테이블에 게시글 번호와 로그인한 회원번호가 일치하는지 조회하는 서비스
				int result = service.reviewLikeCheck(map);
				
				if(result >0) { // 좋아요가 되어있는 경우
					
					model.addAttribute("likeCheck", "on");
				}
			}
		}
		
		return new Gson().toJson(rDetail);
	}
	

	// 좋아요 수 증가(INSERT)
	@GetMapping("/review/likeUp")
	@ResponseBody
	public int reviewLikeUp(@RequestParam Map<String, Object> paramMap) {
		return service.reviewLikeUp(paramMap);
	}
	
	// 좋아요 수 감소(DELETE)
	@GetMapping("/review/likeDown")
	@ResponseBody
	public int reviewLikeDown(@RequestParam Map<String, Object> paramMap) {
		return service.reviewLikeDown(paramMap);
	}
	
	// 리뷰 삭제(UPDATE)
	@GetMapping("/review/delete")
	@ResponseBody
	public int deleteReview(int reviewNo) {
		return service.deleteReview(reviewNo);
	}

}
