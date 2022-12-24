package kr.co.saladay.cart.model.service;

import kr.co.saladay.cart.model.vo.Cart;

public interface CartService {

	/** 장바구니에 담은 패키지 조회(패키지에 담은 메뉴별 옵션 모두 포함)
	 * @param memberNo
	 * @return cartPackage
	 */
	Cart selectCart(int memberNo);

	/** 장바구니 삭제
	 * @param memberNo
	 * @return result
	 */
	int deleteCart(int memberNo);

	
	/** 장바구니 담기
	 * @param cart
	 * @return cartNo
	 */
	int insertCart(Cart cart);

	/** 장바구니 여부 조회
	 * @param memberNo
	 * @return
	 */
	int checkCart(int memberNo);


}
