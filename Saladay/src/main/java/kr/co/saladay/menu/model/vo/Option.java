package kr.co.saladay.menu.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Option {
	private int optionNo;
	private String optionType;
	private String optionName;
	private String optionImage;
	private int optionPrice;
	private String price; // 옵션 가격 표기
	private String optionDeleteFlag;
	private int optionCalorie;
	
}
