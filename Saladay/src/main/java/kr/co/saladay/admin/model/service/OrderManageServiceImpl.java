package kr.co.saladay.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saladay.admin.model.dao.OrderManageDAO;

@Service
public class OrderManageServiceImpl implements OrderManageService{
	@Autowired
	private OrderManageDAO dao;

}
