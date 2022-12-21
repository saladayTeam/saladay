package kr.co.saladay.pay.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PayOption {

	private int optionNo;
	private String optionName;
	private int optionPrice;
	private String optionDeleteFlag;
	
}
