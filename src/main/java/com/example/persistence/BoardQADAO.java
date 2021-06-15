package com.example.persistence;

import java.util.List;

import com.example.domain.BoardQAVO;
import com.example.domain.Criteria;

public interface BoardQADAO {
	public List<BoardQAVO> list(Criteria cri)throws Exception;
	public BoardQAVO read(int boardQA_number) throws Exception;
}
