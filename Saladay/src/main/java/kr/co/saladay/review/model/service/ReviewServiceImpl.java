package kr.co.saladay.review.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saladay.review.model.dao.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO dao;
	

}
