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



@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAO dao;
	
	@Transactional
	@Override
	public int insertOrder(Order order) {
		
		int result=dao.insertOrderNo(order);
		int orderNo=order.getOrderNo();
		
		List<CartMenu> orderList=order.getCart().getMenuList();
		
		for(CartMenu orderMenu : orderList) {
			orderMenu.setOrderNo(orderNo);
			
			int result2=dao.insertOrderMenuNo(orderMenu);
			int orderMenuNo=orderMenu.getOrderMenuNo();
			
			List<CartOption> orderOptionList=orderMenu.getOptionList();
			
			for(CartOption orderOption : orderOptionList) {
				orderOption.setOrderMenuNo(orderMenuNo);
				int result3 = dao.insertorderMenuOption(orderOption);
			}
		}
	
		return orderNo;
	}

	@Override
	public int insertDelivery(Map<String, Object> paramMap) {
		
		return dao.insertDelivery(paramMap);
	}

}
