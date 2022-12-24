package kr.co.saladay.pay.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.pay.model.vo.CartMenu;
import kr.co.saladay.pay.model.vo.CartOption;
import kr.co.saladay.pay.model.vo.Cart;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 장바구니에 담은 패키지 조회(패키지에 담은 메뉴별 옵션 모두 포함)
	 * @param memberNo
	 * @return cartPackage
	 */
	public Cart selectCartPackage(int memberNo) {
		return sqlSession.selectOne("cartMapper.selectCartPackage", memberNo);
	}

	/** 장바구니 삭제
	 * @param memberNo
	 * @return result
	 */
	public int deleteCart(int memberNo) {
		return sqlSession.delete("cartMapper.deleteCart", memberNo);
	}
	
	
	
	/** 장바구니 담기(장바구니 번호 생성)
	 * @param cart
	 * @return
	 */
	public int insertCart(Cart cart) {
		return sqlSession.insert("cartMapper.insertCart", cart);
	}

	/** 장바구니별 메뉴 담기
	 * @param menu
	 * @return
	 */
	public int insertCartMenuNo(CartMenu menu) {
		
		return sqlSession.insert("cartMapper.insertCartMenuNo", menu);
	}

	/** 장바구니별 옵션 담기
	 * @param option
	 * @return
	 */
	public int insertCartMenuOption(CartOption option) {
		
		return sqlSession.insert("cartMapper.insertCartMenuOption", option);
	}

	
	
}
