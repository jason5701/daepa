package com.example.service;

import com.example.domain.NoticeVO;

public interface NoticeService {
	public NoticeVO read(int notice_number) throws Exception;
}
