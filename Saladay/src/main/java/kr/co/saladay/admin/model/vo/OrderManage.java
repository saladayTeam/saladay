package kr.co.saladay.admin.model.vo;

import java.util.List;

import kr.co.saladay.cart.model.vo.CartMenu;
import kr.co.saladay.order.model.vo.OrderMenu;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderManage {
	
	private int orderNo; // 주문 번호
	private String orderDate; // 주문 날짜
	private String cancleDate; // 주문 취소 날짜
	private int packageNo; // 주문한 패키지 넘버
	private String packageName;//주문한 패키지 이름
	private int packageType;//주문한 패키지 타입
	private int memberNo; // 주문한 회원 번호
	private String memberName; // 주문한 회원 이름
	private String memberEmail; // 주문한 회원 이메일
	private String memberTel; // 주문한 회원 전화번호
	private String memberAddress; // 주문한 회원 주소
	private String orderName; // 배송지 수령인 이름
	private String orderTel; // 배송지 수령인 전화번호
	private String orderAddress; // 배송지 수령인 주소
	private int orderPrice; // 결제 금액
	private String orderDeleteFlag; // 주문 취소 여부
	
	List<OrderMenu> orderMenuList;  // 주문한 메뉴 리스트

}
