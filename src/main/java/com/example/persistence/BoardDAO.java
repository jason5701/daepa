package com.example.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.ReviewVO;

public interface BoardDAO {
	public List<ReviewVO> product_review_list(Criteria cri) throws Exception;
	public void product_review_insert(ReviewVO vo) throws Exception;
	public void product_review_delete (int review_number) throws Exception;
	public void product_review_update(ReviewVO vo) throws Exception;
	public int product_totalCount(Criteria cri)throws Exception;
	public List<ReviewVO> meterial_review_list(Criteria cri) throws Exception;
	public void meterial_review_insert(ReviewVO vo) throws Exception;
	public void meterial_review_delete (int review_number) throws Exception;
	public void meterial_review_update(ReviewVO vo) throws Exception;
	public int meterial_totalCount(Criteria cri)throws Exception;
	public ReviewVO review_read(int review_number) throws Exception;
	public void updateReview_click(int review_number)throws Exception;
	public String lastNumber()throws Exception;
}
