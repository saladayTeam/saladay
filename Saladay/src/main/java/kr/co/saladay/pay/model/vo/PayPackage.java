package kr.co.saladay.pay.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PayPackage {

	private int packageNo;
	private String packageName;
	private String packageImage;
	private int packagePrice;
	
	List<PayMenu> menuList;
}
