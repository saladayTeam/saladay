package kr.co.saladay.review.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.saladay.common.Util;
import kr.co.saladay.review.model.dao.ReviewDAO;
import kr.co.saladay.review.model.vo.Pagination;
import kr.co.saladay.review.model.vo.Review;
import kr.co.saladay.review.model.vo.ReviewImage;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO dao;

	// 리뷰 목록 조회
	@Override
	public Map<String, Object> selectReviewList(int cp, int reviewRating) {
		
		int listCount = dao.getListCount(reviewRating);

		Pagination pagination = new Pagination(listCount, cp);
		
		List<Review> reviewList = dao.selectReviewList(reviewRating, pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("reviewList", reviewList);
		
		return map;
	}

	// 특정 메뉴 리뷰 목록 조회
	@Override
	public Map<String, Object> selectMenuReviewList(int cp, int menuNo) {
		
		int menuReviewListCount = dao.getMenuReviewListCount(menuNo);

		Pagination pagination = new Pagination(menuReviewListCount, cp);
		
		List<Review> menuReviewList = dao.selectMenuReviewList(pagination, menuNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("menuReviewList", menuReviewList);
		
		return map;
	}

	// 리뷰 상세조회
	
	@Override
	public List<Review> selectReviewDetail(Map<String, Object> map) {
		return dao.selectReviewDetail(map);
	}
	
	// 좋아요 여부 체크
	@Override
	public int reviewLikeCheck(Map<String, Object> map) {
		return dao.reviewLikeCheck(map);
	}

	// 좋아요 수 증가
	@Override
	public int reviewLikeUp(Map<String, Object> paramMap) {
		return dao.reviewLikeUp(paramMap);
	}

	// 좋아요 수 감소
	@Override
	public int reviewLikeDown(Map<String, Object> paramMap) {
		return dao.reviewLikeDown(paramMap);
	}

	// 리뷰 삭제
	@Override
	public int deleteReview(int reviewNo) {
		
		return dao.deleteReview(reviewNo);
	}

	// 리뷰 이미지 삭제
	@Override
	public int deleteReviewImg(int reviewNo) {
		return dao.deleteReviewImg(reviewNo);
	}

	// 리뷰 작성시 보여줄 기본 정보
	@Override
	public Review reviewWriteInfo(int orderMenuNo) {
		return dao.reviewWriteInfo(orderMenuNo);
	}

	
	// 리뷰 작성
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int reviewWrite(Review review, List<MultipartFile> imageList, String webPath, String folderPath) throws IOException{
		
		// XSS(크로스 사이트 스크립트 공격), 개행 문자 처리
		review.setReviewContent(Util.XSSHandling(review.getReviewContent()));
		review.setReviewContent(Util.newLineHandling(review.getReviewContent()));
		
		// 리뷰 번호 반환 받기
		int reviewNo = dao.reviewWrite(review);
		
		if(reviewNo>0) {
			
			List<ReviewImage> reviewImageList = new ArrayList<ReviewImage>();
			List<String> renameList = new ArrayList<String>();
			
			for(int i=0; i<imageList.size(); i++) {
				
				if(imageList.get(i).getSize()>0) {
					ReviewImage img = new ReviewImage();
					
					img.setImagePath(webPath);
					
					String rename = Util.fileRename(imageList.get(i).getOriginalFilename());
					
					img.setImageRename(rename);
					
					renameList.add(rename);
					
					img.setReviewNo(reviewNo);
					
					img.setImageOrder(i);
					
					reviewImageList.add(img);
				}
			}
			
			// DB에 저장
			if(!reviewImageList.isEmpty()) {
				
				int result = dao.insertReviewImageList(reviewImageList);
				
				if(result == reviewImageList.size()) {
					
					// 파일로 변환하기
					for(int i=0;i<reviewImageList.size();i++) {
						
						int index = reviewImageList.get(i).getImageOrder();
						
						imageList.get(index).transferTo(new File(folderPath+renameList.get(i)));
					}
				} 
			}
		}
		
		return reviewNo;
	}


	
	

}
