package kr.co.saladay.order.model.vo;

import kr.co.saladay.cart.model.vo.Cart;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Order {

	private Cart cart;
	
	private int orderNo;
	private String orderDate;
	private String cancleDate;
	private int orderPrice;
	private String orderName; // 수신자명
	private String orderTel; // 수신자 전화번호
	private String orderAddress; // 수신자 주소
	
	private int memberNo; // 주문한 회원 번호
	
}	

