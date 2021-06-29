package com.example.persistence;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.MeterialAndProductVO;

public interface SearchDAO {
	
	public List<MeterialAndProductVO> search_plist(Criteria cri) throws Exception;
	public List<MeterialAndProductVO> search_mlist(Criteria cri) throws Exception;

}
