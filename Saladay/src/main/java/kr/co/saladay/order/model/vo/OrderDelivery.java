package kr.co.saladay.order.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDelivery {

	private int deliveryNo;
	private String deliveryDate;
	private int orderNo;
	private String deliveryCode;
}
