package kr.co.saladay.review.model.vo;

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
	private String memberName; // 리뷰 작성자 이름 MEMBER_NAME
	private int orderNo; //	주문번호 ORDER_NO
	private String orderDate; // 주문일 ORDER_DATE
	private int orderMenuNo; //	주문한 메뉴 번호 ORDER_MENU_NO
	private int menuNo; //	메뉴 번호 MENU_NO
	private String menuName; // 메뉴 이름 MENU_NAME
	private String thumbnail; // 썸네일 THUMBNAIL
	private String packageName;//주문한 패키지 이름
	private int memberReviewCount; // 특정회원이 작성한 리뷰 수 MEMBER_REVIEW_COUNT
	private int memberLikeCount; // 특정회원이 받은 좋아요 수 MEMBER_LIKE_COUNT
	private double memberRatingAvg; // 특정회원의 별점 평균 MEMBER_RATING_AVG
	private double menuRatingAvg; // 특정메뉴의 별점 평균 MENU_RATING_AVG

}
