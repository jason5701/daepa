package com.example.service;

import com.example.domain.MeterialVO;

public interface MeterialService {
	
	public void update(MeterialVO vo)throws Exception;
	public MeterialVO read(String meterial_id) throws Exception;
	
}
