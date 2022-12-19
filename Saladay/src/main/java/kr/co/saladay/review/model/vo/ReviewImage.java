package kr.co.saladay.review.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewImage {
	
	private int reviewImageNo; //	리뷰 이미지 번호 REVIEW_IMG_NO
	private String imagePath; //	이미지 경로 IMG_PATH
	private String imageRename; //	이미지 변경명 IMG_RENAME
	private String imageOriginal; //	이미지 원본명 IMG_ORIGINAL
	private int imageOrder; //	이미지 순서 IMG_ORDER
	private int reviewNo; //	리뷰 번호 REVIEW_NO

}
