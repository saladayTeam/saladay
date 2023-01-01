package kr.co.saladay.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.saladay.admin.model.dao.FaqDAO;
import kr.co.saladay.admin.model.vo.FAQ;
import kr.co.saladay.common.Util;

@Service
public class FaqServiceImpl implements FaqService{


	@Autowired
	private FaqDAO dao;
	
	
	// faqList조회
	@Override
	public List<FAQ> selectFaqList() {
		return dao.selectFaqList();
	}
	
	
	// FAQ 작성
	@Transactional
	@Override
	public int registFAQ(FAQ faq) throws Exception {
		
		// XSS(크로스 사이트 스크립트 공격) 방지 
		faq.setFaqTitle(Util.XSSHandling(faq.getFaqTitle()));
		faq.setFaqContent(Util.XSSHandling(faq.getFaqContent()));
		
		// 개행 문자 처리(반드시 XSS방지 처리 먼저 수행)
		faq.setFaqContent(Util.newLineHandling(faq.getFaqContent()));
		
		return dao.registFAQ(faq);
	}
	
	
	// FAQ삭제
	@Transactional
	@Override
	public int deleteFAQ(int faqNo) {
		return dao.deleteFAQ(faqNo);
	}
}
