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
	
	@GetMapping("/orderView")
	public String orderView() {
		return "order/orderView";
	}
	
	@PostMapping("/orderView")
	public String orderView(Order order, OrderDelivery delivery,
			@SessionAttribute("loginMember") Member loginMember,
			@SessionAttribute("cart") Cart cart,
			@RequestHeader("referer") String referer,
			@RequestParam(value="deliveryDate2",required=false) String deliveryDate2,
			String[] address,
			RedirectAttributes ra,
			SessionStatus status) {
		
		
		order.setCart(cart);
		order.setMemberNo(loginMember.getMemberNo());
		order.setPackageNo(cart.getPackageNo());
		
		// 주문자 이름
		if(order.getOrderName().equals("")) {
			order.setOrderName(loginMember.getMemberName());			
		}
		
		// 주문자 전화번호
		if(order.getOrderTel().equals("")) {
			order.setOrderTel(loginMember.getMemberTel());			
		}
		
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
		
		// 주문 가격=카트 가격
		if(cart.getPackageType()==1) {
			order.setOrderPrice(cart.getPackagePrice());
			// 2주 패키지일때 10% 할인 가격
		} else { 
			order.setOrderPrice((int)(cart.getPackagePrice()*0.9));
		}
		
		String path="";
		String message="";
		
		int orderNo=service.insertOrder(order);
		
		if(orderNo>0) {
			path="/orderView";
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
