package kr.co.saladay.admin.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DeliveryManage {
	
	private String deliveryDate; // 배송받을 날짜
	private String orderName; // 수신자명
	private String orderTel; // 수신자 전화번호
	private String orderAddress; // 배송주소
	private int orderNo; // 주문번호
	private int packageNo; // 상품번호
	private int orderPrice;  // 상품금액
	private String deliveryStatus; // 배송상태
	private String orderDelFl; // 주문취소상태
	private String deliveryCode; // 배송코드
	private int deliveryNo; // 배송번호
	private int rowNum; // 배송순번
	private String packageName; // 패키지이름
	
}
