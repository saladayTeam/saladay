package kr.co.saladay.order.model.vo;

import java.util.List;

import kr.co.saladay.cart.model.vo.CartOption;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderMenu {

	private int orderMenuNo;
	private String menuName;
	private int menuPrice;
	private String menuDeleteFlag;
	
	private int OrderNo;
	private int menuNo;
	
	List<CartOption> optionList;

}
