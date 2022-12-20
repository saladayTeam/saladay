package kr.co.saladay.pay.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PayMenu {

	private int menuNo;
	private String menuName;
	private int menuPrice;
	private int totalOptionPrice;
	
	List<PayOption> optionList;
}
