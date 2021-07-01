package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.NoticeVO;
import com.example.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService{
	/*20210623 수정사항*/
	@Autowired
	NoticeDAO notice_dao;
	
	/*20210623 수정사항*/
	@Override
	public NoticeVO read(int notice_number) throws Exception {
		NoticeVO vo=notice_dao.read(notice_number);
		notice_dao.updateClick(notice_number);
		return vo;
	}

}
