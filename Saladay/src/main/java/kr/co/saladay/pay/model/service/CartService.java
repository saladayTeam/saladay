package kr.co.saladay.pay.model.service;

import kr.co.saladay.pay.model.vo.PayPackage;

public interface CartService {

	/**
	 * @param memberNo
	 * @return cartPackage
	 */
	PayPackage selectCartPackage(int memberNo);

	
}
