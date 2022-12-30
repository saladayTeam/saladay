package kr.co.saladay.admin.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SalesMenu {
	
	private int menuNo;
	private String menuName;
	private int preMonthSalesQuantity; // 메뉴 별 전월 판매 수량
	private int preMonthSales; // 메뉴 별 전월 판매 금액
	private int currentMonthSalesQuantity; // 메뉴 별 당월 판매 수량
	private int currentMonthSales; // 메뉴 별 당월 판매 금액
	
	private int preMonthMenuSales; // 전월 메뉴 총 판매 금액
	private int currentMonthMenuSales; // 당월 메뉴 총 판매 금액
	
	private double changeRate; // 증감율
	private double percentageOfSales; // 매출 비중
}
