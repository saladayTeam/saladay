package kr.co.saladay.order.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderMenu {

	
	private int cartMenuNo;
	private int orderMenuNo;
	private String menuName;
	private int menuPrice;
	private String menuDeleteFlag;
	
	private int cartNo;
	private int menuNo;
	
	List<OrderOption> optionList;

}
