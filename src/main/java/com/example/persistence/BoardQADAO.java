package com.example.persistence;

import java.util.List;

import com.example.domain.BoardQAVO;
import com.example.domain.Criteria;

public interface BoardQADAO {
   /*20210701 윤선 수정사항*/
   public List<BoardQAVO> product_boardQA_list(Criteria cri) throws Exception;
   public BoardQAVO product_boardQA_read(int boardQA_number) throws Exception;
   public int totalCount(Criteria cri) throws Exception;
   
   public void product_boardQA_update(BoardQAVO vo) throws Exception;
   public void product_boardQA_delete (int boardQA_number) throws Exception;
   
   /*20210701 윤선 수정사항*/
   public List<BoardQAVO> user_boardQA_list(Criteria cri) throws Exception;
   public BoardQAVO user_boardQA_read(int boardQA_number) throws Exception;
   public void user_boardQA_update(BoardQAVO vo) throws Exception;
   public void product_boardQA_insert(BoardQAVO vo)throws Exception;
   public int user_totalCount(Criteria cri) throws Exception;
   public String lastNumber()throws Exception;
}