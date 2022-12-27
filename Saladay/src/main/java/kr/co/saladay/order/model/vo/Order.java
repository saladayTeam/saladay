package kr.co.saladay.order.model.vo;

import java.util.List;


import kr.co.saladay.cart.model.vo.Cart;
import kr.co.saladay.menu.model.vo.Package;

import kr.co.saladay.cart.model.vo.CartMenu;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Order {

	private Cart cart; // 장바구니에 담은 카트
	
	private int orderNo; // 주문 번호
	private String orderDate; // 주문 날짜
	private String cancleDate; // 취소 날짜
	private int orderPrice; // 결제 금액
	private String orderName; // 수신자명
	private String orderTel; // 수신자 전화번호
	private String orderAddress="서울"; // 수신자 주소
	
	private int memberNo; // 주문한 회원 번호
	
	private int packageNo; // 주문한 패키지 넘버
	private String packageName;//주문한 패키지 이름
	private String packageImage; // 주문한 패키지 이미지 경로
	
	private String deliveryCode; //배송코드
	
	List<CartMenu> menuList; // 주문한 메뉴 리스트
	
	List<OrderMenu> orderMenuList;  // 주문한 메뉴 리스트
	
}	

