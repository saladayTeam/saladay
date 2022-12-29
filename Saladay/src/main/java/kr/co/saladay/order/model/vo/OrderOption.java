package kr.co.saladay.order.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderOption {

	private int optionNo;
	private String optionName;
	private int optionPrice;
	private int optionCount;
	private String optionDeleteFlag;
	private int orderMenuNo;
	
	private String reviewCheck; //NVL 결과값 저장
}
