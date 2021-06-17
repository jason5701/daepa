package com.example.service;

import com.example.domain.SuggestionVO;

public interface SuggestionService {
	public SuggestionVO read_confirm(int suggestion_number)throws Exception;
}
