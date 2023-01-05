package kr.co.saladay.order.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.saladay.cart.model.vo.CartMenu;
import kr.co.saladay.cart.model.vo.CartOption;
import kr.co.saladay.order.model.dao.OrderDAO;
import kr.co.saladay.order.model.vo.Order;
import kr.co.saladay.order.model.vo.OrderDelivery;



@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAO dao;
	
	@Transactional
	@Override
	public int insertOrder(Order order) {
		// 주문 insert
		int result=dao.insertOrderNo(order);
		int orderNo=order.getOrderNo();
		
		// 장바구니 담은 메뉴리스트를 주문리스트로 옮겨 담기
		List<CartMenu> orderList=order.getCart().getMenuList();
		
		for(CartMenu orderMenu : orderList) {
			// 주문메뉴에 주문번호 세팅
			orderMenu.setOrderNo(orderNo);
			// 주문메뉴 insert
			int result2=dao.insertOrderMenuNo(orderMenu);
			int orderMenuNo=orderMenu.getOrderMenuNo();
			
			List<CartOption> orderOptionList=orderMenu.getOptionList();
			
			for(CartOption orderOption : orderOptionList) {
				// 주문메뉴옵션에 주문메뉴번호 세팅
				orderOption.setOrderMenuNo(orderMenuNo);
				// 주문메뉴옵션 insert
				int result3 = dao.insertorderMenuOption(orderOption);
			}
		}
	
		return orderNo;
	}

	@Transactional
	@Override
	public int insertDelivery(Order order, OrderDelivery delivery) {
		
		// 배송에 주문번호 세팅
		delivery.setOrderNo(order.getOrderNo());
		int insertDelivery=dao.insertDelivery(delivery);
		
		return insertDelivery;
	}
	

}
