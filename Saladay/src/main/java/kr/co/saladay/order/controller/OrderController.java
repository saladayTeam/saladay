package kr.co.saladay.order.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.saladay.cart.model.service.CartService;
import kr.co.saladay.cart.model.vo.Cart;
import kr.co.saladay.member.model.vo.Member;
import kr.co.saladay.order.model.service.OrderService;
import kr.co.saladay.order.model.vo.Order;
import kr.co.saladay.order.model.vo.OrderDelivery;

@SessionAttributes("cart")
@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	@Autowired
	private CartService cartService;

	// 주문/결제하기 페이지
	@GetMapping("/order")
	public String order() {

		return "order/order";
	}
	
	// 주문완료 페이지
	@GetMapping("/orderView")
	public String orderView() {
		return "order/orderView";
	}
	
	
	/**
	 * @param order 주문 커맨드객체
	 * @param delivery 배송 커맨드객체
	 * @param loginMember session 로그인멤버
	 * @param cart session 카트
	 * @param referer 
	 * @param deliveryDate2 2주패키지일때 2차배송일
	 * @param address 수령인 주소
	 * @param ra
	 * @param status
	 * @return
	 */
	@PostMapping("/orderView")
	public String orderView(Order order, OrderDelivery delivery,
			@SessionAttribute("loginMember") Member loginMember,
			@SessionAttribute("cart") Cart cart,
			@RequestHeader("referer") String referer,
			@RequestParam(value="deliveryDate2",required=false) String deliveryDate2,
			String[] address,
			RedirectAttributes ra,
			SessionStatus status) {
		
		// 장바구니(cart)에 담은 패키지를 새로운 주문에 넣기
		order.setCart(cart);
		// 주문에 로그인한 회원의 회원번호 세팅
		order.setMemberNo(loginMember.getMemberNo());
		// 주문에 cart의 패키지번호 세팅
		order.setPackageNo(cart.getPackageNo());
		
		// 수령인 이름 작성하지 않았을때 주문자 이름을 로그인한 회원 이름으로 세팅
		if(order.getOrderName().equals("")) {
			order.setOrderName(loginMember.getMemberName());			
		}
		
		// 수령인 전화번호를 작성하지 않았을 때 주문자 번호를 로그인한 회원번호로 세팅
		if(order.getOrderTel().equals("")) {
			order.setOrderTel(loginMember.getMemberTel());			
		}
		
		// 수령인 주소를 작성했을 때 주문자 주소를 작성한 수령인 주소로 세팅(String[]-> String으로 변환)
		if(address!=null) {
			order.setOrderAddress(String.join(",,", address));
		}
		
		// 회원 기본 주소 미작성시 수령인 주소
		if(loginMember.getMemberAddress()==null) {
			order.setOrderAddress(String.join(",,", address));
			// 수령인 주소 미작성 시 회원 기본 주소
		} else if(String.join(",,", address).equals(",,,,")) {
			order.setOrderAddress(loginMember.getMemberAddress());
		}
		
		// 1주 패키지일 때 장바구니(cart) 가격 == 주문 가격
		if(cart.getPackageType()==1) {
			order.setOrderPrice(cart.getPackagePrice());
			// 2주 패키지일때 10% 할인한 가격으로 계산하여 세팅
		} else { 
			order.setOrderPrice((int)(cart.getPackagePrice()*0.9));
		}
		
		String path="";
		String message="";
		
		// 기본 세팅을 마친 order를 변수로 전달
		int orderNo=service.insertOrder(order);
		
		// 주문 생성이 성공했을 때
		if(orderNo>0) {
			path="/orderView"; // 주문 완료 페이지로 이동
			ra.addFlashAttribute("order", order);
			cartService.deleteCart(loginMember.getMemberNo());
			status.setComplete();
			
			// 주문 -> 배송 테이블 insert
			int insertDelivery=service.insertDelivery(order,delivery);
			
			// 2주 패키지 일때 2번째 배송요청일 추가
			if(cart.getPackageType()==2) {
				delivery.setDeliveryDate(deliveryDate2);
				int insertDelivery2=service.insertDelivery(order,delivery);
			}
			
		} else {
			path=referer;
			message="결제 실패";
		}
		
		return "redirect:" + path;
	}
	
}
