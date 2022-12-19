package kr.co.saladay.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.saladay.member.model.service.MyPageService;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService service;
	

	
}
