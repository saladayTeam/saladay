package kr.co.saladay.menu.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Menu {
	private int menuNo;
	private String menuName;
	private int menuPrice;
	private String menuImage;
	private String menuContent;
	private String menuDeleteFlag;
	private int menuCalorie;
	
}
