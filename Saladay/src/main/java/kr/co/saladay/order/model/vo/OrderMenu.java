package kr.co.saladay.order.model.vo;

import java.util.List;



import kr.co.saladay.cart.model.vo.CartOption;
import kr.co.saladay.member.model.vo.ReviewCheck;
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
	private int orderMenuPrice;
	
	private int OrderNo;
	private int menuNo;
	private String menuImage;
	
	private int deliveryNo;
	private String deliveryCode;
	private String deliveryDate;
	private String reviewCheck;
	
	List<CartOption> optionList;
	
	List<OrderOption> orderOptionList;
	
}
