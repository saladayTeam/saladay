package kr.co.saladay.pay.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Cart {

	private int cartNo;
	private int orderNo;
	private int packageNo;
	private String packageName;
	private String packageImage;
	private int packagePrice;
	private int packageType;
	private int memberNo;
	
	List<CartMenu> menuList;
}	

