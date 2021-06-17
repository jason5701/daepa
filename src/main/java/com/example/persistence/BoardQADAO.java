package com.example.persistence;

import java.util.List;

import com.example.domain.BoardQAVO;
import com.example.domain.Criteria;

public interface BoardQADAO {
	/*수정사항*/
	public List<BoardQAVO> boardQA_list(Criteria cri) throws Exception;
	public BoardQAVO boardQA_read (int boardQA_number) throws Exception;
	public int totalCount() throws Exception;
}
