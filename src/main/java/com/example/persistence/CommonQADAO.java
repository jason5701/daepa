package com.example.persistence;

import java.util.List;

import com.example.domain.CommonQAVO;
import com.example.domain.Criteria;

public interface CommonQADAO {
	public List<CommonQAVO> list(Criteria cri)throws Exception;
	public CommonQAVO read(int commonQA_number)throws Exception;
}
