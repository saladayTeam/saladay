package kr.co.saladay.pay.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.saladay.pay.model.vo.PayMenu;
import kr.co.saladay.pay.model.vo.PayPackage;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 장바구니에 담은 패키지 조회(패키지에 담은 메뉴별 옵션 모두 포함)
	 * @param memberNo
	 * @return cartPackage
	 */
	public PayPackage selectCartPackage(int memberNo) {
		return sqlSession.selectOne("cartMapper.selectCartPackage", memberNo);
	}

	/** 장바구니 삭제
	 * @param memberNo
	 * @return result
	 */
	public int deleteCart(int memberNo) {
		return sqlSession.delete("cartMapper.deleteCart", memberNo);
	}
	
}
