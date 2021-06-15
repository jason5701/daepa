package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.NoticeVO;
import com.example.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	NoticeDAO dao;
	
	@Override
	public NoticeVO read(int notice_number) throws Exception {
		NoticeVO vo=dao.read(notice_number);
		dao.updateClick(notice_number);
		return vo;
	}

}
