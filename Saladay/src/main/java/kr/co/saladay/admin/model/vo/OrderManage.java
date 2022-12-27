package kr.co.saladay.admin.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderManage {
	
	private int orderNo; // 주문 번호
	private String orderDate; // 주문 날짜
	private int packageNo; // 주문한 패키지 넘버
	private String packageName;//주문한 패키지 이름
	private int memberNo; // 주문한 회원 번호
	private String memberName; // 주문한 회원 이름
	private int orderPrice; // 결제 금액
	private String orderDeleteFlag; // 주문 취소 여부

}
