package com.example.persistence;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.HotdealVO;

public interface HotdealDAO {
	public List<HotdealVO> hotdeal(Criteria cri)throws Exception;
	public List<HotdealVO> hotdeal_detail(int hotdeal_number) throws Exception;
}
