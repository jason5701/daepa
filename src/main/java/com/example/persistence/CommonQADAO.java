package com.example.persistence;

import java.util.List;

import com.example.domain.CommonQAVO;
import com.example.domain.Criteria;

public interface CommonQADAO {
   public List<CommonQAVO> admin_list(Criteria cri)throws Exception;
   public CommonQAVO admin_read(int commonQA_number)throws Exception;
   public int admin_totalCount(Criteria cri)throws Exception;
   public void admin_insert(CommonQAVO vo)throws Exception;
   public int admin_commonQA_code()throws Exception;
   
   public List<CommonQAVO> commonQA_list(Criteria cri)throws Exception;
   public int totalCount(Criteria cri)throws Exception;
   public CommonQAVO commonQA_read(int commonQA_number)throws Exception;
}