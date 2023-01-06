package kr.co.saladay.review.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kr.co.saladay.member.model.vo.Member;
import kr.co.saladay.review.model.service.ReviewService;
import kr.co.saladay.review.model.vo.Review;

@Controller
@SessionAttributes({"reviewRating", "message"})
public class ReviewController {

	@Autowired
	private ReviewService service;

	// 리뷰 목록 조회
	@GetMapping("/review")
	public String selectReviewList(Model model,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@RequestParam(value = "reviewRating" , required = false, defaultValue = "0") int reviewRating, //별점순 정렬
			HttpServletRequest req) {

		Map<String, Object> map = service.selectReviewList(cp, reviewRating);
		//reviewRating 0 == 전체, 그외 숫자 == 별점
		
		// 이전 주소 얻어오기
		String referer = req.getHeader("referer");
		
		model.addAttribute("map", map);
		model.addAttribute("reviewRating", reviewRating);
		model.addAttribute("referer", referer);
		
		return "/review/reviewList";
	}

	// 특정 메뉴 리뷰 목록 조회
	@GetMapping("/review/{menuNo}")
	public String selectMenuReviewList(Model model, @PathVariable("menuNo") int menuNo,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			HttpServletRequest req
			) {

		Map<String, Object> map = service.selectMenuReviewList(cp, menuNo);
		
		// 이전 주소 얻어오기
		String referer = req.getHeader("referer");
		
		model.addAttribute("map", map);
		model.addAttribute("referer", referer);

		return "/review/menuReviewList";
	}
	
	// 특정 회원 리뷰 목록 조회
	@GetMapping("/memberReview/{memberNickname}")
	public String selectMemberReviewList(Model model, @PathVariable("memberNickname") String memberNickname,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			HttpServletRequest req
			) {

		Map<String, Object> map = service.selectMemberReviewList(cp, memberNickname);
		
		// 이전 주소 얻어오기
		String referer = req.getHeader("referer");
		
		model.addAttribute("map", map);
		model.addAttribute("referer", referer);

		return "/review/memberReviewList";
	}

	// 게시글 상세 조회(AJAX)
	@ResponseBody
	@GetMapping("/review/detail")
	public String selectReviewDetail(int reviewNo, Model model, 
			@SessionAttribute(value = "loginMember", required = false) Member loginMember) {

		int memberNo;
		Map<String, Object> map= new HashMap<String, Object>();
		
		// 로그인 확인 / 멤버 넘버 세팅
		if (loginMember == null) { // 로그인하지 않았을 때
			memberNo = -1;
			map.put("reviewNo", reviewNo);
			map.put("memberNo", memberNo);
		} else {
			memberNo = loginMember.getMemberNo();
			map.put("reviewNo", reviewNo);
			map.put("memberNo", loginMember.getMemberNo());
		}
		
		List<Review> rDetail = service.selectReviewDetail(map);
		
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
	
	// 리뷰 이미지 삭제(DELETE)
	// 리뷰가 삭제될 때 리뷰 테이블의 이미지도 삭제
	@GetMapping("/review/deleteImg")
	@ResponseBody
	public int deleteReviewImg(int reviewNo) {
		return service.deleteReviewImg(reviewNo);
	}
	
	// 리뷰 작성 페이지 이동
	@GetMapping("/member/myPage/reviewWrite/{orderMenuNo}")
	public String reviewWrite(
			@PathVariable("orderMenuNo") int orderMenuNo, Model model){
		
		// 리뷰 작성시 보여줄 기본 정보
		Review reviewInfo = service.reviewWriteInfo(orderMenuNo);

		model.addAttribute("reviewInfo", reviewInfo);
		
		return "/review/reviewWrite";
	}
	
	// 리뷰 작성(INSERT)
	@PostMapping("/member/myPage/reviewWrite/{orderMenuNo}")
	public String reviewWrite(Review review,
			@RequestParam(value = "images", required=false) List<MultipartFile> imageList,
			@SessionAttribute("loginMember") Member loginMember,
			@PathVariable("orderMenuNo") int orderMenuNo, 
			RedirectAttributes ra, HttpSession session,
			@RequestHeader("referer") String referer) throws IOException {

		review.setOrderMenuNo(orderMenuNo);
		
		review.setMemberNo(loginMember.getMemberNo());
		
		String webPath = "/resources/images/review/";
		
		String folderPath = session.getServletContext().getRealPath(webPath);
		
		// 리뷰 작성 서비스
		int reviewNo = service.reviewWrite(review, imageList, webPath, folderPath);
		
		String message = null;
		String path = null;
		
		if(reviewNo>0) {
			message = "리뷰가 등록되었습니다.";
			path="/member/myPage/selectMyReview";
		} else {
			message = "리뷰 등록 실패";
			path = referer;
		}
		
		ra.addFlashAttribute(message);
		return "redirect:"+path;

	}

}
