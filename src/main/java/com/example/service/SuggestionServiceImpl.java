package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.SuggestionVO;
import com.example.persistence.SuggestionDAO;

@Service
public class SuggestionServiceImpl implements SuggestionService{
	@Autowired
	SuggestionDAO suggestion_dao;

	@Transactional
	@Override
	public SuggestionVO read_confirm(int suggestion_number) throws Exception {
		SuggestionVO vo=suggestion_dao.read(suggestion_number);
		suggestion_dao.suggestion_confirm(suggestion_number);
		return vo;
	}
	
	
}
