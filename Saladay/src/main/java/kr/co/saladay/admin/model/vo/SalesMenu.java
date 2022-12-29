package kr.co.saladay.admin.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SalesMenu {
	
	private int menuNo;
	private int currentMonthSalesQuantity;
	private int preMonthSales;
	private int currentMonthSales;

}
