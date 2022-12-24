package kr.co.saladay.pay.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.saladay.pay.model.dao.CartDAO;
import kr.co.saladay.pay.model.vo.CartMenu;
import kr.co.saladay.pay.model.vo.CartOption;
import kr.co.saladay.pay.model.vo.Cart;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO dao;
	
	// 장바구니에 담은 패키지 조회(패키지에 담은 메뉴별 옵션 모두 포함)
	@Override
	public Cart selectCartPackage(int memberNo) {
		
		Cart cartPackage=dao.selectCartPackage(memberNo);
				
		return cartPackage;
	}
	
	// 장바구니 삭제
	@Transactional
	@Override
	public int deleteCart(int memberNo) {
		return dao.deleteCart(memberNo);
	}
	
	
	// 장바구니 담기
	@Override
	public int insertCart(Cart cart) {
		
		
		// 장바구니 번호 생성
		int result = dao.insertCart(cart);
		int cartNo = cart.getCartNo();
		
		// 장바구니에 담은 메뉴
		List<CartMenu> menuList=cart.getMenuList();
		
		// 실제 장바구니 메뉴별 옵션
		List<CartOption> cartOptionList= new ArrayList<CartOption>();
		
		
		for(CartMenu menu : menuList) {
			menu.setCartNo(cartNo);
			
			int result2 = dao.insertCartMenuNo(menu);
			int cartMenuNo = menu.getCartMenuNo();
			
			// optionList == 담겨져 온 옵션...............
			List<CartOption> optionList = menu.getOptionList();
			for(CartOption option : optionList) {
				if(option.getOptionCount()>0) {
					option.setCartMenuNo(cartMenuNo);
					cartOptionList.add(option);
					int result3 = dao.insertCartMenuOption(option);
				}
			}
		
		}
		
		return cartNo;
	}
}
