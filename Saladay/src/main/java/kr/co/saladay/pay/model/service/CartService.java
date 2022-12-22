package kr.co.saladay.pay.model.service;

import kr.co.saladay.pay.model.vo.PayPackage;

public interface CartService {

	/** 장바구니에 담은 패키지 조회(패키지에 담은 메뉴별 옵션 모두 포함)
	 * @param memberNo
	 * @return cartPackage
	 */
	PayPackage selectCartPackage(int memberNo);

	/** 장바구니 삭제
	 * @param memberNo
	 * @return result
	 */
	int deleteCart(int memberNo);

	
}
