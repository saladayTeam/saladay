package kr.co.saladay.review.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Review {
	private int reviewNo; // 리뷰번호 REVIEW_NO
	private int rating; // 별점 RATING
	private String reviewContent; // 리뷰 내용 REVIEW_CONTENT
	private String reviewDate; // 리뷰 작성일 REVIEW_DATE
	private String reviewDeleteFlag; //	리뷰 삭제여부 REVIEW_DEL_FL
	private int memberNo; //	리뷰 작성자 번호 MEMBER_NO
	private String memberNickname;//  리뷰 작성자 닉네임 MEMBER_NICKNAME
	private int orderMenuNo; //	주문한 메뉴 번호 ORDER_MENU_NO
	private String menuName; // 메뉴 이름 MENU_NAME
	private int likeCount; // 좋아요 수 LIKE_COUNT
	private String thumbnail; // 썸네일 THUMBNAIL
	
    // 이미지 목록
    private List<ReviewImage> imageList;

}