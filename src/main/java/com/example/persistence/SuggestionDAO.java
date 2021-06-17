package com.example.persistence;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.SuggestionVO;

public interface SuggestionDAO {
	public List<SuggestionVO> list(Criteria cri)throws Exception;
	public int suggestion_count()throws Exception;
	public SuggestionVO read(int suggestion_number)throws Exception;
	public void suggestion_confirm(int suggestion_number)throws Exception;
}
