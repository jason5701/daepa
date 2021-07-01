package com.example.service;

import com.example.domain.NoticeVO;

public interface NoticeService {
	/*20210623 수정사항*/
	public NoticeVO read(int notice_number) throws Exception;
	
}
