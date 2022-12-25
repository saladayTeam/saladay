package kr.co.saladay.cart.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartOption {

	private int optionNo;
	private String optionName;
	private int optionPrice;
	private int optionCount;
	private String optionDeleteFlag;
	private int cartMenuNo;
	
	List<CartOption> optionList;	
	
}
