package com.example.persistence;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.GroupSalesVO;

public interface GroupSalesDAO {
	public List<GroupSalesVO> user_list(Criteria cri,String user_id)throws Exception;
	public GroupSalesVO read(String sales_id)throws Exception;
	public int user_total_count(String user_id)throws Exception;
}
