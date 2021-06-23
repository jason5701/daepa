package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.ReviewVO;
import com.example.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDAO review_dao;
		
	@Transactional
	@Override
	public ReviewVO product_review_read(int review_number) throws Exception {
		ReviewVO vo=review_dao.product_review_read(review_number);
		review_dao.updateReview_click(review_number);
		return vo;
	}
	@Transactional
	@Override
	public ReviewVO meterial_review_read(int review_number) throws Exception {
		ReviewVO vo=review_dao.meterial_review_read(review_number);
		review_dao.updateReview_click(review_number);
		return vo;
	}
}
