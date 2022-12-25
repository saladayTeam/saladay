package kr.co.saladay.order.model.vo;

import java.util.List;

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
	private String CancleDate;
	private int orderPrice;
	private String orderName;
	private String orderTel;
	private String orderAddress;
	
}	

