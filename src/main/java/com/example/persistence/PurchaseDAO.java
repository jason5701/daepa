package com.example.persistence;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.NoticeVO;
import com.example.domain.PurchaseVO;

public interface PurchaseDAO {
	public List<PurchaseVO> order_List(String user_id,Criteria cri)throws Exception;
}
