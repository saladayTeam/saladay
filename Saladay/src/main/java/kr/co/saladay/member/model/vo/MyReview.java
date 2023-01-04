package kr.co.saladay.member.model.vo;

import java.util.List;

import kr.co.saladay.order.model.vo.Order;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyReview {

	private int reviewNo; // 리뷰번호 REVIEW_NO
	private int rating; // 별점 RATING
	private String reviewContent; // 리뷰 내용 REVIEW_CONTENT
	private String reviewDate; // 리뷰 작성일 REVIEW_DATE
	private String reviewDeleteFlag; //	리뷰 삭제여부 REVIEW_DEL_FL
	private int memberNo; //	리뷰 작성자 번호 MEMBER_NO
	private String memberNickname;//  리뷰 작성자 닉네임 MEMBER_NICKNAME
	private int orderNo; //	주문번호 ORDER_NO
	private int orderMenuNo; //	주문한 메뉴 번호 ORDER_MENU_NO
	private int menuNo; //	메뉴 번호 MENU_NO
	private String menuName; // 메뉴 이름 MENU_NAME
	private int likeCount; // 좋아요 수 LIKE_COUNT
	private int likeCheck; // 좋아요 여부 LIKE_CHECK
	private String thumbnail; // 썸네일 THUMBNAIL
	private String packageName;//주문한 패키지 이름

	private int memberReviewCount; // 특정회원이 작성한 리뷰 수 MEMBER_REVIEW_COUNT
	private int memberLikeCount; // 특정회원이 받은 좋아요 수 MEMBER_LIKE_COUNT
}
