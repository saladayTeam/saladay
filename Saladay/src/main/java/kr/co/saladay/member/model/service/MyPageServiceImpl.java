package kr.co.saladay.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.co.saladay.member.model.dao.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageDAO dao;
	
	
}
