package kr.co.saladay.pay.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saladay.pay.model.dao.CartDAO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO dao;
}
