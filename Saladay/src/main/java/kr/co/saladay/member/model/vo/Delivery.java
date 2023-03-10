package kr.co.saladay.member.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Delivery {

	private int deliveryNo;
	private String deliveryDate;
	private int orderNo;
	private String deliveryCode;
	private int rowNum;
	private String deliveryStatus;
}
