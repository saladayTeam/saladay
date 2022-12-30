package kr.co.saladay.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saladay.admin.model.dao.FaqDAO;
import kr.co.saladay.admin.model.vo.FAQ;

@Service
public class FaqServiceImpl implements FaqService{


	@Autowired
	private FaqDAO dao;
	
	@Override
	public List<FAQ> selectFaqList() {
		
		return dao.selectFaqList();
	}
}
