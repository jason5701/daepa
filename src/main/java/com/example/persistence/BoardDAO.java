package com.example.persistence;

import java.util.List;
import com.example.domain.Criteria;
import com.example.domain.ReviewVO;

public interface BoardDAO {
	public List<ReviewVO> review_list(Criteria cri) throws Exception;
	public void review_insert(ReviewVO vo) throws Exception;
	public ReviewVO review_read(int review_number) throws Exception;
	public String lastNumber()throws Exception;
	public void review_delete (int review_number) throws Exception;
	public void review_update(ReviewVO vo) throws Exception;
	public void updateReview_click(int review_number)throws Exception;
	public int totalCount()throws Exception;
}
