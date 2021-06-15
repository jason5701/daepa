package com.example.persistence;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.MeterialVO;

public interface MeterialDAO {
	public List<MeterialVO> list(Criteria cri)throws Exception;
	public MeterialVO read(String meterial_id) throws Exception;
	public void insert(MeterialVO vo) throws Exception;
	public void update(MeterialVO vo) throws Exception;
	public void delete(String meterial_id) throws Exception;
}
