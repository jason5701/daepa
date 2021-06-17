package com.example.persistence;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.GroupSalesVO;

public interface GroupSalesDAO {
	public List<GroupSalesVO> list(Criteria cri)throws Exception;
}
