package kr.co.saladay.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.saladay.pay.model.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;
	
	@GetMapping("/cart")
	public String cart() {
		return "cart/cart";
	}
}
