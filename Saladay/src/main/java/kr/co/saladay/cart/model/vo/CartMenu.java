package kr.co.saladay.cart.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartMenu {

	
	private int cartMenuNo;
	private int orderMenuNo;
	private String menuName;
	private int menuPrice;
	private String menuDeleteFlag;
	
	private int cartNo;
	private int orderNo;
	private int menuNo;
	
	List<CartOption> optionList;

}
