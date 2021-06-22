package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.MeterialVO;
import com.example.persistence.MeterialDAO;

@Service
public class MeterialServiceImpl implements MeterialService{
	@Autowired
	MeterialDAO meterial_dao;
	
	
	@Transactional
	@Override
	public void update(MeterialVO vo) throws Exception {
		System.out.println("재료수정트랜스잭션!!!!!!!!"+vo.toString());
		meterial_dao.update(vo);
		meterial_dao.delAttach(vo.getMeterial_id());
		
		String files[]=vo.getDetail_images();
		
		if(files==null) return;
		for(String fullName:files){
			meterial_dao.addDetail_images(vo.getMeterial_id(), fullName);
		}
	}

}
